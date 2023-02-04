Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2649A68A770
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 02:07:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7vWN57cWz3f8s
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 12:07:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cOFCW2eK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cOFCW2eK;
	dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7vVQ0lRKz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 12:06:20 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id q6so2608435ior.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 17:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJJNrsJn7yzBqph2acvSr4Hti6BrkgyiwRkgePteRzI=;
        b=cOFCW2eKrPz/F7vUGV3S812saggF5YeG/hVM7hcFN7yyU4S9pS1nxzMNle0FhONcm0
         QinIgL9G1RKgP/tdAGV0W7F1TlYTQQnn5j6CVZ8G16iJYwrrpp8MBWSstnhHVVbP9jaa
         +1GfdV7ZDn1qFvbfmQwolq9ris01IwB9DRXK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJJNrsJn7yzBqph2acvSr4Hti6BrkgyiwRkgePteRzI=;
        b=03mGedNkvXmsri+YjveftBtSvyOfLKk4oG1tTDqS4yvb8j4sVC+97j8Suw8mqZ0oVw
         tEagzNR6Pbg5t6CdJA3NPuC0XnBIJwIsBwrbmv5Iqi7+jIpVlPyzAKfV+qRBmuNRVcIt
         0pOIlS33NCSF+Rq55v3OTG3NySzfiEEUfgTgBVEHyWR9bnGc/LSbHFCS7P3d5j5z2/8R
         blSkKlXGW9mkep/V4PvwWeq+MfGaA23ZGW6pt9SN46EjBZvUzcK+j5YnekIIyULET9JP
         X3lANf/ZWu3/1/WZr/oO9Hl3RTsQDx8kxnmQpTB12A6rg6GYKmXTSdsyoLs8HmrBCG4M
         4zJA==
X-Gm-Message-State: AO0yUKWcQmmaLLTZ8fknio+zlBDqA5vGPGkMI2BmMp2w2viiNe1a7OaJ
	NszB62fchLZJNxPlDRlWubOSOg==
X-Google-Smtp-Source: AK7set9499rugZh/K8yzehbsATZ6fL7OrnwVY1iWmkEuyNyOtCYXT0lcwjPiJcBHW95uVphhlXqPsA==
X-Received: by 2002:a6b:3b14:0:b0:715:f031:a7f5 with SMTP id i20-20020a6b3b14000000b00715f031a7f5mr6443794ioa.1.1675472776701;
        Fri, 03 Feb 2023 17:06:16 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id h16-20020a022b10000000b003a970f21f9asm1294500jaa.78.2023.02.03.17.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 17:06:15 -0800 (PST)
Message-ID: <975995d6-366a-88e3-2321-f0728f7e22a7@linuxfoundation.org>
Date: Fri, 3 Feb 2023 18:06:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/34] selftests: Fix incorrect kernel headers search path
Content-Language: en-US
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>
References: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
 <560824bd-da2d-044c-4f71-578fc34a47cd@linuxfoundation.org>
 <799b87d9-af19-0e6a-01b7-419b4893a0df@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <799b87d9-af19-0e6a-01b7-419b4893a0df@linuxfoundation.org>
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
Cc: Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/1/23 19:07, Shuah Khan wrote:
> Hi Mathieu,
> 
> On 1/30/23 15:29, Shuah Khan wrote:
>> On 1/27/23 06:57, Mathieu Desnoyers wrote:
>>> Hi,
>>>
>>> This series fixes incorrect kernel header search path in kernel
>>> selftests.
>>>
>>> Near the end of the series, a few changes are not tagged as "Fixes"
>>> because the current behavior is to rely on the kernel sources uapi files
>>> rather than on the installed kernel header files. Nevertheless, those
>>> are updated for consistency.
>>>
>>> There are situations where "../../../../include/" was added to -I search
>>> path, which is bogus for userspace tests and caused issues with types.h.
>>> Those are removed.
>>>
> 
> Thanks again for taking care of this. I did out of tree build testing on
> x86 on linux-kselftest next with these patches below. I haven't seen
> any problems introduced by the patch set.
> 
>>>    selftests: dma: Fix incorrect kernel headers search path
> This one needs a change and I will send a patch on top of yours.
> Even with that this test depends on unexported header from the
> repo and won't build out of tree. This is not related to your
> change.
> 
>>>    selftests: mount_setattr: Fix incorrect kernel headers search path
> This one fails to build with our without patch - an existing error.
> 
> I have to do cross-build tests on arm64 and other arch patches still.
> This will happen later this week.

arm64, s390 patches look good.

thanks,
-- Shuah
