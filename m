Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A3B7449F7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 16:41:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IcDsm+rZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QtZd12sRGz3c3S
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jul 2023 00:41:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IcDsm+rZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QtZc51q5wz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jul 2023 00:40:36 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2632a72f289so1311949a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jul 2023 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688222430; x=1690814430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyUkD0mJUU/Zf9ldB9gHD2S/2d4V8ANSTIaihttQl0A=;
        b=IcDsm+rZ3hWCxWysGUBDBD5VD+zraq6+jUeIaKn/hFtcy9Dgr5iufxyQz/ygOH39mE
         dKiGEbAwOz8eJHxxFR55WRU7m202fAw12RiTvxzs5RHo6nbhnTtdSl9vjLQDwuPpFr/z
         TvqWtGPj6ulYtEAoYGwMzX2zyPasm2e1wbpEnozvkdR6lQUJ35w0J1Jy+siGUmFf5UjH
         cyNBZHheeVh8SCGH/hLqLeKWYGlmlyi9zqpcgdb7nIIezPoxwuP697JcW0aUKS6/EOTW
         Q8u1XdaYb+ICRxwdlNWbA5XSaRkEE1dnWAZEsbucaG8pYUT7P2RSzJAMx5thpCWC2gsn
         w6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688222430; x=1690814430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyUkD0mJUU/Zf9ldB9gHD2S/2d4V8ANSTIaihttQl0A=;
        b=kn6PmXFnDwalvvd5SYK/erFMTsZTNZ9LnsudIiJky7o4I5ytGhfo4LI02t3M/9kJ+/
         Bq91LMBpDLERfKUGlpIPWjowlxkKY5rMQpG9zi7bYllsv+C1587qShuFcH4kSxegnzzo
         FKQipUo+n5SF+pbFJ3+m24eI4xKk7RWo2QTAsLXP8trLi1MnznyXCu8jP03g+c6Y2SIo
         J2Rizf1PSYo+qJSWMb6kJOimf/MXI7xDssVVQOJzp91KlXbNXQtOIXZWQl9QBiy8cHiQ
         f5Fm1AhKyM0QutWEZaHBDNN+dddciQswGL41zhOYTOH22UHUzmOLN+7z3Ya5WFKZ4O2j
         FPnA==
X-Gm-Message-State: ABy/qLYLFpleMvMjztF6VS0Kx2Q7Kqegz574nz1oGZC3/8Avb9OkXbVM
	DTiC49Fvzm2oYl8bkv8lID8=
X-Google-Smtp-Source: APBJJlEqX62QMvHa1JAPHGFp7Jlctzos+OPSmcIe4d+nG9szuHOt9QyZ+r1VUb70YbR27S9Oc5PE2w==
X-Received: by 2002:a17:90a:e60f:b0:262:e742:f40a with SMTP id j15-20020a17090ae60f00b00262e742f40amr3306132pjy.44.1688222430467;
        Sat, 01 Jul 2023 07:40:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b001a69c1c78e7sm12361682plh.71.2023.07.01.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 07:40:29 -0700 (PDT)
Date: Sat, 1 Jul 2023 07:40:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v2 6/6] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
Message-ID: <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616150618.6073-7-pmladek@suse.com>
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
Cc: kgdb-bugreport@lists.sourceforge.net, Douglas Anderson <dianders@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 05:06:18PM +0200, Petr Mladek wrote:
> The HAVE_ prefix means that the code could be enabled. Add another
> variable for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix.
> It will be set when it should be built. It will make it compatible
> with the other hardlockup detectors.
> 
> The change allows to clean up dependencies of PPC_WATCHDOG
> and HAVE_HARDLOCKUP_DETECTOR_PERF definitions for powerpc.
> 
> As a result HAVE_HARDLOCKUP_DETECTOR_PERF has the same dependencies
> on arm, x86, powerpc architectures.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
...
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -9,7 +9,7 @@
>  #include <asm/irq.h>
>  
>  /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
> -#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
> +#if defined(CONFIG_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)

This results in:

arch/powerpc/platforms/pseries/mobility.c: In function 'pseries_migrate_partition':
arch/powerpc/platforms/pseries/mobility.c:753:17: error: implicit declaration of function 'watchdog_hardlockup_set_timeout_pct'; did you mean 'watchdog_hardlockup_stop'? [-Werror=implicit-function-declaration]
  753 |                 watchdog_hardlockup_set_timeout_pct(factor);

with ppc64_defconfig -CONFIG_HARDLOCKUP_DETECTOR, because the dummy 
for watchdog_hardlockup_set_timeout_pct() is still defined in
arch/powerpc/include/asm/nmi.h which is no longer included.

Guenter

>  #include <asm/nmi.h>
>  #endif
>  
