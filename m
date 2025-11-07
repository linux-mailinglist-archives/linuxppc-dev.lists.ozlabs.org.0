Return-Path: <linuxppc-dev+bounces-13933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 547BFC4047F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 15:18:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d31PY19Pcz3bs7;
	Sat,  8 Nov 2025 01:18:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762525105;
	cv=none; b=NNRzkObBDVtCrQCCFfFnsdu67I2yCPXYZtrj4aQepd1Sm9kR//t7cvgESQr9HMf/vh45K9CEzNJqDp+wXkCIbgD3ebh8zzBLfJXI9RVSecvunllNmcOkrj3Vr93d08p++cx3htgtgl00qhZhMhpLWD1R2DJbOTmTrmbN5t/MjZCgoepcfOQTVHJ5PDdjJK6dlKETHXADzNhHtuberbP56W323wbqDtjgjeiF6JdhdwR8tgcJ27LsoNNgwN+3+tSxk+0G2NeiL6CP0lnKWJobE5iq/zQYuNnj7tBEK0ou79QknlH2W2mQAzyxw41Z+2wQ1pwjDina28qBCEronQhkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762525105; c=relaxed/relaxed;
	bh=+Vc6+O7CetF6YDo7yqfWzzANHwV9RzFoc3MJqcDn2kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRt5tuS5YUxKf8Yh89TSclFKeD/DoMyHzGjtgtg2sVEOEpygU1Y1hN5IjDyCaCCkZJ4nwSkK5qCu/JGVbviYgXlAblCOIMYC2keM24PUE7aficSm8eyw6z8uIpidJX+KdbeRQ4HrfJ4aAkTwGq4Ugp+uHib/3kaWcR9eMTLJ1vgWZ3FIqHSZNoBujuzFuCA77kokiRH0C2SVbEpPSwLgzko/ziOaQC5b7QNFeHxrsLWUo3qU6mmD7PIByWklOlPxi4zlNx48v3s44JXMd5ODygLu4p/y8JsjdHwChlLb/eSeWx/BP17dyr6oQLPyRXiu1h/KSlHwsNLADFC1fBLDPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6k5mck2; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6k5mck2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d31PX0YkTz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 01:18:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF2BB61902;
	Fri,  7 Nov 2025 14:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D505AC4CEF7;
	Fri,  7 Nov 2025 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762525099;
	bh=8j2EWeaBmIMINQPODFrhuPQGp+pV+M9qxQAMDoOptJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p6k5mck28BCPSM/jKqftBs9Ap3SWNPoH6QkG7b2myBd9g5YYib3dem5QMrJmqTyDQ
	 gGtIP5cO0Yg25lNDK97SJxTykWz0mGz7z/G4HXeNWEyTcl0M74v+jCsUoflIGAXFV1
	 7tgjPGXIN9JfOg2+IU2776v3bzdD4ZHGcBiN+Bix7BUjHQDquqyC9Ydr/aozYnhfre
	 7yQ5ToJfrfhrAW0MmBVleCuqSUXBsDVleuHhXPyRuBwW6GgYy2woMbVG93x6QNX6Br
	 KkFf29eafIPCMG3l4/TnyoTtdvky47q3uXVjbSQQwG3DnYx2KnPOEnfIa+ivp4NX2I
	 fu76tvHPkmXDw==
Message-ID: <00763134-2e92-4087-8285-ddb25f843b54@kernel.org>
Date: Fri, 7 Nov 2025 15:18:15 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
 <e93e3a1b-5cf1-4d2a-9b2c-5049e211f593@linux.ibm.com>
 <b875435f-6a69-4989-bc21-4093c2ce6331@kernel.org>
 <5e4bc56e-f0ca-45b3-a7c8-114e7009dfd8@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <5e4bc56e-f0ca-45b3-a7c8-114e7009dfd8@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07.11.25 13:35, Sourabh Jain wrote:
> 
> On 07/11/25 14:32, David Hildenbrand (Red Hat) wrote:
>> On 07.11.25 09:00, Sourabh Jain wrote:
>>>
>>>
>>> On 06/11/25 20:32, David Hildenbrand (Red Hat) wrote:
>>>>>> Yes, we discussed that in [1].
>>>>>>
>>>>>> We'll have to set ARCH_HAS_GIGANTIC_PAGE on ppc and increase
>>>>>> MAX_FOLIO_ORDER, because apparently, there might be ppc configs that
>>>>>> have even larger hugetlb sizes than PUDs.
>>>>>>
>>>>>> @Cristophe, I was under the impression that you would send a fix. Do
>>>>>> you
>>>>>> want me to prepare something and send it out?
>>>>>
>>>>> Indeed I would have liked to better understand the implications of all
>>>>> this, but I didn't have the time.
>>>>
>>>> Indeed, too me longer than it should to understand and make up my mind
>>>> as well.
>>>>
>>>>>
>>>>> By the way, you would describe the fix better than me so yes if you
>>>>> can
>>>>> prepare and send a fix please do.
>>>>
>>>> I just crafted the following. I yet have to test it more, some early
>>>> feedback+testing would be appreciated!
>>>>
>>>>   From 274928854644c49c92515f8675c090dba15a0db6 Mon Sep 17 00:00:00 2001
>>>> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
>>>> Date: Thu, 6 Nov 2025 11:31:45 +0100
>>>> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on some ppc64 configs with
>>>> hugetlb
>>>
>>> b4 did not detect this patch, and manually copying the patch text
>>> from this
>>> reply also did not apply cleanly on upstream master and linuxppc
>>> master/next.
>>
>> I have it on a branch here:
>>
>> https://github.com/davidhildenbrand/linux/commit/274928854644c49c92515f8675c090dba15a0db6
>>
>>
>> https://github.com/davidhildenbrand/linux.git max_folio_order
>>
> 
> The above patch resolves the issue reported in this thread.
> 
> Thanks for the fix David.

Okay, I'll have to do some more testing (and I've been failing for days 
to get a ppc64 machine internally provisioned automatically). Will send 
it out early next week, thanks!

-- 
Cheers

David

