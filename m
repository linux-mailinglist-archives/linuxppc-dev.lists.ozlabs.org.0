Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDD1609875
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 05:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwg422QHfz2xJN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 14:07:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=0uhVZzfu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rXZlS+er;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=0uhVZzfu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rXZlS+er;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwg313lR5z309f
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 14:06:52 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id BBB625C0076;
	Sun, 23 Oct 2022 23:06:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 23 Oct 2022 23:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666580808; x=
	1666667208; bh=/y1HVDfdw92zBbQH8hkPNy4vvcjzzgpitYUC+gDoVDA=; b=0
	uhVZzfuRnhZ8DuArDVZNY5A5jRXHt8acmkadu23FMaBZo7yi1QSsgW2puj5kn1Dp
	Gcm3Hzu1GIUU3dewvKGTV8ptRSy1lN7+u7G/ubu/4+i7tc/SHracvxKEnSch7dCm
	CCNflZ1imrcVm7Vpds/B8oTj6nexLoXRYOFubycqjA4EGtp3iCVnOATNVJ5kQ2oK
	ZLY6hFrf8AzrR6jjdiqshW7a5V1QtUuA/4qiA/252lV0e1zLzDr1xG0CeLt8hTnj
	Kwr/CMBzpdZAPh+cbTAWkMlsxwob+cbGxEYw16wIwplADRgUNjSXYH8GwJkRn/lT
	e6mkT22dYYCmLOpGXTPjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666580808; x=
	1666667208; bh=/y1HVDfdw92zBbQH8hkPNy4vvcjzzgpitYUC+gDoVDA=; b=r
	XZlS+erhOvs8To2u0i4Wscg+N7BjiBTDHDVg+yeitvUZS6hD94DYR4xVG9ZCkqBM
	G/o9Qz9cZT/5cYNRTsKCpwV6UmQ+C0tgbkdk4bVwEjL29VXW/xHM/dKdWIYBogwg
	AkkB8Joyq6b52tw3XNFqjMM9Gh15feulb7lLpTuIj/2irJn/mtYvKxzGDh0wY9Pr
	GOWhtpo9DQYVo7fSSTV9tBV3c3LQ2SfMy44GQcgrajjE1laPomH6p+nX5KHJy9Hc
	klWieG5XPS2r7YCmpHSidZCuHFheygK26/EsO5n7uGCA2nYoOX3OqyH10ZQhcTAB
	9viQLCbqffOG5u2avG5Ww==
X-ME-Sender: <xms:SAFWY8hdN1WcKp2OYkkEhROv3qs37bmPIndWcTBCh30QqnT9t8-HSw>
    <xme:SAFWY1C6KjMNE32zI6yZSh9uW7YBytynMppXVjsF2synzoVUxLXOZCndVBO9NwZVT
    o-UMJuCeC6MtFm-Vw>
X-ME-Received: <xmr:SAFWY0GMtUUhTXeB6C6NYWPjcq3Y7tJq9E-IyW1Dt3gIYH9cXi-KB4juPoasp0KFrX7nxsUcGvPZuz1JCS3tFu6gM1a5Cy7gxyw88NDujj-K-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtfedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:SAFWY9SJHrncDRPlk3uVRQ3iVq_6zTR4FZvfFJx2suLyGCNIxhCeqA>
    <xmx:SAFWY5zriGX_aBhiK0axq_2utXLHobcYwz0H3gKu5zl0vXR4P1Vh0A>
    <xmx:SAFWY74VsTtpptwZjUcAwQmJiXe2LERw-dB2nRCAn-71Dadgh-De0w>
    <xmx:SAFWY8oSzL5kXrz3g371IZL2PrajKPzCTG-EL1Bt98JRsAHHHsHRWg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Oct 2022 23:06:45 -0400 (EDT)
Message-ID: <f7912814434022ba93ed4d653c05d72a1d2b71fa.camel@russell.cc>
Subject: Re: [PATCH v8 1/6] powerpc: Allow clearing and restoring registers
 independent of saved breakpoint state
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 24 Oct 2022 14:06:42 +1100
In-Reply-To: <20221021052238.580986-2-bgray@linux.ibm.com>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
	 <20221021052238.580986-2-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
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
Cc: jniethe5@gmail.com, cmr@bluescreens.de, npiggin@gmail.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-10-21 at 16:22 +1100, Benjamin Gray wrote:
> From: Jordan Niethe <jniethe5@gmail.com>

