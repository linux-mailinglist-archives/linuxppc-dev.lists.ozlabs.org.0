Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1593D011
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 11:06:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TM1tYn5J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UDaezEY1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVhgY6pq1z3dDj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 19:06:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TM1tYn5J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UDaezEY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVhfs1dHWz3cyc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 19:05:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721984719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HRGCaxSvc666yYmWNbyZKl/wJUaVbOHVwo8Yj4hCL/0=;
	b=TM1tYn5J5riqUsN9Tzkjp03Zn24jILzicoZzLrdBxACAtXwoqluAYjqq2WM5nJzi1f5Hla
	Gm8DOJsvqLfVGH433oiOsOvhNBOJPsGy5MwoNwg3suUH+l19eToRZUAYavwiXHstpFDwWt
	jPvLJwrNRVufTOTBgoLCmCGH2GSSSPw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721984720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HRGCaxSvc666yYmWNbyZKl/wJUaVbOHVwo8Yj4hCL/0=;
	b=UDaezEY1SqyygN1q1hhPmGm8AEv2j1K822fCQjAqfYnTz+MDbLKLVRmQyHpofKDz2vPv6j
	gMZ92mzHCHbYT4U7bsvKuYwTUIBMtCb8IZJxoMul/XLoNTJQQAsXVint+nOo0EESUjj/wI
	1I30ffKzXZxhB7syI4/JJGhdvXZP+Os=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-cC4UwhQqOeCHJtBQ3eUptA-1; Fri, 26 Jul 2024 05:05:17 -0400
X-MC-Unique: cC4UwhQqOeCHJtBQ3eUptA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42668796626so14185405e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 02:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721984716; x=1722589516;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRGCaxSvc666yYmWNbyZKl/wJUaVbOHVwo8Yj4hCL/0=;
        b=JqUpXGRRpAnAiJ1uAQWQFthKGxjIEId/f4ZoEYTF7cMfL6x4pR+/5p31VtkmbE+o/0
         IHx/pfMyjm2IEAp5yOcBm/NIiHtkt4BD0yVmKVYVSLlXPFt3ZR4hmjBSMwpURKG+3Xnj
         sIVwhSG9G3sBKZcNU63mJ01V6G29AxA4WkHWUyKNVOaYTCGBSqpmJIkm5HPglpEF5Vii
         XNMvSCagkEuHq7HweFyWtg6w/B0rShaUifUBxH3YDOh5luRvKAgPRQ0jYsdPQVi0XpIh
         jbzWiff9G4llckGacTgRBsGE4WjcDOHmOsNKi2iMtRWYzcobNWhS5Dt2pwWMZWnYkr/d
         /4JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF4J7yie6/NFLWnbLFnjJIFJMKnXma4xNhQRZSjscBqX8oOfhUyg8GA/qxQWsGUt5G2Yxb9Jbalgjh935RaIDA347CXrpUI16zmP/IVw==
X-Gm-Message-State: AOJu0YwU2j/NFh1qnHB/qd3o4NWAUd2xniKKewoAwAMiImZMmoY4Ybz/
	gpYgRLE8ckDKuk35QcwEyvwkY+mVdXw1hVDdWscT9wlZR5omfqp1Zkaw6aqJhBj3DLKBpncpo36
	xDPC5BBNbg2kA8VKsCG1OBtPoOTFWFE5JJEmRoivyvADO0XG1kVXIgkLIBxMTUig=
X-Received: by 2002:a05:600c:19d2:b0:426:6f5f:9da6 with SMTP id 5b1f17b1804b1-4280578b9b6mr35448255e9.27.1721984716015;
        Fri, 26 Jul 2024 02:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwk07jUaAT8ojnh2s98h6UPE6SOVmQ7wq5CBJHKGpwRHZk1gVq/4L8tg0+qalxenlpWVy2Gg==
