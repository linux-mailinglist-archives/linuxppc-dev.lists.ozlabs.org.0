Return-Path: <linuxppc-dev+bounces-6310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8479EA3942C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 08:54:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxsH94rxzz2xGC;
	Tue, 18 Feb 2025 18:54:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739865253;
	cv=none; b=LFhrHkGcPoxqdHGKTUR1kMRsNcyQoBbJ6e/pd//8hUX+Y6ddl91W4KvM5gsk0InuVzoliRbysTn1hqDCi9u0FB5HA2oLv+IrxtGeAUwUABBqzc5XKImdKaPN2kyoBz+1uWS65bBMU4tJi7oHEjfaipp1zxi0/+JeZHNPSnS2SAlM1ek/mX4DJQP91WNSCize0qqudXmS806nUmTI/pGGGY/UI+qg5JIoyKgW7SNdizXO1+bW6V9LE8M5mThQd3xq+TzXdbjM60Ho+YKVijzVDF1gdn45IOcsW5VVlnL221Sp1EuGi5aMzRmu1cdYgHcw5tkZ1L/5Fe5It98lRkmVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739865253; c=relaxed/relaxed;
	bh=d7bHl0ooLxFSzjEUZAaPsWHsj5Dt6Ubf1dAYLGBp6pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6gaE3YSZCxUYRdifO4EI4V4ROgN/qDk0ukLL96ZxH538Zw5wUGlHI2wbixyQ1Kma8MWxl+Tk32oJ8Sfk1a4urpdMHUv8kDOSMFUNd7iVj8u5UQ1BpeFd/iMDoxoTr4VuZdOOct9MdqE7OtwRAHo19RSwx6iw/g4KrR44eJ+wdpA0xs7X7qDa8qXBqanlDJhgm8GNIbg5k0NVEx9bSyF60Np0D8UnGZFA2mJYweSD13lwGKNfJk5hOyqBWJzxTTXNJBMCGaKLXlySVINA7juac4Nayv2L5Kth1ZQpx8oVDdn3AhWgB7pLo/iPBsojuR6IHWOrKlx9mzCVOPM2Jlctg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PPsDCYXe; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5g5XYrVZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PPsDCYXe; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5g5XYrVZ; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PPsDCYXe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5g5XYrVZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PPsDCYXe;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5g5XYrVZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxsH801YSz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 18:54:11 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E54F21160;
	Tue, 18 Feb 2025 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739865244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d7bHl0ooLxFSzjEUZAaPsWHsj5Dt6Ubf1dAYLGBp6pQ=;
	b=PPsDCYXeUSsNDKWv4y90uj2vZdDSQrsaIyIPThIXp1rg3V4Exd1i7qTev+o9zh2uDCSJ66
	OelCcm5ItOHQqW1IapYXvbtpfA46V0ZDoTMSnoGLrSrJZfR8SaMoUG/ibs7IQnZ6CybUWk
	+5YCI3Ma2ojogyPhh6CWq/tnJhIbmlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739865244;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d7bHl0ooLxFSzjEUZAaPsWHsj5Dt6Ubf1dAYLGBp6pQ=;
	b=5g5XYrVZagb7mg9gJiByPE5IU70wlyqEirYOjDaQqamW7rkm5QbeURmiHU+wfAG3eXecAJ
	CjcMdlC6zmGgL4BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739865244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d7bHl0ooLxFSzjEUZAaPsWHsj5Dt6Ubf1dAYLGBp6pQ=;
	b=PPsDCYXeUSsNDKWv4y90uj2vZdDSQrsaIyIPThIXp1rg3V4Exd1i7qTev+o9zh2uDCSJ66
	OelCcm5ItOHQqW1IapYXvbtpfA46V0ZDoTMSnoGLrSrJZfR8SaMoUG/ibs7IQnZ6CybUWk
	+5YCI3Ma2ojogyPhh6CWq/tnJhIbmlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739865244;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d7bHl0ooLxFSzjEUZAaPsWHsj5Dt6Ubf1dAYLGBp6pQ=;
	b=5g5XYrVZagb7mg9gJiByPE5IU70wlyqEirYOjDaQqamW7rkm5QbeURmiHU+wfAG3eXecAJ
	CjcMdlC6zmGgL4BQ==
Date: Tue, 18 Feb 2025 08:54:03 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Vitaly Chikunov <vt@altlinux.org>,
	Abhishek Dubey <dubeyabhishek777@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: Re: [PATCH 1/1] powerpc: use __clang__ instead of CONFIG_CC_IS_CLANG
Message-ID: <Z7Q8m4131_7K44qn@kitsune.suse.cz>
References: <20250218044802.17302-1-shung-hsi.yu@suse.com>
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
In-Reply-To: <20250218044802.17302-1-shung-hsi.yu@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,ellerman.id.au,linux.ibm.com,gmail.com,csgroup.eu,kernel.org,google.com,kernel.crashing.org,altlinux.org,linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,kitsune.suse.cz:helo,kitsune.suse.cz:mid]
X-Spam-Score: -8.30
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

how does this happen?

On Tue, Feb 18, 2025 at 12:48:01PM +0800, Shung-Hsi Yu wrote:
> Due to include chain (below), powerpc's asm-compat.h is part of UAPI,
> thus it should use the __clang__ macro to directly detect whether Clang
> is used rather then relying on the kernel config setting. The later is
> unreliable because the userspace tools that uses UAPI may be compile
> with a different compiler than the one used for the kernel, leading to
> incorrect constrain selection (see link for an example of such).
> 
>   include/uapi/linux/ptrace.h
>   arch/powerpc/include/asm/ptrace.h

There is arch/powerpc/include/uapi/asm/ptrace.h

and if the installed header is used this is what should be included.

That does no include other asm headers.

Thanks

Michal

>   arch/powerpc/include/asm/paca.h
>   arch/powerpc/include/asm/atomic.h
>   arch/powerpc/include/asm/asm-compat.h
> 
> Link: https://github.com/iovisor/bcc/issues/5172
> Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
> ---
>  arch/powerpc/include/asm/asm-compat.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include/asm/asm-compat.h
> index f48e644900a2..34f8740909a9 100644
> --- a/arch/powerpc/include/asm/asm-compat.h
> +++ b/arch/powerpc/include/asm/asm-compat.h
> @@ -37,7 +37,7 @@
>  #define STDX_BE	stringify_in_c(stdbrx)
>  #endif
>  
> -#ifdef CONFIG_CC_IS_CLANG
> +#ifdef __clang__
>  #define DS_FORM_CONSTRAINT "Z<>"
>  #else
>  #define DS_FORM_CONSTRAINT "YZ<>"
> -- 
> 2.48.1
> 

