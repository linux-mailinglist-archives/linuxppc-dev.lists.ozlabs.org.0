Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3AE310368
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 04:18:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX0xP1lsvzDrhY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 14:18:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kl220aut; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX0vS37wmzDvXQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 14:16:46 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id u20so5645674qku.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 19:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WTNk9Xbw6EghApIXQgl/ogYtRuCwBqSCPnWZ2LdagU=;
 b=kl220autwj+PrnjrQxTlb2/j43lozhddaVtEdxeo3Eb1olxxUNrgM27SIT2VuHAEbQ
 UtZypHI/rURy1bC9zu6yyd6rgCtEaseSa8e/f8tSCV9L/AvOaA6Q1NquI0/7bcwOBvo/
 n/Br77ExjxcR1sTUsdJL1mY9250CfUvUypKT4l50J0xQYcfMF4ezP8p3Sho80IY07Unz
 dVX9H9NNI1dk35W20/lmJlEqpF19WFZQSdg7MBDLXFq0gnskmB8iH/spt3+RF0wOmCfd
 LMEiRVaQbuURxJ5lxjaIywwxstP2rNwlDJd/ij7rSS/AKPWJxIsfEXzpynwp1jSAsYA5
 YTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WTNk9Xbw6EghApIXQgl/ogYtRuCwBqSCPnWZ2LdagU=;
 b=LYn27oj4S9+eszDbKmjJWMruqc/js0K7Cz3uMdY1QvLVuXKNTWhOgaZpedwObhJklK
 5QnBA5g7fPCdIbAgbYgWQoqax0swpwhMaSnIvaX0eC5K36YfKwg2343lcchzQAmx+g3q
 gJXx1t6hT7voM8kKXLFok4uaGillA+DlZYE0kxqRfdzBGHMy2DiEb9h1ztiL48HTkt7F
 tkFFsrUZamsNWWIDrfsqevpwwqXwDYzFqTlUH7JTCuRY4Khmo3MipXp1H+aRlSigfiFS
 7JlY9ymdt9XfDx08oWYkPnSwvtreM5EQ2TXhQcQMn4Wtmch8Xk3iOGR89uizV2HeSUzK
 v1xw==
X-Gm-Message-State: AOAM530nTtoHsb/HwvbV4I6z9fU5PUx6cnJuQHo2sCK2KgcDJffaTOu7
 OWDM9PCcnZy2G/W6jQKD5oQ=
X-Google-Smtp-Source: ABdhPJzquNM+md70FmybygGiqQluF5m3/Rm/hLyrOyr5Kt5Vk91Zinjx4QN+Nlm3uwB6RKvlBAe5dw==
X-Received: by 2002:a37:455:: with SMTP id 82mr2590683qke.490.1612495003118;
 Thu, 04 Feb 2021 19:16:43 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 (186-249-147-196.dynamic.desktop.com.br. [186.249.147.196])
 by smtp.gmail.com with ESMTPSA id o45sm6842587qto.91.2021.02.04.19.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 19:16:42 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Gustavo Romero <gromero@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH 1/1] powerpc/kvm: Save Timebase Offset to fix sched_clock()
 while running guest code.
Date: Fri,  5 Feb 2021 00:16:24 -0300
Message-Id: <20210205031623.222730-1-leobras.c@gmail.com>
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
Cc: Leonardo Bras <leobras.c@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
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
---
 arch/powerpc/include/asm/kvm_book3s_asm.h | 1 +
 arch/powerpc/kernel/asm-offsets.c         | 1 +
 arch/powerpc/kernel/time.c                | 3 ++-
 arch/powerpc/kvm/book3s_hv.c              | 2 ++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 2 ++
 5 files changed, 8 insertions(+), 1 deletion(-)

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
index 67feb3524460..adf6648e3572 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -699,7 +699,8 @@ EXPORT_SYMBOL_GPL(tb_to_ns);
  */
 notrace unsigned long long sched_clock(void)
 {
-	return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
+	return mulhdu(get_tb() - boot_tb - local_paca->kvm_hstate.tb_offset, tb_to_ns_scale)
+			<< tb_to_ns_shift;
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

