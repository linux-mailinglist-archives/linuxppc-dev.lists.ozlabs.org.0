Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 367041AABFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 17:37:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492RL63mMYzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 01:37:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 492R5807JCzDr3y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 01:25:46 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.226])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 422274E17AD;
 Wed, 15 Apr 2020 23:25:29 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, oss@buserror.net,
 christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2,0/5] drivers: uio: new driver uio_fsl_85xx_cache_sram
Date: Wed, 15 Apr 2020 08:24:37 -0700
Message-Id: <20200415152442.122873-1-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415124929.GA3265842@kroah.com>
References: <20200415124929.GA3265842@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSFVCTE5CQkJDSElKTkhISVlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6DDo4CDg3PAg3PyoNGRUL
 HzMwCRZVSlVKTkNNQk1PSEhKTkJKVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlNWVdZCAFZQUlPS0M3Bg++
X-HM-Tid: 0a717e71f4179376kuws422274e17ad
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
 * Addressed comments of Greg K-H
 * Moved kfree(info->name) into uio_info_free_internal()

Wang Wenhu (5):
  powerpc: 85xx: make FSL_85XX_CACHE_SRAM configurable
  powerpc: sysdev: fix compile error for fsl_85xx_cache_sram
  powerpc: sysdev: fix compile warning for fsl_85xx_cache_sram
  powerpc: sysdev: fix compile error for fsl_85xx_l2ctlr
  drivers: uio: new driver for fsl_85xx_cache_sram

 arch/powerpc/platforms/85xx/Kconfig       |   2 +-
 arch/powerpc/platforms/Kconfig.cputype    |   5 +-
 arch/powerpc/sysdev/fsl_85xx_cache_sram.c |   3 +-
 arch/powerpc/sysdev/fsl_85xx_l2ctlr.c     |   1 +
 drivers/uio/Kconfig                       |   8 +
 drivers/uio/Makefile                      |   1 +
 drivers/uio/uio_fsl_85xx_cache_sram.c     | 182 ++++++++++++++++++++++
 7 files changed, 198 insertions(+), 4 deletions(-)
 create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c

-- 
2.17.1

