Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7617687342
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 03:08:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6hzV6CGtz3f4q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 13:08:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=LzWodT1e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=LzWodT1e;
	dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6hyX0ggmz3cFH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 13:08:01 +1100 (AEDT)
Received: by mail-il1-x133.google.com with SMTP id w13so260894ilv.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Feb 2023 18:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+BzeSJVfgrSPd0MbuqsjRM9bEzGlx7ixViHWjjvE7s=;
        b=LzWodT1eb5DCcVhR8b+EzMloXXDPgbgfg5yAdRijbYs5VrwQKJ5b4Xn3BrOcQv6ZHm
         j/bfvWWLI1MwoyyRBH16YFEsS/RLHZmYDtrOK68OuhisrVKoWYrz8AY7DIZEDOe1gDZx
         4OF2YnlUs2qkyWJbriJ9+QAh5N1DZRxJo+pdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+BzeSJVfgrSPd0MbuqsjRM9bEzGlx7ixViHWjjvE7s=;
        b=eHSJ3JWceXCoo+bfdbcj0u02m609JbvSjw+i54VNEQkI9Ol3DiojZf5dpD+KZD+FMy
         Dby19nPv0CC6FQ95jKgJ6lMkbo3H2xXKsy0VRBm1ioaUFa1YHhqy8xI3VGT74lJZfkTo
         qSG7q80vCZRzkW8lNFdQMoPIABnTY49BDWsehmY3HMnxWkrMxBjzR/6Du4YPgOcHw2mO
         HnXDuA1DcPrqEIjV7lB8hkELVDCClVEdAPZ3KNG1X3izpvlAq/Cnr2Bw7mkfJ7HpWcNd
         I3cOsZbnO5Ku/qmbtJnx6KgYXgik5WPPlE2vfeHjtxTvkc8+mauE+Z+VVBof7c68JUg/
         GriQ==
X-Gm-Message-State: AO0yUKUQPv7VCVRr3odEJLpUshoyJOincaoOu1NBc2ZdE/I0wYwVoUJ5
	sGNNgKdWyjRR3rKQ0ABw3JZc9g==
X-Google-Smtp-Source: AK7set885G9fsVi6nyk8fZGA4Ca40+OFghSuF3kmr1dqRUTOmqFNraoAAvKt0LfXBjQfFbwgGTGQkA==
X-Received: by 2002:a92:d341:0:b0:310:a904:33ed with SMTP id a1-20020a92d341000000b00310a90433edmr2899734ilh.0.1675303677369;
        Wed, 01 Feb 2023 18:07:57 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id d26-20020a05663802ba00b0039ea2dfebb3sm7259077jaq.24.2023.02.01.18.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 18:07:56 -0800 (PST)
Message-ID: <799b87d9-af19-0e6a-01b7-419b4893a0df@linuxfoundation.org>
Date: Wed, 1 Feb 2023 19:07:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/34] selftests: Fix incorrect kernel headers search path
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>
References: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
 <560824bd-da2d-044c-4f71-578fc34a47cd@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <560824bd-da2d-044c-4f71-578fc34a47cd@linuxfoundation.org>
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
Cc: Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mathieu,

On 1/30/23 15:29, Shuah Khan wrote:
> On 1/27/23 06:57, Mathieu Desnoyers wrote:
>> Hi,
>>
>> This series fixes incorrect kernel header search path in kernel
>> selftests.
>>
>> Near the end of the series, a few changes are not tagged as "Fixes"
>> because the current behavior is to rely on the kernel sources uapi files
>> rather than on the installed kernel header files. Nevertheless, those
>> are updated for consistency.
>>
>> There are situations where "../../../../include/" was added to -I search
>> path, which is bogus for userspace tests and caused issues with types.h.
>> Those are removed.
>>

Thanks again for taking care of this. I did out of tree build testing on
x86 on linux-kselftest next with these patches below. I haven't seen
any problems introduced by the patch set.

>>    selftests: dma: Fix incorrect kernel headers search path
This one needs a change and I will send a patch on top of yours.
Even with that this test depends on unexported header from the
repo and won't build out of tree. This is not related to your
change.

>>    selftests: mount_setattr: Fix incorrect kernel headers search path
This one fails to build with our without patch - an existing error.

I have to do cross-build tests on arm64 and other arch patches still.
This will happen later this week.

>>    selftests: arm64: Fix incorrect kernel headers search path

drivers patch below had arch specific tests - testing todo

The rest looks good. I will try to run bpf patches on my system.
I do have clang, llvm installed on mine. TODO

thanks,
-- Shuah
