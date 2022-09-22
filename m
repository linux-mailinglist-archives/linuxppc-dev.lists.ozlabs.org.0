Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B215E6FB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 00:30:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYVN91ldTz2xy6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 08:30:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C0FMWnH4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=akiyks@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C0FMWnH4;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYGhs5Ph2z30D1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 23:43:55 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id q9so9154308pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=A1gPIGPkwtBGNAsou3191eDbQnV5HHWhy5YFxtQ8rL0=;
        b=C0FMWnH4ugLgjQCous99pqe1wPHUAHr4+tONBDxgiuVY2C7QiPNnPy8wa85+aDYArY
         Q9CcWmvTsaW+HVRDsMq8Sp+ZP6KRzG/AUCj5UKIlIj88xHEXOwewDKTrpgu/iG5TBEbI
         IFyLdTZYLN/N51HRjK48hWY9hwA2EN/Px+Fwd6k73RqomjklcD7i16LKcfUQqSIUgNVI
         wetzltHqurERKJWxlNQ+lWdXu6EQ/D4EvDXD/YNTo6gfKbdVBRSUzb0vpEvfWXzH6ehX
         zhXZ+7l7tigtoN3rJZQwXP2cG4mFuQD+yspPrg2NCWkcuLxBXNCuZQ2DFusEgLHkhqg+
         vsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=A1gPIGPkwtBGNAsou3191eDbQnV5HHWhy5YFxtQ8rL0=;
        b=AmKMY17fJZm9uPMxvpiCbyCEOUuLlkbvbHDKlfnwX0xYm9Vzvml++FMpQy+8wFBBrz
         cSI1VSkk3rM6BMdHmED0Z++mIT8oDAQcQ2YjCHfVcrpr/Li0xIEznFjLAKWMdNTydcvI
         oZf3E8S98NETMLQiSPVmQ5p9fYwBnIGHEl10kNxIXgp40griIY/8aXSzgwOcS7XN1eUT
         f0PRSqVDPe9DhCEoNyUZW7moWEhf81iRenzccxixxeefNP384b/Co/QYEGCst3mppIY2
         SJz2cpgB2AE42cZyE06Oer//oakr+rOjeU9K7S6azN+p33YG52afTGi6EMyR6Jt+6G9i
         WiVQ==
X-Gm-Message-State: ACrzQf07OVwFUhW5UG3yceIeW5iXiaFcstW8ZkpD1qKlCdI0bzNUMG9H
	s5MTC9KiEJw8K09EVYsXSto=
X-Google-Smtp-Source: AMsMyM7AkwO3l8V5ynYvYZueIPngu0PrXh3//n/yokMVdyGKH8unhU1UjYRnlttNuuru0V/uT29V4Q==
X-Received: by 2002:a05:6a00:15d4:b0:544:170c:4f5a with SMTP id o20-20020a056a0015d400b00544170c4f5amr3614064pfu.75.1663854232588;
        Thu, 22 Sep 2022 06:43:52 -0700 (PDT)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id x125-20020a628683000000b0053e199aa99bsm4295515pfd.220.2022.09.22.06.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 06:43:52 -0700 (PDT)
Message-ID: <93343c05-f31e-cfbe-6650-8ea8d79e6d55@gmail.com>
Date: Thu, 22 Sep 2022 22:43:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: David Hildenbrand <david@redhat.com>
References: <20220920122302.99195-2-david@redhat.com>
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220920122302.99195-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 23 Sep 2022 08:29:47 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, bhe@redhat.com, corbet@lwn.net, Akira Yokosawa <akiyks@gmail.com>, dwaipayanray1@gmail.com, linux-doc@vger.kernel.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, joe@perches.com, torvalds@linux-foundation.org, David.Laight@ACULAB.COM, jani.nikula@linux.intel.com, apw@canonical.com, lukas.bulwahn@gmail.com, akpm@linux-foundation.org, dyoung@redhat.com, mingo@kernel.org, vgoyal@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Minor nits on section title adornments.
See inline comments below.

