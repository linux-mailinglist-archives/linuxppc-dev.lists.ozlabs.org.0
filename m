Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47637788E96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 20:24:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HnyXQbm8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXSyc69c3z2yKy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 04:24:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HnyXQbm8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXSxj3tdSz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 04:23:21 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf092a16c9so10316165ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692987798; x=1693592598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ9zjJeALE62O4cw5IYTaJTtY+w53cmCJ0tqcg+cbfo=;
        b=HnyXQbm8I0wncS7q6bqpL+84nVc+SRO3gOlr6HSanLhtlUGqe3qLtjl9NoeWnceonY
         Wszkh9DExW9bToZKm+r3bfPJgD20l6FVa29cqrrXaEROEvs3vo6ecpcyMCQpnRom2zMm
         0cq8MEdGxeVtq9mis1PNV+itkvcfNqdyC6/XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987798; x=1693592598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ9zjJeALE62O4cw5IYTaJTtY+w53cmCJ0tqcg+cbfo=;
        b=bOUrGUQ3/om1MqAGY8PJFEYhE7MyHoRX0F+DVXu9phJYpPxi7tmVSPPflVY+8f1g3a
         fyNW7/qXI7cqTa8XUNxPVDLyNqJ+Zid/tRg7RvA06jQwcKfKuGWuhnGWviRkYt3YMHlH
         /HJoFi6wb/htHj2/+X8l17CUSVgINK1qsEVDQu6P9NW5S8v9zZMTdPoFVGkejVB+SsaZ
         hDyGRQ1aHBmPC8kHJTneFTYaMldeubIz3MfTZNYmfl5PFpBK29Bwcxi8xs4Ldt6I62he
         559GA6mhPZfMj9PxXoMaVj6Fin4TpCVl0Bl1e8xFTKDjFv8yJg8jfyc+8P3QMpXHIYMJ
         4TJQ==
X-Gm-Message-State: AOJu0YzODLcdRiNPdaeblKOf5p2XRipBfkcMkeD5Y6G1syhTNWzcji1p
	dhJylmfl6rH04I+QiFdUCe4sTg==
X-Google-Smtp-Source: AGHT+IF5mGfC+hpo4uDUVvE34Zd1neo+8AiXRx90NzQv5YAzJzW8HNQDHc63LgGceQ+tSuoW87RpyA==
X-Received: by 2002:a17:903:24f:b0:1bf:4833:9c25 with SMTP id j15-20020a170903024f00b001bf48339c25mr22325045plh.36.1692987798689;
        Fri, 25 Aug 2023 11:23:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001bc930d4517sm2078150pln.42.2023.08.25.11.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:23:18 -0700 (PDT)
Date: Fri, 25 Aug 2023 11:23:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Nicolas Schier <n.schier@avm.de>
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308251121.23BAF46E@keescook>
References: <20230824223606.never.762-kees@kernel.org>
 <ZOg/pqoqhp/3rerZ@buildd.core.avm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOg/pqoqhp/3rerZ@buildd.core.avm.de>
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
Cc: linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 25, 2023 at 07:44:06AM +0200, Nicolas Schier wrote:
> On Thu, Aug 24, 2023 at 03:36:10PM -0700, Kees Cook wrote:
> > Doing a "make help" would show only hard-coded Kconfig targets and
> > depended on the archhelp target to include ".config" targets. There was
> > nothing showing global kernel/configs/ targets. Solve this by walking
> > the wildcard list and include them in the output, using the first comment
> > line as the help text.
> > [...]
> 
> Thanks for that patch!  Several times I found myself searching the tree
> to find a specific kconfig fragment; I think you found a nice solution.
> Two minor things below.
> 
> [...]
> > diff --git a/kernel/configs/tiny-base.config b/kernel/configs/tiny-base.config
> > index 2f0e6bf6db2c..ac4d254abc3f 100644
> > --- a/kernel/configs/tiny-base.config
> > +++ b/kernel/configs/tiny-base.config
> > @@ -1 +1,2 @@
> > +# Minimal options for tiny systems
> >  CONFIG_EMBEDDED=y
> 
> (just a note: Randy prepared a patch for removing CONFIG_EMBEDDED:
> https://lore.kernel.org/linux-kbuild/20230816055010.31534-1-rdunlap@infradead.org/)

Ah yeah, I'll rebase this after the merge window, I guess...

> > diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
> > index 00009f7d0835..ea643e8f7f14 100644
> > --- a/kernel/configs/tiny.config
> > +++ b/kernel/configs/tiny.config
> > @@ -1,3 +1,5 @@
> > +# Smallest possible kernel image
> 
> For this fragment alone (not within 'tinyconfig'), "Size-optimize kernel
> image" possibly fits better?

Sounds good to me!

> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index af1c96198f49..c523f24b504a 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -93,11 +93,11 @@ endif
> >  %_defconfig: $(obj)/conf
> >  	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
> >  
> > -configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
> > +configfiles=$(wildcard $(srctree)/kernel/configs/$(1) $(srctree)/arch/$(SRCARCH)/configs/$(1))
> >  
> >  %.config: $(obj)/conf
> > -	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
> > -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
> > +	$(if $(call configfiles,$@),, $(error No configuration exists for this target on this architecture))
> > +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(call configfiles,$@)
> >  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> >  
> >  PHONY += tinyconfig
> > @@ -115,6 +115,7 @@ clean-files += tests/.cache
> >  
> >  # Help text used by make help
> >  help:
> > +	@echo  'Configuration targets:'
> >  	@echo  '  config	  - Update current config utilising a line-oriented program'
> >  	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
> >  	@echo  '  menuconfig	  - Update current config utilising a menu based program'
> > @@ -141,6 +142,12 @@ help:
> >  	@echo  '                    default value without prompting'
> >  	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
> >  	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
> > +	@echo  ''
> > +	@echo  'Configuration fragment targets (for enabling various Kconfig items):'
> > +	@$(foreach c, $(call configfiles,*.config), \
> > +		printf "  %-20s - %s\\n" \
> > +			$(shell basename $(c)) \
> > +			"$(subst # ,,$(shell grep -m1 '^# ' $(c)))";)
> 
> Better use '$(notdir $(c))` instead of forking a shell with
> '$(shell basename $(c))'.

Ah! Thank you. I *knew* there was a function for this but couldn't find
it for some reason. :)

-- 
Kees Cook
