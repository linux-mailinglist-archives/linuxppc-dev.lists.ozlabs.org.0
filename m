Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA70DE705
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:57:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t8S62NrXzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 01:57:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t8Qc33vxzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:56:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t8Qc0lq5z8w0H
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:56:08 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t8Qc0BX4z9sNM; Tue, 30 Apr 2019 01:56:08 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=diana.craciun@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
X-Greylist: delayed 400 seconds by postgrey-1.36 at bilbo;
 Tue, 30 Apr 2019 01:56:07 AEST
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t8Qb2TkDz9s70
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 01:56:06 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4FB32200265;
 Mon, 29 Apr 2019 17:49:22 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 43AAD20024C;
 Mon, 29 Apr 2019 17:49:22 +0200 (CEST)
Received: from fsr-ub1664-009.ea.freescale.net
 (fsr-ub1664-009.ea.freescale.net [10.171.71.77])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id EE9072061E;
 Mon, 29 Apr 2019 17:49:21 +0200 (CEST)
From: Diana Craciun <diana.craciun@nxp.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH stable v4.4 0/8] missing powerpc spectre backports for 4.4
Date: Mon, 29 Apr 2019 18:49:00 +0300
Message-Id: <1556552948-24957-1-git-send-email-diana.craciun@nxp.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Diana Craciun <diana.craciun@nxp.com>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg,

These are missing patches from the initial powerpc spectre backports for 4.4.
Please queue them as well if you don't have any objections.

Thanks,

Diana Craciun (8):
  powerpc/fsl: Enable runtime patching if nospectre_v2 boot arg is used
  powerpc/fsl: Flush branch predictor when entering KVM
  powerpc/fsl: Emulate SPRN_BUCSR register
  powerpc/fsl: Flush the branch predictor at each kernel entry (32 bit)
  powerpc/fsl: Sanitize the syscall table for NXP PowerPC 32 bit
    platforms
  powerpc/fsl: Fixed warning: orphan section `__btb_flush_fixup'
  powerpc/fsl: Add FSL_PPC_BOOK3E as supported arch for nospectre_v2
    boot arg
  Documentation: Add nospectre_v1 parameter

 Documentation/kernel-parameters.txt   |  6 +++++-
 arch/powerpc/kernel/entry_32.S        | 10 ++++++++++
 arch/powerpc/kernel/head_booke.h      | 12 ++++++++++++
 arch/powerpc/kernel/head_fsl_booke.S  | 15 +++++++++++++++
 arch/powerpc/kernel/setup_32.c        |  1 +
 arch/powerpc/kernel/setup_64.c        |  1 +
 arch/powerpc/kvm/bookehv_interrupts.S |  4 ++++
 arch/powerpc/kvm/e500_emulate.c       |  7 +++++++
 8 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.17.1

