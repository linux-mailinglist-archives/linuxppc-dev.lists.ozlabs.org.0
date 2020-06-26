Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6523020BBB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:40:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqzd5MVxzDqsm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:39:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=fTouV6ua; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqXy5mGnzDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:20:18 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id y18so4716470plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fRqRadojwuG0TG7LIG7vreVHmh8dDyxVABNeNVIB/fI=;
 b=fTouV6uau5MrWNpKLBIlplSK4yTsQr8vqkatlxEFGVAIO5/btu/+Y99/2O5JB2z2XB
 0kip19LO2KxaHV2afumDNH48XY2qSD9F6oCsUOcLORAd/9N7qTzU9HoDp25R4vEa6OPQ
 jxl5SwiNpmF8rxPqXZdgmxh0OqDpkM/65iCs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fRqRadojwuG0TG7LIG7vreVHmh8dDyxVABNeNVIB/fI=;
 b=Qso5hPL2HvCwv5i4mReRnyUVEjPNLkeo+UOO3jFs3HfXA/Rp3R3y/JjHSUZSQ52yKW
 BTuN83J/vdJ9eKbQIoPqc+o/tLQuJximRcu91NzHTGzzNIcXSYgUb4mhNFfhPG21SNSV
 7ahWOtkB6LDKrN8wo1K9yEPdcnsd6Ez5oKgKBcO/Zbnnn4zMfZLoXGpQtlactvVkLty0
 wSD693cm2/iu78E0nTy41O35O7a776GeXSIfNBUbc+ignYMa7gpflZBpX16qwvKbJJ+R
 W7y0yBbx9yflO6hsttL3+6mmWBm3UOwUUYd4diL3JOBxZgvQgks4oEDA/cyVKEshW65l
 YVog==
X-Gm-Message-State: AOAM532v5J2N4WKTBMwMo9oU89kyYZdzJFagGXB+DZn8mI17IRUwplna
 XH9xOMzm8jMIY+ajaBNgETYJIg==
X-Google-Smtp-Source: ABdhPJzanFCPjbVP6IP78jIA22FsZ8y83mQsxAnBAhwVFXPMMilrtj09ty+spenAUXCHEiznsVyZsA==
X-Received: by 2002:a17:90a:2b8f:: with SMTP id
 u15mr3731333pjd.98.1593206415418; 
 Fri, 26 Jun 2020 14:20:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o22sm26668076pfd.114.2020.06.26.14.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 14:20:14 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:20:13 -0700
From: Kees Cook <keescook@chromium.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 01/12] vmlinux.lds.h: add linker section for KUnit
 test suites
Message-ID: <202006261416.F4EAAE47E3@keescook>
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-2-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626210917.358969-2-brendanhiggins@google.com>
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
Cc: linux-doc@vger.kernel.org, catalin.marinas@arm.com, jcmvbkbc@gmail.com,
 will@kernel.org, paulus@samba.org, linux-kselftest@vger.kernel.org,
 frowand.list@gmail.com, anton.ivanov@cambridgegreys.com,
 linux-arch@vger.kernel.org, richard@nod.at, rppt@linux.ibm.com,
 yzaikin@google.com, linux-xtensa@linux-xtensa.org, arnd@arndb.de,
 jdike@addtoit.com, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 davidgow@google.com, skhan@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com,
 chris@zankel.net, monstr@monstr.eu, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 alan.maguire@oracle.com, akpm@linux-foundation.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 02:09:06PM -0700, Brendan Higgins wrote:
> Add a linker section where KUnit can put references to its test suites.
> This patch is the first step in transitioning to dispatching all KUnit
> tests from a centralized executor rather than having each as its own
> separate late_initcall.
> 
> Co-developed-by: Iurii Zaikin <yzaikin@google.com>
> Signed-off-by: Iurii Zaikin <yzaikin@google.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  include/asm-generic/vmlinux.lds.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index db600ef218d7d..4f9b036fc9616 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -881,6 +881,13 @@
>  		KEEP(*(.con_initcall.init))				\
>  		__con_initcall_end = .;
>  
> +/* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */

Nit on naming:

> +#define KUNIT_TEST_SUITES						\

I would call this KUNIT_TABLE to maintain the same names as other things
of this nature.

> +		. = ALIGN(8);						\
> +		__kunit_suites_start = .;				\
> +		KEEP(*(.kunit_test_suites))				\
> +		__kunit_suites_end = .;
> +
>  #ifdef CONFIG_BLK_DEV_INITRD
>  #define INIT_RAM_FS							\
>  	. = ALIGN(4);							\
> @@ -1056,6 +1063,7 @@
>  		INIT_CALLS						\
>  		CON_INITCALL						\
>  		INIT_RAM_FS						\
> +		KUNIT_TEST_SUITES					\
>  	}

Nack: this must be in INIT_DATA, not in INIT_DATA_SECTION. Not all
architectures use the INIT_DATA_SECTION macro (e.g. arm64), but everything
uses INIT_DATA.


-- 
Kees Cook
