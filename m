Return-Path: <linuxppc-dev+bounces-4103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0909F0908
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 11:05:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8lMY6XfMz30h5;
	Fri, 13 Dec 2024 21:05:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734084329;
	cv=none; b=MHDqhbpAMdXpTQfLC2x6yIH//TeFYa5c0TZvpd6aBaPKvtumn9hCFB9fgzIUeXP/4qjpJ9aw/C5rEVZOPHomEgzzM2jlFhCUuEYQfbePh0DHueJzwOklZDKbF/PUg+fyzfnadfGeBgYWqcpXtJoN2AbVl+fECI3pzOKcM/e8wCjBVALxSa6arH7Q9TxBuU2tUCAid+9tgHq+zey4AlUTpzDUzuqG/ylas7tP8SsTapZcXES+6TXWY0kfy7nvMjHEelEfMCu3S5Z2sQW9CRn8mHUa18SLkt8tj8tjWF5HnLeFWsmUUJlyQfS4KiCBlAKtkQ8g9T1h7QaE+PZlH/NdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734084329; c=relaxed/relaxed;
	bh=VWc63gruN2VUu9vw6nxAr+LDqu/9hdgDSp/fkHJQsu0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Gr2l9Qg8fkHrB3BKMY/IptnbiM8KMpKTvL8dWQFT14crPnBShaI5SLyXZJ1KHCVCKR+flbPULh6mX1hDMjZajM80tVLg9ntUNhSOxpKJxxm5Gu/Omqu5gaSYgOqrJrGkzUGGad7WCV78UgKs47NOBf+hmSrYYzQoLmiN6Ujkf4p3bhrGbR9XdxxmHzyC45vsdy7KkOrt/7TxR0BsDl+YMyuik1XSrQtq2aabzcAKePW2cUaqLzaLAo3gcgc1vEPdz9M+X3mXyWFkd0FiiQeA2irl8m56nT2i1339oMKyzBqvoHU0f768WWeHV6WeSSXd1rXhIkSKoHlRUG3hRI+KmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=hJTs6O4j; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HFX4e7Ea; dkim-atps=neutral; spf=pass (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=hJTs6O4j;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HFX4e7Ea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8lMW2dGKz30T2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 21:05:26 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id A70611140205;
	Fri, 13 Dec 2024 05:05:23 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 05:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734084323;
	 x=1734170723; bh=VWc63gruN2VUu9vw6nxAr+LDqu/9hdgDSp/fkHJQsu0=; b=
	hJTs6O4jMcoFF/jTBxZ7Mf7S/NmWHzb5koQQF3Eb9WHSulTbMHw3W1eQss/MOaPM
	PhMpOfHpxgSXCZkv4FpoCEzNcuSCcBFTgK2z/lhvONGZxYnXKXMIIXxP48+b/q/u
	bMdKiePQow5lOLD1dHC1Bsb0/tJwEH6+pY+p3sdN1UsVbpOMqKShUznrd5gLsv2n
	Aft6Xh3E+OMO0jhvM0FxUnhpYbUarMPslkIVTU2RgvaPORk0tvJXA5pW9QJNdzGG
	gtz3cIFYO21NG16Tnot8Rtw2dKP0rxpaTf01RiQ6R65Dv9wgHzszSq4u9rgMNMWu
	nLrEtC/gqHPsF6DQD2zk0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734084323; x=
	1734170723; bh=VWc63gruN2VUu9vw6nxAr+LDqu/9hdgDSp/fkHJQsu0=; b=H
	FX4e7EatIGXIPghYMHzYYg7oVO2wsOaTJo1rjY53TZscHX0GF9TY7zVQb8KWkOvo
	tz/31eZURkCgrhyqB32m987s/gB70HA/fEVgcXYMGRr8tKT6SzmaMiEPSvjNHLXv
	LWV99xe4Ra2lcAZ2+2QKeB5r1KZLue3yobmAdsjs6bHSKwQfGzgyMZofsuZmCJtF
	Td7sesOd5b0haOW0lbrT7SeMe7QXu7OtMD8gsoteIYHzSIbDNyB4bmwi4+UM8J+d
	1WdY7/ETmWyiowfoV1mPxErwQb6kfenaWjEyBRaWY/t1JUs/a3LXlBmuHGmYMHEx
	lPYDh0E0C7ttTpQL2bFFA==
X-ME-Sender: <xms:4gZcZzsLTRRWMEamSKkFp_1NlWwkUjBdgN3X_VTvc3F_QDrtxV41RA>
    <xme:4gZcZ0fmPqmn0tr0vhZKg6uja8tNMgqMp5_CRf9djITMlWa_S_ep-JSj-rouiSMGJ
    7z55GT9inc2F6F9ld8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhuedugeeuudehkeetfeefteduhfduffdthfekuddt
    jefgvdffvddvlefgteffkeenucffohhmrghinhephhgvrggupggsohhokhefshgpfedvrd
    hssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegr
    rhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefgedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepthhssgho
    ghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehgrhgrfhesrg
    hmrgiiohhnrdgtohhmpdhrtghpthhtoheprghtihhshhhpsegrthhishhhphgrthhrrgdr
    ohhrghdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhhtrdhorhhgpdhrtghpth
    htoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphht
    thhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvg
    gtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghn
    rdhiugdrrghu
X-ME-Proxy: <xmx:4gZcZ2wugGXNW3b8ogHmYVCNVAvimp1PAnCa-ge6w-DjDnEUp1pTRA>
    <xmx:4gZcZyM4vBnanwQZNU24VzO3XsVwvNmc1HL9DSsu_fhvLDFnbNrk3g>
    <xmx:4gZcZz8dG2Zf7lkSaXunSCPhcbAUWWoXv6eKul3X9obR0pGPiMoSzg>
    <xmx:4gZcZyWqzO64bf-xsf1w0v_lumo_G23RUW4d0v_eRuSTJIxcEvroIw>
    <xmx:4wZcZ2fgbwJdA_4G_XdVMUnA2fWGukOTnpsKbWMRMWhgqhsDauIV94ix>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 297C02220072; Fri, 13 Dec 2024 05:05:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
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
Date: Fri, 13 Dec 2024 11:04:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>, kvm@vger.kernel.org
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Alexander Graf" <graf@amazon.com>, "Crystal Wood" <crwood@redhat.com>,
 "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Sean Christopherson" <seanjc@google.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Paul Durrant" <paul@xen.org>,
 "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Message-Id: <3380464f-5db4-487d-936f-1b5503905793@app.fastmail.com>
In-Reply-To: <2809dcce-3405-430e-b43d-d75f35bdb7d5@csgroup.eu>
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-4-arnd@kernel.org>
 <2809dcce-3405-430e-b43d-d75f35bdb7d5@csgroup.eu>
Subject: Re: [RFC 3/5] powerpc: kvm: drop 32-bit book3s
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Dec 12, 2024, at 19:34, Christophe Leroy wrote:
> Le 12/12/2024 =C3=A0 13:55, Arnd Bergmann a =C3=A9crit=C2=A0:
>
> $ git grep KVM_BOOK3S_32_HANDLER
> arch/powerpc/include/asm/processor.h:#ifdef CONFIG_KVM_BOOK3S_32_HANDL=
ER
> arch/powerpc/include/asm/processor.h:#endif /*=20
> CONFIG_KVM_BOOK3S_32_HANDLER */
> arch/powerpc/kernel/asm-offsets.c:#ifdef CONFIG_KVM_BOOK3S_32_HANDLER

Fixed now.

> What about the following in asm-offsets.c, should it still test=20
> CONFIG_PPC_BOOK3S_64 ? Is CONFIG_KVM_BOOK3S_PR_POSSIBLE still possible=20
> on something else ?
>
> #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_PR_POSS=
IBLE)
> 	OFFSET(VCPU_SHAREDBE, kvm_vcpu, arch.shared_big_endian);
> #endif
>
> Shouldn't CONFIG_KVM and/or CONFIG_VIRTUALISATION be restricted to=20
> CONFIG_PPC64 now ?

