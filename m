Return-Path: <linuxppc-dev+bounces-6843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD9A58E5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 09:40:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZB9Mk0zvsz2yjb;
	Mon, 10 Mar 2025 19:40:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741596050;
	cv=none; b=BNmyLV1qTV3h9PGI+5MUWidwxoYZgtBHPGilu4sMeqmYKg/WzSYc/2cXn0oe7cBfwzTDWeh04oeQdIDJzoCztom8T+/A8nNkkm3yr6RFp2UIceEIJAOgJyHr0bgqYuM0l2XeQbL4BFfpUyQBh9rAYgpgURvVotlmEz3zjbwEb2K3LKx7EjXJo9/kU7MnAF3o//DCWNaG/DF+DO+i80Ohwq1X5Vs5zb9OvIFUHSmd/TzO5OeIHRwNtjm2ZFhkfqhnLubd9xtmIo5FTi1mXBuI9WTRvPbg3jw5jj7RAiwRVYXU+R/rnQ/wiFzs56+s8Pw7jwF2/cvMG6BgQJdyeadvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741596050; c=relaxed/relaxed;
	bh=mTErlNHYltRpOX8C1wmUnBsAoRxLsP2r7CcqnO1N75E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9BdmH+NxXdOA1NVcVrj29XaolXJJxb5CEud1dDCl1szRIUJ6K8s2Oac75aJRbmpztxVsSXElwBLzM23/ThkXvVOsP1EcbRWW567Pi1JOqXVdAHzcbp/02QrCIbvarayLDtBufVnoRxw83PtzHRws5Un8eRTx5S3umbBGy/3A4j/bJE4uC2Pph9R47y/t1KlxRQirKOZv3JPCLnHR+0lqRV4sSp19+dTFX0MH2vSG2/9HTo11l+wHenMkbB3hiMXjLPmP7jZ6HeFQ/o+58Vn0DC1hIkPSP5aVcrXGOvd/nYaTLY5U/65fPsQ+QBOo+Z9RaO7YaLyWc+KhmrX5hsLsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CEsT3FM0; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FJTg7RCm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CEsT3FM0; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FJTg7RCm; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CEsT3FM0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FJTg7RCm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CEsT3FM0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FJTg7RCm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZB9Mg6M9rz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 19:40:47 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 32B02210F3;
	Mon, 10 Mar 2025 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741596044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mTErlNHYltRpOX8C1wmUnBsAoRxLsP2r7CcqnO1N75E=;
	b=CEsT3FM0Za7//x1kKU0c5sW3deok+Be9FaWxLRqFBtEugUe3w/b9dMr1Yby6lvy0tjr+q9
	iGnJKEVdfalcF0uxLP/QpxDShGD+MTW1VArmWtZCp66XfhcCiPMo0jwplCIhfZabXCFxHR
	EskGy2I2Cnpb0g4vE+bQc5OqaNVSLPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741596044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mTErlNHYltRpOX8C1wmUnBsAoRxLsP2r7CcqnO1N75E=;
	b=FJTg7RCm0Sd0oTuAHmR4U53BvFU59JBvHUi9N/EmilDwODzDuIZIZeV18DenRzbB9WVf5n
	6emD59HI9/9rRyAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741596044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mTErlNHYltRpOX8C1wmUnBsAoRxLsP2r7CcqnO1N75E=;
	b=CEsT3FM0Za7//x1kKU0c5sW3deok+Be9FaWxLRqFBtEugUe3w/b9dMr1Yby6lvy0tjr+q9
	iGnJKEVdfalcF0uxLP/QpxDShGD+MTW1VArmWtZCp66XfhcCiPMo0jwplCIhfZabXCFxHR
	EskGy2I2Cnpb0g4vE+bQc5OqaNVSLPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741596044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mTErlNHYltRpOX8C1wmUnBsAoRxLsP2r7CcqnO1N75E=;
	b=FJTg7RCm0Sd0oTuAHmR4U53BvFU59JBvHUi9N/EmilDwODzDuIZIZeV18DenRzbB9WVf5n
	6emD59HI9/9rRyAg==
Date: Mon, 10 Mar 2025 09:40:43 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/boot: Fix build with gcc 15
Message-ID: <Z86liwlwP5WvrEkw@kitsune.suse.cz>
References: <20250307092055.21986-1-msuchanek@suse.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307092055.21986-1-msuchanek@suse.de>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,fjasle.eu,google.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 07, 2025 at 10:20:52AM +0100, Michal Suchanek wrote:
> Similar to x86 the ppc boot code does not build with GCC 15.
> 
> Copy the fix from
> commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/powerpc/boot/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 1ff6ad4f6cd2..e6b35699c049 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -33,6 +33,7 @@ else
>  endif
>  
>  ifdef CONFIG_PPC64_BOOT_WRAPPER
> +BOOTTARGETFLAGS	+= -std=gnu11

I suppose this should be above the ifdef, not below. I build only 64S
but I expect any other platforms that build boot code will be equally
affected.

Thanks

Michal

>  BOOTTARGETFLAGS	+= -m64
>  BOOTTARGETFLAGS	+= -mabi=elfv2
>  ifdef CONFIG_PPC64_ELF_ABI_V2
> -- 
> 2.47.1
> 

