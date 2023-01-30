Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97D681E16
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 23:30:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5ND82F54z3cLR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 09:30:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eYp1e+Hl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eYp1e+Hl;
	dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5NCD3gH3z309T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 09:29:26 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id e204so5045016iof.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 14:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrkG7DevmIdVc4QArNSZDf3MBemOe3Y2WuDo8bGLhYY=;
        b=eYp1e+HlTRtX/dmDx1X/Nzf4NRNxwLZBD1+YjCo8GWixigQSZfNV0vOpD3Z39FSFXX
         v8f/klrijTAWh0RAdtn0o4kbVmd7JYq4DxFZeVpqGFwFRiQvnGkAcaQ07no/E8wTF4jw
         esuV9HG5GnmnBMJQI99nqNS77Bd+cbKzC/1K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrkG7DevmIdVc4QArNSZDf3MBemOe3Y2WuDo8bGLhYY=;
        b=G/6c30Te0ScBwPirg8oQ/qfaL2MlGH2f9mZH0Pu5rB3Sf1hN0VAR2PE/jcA27bVzCY
         HgNCUR2X/ZgLFupQKjdLYSrquRsKxfS8xYDGypUCuiRWFWDb6ZAPZ+HQz0zvd0VpkP9S
         7fH/dyywQf8lzVrk3fLdnMiheFSUk3FFvn/WoaEYjZqng3wFPdCTFUq8G+5A29ihqNFD
         VY7khYWcO86QgkdT1hZNsFGjSmftXyJxKP5guTgCS0QmguLSZxBRT2Q2l2X0+0/etWkv
         YjPzMrMABTy17V7kiplG0egi5C26PZYT2hl+G0hyYK2K4tOrGCpdGkooPPpnK03C474T
         rRGg==
X-Gm-Message-State: AO0yUKXaRJRprAcSNmqYorCQO9IivPMy+pmjmgLcvmFQoFyDNMz3Dkja
	Lc8m6JlYVqy4eraPmKz9XiYz/A==
X-Google-Smtp-Source: AK7set911zMxEqxO1w9EG1O10Ez3qr3zH2+1KFmESEgMcD4E8s1Ysp+q7URLob2ktg+Dq9IYDPRD9g==
X-Received: by 2002:a5d:9d11:0:b0:718:2fa2:6648 with SMTP id j17-20020a5d9d11000000b007182fa26648mr1441851ioj.2.1675117763133;
        Mon, 30 Jan 2023 14:29:23 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id c4-20020a92cf44000000b00310c6f85ea9sm3699637ilr.82.2023.01.30.14.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 14:29:22 -0800 (PST)
Message-ID: <560824bd-da2d-044c-4f71-578fc34a47cd@linuxfoundation.org>
Date: Mon, 30 Jan 2023 15:29:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/34] selftests: Fix incorrect kernel headers search path
Content-Language: en-US
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>
References: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
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

On 1/27/23 06:57, Mathieu Desnoyers wrote:
> Hi,
> 
> This series fixes incorrect kernel header search path in kernel
> selftests.
> 
> Near the end of the series, a few changes are not tagged as "Fixes"
> because the current behavior is to rely on the kernel sources uapi files
> rather than on the installed kernel header files. Nevertheless, those
> are updated for consistency.
> 
> There are situations where "../../../../include/" was added to -I search
> path, which is bogus for userspace tests and caused issues with types.h.
> Those are removed.
> 
> Thanks,
> 
> Mathieu
> 
> Mathieu Desnoyers (34):

The below patches are now applied to linux-kselftest next for Linux 6.3-rc1

>    selftests: arm64: Fix incorrect kernel headers search path
>    selftests: clone3: Fix incorrect kernel headers search path
>    selftests: core: Fix incorrect kernel headers search path
>    selftests: dma: Fix incorrect kernel headers search path
>    selftests: dmabuf-heaps: Fix incorrect kernel headers search path
>    selftests: drivers: Fix incorrect kernel headers search path
>    selftests: filesystems: Fix incorrect kernel headers search path
>    selftests: futex: Fix incorrect kernel headers search path
>    selftests: gpio: Fix incorrect kernel headers search path
>    selftests: ipc: Fix incorrect kernel headers search path
>    selftests: kcmp: Fix incorrect kernel headers search path
>    selftests: media_tests: Fix incorrect kernel headers search path
>    selftests: membarrier: Fix incorrect kernel headers search path
>    selftests: mount_setattr: Fix incorrect kernel headers search path
>    selftests: move_mount_set_group: Fix incorrect kernel headers search
>      path
>    selftests: perf_events: Fix incorrect kernel headers search path
>    selftests: pid_namespace: Fix incorrect kernel headers search path
>    selftests: pidfd: Fix incorrect kernel headers search path
>    selftests: ptp: Fix incorrect kernel headers search path
>    selftests: rseq: Fix incorrect kernel headers search path
>    selftests: sched: Fix incorrect kernel headers search path
>    selftests: seccomp: Fix incorrect kernel headers search path
>    selftests: sync: Fix incorrect kernel headers search path
>    selftests: user_events: Fix incorrect kernel headers search path
>    selftests: vm: Fix incorrect kernel headers search path
>    selftests: x86: Fix incorrect kernel headers search path
>    selftests: iommu: Use installed kernel headers search path
>    selftests: memfd: Use installed kernel headers search path
>    selftests: ptrace: Use installed kernel headers search path
>    selftests: tdx: Use installed kernel headers search path
> 

These will be applied by maintainers to their trees.

>    selftests: bpf: Fix incorrect kernel headers search path # 02/34
>    selftests: net: Fix incorrect kernel headers search path # 17/34
>    selftests: powerpc: Fix incorrect kernel headers search path # 21/34
>    selftests: bpf docs: Use installed kernel headers search path # 30/34

thanks,
-- Shuah
