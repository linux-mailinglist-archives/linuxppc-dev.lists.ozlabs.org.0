Return-Path: <linuxppc-dev+bounces-1868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC0B995EDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 07:17:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNh2m3hX1z2yFP;
	Wed,  9 Oct 2024 16:17:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728451024;
	cv=none; b=WJCeIQjV95nbuCCnype3ao8WzRmZYdWU/+1Q0ByDBUvkMBlTxMovBFWZvmOzVsNSc5rxTTOL9jMZOWq+CBnHKA7KymImzOWEpbg+vIuNftPqWrKjQnSLWOoEef6BaCts5Nuj50dGssoyjzsmSuQz4Ui+jhMSaey2Ox+4lgDnGx2EtIOgjOcObLdHugbyG9sNC6FlT3vy1OKCKGHzuQsY6SLupOH+hiKGsyT+L2lZHt/7FmdN/pm5aNYQdbUSPFfrhRwmKNpA8p6M1Xl7bT9SS5O8QPVcm1rL64EAHAyhihFZ6Iv4t4nL045vq3C9cAnh/HysYQ1KBwMz0JQaYqteJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728451024; c=relaxed/relaxed;
	bh=Kmp3jv3s3LGlEpsRybldqKct2pe49w18wMUTnR4qC+c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Tiz5tarBAMsRhtOgX05PFdY4Z+zovDTXr+BxWwcGGz+gIfKt7JRkDSwSzUi0aY5LFpOsahPZNaunUpedANMvTS1O/FyLwIE48QAvRRBtyEsQApr4HlBAcqUjE5IF8aaDi1LhCI/NR0G92AR3XPVifiFjSJD6hlSMXLzKqm7knPGAQpbTiBR5hwPoE/EOb90FH9Ajd7MKj0ealu0fKA9Ey4/Z4eCCdd1XbWcxRcA/9fa7jfp1jRDIDyOIz6wNqnM/wvtUmjFaF6LnTNRXv8m7oHNe8aMYQ6dwXa+vpnAacz2lo0MtTMP8MfjThCqbbORj3omfnVbvB3+MACBu7NQgwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UhgG/g4p; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UhgG/g4p;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNh2l1V7bz2xks
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 16:17:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728451022;
	bh=Kmp3jv3s3LGlEpsRybldqKct2pe49w18wMUTnR4qC+c=;
	h=From:To:Subject:Date:From;
	b=UhgG/g4pDM3owWdmhk3DaNz3T349lTSLUEViecO0xdoIHmJeWIs0qQ6SsSljZF0Sn
	 ugEBZDo7taygYJHiPcFpkngtfWAO4ij3M1uR9oVfYWUu0ft43Wrg5i2XpwiIlbVtnU
	 ul44T8w0aEOfx2u2Eli2WBkBDsU3xOhppg21LkisX4jpUuq5FZEgZ5HVJlbrWVtfbO
	 /bBIuPXhd9Rze3OqLFuNZs17tYI1Ho5AgXvqj4z0f9m5GCTPk61OoaMY1Qppbv3lAS
	 q6KiplYmr7d7c919/Cqfmt2znCaEosTjpX6SjNuUSL2pDwX3LZek5ZJVBDKxhIkbbd
	 zDVbd77/fZ45g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNh2k20cDz4wy9;
	Wed,  9 Oct 2024 16:17:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64: Drop IPI_PRIORITY from asm-offsets
Date: Wed,  9 Oct 2024 16:17:00 +1100
Message-ID: <20241009051701.132282-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The last use of IPI_PRIORITY in asm was removed in commit 37f55d30df2e
("KVM: PPC: Book3S HV: Convert kvmppc_read_intr to a C function").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/asm-offsets.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 131a8cc10dbe..256e8c1bbb49 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -597,7 +597,6 @@ int main(void)
 	HSTATE_FIELD(HSTATE_DABR, dabr);
 	HSTATE_FIELD(HSTATE_DECEXP, dec_expires);
 	HSTATE_FIELD(HSTATE_SPLIT_MODE, kvm_split_mode);
-	DEFINE(IPI_PRIORITY, IPI_PRIORITY);
 	OFFSET(KVM_SPLIT_RPR, kvm_split_mode, rpr);
 	OFFSET(KVM_SPLIT_PMMAR, kvm_split_mode, pmmar);
 	OFFSET(KVM_SPLIT_LDBAR, kvm_split_mode, ldbar);
-- 
2.46.2