Agreed, fixed and found one more in that file.

> What about:
>
> arch/powerpc/kernel/head_book3s_32.S:#include <asm/kvm_book3s_asm.h>
> arch/powerpc/kernel/head_book3s_32.S:#include "../kvm/book3s_rmhandler=
s.S"

Removed.

> There is still arch/powerpc/kvm/book3s_32_mmu.c

This one is used for 32-bit guests and needs to stay I think.

See below for the changes I've now folded into this patch.

     Arnd

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/includ=
e/asm/kvm_book3s.h
index 71532e0e65a6..7e13e48dbc6b 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -377,7 +377,9 @@ static inline struct kvmppc_vcpu_book3s *to_book3s(s=
truct kvm_vcpu *vcpu)
=20
 /* Also add subarch specific defines */
=20
+#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #include <asm/kvm_book3s_64.h>
+#endif
=20
 static inline void kvmppc_set_gpr(struct kvm_vcpu *vcpu, int num, ulong=
 val)
 {
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/=
asm/kvm_host.h
index 6e1108f8fce6..56b01a135fcb 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -793,7 +793,7 @@ struct kvm_vcpu_arch {
 	struct machine_check_event mce_evt; /* Valid if trap =3D=3D 0x200 */
=20
 	struct kvm_vcpu_arch_shared *shared;
-#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_PR_POSSI=
BLE)
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	bool shared_big_endian;
 #endif
 	unsigned long magic_page_pa; /* phys addr to map the magic page to */
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/a=
sm/kvm_ppc.h
index ca3829d47ab7..001cd00d18f0 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -951,7 +951,7 @@ static inline void kvmppc_mmu_flush_icache(kvm_pfn_t=
 pfn)
  */
 static inline bool kvmppc_shared_big_endian(struct kvm_vcpu *vcpu)
 {
-#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_PR_POSSI=
BLE)
+#if defined(CONFIG_KVM_BOOK3S_PR_POSSIBLE)
 	/* Only Book3S_64 PR supports bi-endian for now */
 	return vcpu->arch.shared_big_endian;
 #elif defined(CONFIG_PPC_BOOK3S_64) && defined(__LITTLE_ENDIAN__)
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include=
/asm/processor.h
index 6b94de17201c..d77092554788 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -223,9 +223,6 @@ struct thread_struct {
 	struct thread_vr_state ckvr_state; /* Checkpointed VR state */
 	unsigned long	ckvrsave; /* Checkpointed VRSAVE */
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	void*		kvm_shadow_vcpu; /* KVM internal data */
-#endif /* CONFIG_KVM_BOOK3S_32_HANDLER */
 #if defined(CONFIG_KVM) && defined(CONFIG_BOOKE)
 	struct kvm_vcpu	*kvm_vcpu;
 #endif
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm=
-offsets.c
index 7a390bd4f4af..c4186061694c 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -147,9 +147,6 @@ int main(void)
 	OFFSET(THREAD_USED_SPE, thread_struct, used_spe);
 #endif /* CONFIG_SPE */
 #endif /* CONFIG_PPC64 */
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	OFFSET(THREAD_KVM_SVCPU, thread_struct, kvm_shadow_vcpu);
-#endif
 #if defined(CONFIG_KVM) && defined(CONFIG_BOOKE)
 	OFFSET(THREAD_KVM_VCPU, thread_struct, kvm_vcpu);
 #endif
@@ -401,7 +398,7 @@ int main(void)
 	OFFSET(VCPU_SHARED, kvm_vcpu, arch.shared);
 	OFFSET(VCPU_SHARED_MSR, kvm_vcpu_arch_shared, msr);
 	OFFSET(VCPU_SHADOW_MSR, kvm_vcpu, arch.shadow_msr);
-#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_PR_POSSI=
BLE)
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	OFFSET(VCPU_SHAREDBE, kvm_vcpu, arch.shared_big_endian);
 #endif
=20
@@ -511,19 +508,13 @@ int main(void)
 	OFFSET(VCPU_TAR_TM, kvm_vcpu, arch.tar_tm);
 #endif
=20
-#ifdef CONFIG_PPC_BOOK3S_64
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	OFFSET(PACA_SVCPU, paca_struct, shadow_vcpu);
 # define SVCPU_FIELD(x, f)	DEFINE(x, offsetof(struct paca_struct, shado=
w_vcpu.f))
 #else
 # define SVCPU_FIELD(x, f)
 #endif
