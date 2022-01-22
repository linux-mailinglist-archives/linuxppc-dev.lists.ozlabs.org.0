Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9F496BCB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 11:57:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgtVp0Y5Cz3bN6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 21:57:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IJ+a5AWN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IJ+a5AWN; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgtV857fjz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 21:56:48 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id p37so11208016pfh.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 02:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SKUk6Lj5naIqkbhFBM90oROvhAGiKRybMHBOlftMt3E=;
 b=IJ+a5AWNX7BHnvaEAnI3sugw2gfY6rDtyTG6Q29f9JC7ZLGpitDxfFlMTu9pLd8l1O
 efzE+1+YjVELigf0zaGWSCHcooSTLa+7APMMZ869A1aW9ON1rroEfv6Zs4IprxT3GizY
 LMKX/FVLxHFqIccxG7liQS/RiuZpL0cyF+HsVjwXKvYsa+Fd7Lw5YofGoYGBMesqn1kw
 c8X/s4niMw5BCEvJyj9A17fcooiU1wN8+US+8wAuH7Hh/ZOGig6qIsrW08rCEWjVmZQC
 Zd14n+ft4D+aqn4xdQV/D5NbS0h+8dMRR4FojOCaSULE46YZabM/HXNzJ/fqM4zqWAzP
 A55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SKUk6Lj5naIqkbhFBM90oROvhAGiKRybMHBOlftMt3E=;
 b=72JQjOyrv5hJhSOAIoxtWj0J5ew77Q1w9m68ivGXP4C5qv2vIFAMk5PozXQlFKAFgZ
 grww6epzgpBh/8/6ryP1YvXeX4Ss/D1XOchZ5Fmu6Ne072Ke+dGj8XgRHAgrEv4o5kRF
 bMphC+I5v1JBe2gjm8D5re0uySz/MJrlUYAFwzHoG5o5x5ln2VJ/pyzngCC5wkTrJ0Ec
 52lMMKqAx/fh5yWY3i+Ha3TC8PBEBI4mRhB1H7k/ebJp1NWUIMKHIBfJbrW8FZoRx4M8
 Udf+X3gT6OrfqethOSHUILINek1ifun/JUR5CYlrufb4LiQ5WewlX4FN/PL6oM4A92tx
 I/qg==
X-Gm-Message-State: AOAM530dqshOrfV55U96oItmndvFhBBDOM7SlaRiqi7a6psp8hOzlgxZ
 RfSn+BTj95nOO6lZZ0cepfh0vnPH5wY=
X-Google-Smtp-Source: ABdhPJw7ZLyR6ZHmrpyZh39wNPJQWRGzCt2SpG20ld8HJ2U4J9CZCR5XkmE7fGBSnEklCccM6yA7jg==
X-Received: by 2002:a63:2220:: with SMTP id i32mr5692281pgi.320.1642849005777; 
 Sat, 22 Jan 2022 02:56:45 -0800 (PST)
Received: from bobo.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id f13sm10294198pfc.70.2022.01.22.02.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 02:56:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV: HFSCR[PREFIX] does not exist
Date: Sat, 22 Jan 2022 20:56:39 +1000
Message-Id: <20220122105639.3477407-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This facility is controlled by FSCR only. Reserved bits should not be
set in the HFSCR register (although it's likely harmless as this
position would not be re-used, and the L0 is forgiving here too).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/reg.h | 1 -
 arch/powerpc/kvm/book3s_hv.c   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 2835f6363228..1e14324c5190 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -417,7 +417,6 @@
 #define   FSCR_DSCR	__MASK(FSCR_DSCR_LG)
 #define   FSCR_INTR_CAUSE (ASM_CONST(0xFF) << 56)	/* interrupt cause */
 #define SPRN_HFSCR	0xbe	/* HV=1 Facility Status & Control Register */
-#define   HFSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
 #define   HFSCR_MSGP	__MASK(FSCR_MSGP_LG)
 #define   HFSCR_TAR	__MASK(FSCR_TAR_LG)
 #define   HFSCR_EBB	__MASK(FSCR_EBB_LG)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 84c89f08ae9a..be8914c3dde9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2830,7 +2830,7 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	 * to trap and then we emulate them.
 	 */
 	vcpu->arch.hfscr = HFSCR_TAR | HFSCR_EBB | HFSCR_PM | HFSCR_BHRB |
-		HFSCR_DSCR | HFSCR_VECVSX | HFSCR_FP | HFSCR_PREFIX;
+		HFSCR_DSCR | HFSCR_VECVSX | HFSCR_FP;
 	if (cpu_has_feature(CPU_FTR_HVMODE)) {
 		vcpu->arch.hfscr &= mfspr(SPRN_HFSCR);
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-- 
2.23.0

