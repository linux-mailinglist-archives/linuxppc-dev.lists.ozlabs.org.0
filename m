Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FD72EEF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 00:13:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MdG3P+8i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgjVY42m6z3bXv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 08:13:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MdG3P+8i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgg1Q0zjCz2y1T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 06:21:11 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-650bacd6250so4620534b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 13:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686687666; x=1689279666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxCRqTUpCdcaL5d+zxoNNIGdAwVO5d6gYOiArNvEfDk=;
        b=MdG3P+8ihRjSOh7LybABvISRLscCMBxkCXrypPOlWdC+OtYj0yftCdz/uUj98Dw73e
         FhGLYHBT+mUIwYBKA7+2i75jw7j0RCQu7cApPRXOzrZZaHzRGXsKvoXhl03dGB8ouUuG
         /A5TFZGtg2AeZl6z7cZS08VFOGBVeakdEkhkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686687666; x=1689279666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxCRqTUpCdcaL5d+zxoNNIGdAwVO5d6gYOiArNvEfDk=;
        b=IW4ofmsnTC9wkO981TLwYnTJcCORjUWbiKmsb0xxFr+2UNqaXOTTj/icuqdhp+8WT2
         HqyJKRpAFBErHG/sYHFA5+sjnYOz425jLwndLBb3spsXqg7strRx3ig0H+sguz+GOBYT
         6otjIeWE3sdKFPpGcoz+StiGgCaJDsHYJArVhnGqw03Mrzuc3aVW2MrtrYIo8TIWJP8k
         IUrT7UR8thwHO463wKBUkVeWsD3RzBwcLJ/0jiL3uQJK2XO5DC41OqEyOaj7LJAQUK/I
         ojC+RY7GnUK2A556YPuE4pCcULrESxELsNl3mSUKFWYSX6qIPJrSmr9FTPsnBlgCdxco
         RFuA==
X-Gm-Message-State: AC+VfDymXH5dE2Ui9/SHEji1HNAPZ6eOavajtu57uYAl4rbv8gWOxUUQ
	0MoWrn7XqEsfpPbs3aF/u/btcA==
X-Google-Smtp-Source: ACHHUZ4FjJE13zDDzcDgsWgBZwhdFAkpwfh7UQt9gQTWfr+WAlSvDzNOiSEYdsJRmv+1hwafinJSyA==
X-Received: by 2002:a17:902:8d8a:b0:1ad:e633:ee96 with SMTP id v10-20020a1709028d8a00b001ade633ee96mr8591788plo.55.1686687666576;
        Tue, 13 Jun 2023 13:21:06 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709026b8400b001b034d2e71csm10608371plk.34.2023.06.13.13.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 13:21:06 -0700 (PDT)
Date: Tue, 13 Jun 2023 13:21:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v1 00/21] refactor Kconfig to consolidate KEXEC and CRASH
 options
Message-ID: <202306131314.EFA558B7@keescook>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
X-Mailman-Approved-At: Wed, 14 Jun 2023 08:08:01 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, 86@kernel.org, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, ziy@nvidia.com, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@ora
 cle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 01:27:52PM -0400, Eric DeVolder wrote:
> The Kconfig is refactored to consolidate KEXEC and CRASH options from
> various arch/<arch>/Kconfig files into new file kernel/Kconfig.kexec.

This looks very nice!

> [...]
> - The boolean ARCH_HAS_<option> in effect allows the arch to determine
>   when the feature is allowed.  Archs which don't have the feature
>   simply do not provide the corresponding ARCH_HAS_<option>.
>   For each arch, where there previously were KEXEC and/or CRASH
>   options, these have been replaced with the corresponding boolean
>   ARCH_HAS_<option>, and an appropriate def_bool statement.
> 
>   For example, if the arch supports KEXEC_FILE, then the
>   ARCH_HAS_KEXEC_FILE simply has a 'def_bool y'. This permits the
>   KEXEC_FILE option to be available.
> 
>   If the arch has a 'depends on' statement in its original coding
>   of the option, then that expression becomes part of the def_bool
>   expression. For example, arm64 had:
> 
>   config KEXEC
>     depends on PM_SLEEP_SMP
> 
>   and in this solution, this converts to:
> 
>   config ARCH_HAS_KEXEC
>     def_bool PM_SLEEP_SMP
> 
> 
> - In order to account for the differences in the config coding for
>   the three common options, the ARCH_SUPPORTS_<option> is used.
>   This options has a 'depends on <option>' statement to couple it
>   to the main option, and from there can insert the differences
>   from the common option and the arch original coding of that option.
> 
>   For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
>   KEXEC_FILE. These require a ARCH_SUPPORTS_KEXEC_FILE and
>   'select CRYPTO' and 'select CRYPTO_SHA256' statements.

Naming nit: "HAS" and "SUPPORTS" feel very similar, and looking at
existing configs, "ARCH_SUPPORTS_..." is already used for doing this
kind of bare "bool" management. e.g. see ARCH_SUPPORTS_INT128

It looks like you need to split "depends" and "select" so the options
can be chosen separately from the "selectable" configs.

How about naming this ARCH_SELECTS_<option>, since that's what it's
there for?

-Kees

-- 
Kees Cook