-# define HSTATE_FIELD(x, f)	DEFINE(x, offsetof(struct paca_struct, kvm_=
hstate.f))
-#else	/* 32-bit */
-# define SVCPU_FIELD(x, f)	DEFINE(x, offsetof(struct kvmppc_book3s_shad=
ow_vcpu, f))
-# define HSTATE_FIELD(x, f)	DEFINE(x, offsetof(struct kvmppc_book3s_sha=
dow_vcpu, hstate.f))
-#endif
-
+#define HSTATE_FIELD(x, f)	DEFINE(x, offsetof(struct paca_struct, kvm_h=
state.f))
 	SVCPU_FIELD(SVCPU_CR, cr);
 	SVCPU_FIELD(SVCPU_XER, xer);
 	SVCPU_FIELD(SVCPU_CTR, ctr);
@@ -547,14 +538,9 @@ int main(void)
 	SVCPU_FIELD(SVCPU_FAULT_DAR, fault_dar);
 	SVCPU_FIELD(SVCPU_LAST_INST, last_inst);
 	SVCPU_FIELD(SVCPU_SHADOW_SRR1, shadow_srr1);
-#ifdef CONFIG_PPC_BOOK3S_32
-	SVCPU_FIELD(SVCPU_SR, sr);
-#endif
-#ifdef CONFIG_PPC64
 	SVCPU_FIELD(SVCPU_SLB, slb);
 	SVCPU_FIELD(SVCPU_SLB_MAX, slb_max);
 	SVCPU_FIELD(SVCPU_SHADOW_FSCR, shadow_fscr);
