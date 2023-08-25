Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C021788E80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 20:21:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E4mC5YAX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXSvX6sw6z3bVp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 04:21:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E4mC5YAX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXStd6KR8z2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 04:20:39 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-56c250ff3d3so1641704a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 11:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692987633; x=1693592433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYd1wVFPRI7NiM/Sx4/tad/ZtbY6g9sye8P5AXqu+fc=;
        b=E4mC5YAXMMgmUHgfRiWFcSZjAFYw1waD0EqZCNwtYhRSRtgJoFZVlCS3JG3wV7FXjd
         sXVU7RTKIYiV68OaJT+pNyPhtCG1CpcRdXA82AG5ofhhqR/vSGm3tvd1mpbR6M1weagG
         NwWQJu1Josu1pkUS1L/DPphW0b+C0Nzy+d45c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987633; x=1693592433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYd1wVFPRI7NiM/Sx4/tad/ZtbY6g9sye8P5AXqu+fc=;
        b=abUON2U9rClTQm14TdsJUTTm6jny4Z1NtV/ohZb6SO5T1SW2dLn1RDgGNVHyhbN1hE
         q/n7gB5788biCM45PHzD6sCmCkBCB/lztbVO6Fx9iuu9Kd8+IWj8xJAkwf3ZGL3UNoYL
         imk0XnVlV0YT7LA47BZ7fnB4yv3YIt87exZy0yn/8zuYsOyY9fNJ5L4FAyHyn0ThKlwZ
         EM8N/u/jzXpMq62WDSad0RWHZBY7zz53TKmg+7XiH61qPSPCWj2GwiCGis2PcuOgEXWM
         sEn3UuFUvFjzR99DiG2j+0ZM5qs/IIrwbL4T0ng8ua7iF4u6IMVazpoHOWPIyd/wk91a
         gkWQ==
X-Gm-Message-State: AOJu0YxIgoaex7ApvBxhrfhHCtgTJgWlTbj21kVXYcpuRfoxZeY0xAUJ
	f2ms94n/c16Y+oHapU6fLSe1Nw==
X-Google-Smtp-Source: AGHT+IF6DSGG+sLTemEr6zFswCsdJsrOmZC3VrMrE6v1fI8J4N4rJsVzak2qfPMHQ2MCnkGlwtuaPA==
X-Received: by 2002:a17:90a:c08d:b0:267:f8f4:73ab with SMTP id o13-20020a17090ac08d00b00267f8f473abmr28444155pjs.16.1692987633516;
        Fri, 25 Aug 2023 11:20:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090a628c00b0026b3f76a063sm1910536pjj.44.2023.08.25.11.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:20:32 -0700 (PDT)
Date: Fri, 25 Aug 2023 11:20:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308251119.B93C95A3A7@keescook>
References: <20230824223606.never.762-kees@kernel.org>
 <21193a52-0425-f5ae-90f0-10e4c578ae90@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21193a52-0425-f5ae-90f0-10e4c578ae90@infradead.org>
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

On Thu, Aug 24, 2023 at 05:04:02PM -0700, Randy Dunlap wrote:
> Hi Kees,
> 
> On 8/24/23 15:36, Kees Cook wrote:
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
> ISTM that you are missing the "why" part of this change in the commit
> description.

I want to see what fragments are available without needing to know the
source tree layout for their locations. :)

> "make tinyconfig" is the real target here.  The other (tiny.) files are just
> implementation details.
> We can't put all implementation details into help messages and it's not
> difficult to find that the (tiny.) config files are merged to make the
> final .config file.

Yeah, this seems true for much of the ppc stuff to, as pointed out by
mpe. I'll go answer there...

-- 
Kees Cook
