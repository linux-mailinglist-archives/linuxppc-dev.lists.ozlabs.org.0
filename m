Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5B681FF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 00:49:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Pzs1lLWz3cCF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 10:49:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SN109vrW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SN109vrW;
	dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5Pyy323Tz2yNm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 10:48:58 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id o1so1309883ioo.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 15:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sv9LM6FCsX+XLQLlczZJ3ogJ6u9sp27c4JRuQ8D9oio=;
        b=SN109vrWZf9cxs6KFGl4MAL63j0Sl4/U5xFRXrWW8hFN+MDbBNYUHS6JsHQKPh7tMu
         k4uCwm241mGFmPLuj2uZfBQUZBN35tdzdp9nirS8ZOpiGdXpN0PUcm/QOaIqg9oZqeFP
         7EBjChBZzZVqmdRgWmVcyJSdMTCqTqAuz9tbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv9LM6FCsX+XLQLlczZJ3ogJ6u9sp27c4JRuQ8D9oio=;
        b=dFEy/c+3fsSuJP5T7s7LI42F1DcYGxmjZr5/XJMhpJswLfAjvpJiessJqTqCG1wNAB
         Avj37Ay8MC9jmLnVGUq2IBuIDwuChZwJgc9wDGtjiwWwhJb6GL215l/ZQkZv0VTIFDHJ
         tf39I7pL2/3S7ehobRdjUyBuxMCgWPNGlBzm+L+jehIcmGVe4TnpptARG5+AjZk1Fqqu
         KOsgjw/9P669+WIbRbIyXAx9PrLHqoY5lajQ09p0Os+SXyR8/dGMFEcOvvNpGc4NOw1M
         Uoaa3GmyquNPUTo1kUpLYsfGcNaFUAjROR6+fi05Da0dO2auQ3xoCpmoqVo4wxe55ykE
         tZrw==
X-Gm-Message-State: AO0yUKVDJlG7JOELDi3S0I8vQZpsbrS3yUhuCGrLLr17S9aRLzqJdp9C
	kZ6TWjcQuxUJvhmb75dNmFIKOw==
X-Google-Smtp-Source: AK7set/3JVSpyoClMsRL6+JQvwoSOPsVcasMV+N0EMQk0vrkc2ryYm7TK2SH7HJjWKS8ryISa7yKXw==
X-Received: by 2002:a6b:bb05:0:b0:716:8f6a:f480 with SMTP id l5-20020a6bbb05000000b007168f6af480mr1706523iof.0.1675122534791;
        Mon, 30 Jan 2023 15:48:54 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id u23-20020a02aa97000000b0039d71c46577sm5308375jai.21.2023.01.30.15.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 15:48:54 -0800 (PST)
Message-ID: <ae22eee7-eb91-427b-a90a-a5a5e1dc4166@linuxfoundation.org>
Date: Mon, 30 Jan 2023 16:48:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/34] selftests: Fix incorrect kernel headers search path
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
 <560824bd-da2d-044c-4f71-578fc34a47cd@linuxfoundation.org>
 <CAADnVQLV+BERfHNUeii=sZfU+z4WF-jsWUN8aMtzv0tYxh9Rcw@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAADnVQLV+BERfHNUeii=sZfU+z4WF-jsWUN8aMtzv0tYxh9Rcw@mail.gmail.com>
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
Cc: Networking <netdev@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, bpf <bpf@vger.kernel.org>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/30/23 16:45, Alexei Starovoitov wrote:
> On Mon, Jan 30, 2023 at 2:46 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
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
>>> Thanks,
>>>
>>> Mathieu
>>>
>>> Mathieu Desnoyers (34):
>>
>> The below patches are now applied to linux-kselftest next for Linux 6.3-rc1
>>
>>>     selftests: arm64: Fix incorrect kernel headers search path
>>>     selftests: clone3: Fix incorrect kernel headers search path
>>>     selftests: core: Fix incorrect kernel headers search path
>>>     selftests: dma: Fix incorrect kernel headers search path
>>>     selftests: dmabuf-heaps: Fix incorrect kernel headers search path
>>>     selftests: drivers: Fix incorrect kernel headers search path
>>>     selftests: filesystems: Fix incorrect kernel headers search path
>>>     selftests: futex: Fix incorrect kernel headers search path
>>>     selftests: gpio: Fix incorrect kernel headers search path
>>>     selftests: ipc: Fix incorrect kernel headers search path
>>>     selftests: kcmp: Fix incorrect kernel headers search path
>>>     selftests: media_tests: Fix incorrect kernel headers search path
>>>     selftests: membarrier: Fix incorrect kernel headers search path
>>>     selftests: mount_setattr: Fix incorrect kernel headers search path
>>>     selftests: move_mount_set_group: Fix incorrect kernel headers search
>>>       path
>>>     selftests: perf_events: Fix incorrect kernel headers search path
>>>     selftests: pid_namespace: Fix incorrect kernel headers search path
>>>     selftests: pidfd: Fix incorrect kernel headers search path
>>>     selftests: ptp: Fix incorrect kernel headers search path
>>>     selftests: rseq: Fix incorrect kernel headers search path
>>>     selftests: sched: Fix incorrect kernel headers search path
>>>     selftests: seccomp: Fix incorrect kernel headers search path
>>>     selftests: sync: Fix incorrect kernel headers search path
>>>     selftests: user_events: Fix incorrect kernel headers search path
>>>     selftests: vm: Fix incorrect kernel headers search path
>>>     selftests: x86: Fix incorrect kernel headers search path
>>>     selftests: iommu: Use installed kernel headers search path
>>>     selftests: memfd: Use installed kernel headers search path
>>>     selftests: ptrace: Use installed kernel headers search path
>>>     selftests: tdx: Use installed kernel headers search path
>>>
>>
>> These will be applied by maintainers to their trees.
> 
> Not in this form. They break the build.

Mathieu is sending you the patches in the format you requested in
the thread on this patch.

thanks,
-- Shuah
