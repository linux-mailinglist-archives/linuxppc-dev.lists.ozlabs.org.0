Return-Path: <linuxppc-dev+bounces-882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 421FF968C3C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 18:40:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyDxw1GT2z2y89;
	Tue,  3 Sep 2024 02:40:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725295204;
	cv=none; b=WR6uNpHHVvfZY7BDemLNlMMZOBHLyVtMt6+cXjhjb/r/qQTKzdyJiinKOMTnsEcA5uaPNVEAK2/K2PVyfaia5n1wocfvZytQ0ZnOGQ5nAql5XDu3b0xrpggZcCwo/vB2CxMm95dbO5Jn3Qs2BOlK8Ebfzwc7SNTwCg5CJ4QQ0ndV0F8R0h7c8hAaV6BrjBF9nwIzgpLSiglMZhjh21zq4lS8xuJYmu+gfoZ//gr9jTHivLbAI5aPYtvddN7YtZFqfJQVWVs6vLdp+u1mpftjaarZeS/A/PUMRy5pel2Tak4xNrzvu0Yif9s02dnzrsTVO1enVEjnRye1tMrwPFtOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725295204; c=relaxed/relaxed;
	bh=sN52cpHdRrdru0pCcK4JXKDfBVCF3QpRMNtiOqVdu9M=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type; b=AxYCiL+q35I2NRQLesbgSzO55wbheLVEAF41ZsrHf/qZ9mmjDdaXK+kkh9SHm6Ow1aGZioJPSWHpJ8DUUXixZfhiDpm2kd2l5KqghAraClSHPv+uTUcf8hoys9cfFJZW+cVFJ+924fznM6NPg+BNb0No6pWndEPgHRlfnNrZik6urslFhtTIm09f2cg0FDUocw7HkD7TUo02e6EVP3K0voOu3bb81VABVS0QPE4Yvpp+xC2ZaTTj1kxKVArcYlrTD+gAR+n7fqajjDpvMAm3lrNbSaNfKzr85XnLLDc7rujeg8kOq4KvJ36G5ZxzmSaKmg8TwlJ958jenqojrKsPEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gvl5QXoz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gvl5QXoz; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gvl5QXoz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gvl5QXoz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyDxv4pV4z2y69
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 02:40:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725295197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sN52cpHdRrdru0pCcK4JXKDfBVCF3QpRMNtiOqVdu9M=;
	b=gvl5QXozY/cufezESXJvbCWidX+RoY+pxTIRVb0XM1+rSsKzqLSGLCPaNMoJeEL0D3a4Mg
	4Z9qdNbpARb+unx5EWgWxq+CCaLZ7k/Nz+wEPEuaQLI2FRE/Z7LtVNaaqbItve7doJL2Qg
	rP3i+uR9K92CYaWPMTV1eGUGXqymPOY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725295197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sN52cpHdRrdru0pCcK4JXKDfBVCF3QpRMNtiOqVdu9M=;
	b=gvl5QXozY/cufezESXJvbCWidX+RoY+pxTIRVb0XM1+rSsKzqLSGLCPaNMoJeEL0D3a4Mg
	4Z9qdNbpARb+unx5EWgWxq+CCaLZ7k/Nz+wEPEuaQLI2FRE/Z7LtVNaaqbItve7doJL2Qg
	rP3i+uR9K92CYaWPMTV1eGUGXqymPOY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-aN1gxB4APcy8K0w27t-8Vg-1; Mon, 02 Sep 2024 12:39:56 -0400
X-MC-Unique: aN1gxB4APcy8K0w27t-8Vg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42bb2efc0b5so21021645e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2024 09:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725295195; x=1725899995;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sN52cpHdRrdru0pCcK4JXKDfBVCF3QpRMNtiOqVdu9M=;
        b=D3288JS1bCR1vKTxGriZzUJZ22a080R8EZGFEDzKPBt0yK/tpPQJxh1wbQb/FlE+Iq
         wAzdVB48No9H/8lA7YewiYtCDyMn4P1Z/aDxg+b8+v0gAGfQr6YR7HYYd8Ez7ZlX1FgV
         ONQm9KySBcorhQVhXiL8fUZMDBb/qTF6DW+9ohX1lGok36U1Be721f4HE5L/9XF/Th4P
         hiwA19iWq2tF13us3QL4Qz6+o/5UrF0J9eIagmDJmBXWJONfOrYeQuMwdL1Ex3OwiUWJ
         pthSVEIpwsKBiatgXdpAs6xoUDrNQFSxNPuU/A1s3nscfqId02li9lPkPG0Hui387H6b
         oMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0lLw/K0t/lazXGkW8Q6li3l57CJOwVP9BRVniohLOBo+qNsXQKqA8fZc9O+6e6g1xaPtauRBxrFSIyw0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDlAY/WBSYquDqKFLpxfjx4yU/JkRi2d5QUfzTAD23gngEUOyy
	yyq75BJBnnfgYl/VP/fvWblmn+N7jtKFkmScea9t4g0aCWEPVnVgXynuekghtL1a44iUabHoqtL
	5SveUR4hzpX+HDqPibX7skfISBALaIxVwfeOkiBPEyURNfSB5GAsX8VvHk0kwSDs=
X-Received: by 2002:a05:600c:3ba3:b0:42a:a92b:8e06 with SMTP id 5b1f17b1804b1-42bb4c3e51bmr97930605e9.4.1725295194797;
        Mon, 02 Sep 2024 09:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9phZGFO80qt7wZJU2JQ9lMT8p4KQA1ByjuceIs5a81ZoCFG/S1B+NhesIR8p82ymaNDcdGw==
