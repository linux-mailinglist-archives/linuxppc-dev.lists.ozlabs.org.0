Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A14788EC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 20:34:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fs2vsxHk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXTBk35n4z3c5Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 04:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fs2vsxHk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXT9p6vLgz2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 04:33:48 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68bed8de5b9so1018781b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 11:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692988426; x=1693593226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lUGjqed5vBEF61//Ts3J+LsbHjaPbzQsfTJT+JEbFA=;
        b=fs2vsxHkz2wP7TObW5d0DadYscN9gIp3iQDmbXDJFZ9TXLBpCjfEgbr249m+hpnt0H
         N8eHUiqtK7UcSX0JDYTqI1A6bnyDPDj8c4Ou7YGA0GVwgInqr0iTvOzvDiJxGlCaQxLN
         RIAxlHY6RydO0bYtLOKbnqDYX0Yp0fkHde1d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692988426; x=1693593226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lUGjqed5vBEF61//Ts3J+LsbHjaPbzQsfTJT+JEbFA=;
        b=RbK/QyqQADjMbbcJIjq9mLKfzRaAC627H1WOsW0e4HqppCiiGIwm3VvjH6L9UyeBfF
         H0/MHbKgMcnjQK4KH6g9AYMqT9D391IY2qT+SdnwdL8horXY5uUnL6QdS9VeZUC30aaZ
         KkP2HzZknshZQlg6Ln83QrTz8mg2cek+0ia/XK3gS8CEjnn2uyT7NZf/uVO9/4RWLeQE
         8ytxwSCJGhFNWIfVSrmm+VWdsZ7GsDXKGdxZ2ZqNqa9hxNGar2iwmwLMsrZA9/sK5Q4H
         hGKJhE+sBZ1m7rRpOQO4EqLXPSOX9bRaFZyNaYcFM3edyFM5JNDfK7pKdOIGijmbuWqE
         Cvcg==
X-Gm-Message-State: AOJu0YxKMmiWDXriJSmQlzRZ+DZ+TfQhrIes8QKXJG7BFFlbkwp9kgBI
	EaTc+EJWFGHDmhQib3msY8VA3A==
X-Google-Smtp-Source: AGHT+IGDxoqIqcJZyjYGVuOgm8M01AX2FlPXYmdv5h9gJHh0STQ7ADq/UhT1DHG724uSr8yjfQvnWw==
X-Received: by 2002:a05:6a00:23c6:b0:68a:406f:8a11 with SMTP id g6-20020a056a0023c600b0068a406f8a11mr18065379pfc.15.1692988425770;
        Fri, 25 Aug 2023 11:33:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7838e000000b0065980654baasm1891186pfm.130.2023.08.25.11.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:33:45 -0700 (PDT)
Date: Fri, 25 Aug 2023 11:33:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308251123.D87F05DC@keescook>
References: <20230824223606.never.762-kees@kernel.org>
 <87a5ufvefl.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5ufvefl.fsf@mail.lhotse>
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

On Fri, Aug 25, 2023 at 04:11:58PM +1000, Michael Ellerman wrote:
> Kees Cook <keescook@chromium.org> writes:
> > Doing a "make help" would show only hard-coded Kconfig targets and
> > depended on the archhelp target to include ".config" targets. There was
> > nothing showing global kernel/configs/ targets. Solve this by walking
> > the wildcard list and include them in the output, using the first comment
> > line as the help text.
> >
> > Update all Kconfig fragments to include help text and adjust archhelp
> > targets to avoid redundancy.
> >
> > Adds the following section to "help" target output:
> >
> > Configuration fragment targets (for enabling various Kconfig items):
> >   debug.config         - Debugging for CI systems and finding regressions
> >   kvm_guest.config     - Bootable as a KVM guest
> >   nopm.config          - Disable Power Management
> >   rust.config          - Enable Rust
> >   tiny-base.config     - Minimal options for tiny systems
> >   tiny.config          - Smallest possible kernel image
> >   x86_debug.config     - Debugging options for tip tree testing
> >   xen.config           - Bootable as a Xen guest
> >   tiny.config          - x86-specific options for a small kernel image
> >   xen.config           - x86-specific options for a Xen virtualization guest
> 
> I think we need a way to opt some files out.
> 
> It's a bit ugly on powerpc because there are so many fragments:
> 
> Configuration fragment targets (for enabling various Kconfig items):
>   debug.config         - Debugging for CI systems and finding regressions
>   kvm_guest.config     - Bootable as a KVM guest
>   nopm.config          - Disable Power Management
>   rust.config          - Enable Rust
>   tiny-base.config     - Minimal options for tiny systems
>   tiny.config          - Smallest possible kernel image
>   x86_debug.config     - Debugging options for tip tree testing
>   xen.config           - Bootable as a Xen guest
>   32-bit.config        - Build a 32-bit image
>   64-bit.config        - Build a 64-bit image
>   85xx-32bit.config    - Build a 32-bit 85xx image
>   85xx-64bit.config    - Build a 64-bit 85xx image
>   85xx-hw.config       - Base hardware support for 86xx
>   85xx-smp.config      - Enable SMP on 85xx
>   86xx-hw.config       - Base hardware support for 86xx
>   86xx-smp.config      - Enable SMP on 86xx
>   altivec.config       - Enable Altivec support
>   be.config            - Enable Big Endian mode
>   book3s_32.config     - Base support for Book3s
>   corenet_base.config  - Base support for corenet
>   debug.config         - Enable PowerPC specific debug options
>   disable-werror.config - Disable -Werror
>   dpaa.config          - Base suppot for DPPA
>   fsl-emb-nonhw.config - Non-hardware options common to 85xx and corenet
>   guest.config         - PowerPC specific virtualization guest options
>   kvm_guest.config     - Bootable as a KVM guest
>   le.config            - Enable Little Endian mode
>   mpc85xx_base.config  - Base mpc85xxx support
>   mpc86xx_base.config  - Base mpc85xxx support
>   ppc64le.config       - Enable ppc64le mode
>   security.config      - Common security options for PowerPC builds
> 
> And some of those are not intended for use with "make foo.config",
> they're used internally for generating our "normal" defconfigs and they
> don't necessarily work on their own.
> 
> Also I'd like to add more fragments in future, to the point where nearly
> all our configs are generated by them.
> 
> Can we have some way to differentiate fragments that are intended to be
> used with "make foo.config" vs just being used internally to generate
> other configs.
> 
> The obvious thing would be to use a different suffix, eg. "foo.fragment"
> for internal use fragments. That would require changing
> merge_into_defconfig and merge_into_defconfig_override to not assume the
> .config suffix, and update the users in arm, arm64 and powerpc.
> 
> The other option would be to ignore .config files starting with eg. "_".
> 
> +       @$(foreach c, $(filter-out $(call configfiles,_*.config),$(call configfiles,*.config)), \
> +               printf "  %-20s - %s\\n" \
> +                       $(shell basename $(c)) \
> +                       "$(subst # ,,$(shell grep -m1 '^# ' $(c)))";)
> 
> Not sure which is preferable.

Yeah, I wasn't too happy about some of these results. There seems to be
three cases a fragment:

- user-visible make target
- used internally
- arch-specific settings for a user-visible make target (redundant)

Only the first should be visible. The trouble is that some user-visible
targets are arch-specific.

I think I like your idea of having both .config and .fragment... I'll
give that a try and see how it looks.

-- 
Kees Cook
