Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CF345305
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 00:31:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F49jm4mPKz30CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 10:31:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qsOszmmo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qsOszmmo; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F49jL4NkKz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 10:30:44 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id h3so9581247qvh.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 16:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Flv7N9YKZgQ+axjMlJ48Sk/1ZxaJPhQd7ShqxyoaEUs=;
 b=qsOszmmoXSKrSKWadgyyH0NB0zZYX9ALRSf8uY5PMqXJsrzXPqOBJYFUD/kLsCAoRh
 i+6BsVJdFMIBdCe6xe+Rm4PVD3cRj909pDBHPRqAeC2Aiq+ceGBpWXiIHvWRx/70qfI0
 45P52wIF5hRKwyFhxgfD4vGYE+F09ci2AcCTa8RqUm4ImwzNVAlkpUHjjIC1QcGnM4eF
 +VftBXI3UiPh2ehv3oxMjRBqxZwdkn9erHLaheRRfONrOzcfFc2YQF2wsQ0XiowdHZxc
 5jOGUPrY8JEOZBiaGP32Bc0AFiz0tnxCEFofyFSb9R7QeBxNHRdNaMx4pqQJZAJX+BAN
 3ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Flv7N9YKZgQ+axjMlJ48Sk/1ZxaJPhQd7ShqxyoaEUs=;
 b=lZZ7zncnSfctALjuHjrSHbjXDwdU3f1QocomzwP8JwoRCETDGOjksnDrGN9e0pU5l2
 VqUuGyHunSAw+mf8qTcQ/S9rE9m2VZ5y7HgvdB61joeel0rJyPCW73QkAKlgS8T1GX0T
 WSuwXCFpLGFYfAzkM7qgHMc3EVEk7xpFnqCDDXGQPmxRRQTK/LsSwuwUsuHaWWb43W8B
 VNDFi9Pjlq/DQ+AfviN3iSwc7Y4pf0FpMZVt7mmMHGoiQdTkyhgNNqJD96dJdZJsW4PT
 FwAjUbGHgk1OmpZZYaNSLMeJbPHQQGuj0Y39LHxFbu06fypJa1zXd6/9W2Vje+WzAZW7
 xUmw==
X-Gm-Message-State: AOAM5328UZrtjoL56W+gl8P0hPpZU+T3vBhfGxlaaN0rjEZxXSHRpHbo
 Z9ECGg1Dh1LDG6i8M2ouVvFmUcxjd6M=
X-Google-Smtp-Source: ABdhPJz1I1/wpbkasrhHG/j1zJpNK1ISnd+MGBpXAoP1pUOH3UlSTF2SpyejU/ozbH8x74Sd7Zu7sw==
X-Received: by 2002:ad4:4ae9:: with SMTP id cp9mr2134690qvb.20.1616455839255; 
 Mon, 22 Mar 2021 16:30:39 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c?
 ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id i14sm3664989qtq.81.2021.03.22.16.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 16:30:38 -0700 (PDT)
Subject: Re: [PATCH 1/1] hotplug-cpu.c: show 'last online CPU' error in
 dlpar_cpu_remove()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210305173845.451158-1-danielhb413@gmail.com>
 <c2fdbf4e-995b-fec8-7dc3-41beb7d66daa@gmail.com>
 <87a6qz8juk.fsf@mpe.ellerman.id.au>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <2642d868-1c08-a8f3-042f-f43720d46250@gmail.com>
Date: Mon, 22 Mar 2021 20:30:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87a6qz8juk.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/19/21 8:26 AM, Michael Ellerman wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> Ping
>>
>> On 3/5/21 2:38 PM, Daniel Henrique Barboza wrote:
>>> Of all the reasons that dlpar_cpu_remove() can fail, the 'last online
>>> CPU' is one that can be caused directly by the user offlining CPUs
>>> in a partition/virtual machine that has hotplugged CPUs. Trying to
>>> reclaim a hotplugged CPU can fail if the CPU is now the last online in
>>> the system. This is easily reproduced using QEMU [1].
> 
> Sorry, I saw this earlier and never got around to replying.

No problem. Thanks for the review!

> 
> I'm wondering if we neet to catch it earlier, ie. in
> dlpar_offline_cpu().
> 
> By the time we return to dlpar_cpu_remove() we've dropped the
> cpu_add_remove_lock (cpu_maps_update_done), so num_online_cpus() could
> change out from under us, meaning the num_online_cpus() == 1 check might
> trigger incorrectly (or vice versa).
> 
> Something like the patch below (completely untested :D)

Makes sense. I'll try it out to see if it works.

> 
> And writing that patch makes me wonder, is == 1 the right check?
> 
> In most cases we'll remove all but one thread of the core, but we'll
> fail on the last thread. Leaving that core effectively stuck in SMT1. Is
> that useful behaviour? Should we instead check at the start that we can
> remove all threads of the core without going to zero online CPUs?

I think it's ok to allow SMT1 cores, speaking from QEMU perspective.
QEMU does not have a "core hotunplug" operation where the whole core is
hotunplugged at once. The CPU hotplug/unplug operations are done as single
CPU thread add/removal. If the user wants to run 4 cores, all of them with
SMT1, QEMU will allow it.

Libvirt does not operate with the core granularity either - you can specify
the amount of vcpus the guest should run with, and Libvirt will send
hotplug/unplug requests to QEMU to match the desired value. It doesn't
bother with how many threads of a core were offlined or not.


Thanks,


DHB



> 
> cheers
> 
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index 12cbffd3c2e3..498c22331ac8 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -271,6 +271,12 @@ static int dlpar_offline_cpu(struct device_node *dn)
>   			if (!cpu_online(cpu))
>   				break;
>   
> +			if (num_online_cpus() == 1) {
> +				pr_warn("Unable to remove last online CPU %pOFn\n", dn);
> +				rc = EBUSY;
> +				goto out_unlock;
> +			}
> +
>   			cpu_maps_update_done();
>   			rc = device_offline(get_cpu_device(cpu));
>   			if (rc)
> @@ -283,6 +289,7 @@ static int dlpar_offline_cpu(struct device_node *dn)
>   				thread);
>   		}
>   	}
> +out_unlock:
>   	cpu_maps_update_done();
>   
>   out:
> 