X-Received: by 2002:a05:600c:3ba3:b0:42a:a92b:8e06 with SMTP id 5b1f17b1804b1-42bb4c3e51bmr97930195e9.4.1725295193873;
        Mon, 02 Sep 2024 09:39:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72d:6500:849a:c1af:a5bb:ba9d? (p200300cbc72d6500849ac1afa5bbba9d.dip0.t-ipconnect.de. [2003:cb:c72d:6500:849a:c1af:a5bb:ba9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63abea3sm180516415e9.28.2024.09.02.09.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 09:39:53 -0700 (PDT)
Message-ID: <995d18bb-16f1-4843-92bc-6c4a386a811d@redhat.com>
Date: Mon, 2 Sep 2024 18:39:52 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
To: Omar Sandoval <osandov@osandov.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 kernel-team@fb.com
References: <cover.1725223574.git.osandov@fb.com>
 <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
 <ZtVbrM4rQsGFJo_t@telecaster>
 <861d448c-ce1d-4b74-87eb-9b211dfebbb1@redhat.com>
 <ZtXZFc9kZAUMD4e0@telecaster>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZtXZFc9kZAUMD4e0@telecaster>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.09.24 17:26, Omar Sandoval wrote:
> On Mon, Sep 02, 2024 at 10:56:27AM +0200, David Hildenbrand wrote:
>> On 02.09.24 08:31, Omar Sandoval wrote:
>>> On Mon, Sep 02, 2024 at 08:19:33AM +0200, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
>>>>> [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> From: Omar Sandoval <osandov@fb.com>
>>>>>
>>>>> Hi,
>>>>>
>>>>> I hit a case where copy_to_kernel_nofault() will fault (lol): if the
>>>>> destination address is in userspace and x86 Supervisor Mode Access
>>>>> Prevention is enabled. Patch 2 has the details and the fix. Patch 1
>>>>> renames a helper function so that its use in patch 2 makes more sense.
>>>>> If the rename is too intrusive, I can drop it.
>>>>
>>>> The name of the function is "copy_to_kernel". If the destination is a user
>>>> address, it is not a copy to kernel but a copy to user and you already have
>>>> the function copy_to_user() for that. copy_to_user() properly handles SMAP.
>>>
>>> I'm not trying to copy to user. I am (well, KDB is) trying to copy to an
>>> arbitrary address, and I want it to return an error instead of crashing
>>> if the address is not a valid kernel address. As far as I can tell, that
>>> is the whole point of copy_to_kernel_nofault().
>>
>> The thing is that you (well, KDB) triggers something that would be
>> considered a real BUG when triggered from "ordinary" (non-debugging) code.
> 
> If that's the case, then it's a really weird inconsistency that it's OK
> to call copy_from_kernel_nofault() with an invalid address but a bug to
> call copy_to_kernel_nofault() on the same address. Again, isn't the
> whole point of these functions to fail gracefully instead of crashing on
> invalid addresses? (Modulo the offline and hwpoison cases you mention
> for /proc/kcore.)

I assume the difference is mostly historically, because usually, when 
modifying something (ftrace, live patch, kdb) you better know what you 
want to modify actually exist and can be modified. IOW, you usually 
read-before-weite.

In contrast, things like /proc/kcore, (I think) while limiting it to 
sane addresses, might still read from areas where we remove entries from 
the directmap (e.g., secretmem), I think.

Like, in a compiler, modifying a variable you didn't read before is 
rather rare as well. If you would have tried to read it, the 
copy_from_kernel_nofault() would have failed.

I agree that the difference is weird, and likely really "nobody ran into 
this before in sane use cases".

> 
>> But now I am confused: "if the destination address is in userspace" does not
>> really make sense in the context of KDB, no?
>>
>>    [15]kdb> mm 0 1234
>>    [   94.652476] BUG: kernel NULL pointer dereference, address:
>> 0000000000000000
>>
>> Why is address 0 in "user space"? "Which" user space?
> 
> Sure, it's not really user space, but it's below TASK_SIZE_MAX, so
> things like handle_page_fault() and fault_in_kernel_space() treat it as
> if it were a user address. I could
> s/userspace address/address that is less than TASK_SIZE_MAX or is_vsyscall_vaddr(address)/.

Ah, okay, that's x86 specifics detail in 
copy_from_kernel_nofault_allowed(), thanks.

> 
>> Isn't the problem here that KDB lets you blindly write to any non-existing
>> memory address?
>>
>>
>> Likely it should do some proper filtering like we do in fs/proc/kcore.c:
>>
>> Take a look at the KCORE_RAM case where we make sure the page exists, is
>> online and may be accessed. Only then, we trigger a
>> copy_from_kernel_nofault(). Note that the KCORE_USER is a corner case only
>> for some special thingies on x86 (vsyscall), and can be ignored for our case
>> here.
> 
> Sure, it would be better to harden KDB against all of these special
> cases. But you can break things in all sorts of fun ways with a
> debugger, anyways. The point of this patch is that it's nonsense that a
> function named copy_to_kernel_nofault() does indeed fault in a trivial
> case like address < TASK_SIZE_MAX.

Yes, because the write-without-read to kernel memory "you don't know 
even exists" is rather ... weird :)

Anyhow, no strong opinion here. Patches look simple enough.

-- 
Cheers,

David / dhildenb


