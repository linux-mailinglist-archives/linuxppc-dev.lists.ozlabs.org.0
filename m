Return-Path: <linuxppc-dev+bounces-7202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB49A68802
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 10:31:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHk3l3jPFz2yrX;
	Wed, 19 Mar 2025 20:31:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742376675;
	cv=none; b=L2cSf6Z+IIK/bEgcZrM8iPWFL9DU1lGF0LNh9o2ctf6iyHLADk1aT0Br4n0o6yNKuMv7zu3wrid83B95jy6WQw+94eYPkC87jOXzruivPEFeDwzPvZyFIyvZpeMr+OoyPuQq4kjn2JScyw2C91Ts3XmFSdgW6I7oVqUHo4bixlKngAsnHIyzgFF3F86Rq4thJ9pfi7T3m+UpxwM9Dsaevdhf6L/ZxTjoOvwzcRs6cVLMxaNyteVixv3Sz/TKlvRWtWeGcS6jn6RYPq9vydzZdL5JGa+VqKmiZspGNGs5q91QbtZdOcpnXDIg6qK3IJlS36zc3Y3Dv9ygnXIT3SEZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742376675; c=relaxed/relaxed;
	bh=ggoJVmSZY4rP9BTO5PfJZrTvNlvIof77PrY5yQ6udEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iY4gxh+6eG2hX9BOKhbMlBjyTBAzhxqRKkH3VbSoJdz16wRXX9xg3L5cjW9OA2lA/TcRvlGUGrPN1Ld98mKaRzs1S7ugZ/s6MUbTCIA747Vk0n1j4eqozqcAGynnL5D28vTTPX0DDGSN0ejhiBIZLRWQI1oHEGx+ecnWOzEXpQUChYk18VWeYBM08El18n7GYZ1d8AwM8mHNfybrtVt2PIfC7LfGhZpUguAkiXLBNar5Pic4AoUn/UqGQHLRg05rcvCviPoBF4Yx7CYt6i0nn3j/Ssw5b2XMZXE29xnAu0BDju06Qjmbb+lqsyTxbB0YBHJKKqrCrQJjD3AbtW6c9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vRyxyYsr; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vRyxyYsr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHk3k6Kndz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 20:31:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A8486160D;
	Wed, 19 Mar 2025 09:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CE7C4CEE9;
	Wed, 19 Mar 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376670;
	bh=ZhE2RX1DzogrkLp/XQnGF8fK6IIiYf5DdB69tq+aBqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vRyxyYsr9l+WcVCxIWgYxwWPDzfPqHn2pY4ui2Pd6w3YkuxGdswrbAiNSS5k5o/Zk
	 olri7kh5KeOJZ0PoGnYaYikbaGafzSdJSeriOBmOu4BNkXTZ4+W15MgqycDBmoZS1v
	 W4lw1CpsWwgA93v8e0GiOMOp5wvsbl//ICor0BQY7+76rU3ahSF1e3XzKSE3nUEvtH
	 dNwLXYkSApuCqzhIb2hcR0x5u7dwseNWf+mJ+9oBxCvtqeNX6wkW75WXV1hnIfVI55
	 tNMdTeJMvqCAnJiaWvp4ELLQlz2T/ZBKrDXSAS55Na6/hhjL5UZbCRqwb0vshao6Gl
	 4bNu5u4wx/XaQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/57] irqdomain: ppc: Switch to of_fwnode_handle()
Date: Wed, 19 Mar 2025 10:29:01 +0100
Message-ID: <20250319092951.37667-9-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
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
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
defined of_fwnode_handle(). The former is in the process of being
removed, so use the latter instead.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 2 +-
 arch/powerpc/platforms/pseries/msi.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index ae4b549b5ca0..d8ccf2c9b98a 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1897,7 +1897,7 @@ static int __init pnv_msi_allocate_domains(struct pci_controller *hose, unsigned
 		return -ENOMEM;
 	}
 
-	hose->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(hose->dn),
+	hose->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(hose->dn),
 						     &pnv_msi_domain_info,
 						     hose->dev_domain);
 	if (!hose->msi_domain) {
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index f9d80111c322..5b191f70c088 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -628,7 +628,7 @@ static int __pseries_msi_allocate_domains(struct pci_controller *phb,
 		return -ENOMEM;
 	}
 
-	phb->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(phb->dn),
+	phb->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(phb->dn),
 						    &pseries_msi_domain_info,
 						    phb->dev_domain);
 	if (!phb->msi_domain) {
-- 
2.49.0


