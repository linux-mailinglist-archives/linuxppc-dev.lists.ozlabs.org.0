Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873F4B7C5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 02:29:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz0kB6vLMz3cVs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 12:29:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=H+50svR9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=H+50svR9; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz0jS3nVgz2ybK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 12:28:57 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id z16so858738pfh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 17:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tQTDncmXURnIkQJis+wxjFZC0hGspK56+Qdf43TRr3E=;
 b=H+50svR9Fo1VEERYUeQdw5S6DLto/gQadF0oqYP7WRy6XGdQXD3BPwkjbRpy52LbV5
 rRe1ILqmSjWwAuyPZebSKMbskC5iphX7EXTVBCVZCWXtF1JOik0dvuLT4CaeLG9p4O/m
 1WcBi1FwIdMfNxBRhSbZj0I+Li2KiEGVoioM3+BTNNIMmZHt2O4Lt7xGzDNTOBKMlLoR
 Np02mi1pjOCEOEtTvpr+BPp7oi3IrLeAwfzTnv6vX0rFOIsdSJN+RW9BYrDa9YLl553z
 NCC3WvrredcVtaKufNs/tk98SQSGWqL1gWGyJM4MkAM7CbuV8sK/ZSdWZ75H9IvdVWcn
 rxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tQTDncmXURnIkQJis+wxjFZC0hGspK56+Qdf43TRr3E=;
 b=TUX0eEKydi9Dzqqm6bWBmbOo7zg/Q9h+p+j0A4tw95fOG9FMvuHn4xhP/nl8pvJ1GQ
 D+hrmeDMYsgD1y9zD2k7aiAKH10hFEykml1+8W0/jo4M1qWjQtw9CErOuDrEs0gPF3rK
 undncyVdQ7LPKvgcTYkiBNOzV0DN0dk5h4jv1ULIGwq4nQmuHp2thdIqcUNBRrB5F211
 h9GUlhZRX2RrneJIiL2YztrcDmwBnprF4GMjsaN6dLjuPJiIyGvY5aDbCcYxtK8uP81V
 G43otxe2eT9gk1rfwM0Lh44FMsykFx378tPTih/tXg/TBeS3dD65EKfmJ4/+1/t3D1Rt
 plDQ==
X-Gm-Message-State: AOAM5325GutwplOntxvDA+Lu7+aomY5f0eezuXESGlsVIix3rrILbkmp
 C/RUe+z1rOCBDxuz/SFZAYnjuw==
X-Google-Smtp-Source: ABdhPJwM77UFLOF1OiIUZL5zuriL3dDg9+gURcyC0/EAXme+PzwciNao4NhxjcQ3KNF6vcDe8cHzUw==
X-Received: by 2002:a63:f011:0:b0:36c:2da3:32bc with SMTP id
 k17-20020a63f011000000b0036c2da332bcmr342889pgh.40.1644974934995; 
 Tue, 15 Feb 2022 17:28:54 -0800 (PST)
Received: from [192.168.10.24] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 t22sm1149617pfg.92.2022.02.15.17.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 17:28:54 -0800 (PST)
Message-ID: <535eefe8-c332-4c66-30d0-c792911ee4d5@ozlabs.ru>
Date: Wed, 16 Feb 2022 12:28:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Subject: Re: [PATCH kernel 2/3] powerpc/llvm: Sample config for LLVM LTO
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20220211023125.1790960-1-aik@ozlabs.ru>
 <20220211023125.1790960-3-aik@ozlabs.ru>
 <CAKwvOdmJspxuNh-K-CeLJh4X4GGVYJWH29HnjJwuRL+jcN9G5w@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CAKwvOdmJspxuNh-K-CeLJh4X4GGVYJWH29HnjJwuRL+jcN9G5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 llvm@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/12/22 11:05, Nick Desaulniers wrote:
> On Thu, Feb 10, 2022 at 6:31 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> The config is a copy of ppc64_defconfig with a few tweaks. This could be
>> a smaller config to merge into ppc64_defconfig but unfortunately
>> merger does not allow disabling already enabled options.
> 
> Cool series!
> 
>>
>> This is a command line to compile the kernel using the upstream llvm:
>>
>> make -j64 O=/home/aik/pbuild/kernels-llvm/ \
>>   "KCFLAGS=-Wmissing-braces -Wno-array-bounds" \
>>   ARCH=powerpc LLVM_IAS=1 ppc64le_lto_defconfig CC=clang LLVM=1
> 
> That command line invocation is kind of a mess, and many things
> shouldn't be necessary.
> 
> O= is just noise; if folks are doing in tree builds then that doesn't
> add anything meaningful.
> KCFLAGS= why? I know -Warray-bounds is being worked on actively, but
> do we have instances of -Wmissing-braces at the moment? Let's get
> those fixed up.
> LLVM_IAS=1 is implied by LLVM=1.
> CC=clang is implied by LLVM=1
> 
> why add a new config? I think it would be simpler to just show command
> line invocations of `./scripts/config -e` and `make`. No new config
> required.



I should have added "RFC" in this one as the purpose of the patch is to 
show what works right now and not for actual submission.


>>
>> Forces CONFIG_BTRFS_FS=y to make CONFIG_ZSTD_COMPRESS=y to fix:
>> ld.lld: error: linking module flags 'Code Model': IDs have conflicting values in 'lib/built-in.a(entropy_common.o at 5332)' and 'ld-temp.o'
>>
>> because modules are linked with -mcmodel=large but the kernel uses -mcmodel=medium
> 
> Please file a bug about this.
> https://github.com/ClangBuiltLinux/linux/issues
> 
>>
>> Enables CONFIG_USERFAULTFD=y as otherwise vm_userfaultfd_ctx becomes
>> 0 bytes long and clang sanitizer crashes as
>> https://bugs.llvm.org/show_bug.cgi?id=500375

> 
> The above hyperlink doesn't work for me. Upstream llvm just moved from
> bugzilla to github issue tracker.


aah this is the correct one:
https://bugs.llvm.org/show_bug.cgi?id=50037

> 
> https://github.com/llvm/llvm-project/issues

oh ok.

>>
>> Disables CONFIG_FTR_FIXUP_SELFTEST as it uses FTR_SECTION_ELSE with
>> conditional branches. There are other places like this and the following
>> patches address that.
>>
>> Disables CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT as CONFIG_HAS_LTO_CLANG
>> depends on it being disabled. In order to avoid disabling way too many
>> options (like DYNAMIC_FTRACE/FUNCTION_TRACER), this converts
>> FTRACE_MCOUNT_USE_RECORDMCOUNT from def_bool to bool.
>>
>> Note that even with this config there is a good chance that LTO
>> is going to fail linking vmlinux because of the "bc" problem.
> 
> I think rather than adding a new config with LTO enabled and a few
> things turned off, it would be better to not allow LTO to be
> selectable if those things are turned on, until the combination of the
> two are fixed.

Well, if I want people to try this thing, I kinda need to provide an 
easy way to allow LTO. The new config seemed the easiest (== the 
shortest) :)
