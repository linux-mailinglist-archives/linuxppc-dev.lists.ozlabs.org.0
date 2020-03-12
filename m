Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D360183C84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 23:32:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dk8f0fHGzDqKX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 09:32:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dk4w6D0PzDqG1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 09:28:43 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 999851A11AB;
 Thu, 12 Mar 2020 23:28:39 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5DB571A11BA;
 Thu, 12 Mar 2020 23:28:39 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 C7CA840A63; Thu, 12 Mar 2020 15:28:38 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Timur Tabi <timur@kernel.org>,
 Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 0/6] Fix sparse warnings for common qe library code
Date: Thu, 12 Mar 2020 17:28:21 -0500
Message-Id: <20200312222827.17409-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QE code was previously only supported on big-endian PowerPC systems
that use the same endian as the QE device.  The endian transfer code is
not really exercised.  Recent updates extended the QE drivers to
little-endian ARM/ARM64 systems which makes the endian transfer really
meaningful and hence triggered more sparse warnings for the endian
mismatch.  Some of these endian issues are real issues that need to be
fixed.

While at it, fixed some direct de-references of IO memory space and
suppressed other __iomem address space mismatch issues by adding correct
address space attributes.

Li Yang (6):
  soc: fsl: qe: fix sparse warnings for qe.c
  soc: fsl: qe: fix sparse warning for qe_common.c
  soc: fsl: qe: fix sparse warnings for ucc.c
  soc: fsl: qe: fix sparse warnings for qe_ic.c
  soc: fsl: qe: fix sparse warnings for ucc_fast.c
  soc: fsl: qe: fix sparse warnings for ucc_slow.c

 drivers/soc/fsl/qe/qe.c        |  4 ++--
 drivers/soc/fsl/qe/qe_common.c |  2 +-
 drivers/soc/fsl/qe/qe_ic.c     |  2 +-
 drivers/soc/fsl/qe/ucc.c       |  2 +-
 drivers/soc/fsl/qe/ucc_slow.c  | 33 +++++++++++++--------------------
 include/soc/fsl/qe/ucc_fast.h  |  6 +++---
 include/soc/fsl/qe/ucc_slow.h  | 13 ++++++-------
 7 files changed, 27 insertions(+), 35 deletions(-)

-- 
2.17.1

