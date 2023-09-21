Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 912077A94AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 15:23:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOIWEpmZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOIWEpmZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrx1Y2m1Lz3cD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 23:23:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOIWEpmZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOIWEpmZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrx0b3wjhz3cc7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 23:22:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695302571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64XIT8H+cirzJrInDt0c0EtJPFaDtKDsNwOF41i1jT8=;
	b=DOIWEpmZG8SDTXPZ4ThyRde63l5YnVMIcFBolizoBtiovMv3xMFpTbhaTPhrrN5b0I+sDf
	vXj6gDfiDlCTPS2b05+qNnQn5aZZ4pw/vi2qz3NgeREStk0lmTlBAg5BgGlZSF9mu0o4bo
	u8vVdYBkF+zrQ8jtxfCha0l29Jf4oD4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695302571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64XIT8H+cirzJrInDt0c0EtJPFaDtKDsNwOF41i1jT8=;
	b=DOIWEpmZG8SDTXPZ4ThyRde63l5YnVMIcFBolizoBtiovMv3xMFpTbhaTPhrrN5b0I+sDf
	vXj6gDfiDlCTPS2b05+qNnQn5aZZ4pw/vi2qz3NgeREStk0lmTlBAg5BgGlZSF9mu0o4bo
	u8vVdYBkF+zrQ8jtxfCha0l29Jf4oD4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-sV5TDaNyOPWm9zV_5p6jOQ-1; Thu, 21 Sep 2023 09:22:50 -0400
X-MC-Unique: sV5TDaNyOPWm9zV_5p6jOQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-770ef0d510fso61524585a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 06:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695302569; x=1695907369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64XIT8H+cirzJrInDt0c0EtJPFaDtKDsNwOF41i1jT8=;
        b=XfwQLHJz4YfYaQ4kSNv/nYs0x9MvrDRSfiGrYOQ/50Jd+uCbh52Un7xjSl7jApOsCW
         UGiEA0wJo679iBoCTDDVcuXAAStNpuC50jcdbZtOw+2uODGe4Dlj8XYT1f3Y2+0x3gWc
         heM8xDQ51s9c5qFcf/br2kgrD0TOYplr5IyQ9CTxNpncGWdVJlGoYQj5qU3iJXn/EJ+f
         Guu9zs0JZOLlfBG5gXJ2m7vn1/dBfh6JdlVAnbHEdkIgDnmkH2HY91EKJFftQLZWnPPM
         FjivFkBChR0Ohc1LEbsBR38ZRviZZFVK25A6X1D5SoV0DLwAn1M9+qE6VFPNlkv3JaHu
         ADLQ==
X-Gm-Message-State: AOJu0YwD+Hhkb8ksKzIkVcSOxF7+CfzXS/SOmJFdmKnFbs3RCa/G2CzH
	6a6T5atpzUAzoaz2leSuxs4/TKjevuc4FEENXKCdJfBfxPb942WSjDJsDXCclKnOjNXSq4ouhYR
	9s1/+qG4MrrIKc0To5UWnxaHb/A==
X-Received: by 2002:a05:620a:bd6:b0:773:a91c:6164 with SMTP id s22-20020a05620a0bd600b00773a91c6164mr10167269qki.19.1695302569772;
        Thu, 21 Sep 2023 06:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOAVkieqa7avECMyCd3R5BOjdreLXm1gXdIE81QoNHp+hCn2/S9LgxfK3ML1R3gd61F/wEbA==
X-Received: by 2002:a05:620a:bd6:b0:773:a91c:6164 with SMTP id s22-20020a05620a0bd600b00773a91c6164mr10167245qki.19.1695302569471;
        Thu, 21 Sep 2023 06:22:49 -0700 (PDT)
Received: from [192.168.1.12] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id 11-20020ac8564b000000b003f6ac526568sm607991qtt.39.2023.09.21.06.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 06:22:48 -0700 (PDT)
Message-ID: <77033ba0-9786-62c6-d3fd-ad1226017c09@redhat.com>
Date: Thu, 21 Sep 2023 09:22:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Recent Power changes and stack_trace_save_tsk_reliable?
To: Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>
References: <ZO4K6hflM/arMjse@redhat.com> <87o7ipxtdc.fsf@mail.lhotse>
 <87il8xxcg7.fsf@mail.lhotse>
 <cca0770c-1510-3a02-d0ba-82ee5a0ae4f2@redhat.com> <ZQr-vmBBQ66TRobQ@alley>
 <8734z7ogpd.fsf@mail.lhotse>
From: Joe Lawrence <joe.lawrence@redhat.com>
In-Reply-To: <8734z7ogpd.fsf@mail.lhotse>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Ryan Sullivan <rysulliv@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/21/23 08:26, Michael Ellerman wrote:
> Petr Mladek <pmladek@suse.com> writes:
>> On Wed 2023-08-30 17:47:35, Joe Lawrence wrote:
>>> On 8/30/23 02:37, Michael Ellerman wrote:
>>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>>>> Joe Lawrence <joe.lawrence@redhat.com> writes:
>>>>>> We noticed that our kpatch integration tests started failing on ppc64le
>>>>>> when targeting the upstream v6.4 kernel, and then confirmed that the
>>>>>> in-tree livepatching kselftests similarly fail, too.  From the kselftest
>>>>>> results, it appears that livepatch transitions are no longer completing.
> ...
>>>>
>>>> The diff below fixes it for me, can you test that on your setup?
>>>>
>>>
>>> Thanks for the fast triage of this one.  The proposed fix works well on
>>> our setup.  I have yet to try the kpatch integration tests with this,
>>> but I can verify that all of the kernel livepatching kselftests now
>>> happily run.
>>
>> Have this been somehow handled, please? I do not see the proposed
>> change in linux-next as of now.
> 
> I thought I was waiting for Joe to run the kpatch integration tests, but
> in hindsight maybe he was hinting that someone else should run them (ie. me) ;)
> 
> Patch incoming.

Ah sorry for the confusion.  kpatch integration tests - that's on me.
If kernel stack unwinding is fixed, I'm pretty confident they will
execute.  I will kick them off today, but don't let that hold up the
kernel patches.

Thanks,
-- 
Joe

