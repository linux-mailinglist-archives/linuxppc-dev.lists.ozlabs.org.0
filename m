Return-Path: <linuxppc-dev+bounces-5997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C8A2DB96
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 09:18:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrLDt4cjDz2yDT;
	Sun,  9 Feb 2025 19:18:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b9"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739089086;
	cv=none; b=GnZY4a9XQ1OfRBsMAg58Eo5I3RAIBXOUgAWLERdAqaBQtj7R2K48xuJfW2L2l1od+56wUcD8EY3CEe1OiSz6CZC+78r0aXKMh9pyci368fUP9JUNcwu4gXla1wCiOPRqxQp5bEkBcF4BWFOcNyyT8BcK9C8bagqul/jstHl/yFy9oh5JC9VYLL3idVRax00jcrVVdfw6wrBsIzGV90rSqKddQJTpFXHviLrIMYKCQCX1e5O3Ey3lp4sYSf+ovihMBkyeh4qUuW0KrbNDFZQwpgxcf4avcQIio8FEFWAwm/358CtwHs1PSFjmyIIZ/p59AeLrqkr+UAZ/Pq/XVXR8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739089086; c=relaxed/relaxed;
	bh=IiH2NYlYsxSXLU1sZ46R9u08xGC0tcovZjatzA0NQ/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JpaStV1eg1jajd6tEGtJlHT87L53YcZrKj6uS3mwpcCVJsl4Wh/BYiRRVnuRKkTRHHkJSXJHQgf5EKQ/+MtD6boN7UAGPi5CSmTvecutz+rTNj1EjbIAX61/E0bsgCBsPqnjhkpmYf+dxdN71MmTv45l3nlxxxNzDrKdkMmbKToMmNV3yP/tBwFi2DvCSn4XmS9dhUDntBRCPXb1FxoRq9QDVL4Fw7Dq8soPNHz0RstyjQqnngCGGevmANsR0/F4t6i2KJ8MagKDqzWohba3mgWIlqPkhgTUCrkAJPbOdFGwSFein+nAYlcVG3uSuPSgOQbZNxMc2gfGfgKEc1BngQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:203:375::b9; helo=out-185.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b9; helo=out-185.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [IPv6:2001:41d0:203:375::b9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrLDl6Lj8z2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 19:17:59 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739089051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IiH2NYlYsxSXLU1sZ46R9u08xGC0tcovZjatzA0NQ/g=;
	b=beA2ZaiO51l+gHGagbiy/5PON6iHcgDUL2hOT4U9nQRs1pDSlEUfvytDoLVV0jN70Am9uk
	h8sS4Ej53b1rW6aS17PW6xy/OK/bG4alYOo3PTnHR99YN8sn8Y62wddmhExI5mrIaqrnyN
	tWzymrtgpzZIVp4gUoF9e4tes3cbRmI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	"Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Baoquan He <bhe@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] fadump: Use str_yes_no() helper in fadump_show_config()
Date: Sun,  9 Feb 2025 09:17:03 +0100
Message-ID: <20250209081704.2758-2-thorsten.blum@linux.dev>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_yes_no() helper function.

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kernel/fadump.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..8c531533dd3e 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -289,10 +289,8 @@ static void __init fadump_show_config(void)
 	if (!fw_dump.fadump_supported)
 		return;
 
-	pr_debug("Fadump enabled    : %s\n",
-				(fw_dump.fadump_enabled ? "yes" : "no"));
-	pr_debug("Dump Active       : %s\n",
-				(fw_dump.dump_active ? "yes" : "no"));
+	pr_debug("Fadump enabled    : %s\n", str_yes_no(fw_dump.fadump_enabled));
+	pr_debug("Dump Active       : %s\n", str_yes_no(fw_dump.dump_active));
 	pr_debug("Dump section sizes:\n");
 	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
 	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);
-- 
2.48.1


