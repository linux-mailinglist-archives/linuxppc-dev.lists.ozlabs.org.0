Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D99DF1EED89
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 23:53:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dKKP6xPrzDqwW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 07:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=nvCBfgRF; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dKHr0vwSzDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 07:52:06 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n23so4086255pgb.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jun 2020 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AVPTbQ8NFmXxqrUWzxefqxjRddWDIP1x9mYNjqrmPjE=;
 b=nvCBfgRFWPPl3m6Bthhk0OWoXZRMMIM+TK/2J+9C4SQ0piWaVE9ZVnk8WiFbpsbRT/
 /g29RqVU8fUG9ThA2iqChW/8MiSP+ZFwEPslOSU0ICuby2DV5HBeUOs5LDQMbQDatIgj
 6uG1WrRWePfyjCUmkYEfSxiAWCdHEBunPK80I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AVPTbQ8NFmXxqrUWzxefqxjRddWDIP1x9mYNjqrmPjE=;
 b=klwUNnJZAPKCnxQEhy+v0NxG2FpdpsWeKdRjDYyih6B8zbozC1yl1yYs14KIkxtYmy
 6NsSZchWTd/EJ0VX4IafhPJfsBdpDmTXBV05Ln68m0T6TsD7v4zdI3ajuGqu0VKQvjzU
 aaEZ+9JiH1GG3SWKcM/Jx/zbD1Si5fnTxpJFqWos/8tltVc6BkQBs/JvioaZFpuXZdHI
 2NN6erPeLCx8aFTLHy4O8IrLF8c04wA9zpIi9WCwp2Y0zlXApHdpL4FAzAJUMs00APfY
 qJ0O+6gG1PS9KvYV6MVSLoTXd9q2GDZECwGZ2IDvTWjYKcaZVI0517KbFRn+KrxNexKT
 lGxA==
X-Gm-Message-State: AOAM530kzDv4P5LKgPtFBVo+msN0dtc90VuQX3AH24zeCcMuPzYvgjHs
 qfTpgQFNfsCkqjQm4ROKb1cC+w==
X-Google-Smtp-Source: ABdhPJzl+XR3LgR5r+6XiLd36g6PDrxYDguA3/nHf6QujkMv8ETocNSKltDFZQ8341Fl+XxZA922iw==
X-Received: by 2002:a63:d918:: with SMTP id r24mr6439147pgg.119.1591307522152; 
 Thu, 04 Jun 2020 14:52:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z138sm5469147pfc.70.2020.06.04.14.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 14:52:01 -0700 (PDT)
Date: Thu, 4 Jun 2020 14:52:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] pwm: Add missing "CONFIG_" prefix
Message-ID: <202006041451.19491ECA@keescook>
References: <202006031539.4198EA6@keescook>
 <b08611018fdb6d88757c6008a5c02fa0e07b32fb.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b08611018fdb6d88757c6008a5c02fa0e07b32fb.camel@perches.com>
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
Cc: linux-pwm@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 04:04:31PM -0700, Joe Perches wrote:
> On Wed, 2020-06-03 at 15:40 -0700, Kees Cook wrote:
> > The IS_ENABLED() use was missing the CONFIG_ prefix which would have
> > lead to skipping this code.
> > 
> > Fixes: 3ad1f3a33286 ("pwm: Implement some checks for lowlevel drivers")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/pwm/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index 9973c442b455..6b3cbc0490c6 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -121,7 +121,7 @@ static int pwm_device_request(struct pwm_device *pwm, const char *label)
> >  		pwm->chip->ops->get_state(pwm->chip, pwm, &pwm->state);
> >  		trace_pwm_get(pwm, &pwm->state);
> >  
> > -		if (IS_ENABLED(PWM_DEBUG))
> > +		if (IS_ENABLED(CONFIG_PWM_DEBUG))
> >  			pwm->last = pwm->state;
> >  	}
> >  
> > -- 
> > 2.25.1
> > 
> 
> more odd uses (mostly in comments)
> 
> $ git grep -P -oh '\bIS_ENABLED\s*\(\s*\w+\s*\)'| \
>   sed -r 's/\s+//g'| \
>   grep -v '(CONFIG_' | \
>   sort | uniq -c | sort -rn
>       7 IS_ENABLED(DEBUG)
>       4 IS_ENABLED(DRM_I915_SELFTEST)
>       4 IS_ENABLED(cfg)
>       2 IS_ENABLED(opt_name)
>       2 IS_ENABLED(DEBUG_PRINT_TRIE_GRAPHVIZ)
>       2 IS_ENABLED(config)
>       2 IS_ENABLED(cond)
>       2 IS_ENABLED(__BIG_ENDIAN)
>       1 IS_ENABLED(x)
>       1 IS_ENABLED(STRICT_KERNEL_RWX)
>       1 IS_ENABLED(PWM_DEBUG)
>       1 IS_ENABLED(option)
>       1 IS_ENABLED(ETHTOOL_NETLINK)
>       1 IS_ENABLED(DEBUG_RANDOM_TRIE)
>       1 IS_ENABLED(DEBUG_CHACHA20POLY1305_SLOW_CHUNK_TEST)
> 
> STRICT_KERNEL_RWX is misused here in ppc
> 
> ---
> 
> Fix pr_warn without newline too.
> 
>  arch/powerpc/mm/book3s64/hash_utils.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 51e3c15f7aff..dd60c5f2b991 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -660,11 +660,10 @@ static void __init htab_init_page_sizes(void)
>  		 * Pick a size for the linear mapping. Currently, we only
>  		 * support 16M, 1M and 4K which is the default
>  		 */
> -		if (IS_ENABLED(STRICT_KERNEL_RWX) &&
> +		if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) &&
>  		    (unsigned long)_stext % 0x1000000) {
>  			if (mmu_psize_defs[MMU_PAGE_16M].shift)
> -				pr_warn("Kernel not 16M aligned, "
> -					"disabling 16M linear map alignment");
> +				pr_warn("Kernel not 16M aligned, disabling 16M linear map alignment\n");
>  			aligned = false;
>  		}

Joe, I was going to send all of the fixes for these issues, but your
patch doesn't have a SoB. Shall I add one for the above patch?

-- 
Kees Cook
