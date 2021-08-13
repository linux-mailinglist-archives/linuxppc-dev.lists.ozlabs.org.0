Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC45C3EBD0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 22:06:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmZMG5P0jz3brd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 06:06:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=tsbCgqA+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=tsbCgqA+; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmZKs0x72z3bjD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 06:05:19 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id q2so13410940plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 13:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LLGFAtJMn9/g+hSmBB/R1jZF7zawczzcNya/wcap1qw=;
 b=tsbCgqA+modt4I/2YcP2KWUIr4RPfsj/a17xi4tsOcqg4wa/GlfE5TSsBBNFw99QLi
 pMGX9DSZRnUrlqjyUXToXAR6sD86vRNQNlz4nMF2AKrymHZpWRZQwcKP9FDLCzYNQ1Iu
 d58Er7HLYcZQO7ECYbQ5V5QStHPe3CmEQmOK0RkAFYmAGNYejk1sQh+8G/zTwNeTIR+N
 fDujv5jrm5qVMi10Qc2I4qnlP5F3KGIUHg4l0jsZncetEFfczE0mabFWaZFVvY0UDSmI
 CPKyPM5pHZ/cQCY4UQ5/WhtfYRMRF/EfYmFkmC/ALo2H7gIz7ZmT/sVr9vg3uu30Omtq
 CBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LLGFAtJMn9/g+hSmBB/R1jZF7zawczzcNya/wcap1qw=;
 b=QR1JftVT/nZZOXuMBG0uY3iSKVLy0sQF+wkVkXLqpcUkUWlVDyZZulODMA/qR9ObcP
 Ud2gUUfYVhL5LvWbEFF1xXhuVGf2VYD0PD7C6fp6AgoZy8GLUlUtONakmj4FsOrydYBk
 sA/wFNJaXp2WrUoQf4Iqo8KVw6FtmYn6i7zjr70J8HQdSYkMV/oe1tOw1C33c2wpQEp4
 viRC765kqbADUjiA9lIRjGbsLgJfvX+9a7HhIaLggZlWpjIX8J3FAfSaPxtmqjnNeBd1
 +rIdb0e3AIkc4l1dhOZs4JrDPAf2aaPhw1uqtIuj758mDUAa+ftYU2nB3rCe4RJsw+Xc
 fg1Q==
X-Gm-Message-State: AOAM533xpsLL0GKB9oG5QuUG/oqdQcGlZP80Dp2uF6WqoHyZ3sre2WpY
 eJ/xXgAWgvMb8ulEz9kwqD1Lfg==
X-Google-Smtp-Source: ABdhPJzaqRUcYvq8j5jCPYy5mlscmobnM6iUY4vm+qoKCyhKIYqI6qJp5w4VVR3JpQAMXU09d24Izw==
X-Received: by 2002:a65:5686:: with SMTP id v6mr3851920pgs.174.1628885113391; 
 Fri, 13 Aug 2021 13:05:13 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:c94e:5de5:2819:8b32])
 by smtp.gmail.com with ESMTPSA id g20sm3204758pfo.20.2021.08.13.13.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:05:12 -0700 (PDT)
Date: Fri, 13 Aug 2021 13:05:08 -0700
From: Fangrui Song <maskray@google.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] ppc: add "-z notext" flag to disable diagnostic
Message-ID: <20210813200508.7bqehxgd6ruerds5@google.com>
References: <20210812204951.1551782-1-morbo@google.com>
 <87sfzde8lk.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87sfzde8lk.fsf@linkitivity.dja.id.au>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, Bill Wendling <morbo@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-08-14, Daniel Axtens wrote:
>Bill Wendling <morbo@google.com> writes:
>
>> The "-z notext" flag disables reporting an error if DT_TEXTREL is set on
>> PPC with CONFIG=kdump:
>>
>>   ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 against
>>     local symbol in readonly segment; recompile object files with -fPIC
>>     or pass '-Wl,-z,notext' to allow text relocations in the output
>>   >>> defined in built-in.a(arch/powerpc/kernel/misc.o)
>>   >>> referenced by arch/powerpc/kernel/misc.o:(.text+0x20) in archive
>>       built-in.a
>>
>> The BFD linker disables this by default (though it's configurable in
>> current versions). LLD enables this by default. So we add the flag to
>> keep LLD from emitting the error.
>
>You didn't provide a huge amount of context but I was able to reproduce
>a similar set of errors with pseries_le_defconfig and
>
>make ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- CC="ccache clang-11" LD=ld.lld-11 AR=llvm-ar-11 -j4 vmlinux
>
>I also checked the manpage, and indeed the system ld does not issue this
>warning/error by default.
>
>> ---
>>  arch/powerpc/Makefile | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index 6505d66f1193..17a9fbf9b789 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -122,6 +122,7 @@ endif
>>
>>  LDFLAGS_vmlinux-y := -Bstatic
>>  LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
>> +LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
>
>Is there any reason this should be gated on CONFIG_RELOCATABLE? (I tried
>without it and got different but possibly related linker errors...)
>
>Also, is this behaviour new?

This is a longstanding behavior.

https://maskray.me/blog/2020-12-19-lld-and-gnu-linker-incompatibilities
See "Text relocations"

.o files used to link .tmp_vmlinux.kallsyms1 have many R_PPC64_ADDR64
relocations in non-SHF_WRITE sections. There are many text relocations (e.g. in
.rela___ksymtab_gpl+* and .rela__mcount_loc sections) in a -pie link and are
disallowed by LLD:

   ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 against local symbol in readonly segment; recompile object files with -fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
   >>> defined in arch/powerpc/kernel/head_64.o
   >>> referenced by arch/powerpc/kernel/head_64.o:(__restart_table+0x10)

Newer GNU ld configured with --enable-textrel-check=error will report an error
as well:

   ld/ld-new: read-only segment has dynamic relocations



Text relocations are considered very awful by linker developers.
binutils 2.35 added --enable-textrel-check={no,warn,error}
https://sourceware.org/bugzilla/show_bug.cgi?id=20824

I can imagine that in the future some Linux distributions (especially those
focusing on security) will default their binutils to use
--enable-textrel-check={no,warn,error}.  CONFIG_RELOCATABLE build will break
sooner or later.


In -no-pie links, R_PPC64_ADDR64 relocations are link-time constants.
There are no text relocations, therefore no need for -z notext.

>Kind regards,
>Daniel
>
>>  LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
>>
>>  ifdef CONFIG_PPC64
>> --
>> 2.33.0.rc1.237.g0d66db33f3-goog
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/87sfzde8lk.fsf%40linkitivity.dja.id.au.
