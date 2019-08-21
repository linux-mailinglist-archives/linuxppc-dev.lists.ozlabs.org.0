Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2F9723E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 08:28:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CyR72rfzzDqjl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 16:28:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dg9s5b7r"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CyPV2kh1zDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 16:27:09 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id o70so740219pfg.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 23:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gn10+3SqpCmyRBAvFi5/AgyLnuNqA/4EEBKTPhN5g40=;
 b=dg9s5b7rHwxOWxAdAj+2Pn58PE3+mi4ar8IEQLM9GS+bRxTvsEU2tjvZpo5HXuEq/l
 3n1sGsr/j/airWx8sZjQqtnZhfO1jsN0pAecDUl3PO8IB3iRe75knStG0l0//MvkUyen
 LLNN1o3q8hB5mLIc/zbMVE08LlilFiblpNCQJn1IvcjSN843swXo+fmapKiDhFDTyRxo
 OFCaFDrRxzFp9QlfrsQx/qeAYEiEyyb88QfvjKCFxmKnneOyIE7CA5afvhJXJwm06q4F
 ep/chT7dAz08ChOYpt887CUupVV6aPFOP15S1quPzPJTZJK482ZG3RaSc0iqAs6MpY96
 C6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gn10+3SqpCmyRBAvFi5/AgyLnuNqA/4EEBKTPhN5g40=;
 b=Ok4/NQdF0ZENWiycbVgy4N66TjAPE3545VbufmJa6cudFDU6aKpTRxqc+DqAyAv4Xd
 s0PoLm53eNUDdG4/q8Baeq8j6Y85ipTagkPk7JP5+yc1qcLQvu0g+NpnibctJ0XcC7UE
 hkQXWykTZtLM52PpHObsifJVy8ZYdIOpkAluGEYbbG3O7S9AewqU3P0cz6EPYNpD6EuR
 4Qb8ZX0oHASF73DWuoGC+gSg2jjuogg+GbcwvMbmViRwvlrsaxFUAqegqAQ9vnVJ6wS7
 zSy7kUoKWIBgVem5Tlrf3x2nvehXGCe7lbbdPzMdT75ZpuAG7Ns2Eeq0fcCFRc6bDPuK
 D6vg==
X-Gm-Message-State: APjAAAXMBZOKn6VnIrL/yaYfqqa5BNZy2iRsgNEipBwgdGLfQL8nGgIj
 o5blOAi6R+/9LiMZMnrRGRMC+9vS
X-Google-Smtp-Source: APXvYqw877aA32Ur0s/I1cP9/VEVeTVHZP5cJsdMfqCxzQxRmtnu55t0xIYWnP4E5hN0CUTtZ0fquA==
X-Received: by 2002:aa7:8559:: with SMTP id y25mr33456308pfn.260.1566368827875; 
 Tue, 20 Aug 2019 23:27:07 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id v27sm34694103pgn.76.2019.08.20.23.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 23:27:07 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/sriov: Remove VF eeh_dev state when disabling
 SR-IOV
Date: Wed, 21 Aug 2019 16:26:53 +1000
Message-Id: <20190821062655.19735-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When disabling virtual functions on an SR-IOV adapter we currently do not
correctly remove the EEH state for the now-dead virtual functions. When
removing the pci_dn that was created for the VF when SR-IOV was enabled
we free the corresponding eeh_dev without removing it from the child device
list of the eeh_pe that contained it. This can result in crashes due to the
use-after-free.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
No Fixes: here since I'm not sure if the commit that added this actually
introduced the bug. EEH is amazing.

I suspect backporting this would cause more problems than it solves since
reliably replicating the crash required enabling memory poisoning and
hacking a device driver to remove the PCI error handling callbacks so
the EEH fallback path (which removes and re-probes PCI devices)
would be used.
---
 arch/powerpc/kernel/pci_dn.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 6556b57..795c4e3 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -244,9 +244,22 @@ void remove_dev_pci_data(struct pci_dev *pdev)
 				continue;
 
 #ifdef CONFIG_EEH
-			/* Release EEH device for the VF */
+			/*
+			 * Release EEH state for this VF. The PCI core
+			 * has already torn down the pci_dev for this VF, but
+			 * we're responsible to removing the eeh_dev since it
+			 * has the same lifetime as the pci_dn that spawned it.
+			 */
 			edev = pdn_to_eeh_dev(pdn);
 			if (edev) {
+				/*
+				 * We allocate pci_dn's for the totalvfs count,
+				 * but only only the vfs that were activated
+				 * have a configured PE.
+				 */
+				if (edev->pe)
+					eeh_rmv_from_parent_pe(edev);
+
 				pdn->edev = NULL;
 				kfree(edev);
 			}
-- 
2.9.5

