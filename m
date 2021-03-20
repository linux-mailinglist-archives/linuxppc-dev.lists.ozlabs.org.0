Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168E33429A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 02:41:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2Nld35Yrz3c0L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 12:41:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sOLb6Dan;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=bsingharora@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sOLb6Dan; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2NlB4F80z2y8B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 12:41:09 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id v186so4852576pgv.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 18:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oWdIOPAkZfr1BoujvrjjbGLV84XJk3QFa5vSlgO7ACI=;
 b=sOLb6DanI+zm5MFPForuIykm6CHj/PtN+oXFpBhQmcrrR5idcrXbqKnIB7N7bOLuuq
 p3SHcXX/mt2M8rwjX5aN1Zi259kXlIpgHYettXIDWhdimrHhk+Czv1vdVdu2qE7+6qPL
 L0T6JZYa+2G9AYm3I+7Qlt9VVMnF6WXsT+z5FLopQfWZ1lJBeyOPI4EStu4fORX+AmE9
 jKSsOp5uQJq89Fa140cV2bxJfA+y3+ztNrbSUgg8HuvDu2UMGQM/wd4jwomQqtlkM6Tf
 c0iG8fb5Q7CezO2+iLCMHy8JrhzfTpqxrQzgF+F24HUNU1v5itQx039AKXGvcEFMvqmD
 WVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oWdIOPAkZfr1BoujvrjjbGLV84XJk3QFa5vSlgO7ACI=;
 b=Wz8uxAICGYERnkhEDkSDNs8w1VXzhVDAPb+8h8ptrYAeZ2MQVLtCneFNk0UYTBgbmq
 ZfEAVwB1j6FyHYvBLjszdchlqkqSVOPEs6TOcSei5baEQPjqP9+nolpGK3GFx6QS1U4E
 vd3VlImzsaZlgaV2VaJOqlvrg7ZS9+vhQ2x+W5E3GW9qnbG74Wi/pQAC5zgZTQdH+nWq
 lmm3+bNbIE8DgLTme8Bl11sn5QHr9b8wI7fcvLp/kIOEOIyuYr7o8BzhyJGBnKzWuqVS
 tY5dUs7vsZEJvCbfn90DJIUzhxI9301mBVfZB4Kak4VI8Snzrcp841tki5bcYEscL3ZC
 XAjw==
X-Gm-Message-State: AOAM531TDa/02AnCoha7xu0eR1LqWjR53EWTdiHVJ/IAc5pvQDKdmTvb
 mSLRkM2wrSXc5VguZ7DLIjY=
X-Google-Smtp-Source: ABdhPJx0W9fCwaT8UQdJG3P26P2B6HAB0ynZeZvZHx2tVy0Y5WbW6HCKUtmhyouZzzOoxt8gqGFNZg==
X-Received: by 2002:a65:44c5:: with SMTP id g5mr14108950pgs.295.1616204466016; 
 Fri, 19 Mar 2021 18:41:06 -0700 (PDT)
Received: from localhost ([103.250.185.142])
 by smtp.gmail.com with ESMTPSA id y29sm6830981pfp.206.2021.03.19.18.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 18:41:04 -0700 (PDT)
Date: Sat, 20 Mar 2021 12:40:57 +1100
From: Balbir Singh <bsingharora@gmail.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v11 0/6] KASAN for powerpc64 radix
Message-ID: <20210320014057.GA77072@balbir-desktop>
References: <20210319144058.772525-1-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319144058.772525-1-dja@axtens.net>
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
Cc: aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 20, 2021 at 01:40:52AM +1100, Daniel Axtens wrote:
> Building on the work of Christophe, Aneesh and Balbir, I've ported
> KASAN to 64-bit Book3S kernels running on the Radix MMU.
> 
> v11 applies to next-20210317. I had hoped to have it apply to
> powerpc/next but once again there are changes in the kasan core that
> clash. Also, thanks to mpe for fixing a build break with KASAN off.
> 
> I'm not sure how best to progress this towards actually being merged
> when it has impacts across subsystems. I'd appreciate any input. Maybe
> the first four patches could go in via the kasan tree, that should
> make things easier for powerpc in a future cycle?
> 
> v10 rebases on top of next-20210125, fixing things up to work on top
> of the latest changes, and fixing some review comments from
> Christophe. I have tested host and guest with 64k pages for this spin.
> 
> There is now only 1 failing KUnit test: kasan_global_oob - gcc puts
> the ASAN init code in a section called '.init_array'. Powerpc64 module
> loading code goes through and _renames_ any section beginning with
> '.init' to begin with '_init' in order to avoid some complexities
> around our 24-bit indirect jumps. This means it renames '.init_array'
> to '_init_array', and the generic module loading code then fails to
> recognise the section as a constructor and thus doesn't run it. This
> hack dates back to 2003 and so I'm not going to try to unpick it in
> this series. (I suspect this may have previously worked if the code
> ended up in .ctors rather than .init_array but I don't keep my old
> binaries around so I have no real way of checking.)
> 
> (The previously failing stack tests are now skipped due to more
> accurate configuration settings.)
> 
> Details from v9: This is a significant reworking of the previous
> versions. Instead of the previous approach which supported inline
> instrumentation, this series provides only outline instrumentation.
> 
> To get around the problem of accessing the shadow region inside code we run
> with translations off (in 'real mode'), we we restrict checking to when
> translations are enabled. This is done via a new hook in the kasan core and
> by excluding larger quantites of arch code from instrumentation. The upside
> is that we no longer require that you be able to specify the amount of
> physically contiguous memory on the system at compile time. Hopefully this
> is a better trade-off. More details in patch 6.
> 
> kexec works. Both 64k and 4k pages work. Running as a KVM host works, but
> nothing in arch/powerpc/kvm is instrumented. It's also potentially a bit
> fragile - if any real mode code paths call out to instrumented code, things
> will go boom.
>

The last time I checked, the changes for real mode, made the code hard to
review/maintain. I am happy to see that we've decided to leave that off
the table for now, reviewing the series

Balbir Singh.