-#endif
=20
 	HSTATE_FIELD(HSTATE_HOST_R1, host_r1);
 	HSTATE_FIELD(HSTATE_HOST_R2, host_r2);
@@ -601,12 +587,9 @@ int main(void)
 	OFFSET(KVM_SPLIT_NAPPED, kvm_split_mode, napped);
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
=20
-#ifdef CONFIG_PPC_BOOK3S_64
 	HSTATE_FIELD(HSTATE_CFAR, cfar);
 	HSTATE_FIELD(HSTATE_PPR, ppr);
 	HSTATE_FIELD(HSTATE_HOST_FSCR, host_fscr);
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
 #else /* CONFIG_PPC_BOOK3S */
 	OFFSET(VCPU_CR, kvm_vcpu, arch.regs.ccr);
 	OFFSET(VCPU_XER, kvm_vcpu, arch.regs.xer);
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32=
.h
index 9cba7dbf58dd..24e89dadc74d 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -172,7 +172,6 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 #define	START_EXCEPTION(n, label)		\
 	__HEAD;					\
 	. =3D n;					\
-	DO_KVM n;				\
 label:
=20
 #else
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/=
head_book3s_32.S
index cb2bca76be53..505d0009ddc9 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -30,7 +30,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/ptrace.h>
 #include <asm/bug.h>
-#include <asm/kvm_book3s_asm.h>
 #include <asm/feature-fixups.h>
 #include <asm/interrupt.h>
=20
@@ -861,10 +860,6 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_HPTE_TABLE)
 	rfi
 #endif /* CONFIG_SMP */
=20
-#ifdef CONFIG_KVM_BOOK3S_HANDLER
-#include "../kvm/book3s_rmhandlers.S"
-#endif
-
 /*
  * Load stuff into the MMU.  Intended to be called with
  * IR=3D0 and DR=3D0.

