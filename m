Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C64963104D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 07:09:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX4k45zbfzDrdS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 17:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M0eKd+0H; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX4hK65MfzDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 17:07:27 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id d85so5904332qkg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 22:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+rZMn81nItYMfTxQIYm4AJB4Em1cxJWX+xfGWskuj0=;
 b=M0eKd+0HHH/kMzKnq9rLYOT8HdhYTANkxRdXNs0vIEEhqlZiGB+mPBHx1Je1rGIl3Q
 D2+TfYASZwF5/FCGh3GAqas7MIWkmdU40IlNl5KlID2kjYHxZ4dLZ2DUTBJLlkOc27iW
 /XuMlH6I2lAbmCH+tx0QoAop3XZ6xWMyUdM810U4DThrqH4zUzvzE34bUNQJTRofsGiN
 a1Ebrv1yU0/0+08aucKtAzOSrmwrL5rh/kya1E8c4jJOiQnQVoz05VXFBfVIFz/6mhAv
 16GIb9/vouy/V4dHC3NjcOmTOlwEvy9GSk/VKyLbJiyifqsnNHyo6sxRWcs37Dmo1xzX
 9w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+rZMn81nItYMfTxQIYm4AJB4Em1cxJWX+xfGWskuj0=;
 b=gaA5G8wOSSjZelOFsRZqs19lUBfUOr3Fie6QvKGKZ4/Mlzn1X6DO8wzPhgwwwOeV/+
 68FjowXkT9mpUCSdwhx4o2Nxg+Eh6Arh7uIiiWAtDYw73IpvtikxeLywKv99uBQ8BNwk
 iw/XZoZgHXJaolkGq1luOPbCf8D6rVa9vo2fFcOHkIc5iNC0i3nUR5e62wLLF558Xv2J
 Oq9/YcYrMhadAUWx7z2p/zn5pfRggsC9CvvByytaGQAnurLiA3CcoiKUcN/panY7EWZl
 wMsXdjEIyoFDVkeEqmhyJP14N4WrxQaOIN5lpyxn1m8k1de8mZhMbVxZKa7bmv500C7x
 FMwQ==
X-Gm-Message-State: AOAM531V/DEf7+738/YIg8GVqHl4j39WOEtYmnsma4K1GiKBmIaulIl0
 Y6kiBPLZ5CwqMYmY4qu284c=
X-Google-Smtp-Source: ABdhPJytFulfFj25v/hGN6HgQ33XEaNapQrRh0Va6HFsbKPJJRVrCk0eK4ifv0egqZk+weMhL6+mkQ==
X-Received: by 2002:a37:e217:: with SMTP id g23mr2885432qki.283.1612505245360; 
 Thu, 04 Feb 2021 22:07:25 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 (186-249-147-196.dynamic.desktop.com.br. [186.249.147.196])
 by smtp.gmail.com with ESMTPSA id q22sm4129436qki.51.2021.02.04.22.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 22:07:24 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Leonardo Bras <leobras.c@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/1] powerpc/kvm: Save Timebase Offset to fix sched_clock()
 while running guest code.
Date: Fri,  5 Feb 2021 03:06:44 -0300
Message-Id: <20210205060643.233481-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.29.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Before guest entry, TBU40 register is changed to reflect guest timebase.
After exitting guest, the register is reverted to it's original value.

If one tries to get the timestamp from host between those changes, it
will present an incorrect value.

An example would be trying to add a tracepoint in
kvmppc_guest_entry_inject_int(), which depending on last tracepoint
acquired could actually cause the host to crash.

Save the Timebase Offset to PACA and use it on sched_clock() to always
get the correct timestamp.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Suggested-by: Paul Mackerras <paulus@ozlabs.org>
---
Changes since v1:
- Subtracts offset only when CONFIG_KVM_BOOK3S_HANDLER and
  CONFIG_PPC_BOOK3S_64 are defined.
---
 arch/powerpc/include/asm/kvm_book3s_asm.h | 1 +
 arch/powerpc/kernel/asm-offsets.c         | 1 +
 arch/powerpc/kernel/time.c                | 8 +++++++-
 arch/powerpc/kvm/book3s_hv.c              | 2 ++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 2 ++
 5 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
index 078f4648ea27..e2c12a10eed2 100644
--- a/arch/powerpc/include/asm/kvm_book3s_asm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
@@ -131,6 +131,7 @@ struct kvmppc_host_state {
 	u64 cfar;
 	u64 ppr;
 	u64 host_fscr;
+	u64 tb_offset;		/* Timebase offset: keeps correct timebase while on guest */
 #endif
 };
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index b12d7c049bfe..0beb8fdc6352 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -706,6 +706,7 @@ int main(void)
 	HSTATE_FIELD(HSTATE_CFAR, cfar);
 	HSTATE_FIELD(HSTATE_PPR, ppr);
 	HSTATE_FIELD(HSTATE_HOST_FSCR, host_fscr);
+	HSTATE_FIELD(HSTATE_TB_OFFSET, tb_offset);
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 #else /* CONFIG_PPC_BOOK3S */
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 67feb3524460..f27f0163792b 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -699,7 +699,13 @@ EXPORT_SYMBOL_GPL(tb_to_ns);
  */
 notrace unsigned long long sched_clock(void)
 {
-	return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
+	u64 tb = get_tb() - boot_tb;
+
+#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_HANDLER)
+	tb -= local_paca->kvm_hstate.tb_offset;
+#endif
+
+	return mulhdu(tb, tb_to_ns_scale) << tb_to_ns_shift;
 }
 
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index b3731572295e..c08593c63353 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3491,6 +3491,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		if ((tb & 0xffffff) < (new_tb & 0xffffff))
 			mtspr(SPRN_TBU40, new_tb + 0x1000000);
 		vc->tb_offset_applied = vc->tb_offset;
+		local_paca->kvm_hstate.tb_offset = vc->tb_offset;
 	}
 
 	if (vc->pcr)
@@ -3594,6 +3595,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		if ((tb & 0xffffff) < (new_tb & 0xffffff))
 			mtspr(SPRN_TBU40, new_tb + 0x1000000);
 		vc->tb_offset_applied = 0;
+		local_paca->kvm_hstate.tb_offset = 0;
 	}
 
 	mtspr(SPRN_HDEC, 0x7fffffff);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index b73140607875..8f7a9f7f4ee6 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -632,6 +632,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 	cmpdi	r8,0
 	beq	37f
 	std	r8, VCORE_TB_OFFSET_APPL(r5)
+	std	r8, HSTATE_TB_OFFSET(r13)
 	mftb	r6		/* current host timebase */
 	add	r8,r8,r6
 	mtspr	SPRN_TBU40,r8	/* update upper 40 bits */
@@ -1907,6 +1908,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	beq	17f
 	li	r0, 0
 	std	r0, VCORE_TB_OFFSET_APPL(r5)
+	std	r0, HSTATE_TB_OFFSET(r13)
 	mftb	r6			/* current guest timebase */
 	subf	r8,r8,r6
 	mtspr	SPRN_TBU40,r8		/* update upper 40 bits */
-- 
2.29.2