X-Received: by 2002:a05:600c:19d2:b0:426:6f5f:9da6 with SMTP id 5b1f17b1804b1-4280578b9b6mr35447975e9.27.1721984715417;
        Fri, 26 Jul 2024 02:05:15 -0700 (PDT)
Received: from [10.33.192.191] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42805730e47sm69535525e9.1.2024.07.26.02.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 02:05:15 -0700 (PDT)
Message-ID: <8c9ca85f-0995-4c34-bb57-5a8490f74b50@redhat.com>
Date: Fri, 26 Jul 2024 11:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH] build: retain intermediate .aux.o targets
To: Nicholas Piggin <npiggin@gmail.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <20240612044234.212156-1-npiggin@gmail.com>
 <20240612082847.GG19790@gate.crashing.org>
 <D1ZBO021MLHV.3C7E4V3WOHO8V@gmail.com>
 <20240614010856.GK19790@gate.crashing.org>
 <D1ZLRVNGPWTV.5H76A3E8DJCV@gmail.com> <D2Z6GP2VFOJ8.2KU7OB25CUXTC@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <D2Z6GP2VFOJ8.2KU7OB25CUXTC@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/07/2024 06.15, Nicholas Piggin wrote:
> On Fri Jun 14, 2024 at 6:38 PM AEST, Nicholas Piggin wrote:
>> On Fri Jun 14, 2024 at 11:08 AM AEST, Segher Boessenkool wrote:
>>> On Fri, Jun 14, 2024 at 10:43:39AM +1000, Nicholas Piggin wrote:
>>>> On Wed Jun 12, 2024 at 6:28 PM AEST, Segher Boessenkool wrote:
>>>>> On Wed, Jun 12, 2024 at 02:42:32PM +1000, Nicholas Piggin wrote:
>>>>>> arm, powerpc, riscv, build .aux.o targets with implicit pattern rules
>>>>>> in dependency chains that cause them to be made as intermediate files,
>>>>>> which get removed when make finishes. This results in unnecessary
>>>>>> partial rebuilds. If make is run again, this time the .aux.o targets
>>>>>> are not intermediate, possibly due to being made via different
>>>>>> dependencies.
>>>>>>
>>>>>> Adding .aux.o files to .PRECIOUS prevents them being removed and solves
>>>>>> the rebuild problem.
>>>>>>
>>>>>> s390x does not have the problem because .SECONDARY prevents dependancies
>>>>>> from being built as intermediate. However the same change is made for
>>>>>> s390x, for consistency.
>>>>>
>>>>> This is exactly what .SECONDARY is for, as its documentation says,
>>>>> even.  Wouldn't it be better to just add a .SECONDARY to the other
>>>>> targets as well?
>>>>
>>>> Yeah we were debating that and agreed .PRECIOUS may not be the
>>>> cleanest fix but since we already use that it's okay for a
>>>> minimal fix.
>>>
>>> But why add it to s390x then?  It is not a fix there at all!
>>
>> Eh, not a big deal. I mentioned that in the changelog it doesn't seem to
>> pracicaly fix something. And I rather the makefiles converge as much as
>> possible rather than diverge more.
>>
>> .SECONDARY was added independently and not to fix this problem in
>> s390x. And s390x has .SECONDARY slightly wrong AFAIKS. It mentions
>> .SECONDARY: twice in a way that looks like it was meant to depend on
>> specific targets, it actually gives it no dependencies and the
>> resulting semantics are that all intermediate files in the build are
>> treated as secondary. So somethig there should be cleaned up. If the
>> .SECONDARY was changed to only depend on the .gobj and .hdr.obj then
>> suddenly that would break .aux.o if I don't make the change.
>>
>> So I'm meaning to work out what to do with all that, i.e., whether to
>> add blanket .SECONDARY for all and trim or remove the .PRECIOUS files,
>> or remove s390x's secondary, or make it more specific, or something
>> else. But it takes a while for me to do makefile work.
> 
> Hi Thomas,
> 
> Ping on this patch?

I assumed that Marc would chime in on the s390x part here?

  Thomas


