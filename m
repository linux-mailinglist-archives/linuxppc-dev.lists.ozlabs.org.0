Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B671ABC12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 11:04:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492tZC21yCzDrJf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 19:04:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.18; helo=m17618.mail.qiye.163.com;
 envelope-from=wenhu.wang@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492sws2HrpzDrHm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 18:35:08 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.226])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 1F3624E47E6;
 Thu, 16 Apr 2020 15:49:29 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, oss@buserror.net,
 christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3,0/4] drivers: uio: new driver uio_fsl_85xx_cache_sram
Date: Thu, 16 Apr 2020 00:49:14 -0700
Message-Id: <20200416074918.3617-1-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415152442.122873-1-wenhu.wang@vivo.com>
References: <20200415152442.122873-1-wenhu.wang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSFVCTkNLS0tKQ0hKS05PTFlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OhQ6Ohw6CzgrQwghHRM5MzgY
 DiMwCihVSlVKTkNMS0lISExKTktKVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlNWVdZCAFZQUhKSks3Bg++
X-HM-Tid: 0a7181f6d4a19376kuws1f3624e47e6
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kernel@vivo.com, Wang Wenhu <wenhu.wang@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series add a new uio driver for freescale 85xx platforms to
access the Cache-Sram form user level. This is extremely helpful
for the user-space applications that require high performance memory
accesses.

It fixes the compile errors and warning of the hardware level drivers
and implements the uio driver in uio_fsl_85xx_cache_sram.c.

Changes since v1:
 * Addressed comments from Greg K-H
 * Moved kfree(info->name) into uio_info_free_internal()

Changes since v2:
 * Drop the patch that modifies Kconfigs of arch/powerpc/platforms
   and modified the sequence of patches:
    01:dropped, 02->03, 03->02, 04->01, 05->04
 * Addressed comments from Greg, Scott and Christophe
 * Use "uiomem->internal_addr" as if condition for sram memory free,
   and memset the uiomem entry
 * Modified of_match_table make the driver apart from Cache-Sram HW info
   which belong to the HW level driver fsl_85xx_cache_sram to match
 * Use roundup_pow_of_two for align calc(really learned a lot from Christophe)
 * Remove useless clear block of uiomem entries.
 * Use UIO_INFO_VER micro for info->version, and define it as
   "devicetree,pseudo", meaning this is pseudo device and probed from
   device tree configuration
 * Select FSL_85XX_CACHE_SRAM rather than depends on it

Wang Wenhu (4):
  powerpc: sysdev: fix compile error for fsl_85xx_l2ctlr
  powerpc: sysdev: fix compile error for fsl_85xx_cache_sram
  powerpc: sysdev: fix compile warning for fsl_85xx_cache_sram
  drivers: uio: new driver for fsl_85xx_cache_sram

 arch/powerpc/sysdev/fsl_85xx_cache_sram.c |   3 +-
 arch/powerpc/sysdev/fsl_85xx_l2ctlr.c     |   1 +
 drivers/uio/Kconfig                       |   9 ++
 drivers/uio/Makefile                      |   1 +
 drivers/uio/uio_fsl_85xx_cache_sram.c     | 158 ++++++++++++++++++++++
 5 files changed, 171 insertions(+), 1 deletion(-)
 create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c

-- 
2.17.1

