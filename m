Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04324338477
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 04:45:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxWtm08ZVz3dDM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:45:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=vuJbn5YD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=vuJbn5YD; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxWtJ6CYSz3cJX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 14:45:25 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id l7so955313pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 19:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+UxDu1OMkjlBjCBhL012JeSF23eUU8crAJ2h0QUTKBA=;
 b=vuJbn5YDcO8s4thuITfoh9JX/Y8eTdfR2O3/CMCZxQuUjQuLHNpWkAg7XmZz8K5zdN
 cnlO2+pp6pj012fNtXCvk1uZhBP2k+bSq4BXTyDVLEHwthjsVsoqxQ3As5fgf20zwren
 ZdpwSBLDHOxxY2EvQQXe6j1TbWIM7C7FpJqj9cde4kh0gttMRIBnxNlU4Xdyfpao0yVn
 UuOhaBO6XMACYaj265G4w+wxfXTvQOv5rRu+oIDaU1rq86VshE2cMeeyXrALeHad2FNU
 LUplHi6o+obaF4XciMMK8TrGOPkVc+j02R4q2SNqeVv9/pOJbTZs641FmY7jcgNYHcTP
 /mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+UxDu1OMkjlBjCBhL012JeSF23eUU8crAJ2h0QUTKBA=;
 b=pxvbqlCoCixqYRoJfEHjYUfwQ9FPUconvUUKpuSjls5B3Lk9q8F33VCy9TOK3SzuFS
 /d0Yfyz6PzuaWUWBU3o+smjej6R7QNImaK3Zv9sb3EFaO5OUeOtTGsEqykFzItC/ftZj
 hw/28a1EBQ3O4mnrYJqzirc96WU/P90lUPUacO7nhgtj4Zgt/ApyJt9OF+KnTZhMfKeM
 MhQ6RkVz2ymWPA6ytIzbv9zMR30FCFabFg+N8MDdnFRvRifw3GjVX4TIyIPWtI6GttL8
 +505lgPIZKcj7EN0F2GK76ZkiuKn49ratSlWag9eUCv9Dx+5qjiJDS8es2Ptb2BZAM4T
 7UEg==
X-Gm-Message-State: AOAM531nOqSeOWm/8VzrSpP57NhUMMN6OqabayUviUsZzoDfYuWXVtWd
 vM/IAMS515DTbk+0q4v39PzmElwzk0SKw4C4
X-Google-Smtp-Source: ABdhPJzeikVGR+92CKdvaSQjcMn1Cyr/SlWohyWSplupON4v/IeFDyvKlQhudqWwy2gl+BonELOqUg==
X-Received: by 2002:aa7:942d:0:b029:1f2:cbc6:8491 with SMTP id
 y13-20020aa7942d0000b02901f2cbc68491mr10556788pfo.53.1615520719927; 
 Thu, 11 Mar 2021 19:45:19 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id u20sm3717947pfm.146.2021.03.11.19.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 19:45:19 -0800 (PST)
Subject: Re: PowerPC64 future proof kernel toc, revised for lld
To: Michael Ellerman <ellerman@au1.ibm.com>, Alan Modra <amodra@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20210309045638.GI6042@bubble.grove.modra.org>
 <20210310034813.GM6042@bubble.grove.modra.org>
 <3c92968f-7c61-8d36-4001-91f8630de4b1@linux.ibm.com>
 <20210310050722.GN6042@bubble.grove.modra.org>
 <5aa60950-d93c-f700-3b0b-a01f947e8a22@linux.ibm.com>
 <20210310122513.GB29645@bubble.grove.modra.org>
 <df863fb6-2fd6-00d7-b6f3-94a49c2a5405@csgroup.eu>
 <20210310234135.GC29645@bubble.grove.modra.org>
 <87mtv9jmgf.fsf@mpe.ellerman.id.au>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <15227114-a5fc-9573-f563-cde1b84cbaa1@ozlabs.ru>
Date: Fri, 12 Mar 2021 14:45:13 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <87mtv9jmgf.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: alexey@au1.ibm.com, Alexey Kardashevskiy <aik@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/03/2021 10:32, Michael Ellerman wrote:
> Alan Modra <amodra@gmail.com> writes:
>> On Wed, Mar 10, 2021 at 01:44:57PM +0100, Christophe Leroy wrote:
>>>
>>> Le 10/03/2021 à 13:25, Alan Modra a écrit :
>>>> On Wed, Mar 10, 2021 at 08:33:37PM +1100, Alexey Kardashevskiy wrote:
>>>>> One more question - the older version had a construct "DEFINED (.TOC.) ?
>>>>> .TOC. : ..." in case .TOC. is not defined (too old ld? too old gcc?) but the
>>>>> newer patch seems assuming it is always defined, when was it added? I have
>>>>> the same check in SLOF, for example, do I still need it?
>>>>
>>>> .TOC. symbol support was first added 2012-11-06, so you need
>>>> binutils-2.24 or later to use .TOC. as a symbol.
>>>>
>>>
>>> As of today, minimum requirement to build kernel is binutils 2.23, see https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_latest_process_changes.html-23current-2Dminimal-2Drequirements&d=DwIDAw&c=jf_iaSHvJObTbx-siA1ZOg&r=uzpscot8Q8p-51o1Gp1vnzKV94bfny2qmUdVe821lv0&m=SYi605mn0I1hf1QoHuvHXtS_Z-R6JJHbzS34cEtV2Tk&s=47ckf3yxVcP6RwRb8D9viYOQSWpf6rXrnWj4YM4OTJ0&e=
>>
>> Yes, and arch/powerpc/Makefile complains about 2.24.  So for powerpc
>> that means you need to go to at least 2.25.
> 
> Not quite. It only complains for little endian builds, and only if you
> have stock 2.24, it will allow a 2.24.<something>.
> 
> I do most of my builds with 2.34, so I have no issue with newer
> binutils. But we try not to increase the minimum version too rapidly to
> accommodate folks using older and/or "Enterprise" distros that are stuck
> on old toolchains.
> 
> I think we are within our rights to increase the minimum requirement for
> powerpc builds, if it brings advantages we can identify.
> 
> The way to do that would be to add a new check in our arch Makefile that
> rejects the older versions.

The upstream llvm just learnt to handle the .TOC. symbol in linker 
scripts so we may delay the future for a bit longer :) @dja wanted 
upstream llvm anyway and the currently supported llvm 10.xx is not much 
value for our experiments.

https://github.com/llvm/llvm-project/commit/e4f385d89448393b4d213339bbbbbbaa42b49489



-- 
Alexey
