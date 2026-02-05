Return-Path: <linuxppc-dev+bounces-16611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO3VKlFQhGkE2gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 09:09:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA5EFBD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 09:09:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f68yk1lTnz2yFb;
	Thu, 05 Feb 2026 19:09:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770278990;
	cv=none; b=HmLgnijkprV+eg83E5d7X0SbcytYhe5rADu72Pu+FpylZv8aUVfRxRO9ULjb3D2Io+piwfCLLReQsKCR9dZdFF1DC8D/9vi0yqunBi88057OdtAFaGel753Jbp47siEWWTS0jWMlgN1tuM0dAGWb2JHbzIqc1+/iENmMOGcZ9w2gEGqkPQTIpq6gku9nxTYiYTaEtDSXFfNrv2ymV7FdtnLEzZbnqGUg7Y0zslrDA9tO5tVsX22qoWPVH7+t7v241E1bU2XLrpZDU+38vC6swYftxgxGX2GS95whAsPgtrEnB39am4r8D49OhEVPPkU4Jo7L29lsgS0GU0/W9nrzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770278990; c=relaxed/relaxed;
	bh=j0zOtfOLPNEn9L9ERmStb8da84cpm/uZMBH6mKpx9nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aDxZ8wgU8fZROiOuOO/7vnOlcvpjUkyANzGC5k1OWtvAeHZ96FMr7WfyN7faoq6AKl4PxzI4eQNmWPQuMCRk/OkXGvTQMhhe2KuucTgNPM0XyYAVyz/jdmPWCmPk4DNIetH79bdW/lxtJuDgNjsUbaa2S/2xDxTP0KWh3uPaWM/mtJ3jIa8tzceZ8z/BALXKLm/jF0k89g4MVVX6wQeJjJFDPHnfwuSR0t0CoTaVcTpc938tkSyqzNZbpPOzcgp4FTed+1URPNKbwVZusl0nW6tyCxbgqYY13ul/O+svb+CTXVuZbhe8RjbnRSe25y9XXeOfrgHrsHbMROCQBebFAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pB2e8MNX; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pB2e8MNX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f68yj2k0nz2xg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 19:09:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84C9343B8D;
	Thu,  5 Feb 2026 08:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33374C4CEF7;
	Thu,  5 Feb 2026 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770278987;
	bh=Gk1rpoOJ3qlMNhZI4HdytNI08bOgFElC6mEKS/IYXNY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=pB2e8MNXaRPUmdj792704a5mCJ0O/XIcY+O/2uRB8F5ajnD4PcWkA5KMzKdeEv6lr
	 1uUJN8R989oRBO7EdhPbQ6DY7ClEQcXN6BH40hSFaFL34sfY2LJiOslN+vusKxUq5M
	 7AinykT94Vuh8f1ztqhVGOk6b3g7bai93vDS+1Fii6v1Eooi66xu05r+3tGuW9REsC
	 HHy6KSI7JjgIhhbLQNpDPf/rhBrUvbebMayFanIA0pa7w2sSqk3ka0qoG7MqSLq2O7
	 1TNzuHjjOsM9ii53boG+MXTyhUyTTv1CEpljC4vj5gNuGBrgBzqfZnfe1x8M1yTlje
	 VRvEXr3Tb4PMQ==
Message-ID: <306b01a2-caba-4c15-89d4-849c3f4848cb@kernel.org>
Date: Thu, 5 Feb 2026 09:09:41 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] powerpc/jump_label: adjust inline asm to be
 consistent
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-2-mkchauras@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260204210125.613350-2-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16611-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C6EA5EFBD2
X-Rspamd-Action: no action



Le 04/02/2026 à 22:01, Mukesh Kumar Chaurasiya (IBM) a écrit :
> [Vous ne recevez pas souvent de courriers de mkchauras@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
> to avoid duplication of inline asm between C and Rust. This is
> inline with commit aecaf181651c '("jump_label: adjust inline asm to be consistent")'
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
> index d4eaba459a0e..a6b211502bfe 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,20 @@
>   #define JUMP_ENTRY_TYPE                stringify_in_c(FTR_ENTRY_LONG)
>   #define JUMP_LABEL_NOP_SIZE    4
> 
> +#define JUMP_TABLE_ENTRY(key, label)                   \
> +       ".pushsection __jump_table,  \"aw\"     \n\t"   \
> +       ".long 1b - ., " label " - .            \n\t"   \
> +       JUMP_ENTRY_TYPE key " - .               \n\t"   \
> +       ".popsection                            \n\t"
> +
> +#define ARCH_STATIC_BRANCH_ASM(key, label)             \
> +       "1:     nop                             \n\t"   \
> +       JUMP_TABLE_ENTRY(key,label)
> +
>   static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>   {
> -       asm goto("1:\n\t"
> -                "nop # arch_static_branch\n\t"
> -                ".pushsection __jump_table,  \"aw\"\n\t"
> -                ".long 1b - ., %l[l_yes] - .\n\t"
> -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -                ".popsection \n\t"
> +       asm goto(
> +                ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>          return false;
> @@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
>   {
>          asm goto("1:\n\t"
>                   "b %l[l_yes] # arch_static_branch_jump\n\t"
> -                ".pushsection __jump_table,  \"aw\"\n\t"
> -                ".long 1b - ., %l[l_yes] - .\n\t"
> -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -                ".popsection \n\t"
> +                JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
>                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>          return false;
> --
> 2.52.0
> 