On Tue, 20 Sep 2022 14:23:00 +0200, David Hildenbrand wrote:
> Linus notes [1] that the introduction of new code that uses VM_BUG_ON()
> is just as bad as BUG_ON(), because it will crash the kernel on
> distributions that enable CONFIG_DEBUG_VM (like Fedora):
> 
>     VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
>     no different, the only difference is "we can make the code smaller
>     because these are less important". [2]
> 
> This resulted in a more generic discussion about usage of BUG() and
> friends. While there might be corner cases that still deserve a BUG_ON(),
> most BUG_ON() cases should simply use WARN_ON_ONCE() and implement a
> recovery path if reasonable:
> 
>     The only possible case where BUG_ON can validly be used is "I have
>     some fundamental data corruption and cannot possibly return an
>     error". [2]
> 
> As a very good approximation is the general rule:
> 
>     "absolutely no new BUG_ON() calls _ever_" [2]
> 
> ... not even if something really shouldn't ever happen and is merely for
> documenting that an invariant always has to hold. However, there are sill
> exceptions where BUG_ON() may be used:
> 
>     If you have a "this is major internal corruption, there's no way we can
>     continue", then BUG_ON() is appropriate. [3]
> 
> There is only one good BUG_ON():
> 
>     Now, that said, there is one very valid sub-form of BUG_ON():
>     BUILD_BUG_ON() is absolutely 100% fine. [2]
> 
> While WARN will also crash the machine with panic_on_warn set, that's
> exactly to be expected:
> 
>     So we have two very different cases: the "virtual machine with good
>     logging where a dead machine is fine" - use 'panic_on_warn'. And
>     the actual real hardware with real drivers, running real loads by
>     users. [4]
> 
> The basic idea is that warnings will similarly get reported by users
> and be found during testing. However, in contrast to a BUG(), there is a
> way to actually influence the expected behavior (e.g., panic_on_warn)
> and to eventually keep the machine alive to extract some debug info.
> 
> Ingo notes that not all WARN_ON_ONCE cases need recovery. If we don't ever
> expect this code to trigger in any case, recovery code is not really
> helpful.
> 
>     I'd prefer to keep all these warnings 'simple' - i.e. no attempted
>     recovery & control flow, unless we ever expect these to trigger.
>     [5]
> 
> There have been different rules floating around that were never properly
> documented. Let's try to clarify.
> 
> [1] https://lkml.kernel.org/r/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com
> [2] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
> [2] https://lkml.kernel.org/r/CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com
> [4] https://lore.kernel.org/r/CAHk-=wgF7K2gSSpy=m_=K3Nov4zaceUX9puQf1TjkTJLA2XC_g@mail.gmail.com
> [5] https://lore.kernel.org/r/YwIW+mVeZoTOxn%2F4@gmail.com
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  Documentation/process/coding-style.rst | 61 ++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 03eb53fd029a..e05899cbfd49 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -1186,6 +1186,67 @@ expression used.  For instance:
>  	#endif /* CONFIG_SOMETHING */
>  
>  
> +22) Do not crash the kernel
> +---------------------------
> +
> +In general, it is not the kernel developer's decision to crash the kernel.
> +
> +Avoid panic()
> +=============
This looks to me like a subsection-level title.  The adornment symbol
needs to be:

   *************

> +
> +panic() should be used with care and primarily only during system boot.
> +panic() is, for example, acceptable when running out of memory during boot and
> +not being able to continue.
> +
> +Use WARN() rather than BUG()
> +============================
Ditto.

> +
> +Do not add new code that uses any of the BUG() variants, such as BUG(),
> +BUG_ON(), or VM_BUG_ON(). Instead, use a WARN*() variant, preferably
> +WARN_ON_ONCE(), and possibly with recovery code. Recovery code is not
> +required if there is no reasonable way to at least partially recover.
> +
> +"I'm too lazy to do error handling" is not an excuse for using BUG(). Major
> +internal corruptions with no way of continuing may still use BUG(), but need
> +good justification.
> +
> +Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
> +**************************************************
These wrong adornment symbol confuse ReST parser of Sphinx and results in
the build error from "make htmldocs" at this title (long message folded):

    Sphinx parallel build error:

    docutils.utils.SystemMessage: /xxx/Documentation/process/coding-style.rst:1213:
     (SEVERE/4) Title level inconsistent:



Please fix in v2.

        Thanks, Akira

> +
> +WARN_ON_ONCE() is generally preferred over WARN() or WARN_ON(), because it
> +is common for a given warning condition, if it occurs at all, to occur
> +multiple times. This can fill up and wrap the kernel log, and can even slow
> +the system enough that the excessive logging turns into its own, additional
> +problem.
> +
[...]