Hi Ben,

> For the coming temporary mm used for instruction patching, the
> breakpoint registers need to be cleared to prevent them from
> accidentally being triggered. As soon as the patching is done, the
> breakpoints will be restored. The breakpoint state is stored in the
> per
> cpu variable current_brk[]. Add a pause_breakpoints() function which
> will
> clear the breakpoint registers without touching the state in
> current_bkr[]. Add a pair function unpause_breakpoints() which will
=20
typo here ^

> move
> the state in current_brk[] back to the registers.
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
> =C2=A0arch/powerpc/include/asm/debug.h |=C2=A0 2 ++
> =C2=A0arch/powerpc/kernel/process.c=C2=A0=C2=A0=C2=A0 | 36 ++++++++++++++=
+++++++++++++++-
> --
> =C2=A02 files changed, 35 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/debug.h
> b/arch/powerpc/include/asm/debug.h
> index 86a14736c76c..83f2dc3785e8 100644
> --- a/arch/powerpc/include/asm/debug.h
> +++ b/arch/powerpc/include/asm/debug.h
> @@ -46,6 +46,8 @@ static inline int debugger_fault_handler(struct
> pt_regs *regs) { return 0; }
> =C2=A0#endif
> =C2=A0
> =C2=A0void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
> +void pause_breakpoints(void);
> +void unpause_breakpoints(void);

Nitpick, would (clear/suspend)/restore be clearer than pause/unpause?

> =C2=A0bool ppc_breakpoint_available(void);
> =C2=A0#ifdef CONFIG_PPC_ADV_DEBUG_REGS
> =C2=A0extern void do_send_trap(struct pt_regs *regs, unsigned long
> address,
> diff --git a/arch/powerpc/kernel/process.c
> b/arch/powerpc/kernel/process.c
> index 67da147fe34d..7aee1b30e73c 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -685,6 +685,7 @@ DEFINE_INTERRUPT_HANDLER(do_break)
> =C2=A0
> =C2=A0static DEFINE_PER_CPU(struct arch_hw_breakpoint,
> current_brk[HBP_NUM_MAX]);
> =C2=A0
> +

some bonus whitespace here

> =C2=A0#ifdef CONFIG_PPC_ADV_DEBUG_REGS
> =C2=A0/*
> =C2=A0 * Set the debug registers back to their default "safe" values.
> @@ -862,10 +863,8 @@ static inline int set_breakpoint_8xx(struct
> arch_hw_breakpoint *brk)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> -void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> +static void ____set_breakpoint(int nr, struct arch_hw_breakpoint
> *brk)

Is there a way to refactor this?  The quad underscore is pretty cursed.

> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memcpy(this_cpu_ptr(&current_b=
rk[nr]), brk, sizeof(*brk));
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dawr_enabled())
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0// Power8 or later
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0set_dawr(nr, brk);
> @@ -879,6 +878,12 @@ void __set_breakpoint(int nr, struct
> arch_hw_breakpoint *brk)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON_ONCE(1);
> =C2=A0}
> =C2=A0
> +void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memcpy(this_cpu_ptr(&current_b=
rk[nr]), brk, sizeof(*brk));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0____set_breakpoint(nr, brk);
> +}
> +
> =C2=A0/* Check if we have DAWR or DABR hardware */
> =C2=A0bool ppc_breakpoint_available(void)
> =C2=A0{
> @@ -891,6 +896,31 @@ bool ppc_breakpoint_available(void)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(ppc_breakpoint_available);
> =C2=A0
> +/* Disable the breakpoint in hardware without touching current_brk[]
> */
> +void pause_breakpoints(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct arch_hw_breakpoint brk =
=3D {0};
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ppc_breakpoint_available(=
))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < nr_wp_slots(=
); i++)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0____set_breakpoint(i, &brk);
> +}
> +
> +/* Renable the breakpoint in hardware from current_brk[] */
> +void unpause_breakpoints(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ppc_breakpoint_available(=
))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < nr_wp_slots(=
); i++)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0____set_breakpoint(i, this_cpu_ptr(&current_brk[i]));
> +}
> +
> =C2=A0#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> =C2=A0
> =C2=A0static inline bool tm_enabled(struct task_struct *tsk)

