Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C46B228CDE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 01:49:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBFgr0HXpzDqlK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:49:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20150623.gappssmtp.com
 header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=hsWZwjsr; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBFfB1qL3zDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 09:48:16 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id a9so202262pjd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 16:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mDc030Vht0H+5kxn8kLZcM0RglBvmobnh33JIp70Q9A=;
 b=hsWZwjsrrb6MHnGlDjXciuMZQ0nzpaGX0XqqotTf6FxppNdslwj80bOHq4XiVr8B4N
 SCpSNd4Uu+fKdrj6GAgEnicqXWWEP9PCWq23ucc9/tt2akFpRFgjuE9SeU+cCHODPhj8
 maVEeY1DOS1y5XfHe5sHYmNqjl4RoWUBn7w7lB8TeTWwtt4QeijAeuGNPjcLeBnjV19B
 SmugmuJ8ByDeMpqvSyeew7HlPpyj9My215QEtBoF9dt3tORKxn+X2oVXdd2uNIyHmd9b
 VDJVMDJNscIIFoT2kCXV0OaSjuh8jGAbeGFch/4XoFGO9VWRYU5PdpQ3sp+SqpvXySKf
 YI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mDc030Vht0H+5kxn8kLZcM0RglBvmobnh33JIp70Q9A=;
 b=c4u2s0BpYVYgUWKeWezWT1n+NQ3dprb1RFB/oKPe2Ukc/7GHWHoTZ0xMNTMDs0Pta/
 Pheyba4t199jsPZLrDfjlIhREMCzhhhzaV0qiQa6QiI+/sdYjMzAgl6ZzAblBk+LsQbm
 SW4VxvOeT3t+/gllsc/Pf3cveumJPPtajpaAXGP7i0TzwPLYOp3j4ipkva6Ns/heZOPG
 lOJU6h0wQ8Z13ZwUDE/KMnSzm03haS8pkRfUv66B0WoOpwaX3EyXk6MlQ8pu4j8EScd/
 Qyh/D3Y6M8nkQVhgMY1z0c3nnmQcfSbN0OIu88mOP41qxQ6FiiPeTonilXsZ2tMWzdFu
 2N/Q==
X-Gm-Message-State: AOAM5317ySC1dzKYKJzhg1cNC00iJ/JL5QiyEwPC5An9Td5/8FbLHBXB
 Yy7CC5ppe2hfJPebWeztedwgRw==
X-Google-Smtp-Source: ABdhPJz7GQOPhPQo7WdQAVqmRGBn/kBHYhew0a/7KykfyZ8e5DBJEpqbOEQfucs+jTILpvC6kcl9RQ==
X-Received: by 2002:a17:90a:cc03:: with SMTP id
 b3mr6637665pju.80.1595375292546; 
 Tue, 21 Jul 2020 16:48:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i66sm20870634pfc.12.2020.07.21.16.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 16:48:11 -0700 (PDT)
Date: Tue, 21 Jul 2020 16:48:11 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 16:48:10 PDT (-0700)
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
In-Reply-To: <6fbea8347bdb8434d91cf3ec2b95b134bd66cfe3.camel@kernel.crashing.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: benh@kernel.crashing.org
Message-ID: <mhng-cd9a74ea-2edf-47e4-aade-b090f1a069f1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, linux-mm@kvack.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, paulus@samba.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Jul 2020 16:12:58 PDT (-0700), benh@kernel.crashing.org wrote:
> On Tue, 2020-07-21 at 12:05 -0700, Palmer Dabbelt wrote:
>>
>> * We waste vmalloc space on 32-bit systems, where there isn't a lot of it.
>> * On 64-bit systems the VA space around the kernel is precious because it's the
>>   only place we can place text (modules, BPF, whatever).
>
> Why ? Branch distance limits ? You can't use trampolines ?

Nothing fundamental, it's just that we don't have a large code model in the C
compiler.  As a result all the global symbols are resolved as 32-bit
PC-relative accesses.  We could fix this with a fast large code model, but then
the kernel would need to relax global symbol references in modules and we don't
even do that for the simple code models we have now.  FWIW, some of the
proposed large code models are essentially just split-PLT/GOT and therefor
don't require relaxation, but at that point we're essentially PIC until we
have more that 2GiB of kernel text -- and even then, we keep all the
performance issues.

>>  If we start putting
>>   the kernel in the vmalloc space then we either have to pre-allocate a bunch
>>   of space around it (essentially making it a fixed mapping anyway) or it
>>   becomes likely that we won't be able to find space for modules as they're
>>   loaded into running systems.
>
> I dislike the kernel being in the vmalloc space (see my other email)
> but I don't understand the specific issue with modules.

Essentially what's above, the modules smell the same as the rest of the
kernel's code and therefor have a similar set of restrictions.  If we build PIC
modules and have the PLT entries do GOT loads (as do our shared libraries) then
we could break this restriction, but that comes with some performance
implications.  Like I said in the other email, I'm less worried about the
instruction side of things so maybe that's the right way to go.

>> * Relying on a relocatable kernel for sv48 support introduces a fairly large
>>   performance hit.
>
> Out of curiosity why would relocatable kernels introduce a significant
> hit ? Where about do you see the overhead coming from ?

Our PIC codegen, probably better addressed by my other email and above.

>
>> Roughly, my proposal would be to:
>>
>> * Leave the 32-bit memory map alone.  On 32-bit systems we can load modules
>>   anywhere and we only have one VA width, so we're not really solving any
>>   problems with these changes.
>> * Staticly allocate a 2GiB portion of the VA space for all our text, as its own
>>   region.  We'd link/relocate the kernel here instead of around PAGE_OFFSET,
>>   which would decouple the kernel from the physical memory layout of the system.
>>   This would have the side effect of sorting out a bunch of bootloader headaches
>>   that we currently have.
>> * Sort out how to maintain a linear map as the canonical hole moves around
>>   between the VA widths without adding a bunch of overhead to the virt2phys and
>>   friends.  This is probably going to be the trickiest part, but I think if we
>>   just change the page table code to essentially lie about VAs when an sv39
>>   system runs an sv48+sv39 kernel we could make it work -- there'd be some
>>   logical complexity involved, but it would remain fast.
>>
>> This doesn't solve the problem of virtually relocatable kernels, but it does
>> let us decouple that from the sv48 stuff.  It also lets us stop relying on a
>> fixed physical address the kernel is loaded into, which is another thing I
>> don't like.
>>
>> I know this may be a more complicated approach, but there aren't any sv48
>> systems around right now so I just don't see the rush to support them,
>> particularly when there's a cost to what already exists (for those who haven't
>> been watching, so far all the sv48 patch sets have imposed a significant
>> performance penalty on all systems).
