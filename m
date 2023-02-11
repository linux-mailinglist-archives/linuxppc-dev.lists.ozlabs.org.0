Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC896692BDD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 01:16:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PDB3q55RQz3f60
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 11:16:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ADJ+NDsg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ADJ+NDsg;
	dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PDB2s6Bypz3bVK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 11:15:47 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id l128so2590895iof.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 16:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbkcBCzqB6Bhnw08ObqB4UKeNk62tom/v69d4G2QaHo=;
        b=ADJ+NDsgKyHyN8uoAdicRC4TZYYcp9IncDhQqJ/pK3xuapGF2kXR16aWyA3vBiCQp0
         /sDAp9j9LtU1F707Vz870jS59vZ+QIvkPxitLoXLcGtzQhM5XeXyQjnpQRM1PF81gN39
         qL/KvKn0G3q6tNs1860AZIEcQM0srawlAwoiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbkcBCzqB6Bhnw08ObqB4UKeNk62tom/v69d4G2QaHo=;
        b=IqKWzFUM/gb9rKyaw1E5TkH1Y/bxLJ4obSNQekzH4zjM1p+yMhXPTEWh1JH3v2KqDt
         B/+Q09ZaeMbWBAWGtp64ryBaMuFf+fUdZ97Eaa2RfJiSrohyCdapRu6ImA2TcYfnF2Jv
         6Hd1l4yC2r+qrnFrZy18Sh6xJg1HNe0Mj1H+9e/+CWBSYQz2cdtBOrw2fHt7mtIovwJs
         4jGXCAqql38DIwl/0yI00VN/VFznOa88xytAK4ZMGRLvPPTAzJ84xL5CkCnhI5pyMI+U
         uFjvqQ/dB4H9/Su6fGLSnfz/IiziGK0BrCnxGvjrUePOvbfCA5pJTNF6qcVGBja+mm8z
         qgUw==
X-Gm-Message-State: AO0yUKWKcAnN0RHhCZWq64mGg8uHympppSUflXpAld5Jc4qpKKuxRXoY
	6aV/MeMTV2RcKinHF1MxfPw/Vw==
X-Google-Smtp-Source: AK7set/LYZ0DlptJM/8MELucz4/oGHkq3EnrHPTYhMfuT7mKai/9dPxEnYLdjBR81HUtP0VXeg3Zow==
X-Received: by 2002:a5d:9046:0:b0:71d:63e5:7b5f with SMTP id v6-20020a5d9046000000b0071d63e57b5fmr11461339ioq.2.1676074543415;
        Fri, 10 Feb 2023 16:15:43 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id n10-20020a5ed90a000000b0073a312aaae5sm1725931iop.36.2023.02.10.16.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 16:15:42 -0800 (PST)
Message-ID: <dae27584-faf7-f132-1272-cb21248e5fa9@linuxfoundation.org>
Date: Fri, 10 Feb 2023 17:15:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/34] selftests: Fix incorrect kernel headers search path
Content-Language: en-US
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Christoph Hellwig <hch@lst.de>
References: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
 <560824bd-da2d-044c-4f71-578fc34a47cd@linuxfoundation.org>
 <799b87d9-af19-0e6a-01b7-419b4893a0df@linuxfoundation.org>
 <975995d6-366a-88e3-2321-f0728f7e22a7@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <975995d6-366a-88e3-2321-f0728f7e22a7@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/3/23 18:06, Shuah Khan wrote:
> On 2/1/23 19:07, Shuah Khan wrote:
>> Hi Mathieu,
>>
>> On 1/30/23 15:29, Shuah Khan wrote:
>>> On 1/27/23 06:57, Mathieu Desnoyers wrote:
>>>> Hi,
>>>>
>>>> This series fixes incorrect kernel header search path in kernel
>>>> selftests.
>>>>
>>>> Near the end of the series, a few changes are not tagged as "Fixes"
>>>> because the current behavior is to rely on the kernel sources uapi files
>>>> rather than on the installed kernel header files. Nevertheless, those
>>>> are updated for consistency.
>>>>
>>>> There are situations where "../../../../include/" was added to -I search
>>>> path, which is bogus for userspace tests and caused issues with types.h.
>>>> Those are removed.
>>>>
>>
>> Thanks again for taking care of this. I did out of tree build testing on
>> x86 on linux-kselftest next with these patches below. I haven't seen
>> any problems introduced by the patch set.
>>
>>>>    selftests: dma: Fix incorrect kernel headers search path
>> This one needs a change and I will send a patch on top of yours.
>> Even with that this test depends on unexported header from the
>> repo and won't build out of tree. This is not related to your
>> change.
>>
>>>>    selftests: mount_setattr: Fix incorrect kernel headers search path
>> This one fails to build with our without patch - an existing error.
>>
>> I have to do cross-build tests on arm64 and other arch patches still.
>> This will happen later this week.
> 
> arm64, s390 patches look good.
> 

I am seeing problem with selftests/dma and selfttests/user_events.

1. selftests: dma: Fix incorrect kernel headers search path

dma test no longer builds. This test depends on linux/map_benchmark.h
which is not included in uapi

The order of include directorries -isystem followed by installed kernel
headers, breaks the test build with the change to use KHDR_INCLUDES


I am going to revert this patch for now and figure a longer term fix.
The problem is the dependency on a non-uapi file: linux/map_benchmark.h

Fixes: 8ddde07a3d28 ("dma-mapping: benchmark: extract a common
header file for map_benchmark definition") change added this
dependency on including linux/map_benchmark.h

Christoph, Do you see this map_benchmark.h as part of uapi?


2. selftests: user_events: Fix incorrect kernel headers search path
This one depends on linux/user_events.h which has bee removed from
uapi in this commit:

commit 5cfff569cab8bf544bab62c911c5d6efd5af5e05
Author: Steven Rostedt (Google) <rostedt@goodmis.org>
Date:   Fri Apr 1 14:39:03 2022 -0400

     tracing: Move user_events.h temporarily out of include/uapi

This isn't a regression from 6.2 - this test stopped building once
user_events.h has been removed from uapi. I will add a note that
this test depends on a non-uapi header and can't be built at the
moment.

thanks,
-- Shuah





