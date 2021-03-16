Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07933CC42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:46:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzzjW26T8z30GS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:46:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=HzMVlrLH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=UpUCtl+A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=HzMVlrLH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UpUCtl+A; 
 dkim-atps=neutral
X-Greylist: delayed 531 seconds by postgrey-1.36 at boromir;
 Tue, 16 Mar 2021 14:45:56 AEDT
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzzj01wdcz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 14:45:56 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 481B65C0108;
 Mon, 15 Mar 2021 23:37:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 15 Mar 2021 23:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 DpYLPwutDRmI/uxfHqddZ1cnpn6dGqh2dZModGa7/+w=; b=HzMVlrLH899GtYQ7
 1n2IKeTnRx9/5K5sCe7TOMtBclG7n7C08BiKyQrawzF19j0j0nAVCyXUWxBFlqyx
 5FT/9orh8kshhL0NodjnN7FgU0cel2HXdXLbB7Lg8JDi/vDGH7vsYyF6kaAjRGVH
 oPEK+6QGoUxEjYS5NUfL9dPgckG0e5j0u2hvFW4Ss2NWrUaOmTCFLFHJMfKMcVxf
 kLO0qovAuG4qJSjdSN9fXTOMAE4efuYc0lDhbz9QvAhElBvH0lXEjzweUo31M6mi
 /C2eR5JArHGyqAQxvXD0iQyGIfm1+8JUrPSWOE4dwX/kL+zS6Tp3Zaflnpn8zxPS
 5tJrIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=DpYLPwutDRmI/uxfHqddZ1cnpn6dGqh2dZModGa7/
 +w=; b=UpUCtl+Ash3j0YZ73WUP3Fv+yNctIbzRbfZgTjjCIXAYGmjFny5ls+9+d
 0G+kUb//iFHm0f6enzofEYOPgfeEF05dZC0Fn1Pp4B7qOqTMu8jYaK8q9bjrdTu9
 1yhSNLk16V1a87IDZJj1Pfmd8O5jE+NXon+UvG6tcgmhnoJ2Ad/plyOM0WKd9eiD
 sSE5lErWW+FDhevu1gIn9Jig+vo/8Flud8u+JzZXLwLAo9fKJnz/FP1cXZ9WqiUw
 cN7HtIfxHbKQgZZ1VXDjyx26cHLNPQN0cVxUqgzhlfLPzacysZbMoVP/JJrcvsUZ
 OP+6CwL64fWGRwSMylB8EDwh2fMcQ==
X-ME-Sender: <xms:2ydQYFz5XZP89njQw8PRLnOMdTwmf7OQjCVJUR1Nvnwe5qepKCsaRg>
 <xme:2ydQYFTw0R0SBxtQET2n7luRzy4WlgEaHsnKt8aVaba_reKlRVZY36aCWT-La8bqV
 r1rrD4U9um-g-Smgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfffjghftggfggfgsehtkeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeeukeegvdefiefgudekgefftddvtdel
 keegvefgkeelgeejueejveehvefgieeujeenucfkphepudejvddrudelfedrgeeirdehje
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhs
 tghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:2ydQYPUjH62kP2lLKSLOtdiwPKrUdHbGpYwbttte_JZ0nGyTTVtLeQ>
 <xmx:2ydQYHjZT5GleL5G8Y2c7M2TSauogxaRRmELewMX-2f_YNpM_WV5Aw>
 <xmx:2ydQYHAsRWMNl_9nb_0J65ZLNdBWGdhiel5kYlzKkMSR_yzlYdnG-w>
 <xmx:3CdQYC9hx71N1Am7DvYWdoqn6c3ucy-cbSQDgq66MXIbIgUqiU5syg>
Received: from crackle.ozlabs.ibm.com (cpe-172-193-46-57.qld.foxtel.net.au
 [172.193.46.57])
 by mail.messagingengine.com (Postfix) with ESMTPA id 779B71080054;
 Mon, 15 Mar 2021 23:36:57 -0400 (EDT)
Message-ID: <5140a641c71f0e89edb5800b075138b32fd56544.camel@russell.cc>
Subject: Re: [PATCH v9 2/8] powerpc/lib/code-patching: Set up Strict RWX
 patching earlier
From: Russell Currey <ruscur@russell.cc>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 16 Mar 2021 13:36:52 +1000
In-Reply-To: <20210316031741.1004850-2-jniethe5@gmail.com>
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-2-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
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
Cc: christophe.leroy@c-s.fr, naveen.n.rao@linux.ibm.com, ajd@linux.ibm.com,
 npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-03-16 at 14:17 +1100, Jordan Niethe wrote:
> setup_text_poke_area() is a late init call so it runs before
> mark_rodata_ro() and after the init calls. This lets all the init
> code
> patching simply write to their locations. In the future, kprobes is
> going to allocate its instruction pages RO which means they will need
> setup_text__poke_area() to have been already called for their code
> patching. However, init_kprobes() (which allocates and patches some
> instruction pages) is an early init call so it happens before
> setup_text__poke_area().
> 
> start_kernel() calls poking_init() before any of the init calls. On
> powerpc, poking_init() is currently a nop. setup_text_poke_area()
> relies
> on kernel virtual memory, cpu hotplug and per_cpu_areas being setup.
> setup_per_cpu_areas(), boot_cpu_hotplug_init() and mm_init() are
> called
> before poking_init().
> 
> Turn setup_text_poke_area() into poking_init().
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Good job finding & fixing this bug!

Reviewed-by: Russell Currey <ruscur@russell.cc>

> ---
> v9: New to series
> ---
>  arch/powerpc/lib/code-patching.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c
> b/arch/powerpc/lib/code-patching.c
> index 2333625b5e31..b28afa1133db 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -65,14 +65,11 @@ static int text_area_cpu_down(unsigned int cpu)
>  }
>  
>  /*
> - * Run as a late init call. This allows all the boot time patching
> to be done
> - * simply by patching the code, and then we're called here prior to
> - * mark_rodata_ro(), which happens after all init calls are run.
> Although
> - * BUG_ON() is rude, in this case it should only happen if ENOMEM,
> and we judge
> - * it as being preferable to a kernel that will crash later when
> someone tries
> - * to use patch_instruction().
> + * Although BUG_ON() is rude, in this case it should only happen if
> ENOMEM, and
> + * we judge it as being preferable to a kernel that will crash later
> when
> + * someone tries to use patch_instruction().
>   */
> -static int __init setup_text_poke_area(void)
> +int __init poking_init(void)
>  {
>         BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>                 "powerpc/text_poke:online", text_area_cpu_up,
> @@ -80,7 +77,6 @@ static int __init setup_text_poke_area(void)
>  
>         return 0;
>  }
> -late_initcall(setup_text_poke_area);
>  
>  /*
>   * This can be called for kernel text or a module.


