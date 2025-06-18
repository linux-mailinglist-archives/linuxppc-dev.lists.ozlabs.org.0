Return-Path: <linuxppc-dev+bounces-9438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 930F9ADE24E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 06:22:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMVvk37gbz30T3;
	Wed, 18 Jun 2025 14:22:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750220562;
	cv=none; b=SH9b7L4i7KWpWAmEtwjX/XZ05gnLJ+5UY+RUlQv3kN6PY1U2OSJmDeCgv8M5guba7at03EAMzE9w7D79CDERdz+4GIbBBL+oPfoqZEPf3H7nuGJoAexdX4DHcLxwSguG8B2kaXlsVJvPaqCBIR2JmLBabPlH2gGGaRw6uU/6L6nLPBzxh7wac/PA/lWx1Eh/OozMp8rDPRGEfnits1OFtTnUzlDaQ0WHh+u4WTfSsLVy0LUiuAVvzGZfWgFVdWlkmU2hR5uPfgkaSpQHs0rOmequ28yaReMN7PL8WzLpUpDAG90WkLr9plIlbkjrKoYpn/tO+gb6G92CfMsT2D8kOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750220562; c=relaxed/relaxed;
	bh=JG6PHstQI5H5oe+I9jfK74vnZjEQG60lz7/1SwQnFDg=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=GrebTWdZwmXkbPzkL6+sfmtkZx4WqLti87rEKLbMAm20eCuP3GO18HzWHo6kof19I6BrkGvUMbjCVUx205iWtqxnOzgwddym81uka2mkSl53Y8iOLW3s1K4CZJ3uDPuvEldM/q7lzuZ3kwxcUkKbjbKmGpIt03A/fWySjFe/TrLTtihnwqzSLLwzGmomgC52h8MD1D7C9nhgnzB0ysXbmJ6/MnB74AmwCs3H9M+BumLpC+ogkDobQKTByGnGJt7R4vfMMXNUooKjhmwBLj4JZTV0PcVfDOPKsqthv6NUnmHzrTy5sl3n2zbSbLqw/V5Rsxp/iwP+rEED59eSnHeZyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=dTlfwXTN; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=dTlfwXTN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMVvj5WY2z309v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 14:22:41 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id F247682887A2;
	Tue, 17 Jun 2025 23:22:39 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id CfkGZkyyXleX; Tue, 17 Jun 2025 23:22:39 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 69C74828884A;
	Tue, 17 Jun 2025 23:22:39 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 69C74828884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750220559; bh=JG6PHstQI5H5oe+I9jfK74vnZjEQG60lz7/1SwQnFDg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=dTlfwXTNhotmxPS8lPKUJoJuLSjqgLezi0BQoMDnf3aivYJOK48S/RQqQL7YclVww
	 xnII/qbAAfOW1hqY4iXTQZw3RZwBEVRAIlQ7ahAiFK8kGCNiMZyW3VC97if2NqnYgv
	 apR1VLuk76oHJqGB+376zkfA/IH+xd03H4NOUdAY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gDPUZFqiqKn5; Tue, 17 Jun 2025 23:22:39 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 402A082887A2;
	Tue, 17 Jun 2025 23:22:39 -0500 (CDT)
Date: Tue, 17 Jun 2025 23:22:39 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Timothy Pearson <tpearson@raptorengineering.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <946966095.1309769.1750220559201.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 3/8] powerpc/pseries/eeh: Export eeh_unfreeze_pe() and
 eeh_ops
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Index: Jx2/bwZfy/PY/F2nzIG8e+jlRecltQ==
Thread-Topic: powerpc/pseries/eeh: Export eeh_unfreeze_pe() and eeh_ops
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The PowerNV hotplug driver needs to be able to detect and clear any
frozen PE on the PHB after suprise removal of a downstream device.

Export the eeh_unfreeze_pe() and eeh_ops symbols to allow implementation
of this functionality in the php_nv module.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/eeh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 83fe99861eb1..543d8323c1fb 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -107,6 +107,7 @@ bool eeh_debugfs_no_recover;
 
 /* Platform dependent EEH operations */
 struct eeh_ops *eeh_ops = NULL;
+EXPORT_SYMBOL(eeh_ops);
 
 /* Lock to avoid races due to multiple reports of an error */
 DEFINE_RAW_SPINLOCK(confirm_error_lock);
@@ -1139,6 +1140,7 @@ int eeh_unfreeze_pe(struct eeh_pe *pe)
 
 	return ret;
 }
+EXPORT_SYMBOL(eeh_unfreeze_pe);
 
 
 static struct pci_device_id eeh_reset_ids[] = {
-- 
2.39.5

