Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA363438CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 06:52:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3kDK0tDtz30Bm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:52:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=YAeNiVm0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=YAeNiVm0; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3kCt2ddlz2yZ5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 16:52:07 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id e33so7909598pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 22:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jrTlyfiRQP0Jt7kq8QZFoM4VuMzt11eSTk3pvqVA7QY=;
 b=YAeNiVm0owARRZ8J86zOqgnrs/sywKok5qVDj67SztBIB9IHR+PwOEh/aZCWUCpE3L
 F16yrKLIthrKYhKCdHO1EAbhiFxaD72nFnwexy3ox4A7HBdijzE8VHG7jtptmM71QbQO
 Kl2vG24WjLENgZYdss4cmjq+iaeYGZfc5rHjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jrTlyfiRQP0Jt7kq8QZFoM4VuMzt11eSTk3pvqVA7QY=;
 b=V0xT7QaYkDuBX+IgVBERxiCqAqEELQ5UeuoFXGiDTMeBxPBTE0JF/TIi2oXicaDJ89
 mThedyihsMHfjan6xY4uF2DcKe6XNc7M+by2sFjy2Z981EKST5hrrMReK80gfAz38p/E
 PBeyzJNg4dtfN8bcfCJ1qiDUQx7GfcVCKOh2z11l/B5dgV3MMG26ZlKRh22c1wBlJ8Hj
 YoAXTODCflPtB2wESG4BNOVCVY2HP8Bu/f593/1lsikK4y/AO+1a/RiyvusIRgP7WhjM
 y6vVNRvjSks/hnqUfGYmb+j6e0NBZPIsbe/3xI1EFflzW5TgRRsiOb52pCbjnNQH1YLD
 +5tw==
X-Gm-Message-State: AOAM532Zunl12+2lzdJznFTS3Y4o40yqs+wylrEZs1tuFbDitr27oS8W
 dOjSfLyVlr994gtrZC4wE4C68A==
X-Google-Smtp-Source: ABdhPJxYnbJhRJz/PWii4fLjBsRW4wnnSFzmMWXqQj/ARd+zZPwmpUweQXWSFt4ROYZs7QIZ2x4FPg==
X-Received: by 2002:aa7:9852:0:b029:211:6824:6c7d with SMTP id
 n18-20020aa798520000b029021168246c7dmr17530016pfq.19.1616392324492; 
 Sun, 21 Mar 2021 22:52:04 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-b3b5-fa56-fd12-3c5a.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:b3b5:fa56:fd12:3c5a])
 by smtp.gmail.com with ESMTPSA id nk3sm12514893pjb.17.2021.03.21.22.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 22:52:04 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [PATCH v11 6/6] powerpc: Book3S 64-bit outline-only KASAN support
In-Reply-To: <20210322025934.GG77072@balbir-desktop>
References: <20210319144058.772525-1-dja@axtens.net>
 <20210319144058.772525-7-dja@axtens.net>
 <20210320060259.GF77072@balbir-desktop>
 <87o8fcatxv.fsf@dja-thinkpad.axtens.net>
 <20210322025934.GG77072@balbir-desktop>
Date: Mon, 22 Mar 2021 16:52:00 +1100
Message-ID: <87lfafburj.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Balbir Singh <bsingharora@gmail.com> writes:

> On Mon, Mar 22, 2021 at 11:55:08AM +1100, Daniel Axtens wrote:
>> Hi Balbir,
>> 
>> > Could you highlight the changes from
>> > https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20170729140901.5887-1-bsingharora@gmail.com/?
>> >
>> > Feel free to use my signed-off-by if you need to and add/update copyright
>> > headers if appropriate.
>> 
>> There's not really anything in common any more:
>> 
>>  - ppc32 KASAN landed, so there was already a kasan.h for powerpc, the
>>    explicit memcpy changes, the support for non-instrumented files,
>>    prom_check.sh, etc. all already landed.
>> 
>>  - I locate the shadow region differently and don't resize any virtual
>>    memory areas.
>> 
>>  - The ARCH_DEFINES_KASAN_ZERO_PTE handling changed upstream and our
>>    handling for that is now handled more by patch 3.
>> 
>>  - The outline hook is now an inline function rather than a #define.
>> 
>>  - The init function has been totally rewritten as it's gone from
>>    supporting real mode to not supporting real mode and back.
>> 
>>  - The list of non-instrumented files has grown a lot.
>> 
>>  - There's new stuff: stack walking is now safe, KASAN vmalloc support
>>    means modules are better supported now, ptdump works, and there's
>>    documentation.
>> 
>> It's been a while now, but I don't think when I started this process 2
>> years ago that I directly reused much of your code. So I'm not sure that
>> a signed-off-by makes sense here? Would a different tag (Originally-by?)
>> make more sense?
>>
>
> Sure

Will do.

>  
>> >> + * The shadow ends before the highest accessible address
>> >> + * because we don't need a shadow for the shadow. Instead:
>> >> + * c00e000000000000 << 3 + a80e 0000 0000 0000 000 = c00fc00000000000
>> >
>> > The comment has one extra 0 in a80e.., I did the math and had to use
>> > the data from the defines :)
>> 
>> 3 extra 0s, even! Fixed.
>> 
>> >> +void __init kasan_init(void)
>> >> +{
>> >> +	/*
>> >> +	 * We want to do the following things:
>> >> +	 *  1) Map real memory into the shadow for all physical memblocks
>> >> +	 *     This takes us from c000... to c008...
>> >> +	 *  2) Leave a hole over the shadow of vmalloc space. KASAN_VMALLOC
>> >> +	 *     will manage this for us.
>> >> +	 *     This takes us from c008... to c00a...
>> >> +	 *  3) Map the 'early shadow'/zero page over iomap and vmemmap space.
>> >> +	 *     This takes us up to where we start at c00e...
>> >> +	 */
>> >> +
>> >
>> > assuming we have
>> > #define VMEMMAP_END R_VMEMMAP_END
>> > and ditto for hash we probably need
>> >
>> > 	BUILD_BUG_ON(VMEMMAP_END + KASAN_SHADOW_OFFSET != KASAN_SHADOW_END);
>> 
>> Sorry, I'm not sure what this is supposed to be testing? In what
>> situation would this trigger?
>>
>
> I am bit concerned that we have hard coded (IIR) 0xa80e... in the
> config, any changes to VMEMMAP_END, KASAN_SHADOW_OFFSET/END
> should be guarded.
>

Ah that makes sense. I'll come up with some test that should catch any
unsynchronised changes to VMEMMAP_END, KASAN_SHADOW_OFFSET or
KASAN_SHADOW_END.

Kind regards,
Daniel Axtens

> Balbir Singh.
