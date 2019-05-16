Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 773151FEA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 06:57:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454K0P47wczDqbm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 14:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="se5MD3uH"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Jyx0ssPzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 14:55:52 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g9so967554plm.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 21:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=uktd7XQDdDULr5leGV0KZGf/+ljezZrUJm/HKaIvbqI=;
 b=se5MD3uHJ8+Gc+mS+YyGaKQje/uCx4huJ/XEqaT8Gu2hiLrurV+fPQyFCO1nUH/23q
 RCdc5JAP+VK4Tfjm/Dz8lEgxVNlph+UTmwrbQ7JG5MUERKeHFOXfLvQs8AXixpCJV1ZG
 Q6ObBUrGP4T6siRpTWSVXRVxV7IlcdRe+4TnCEwKJ+T7pNGEvQRlkv7cimO14KMvOZ4G
 KAX8y95S2A6Ux3w9qGKFoaRGgMgeZ751n11ELw1JYFfRf1KWhp7aHoZB25XOyB6TDifd
 bf2CtMFSJiZOQRNOQv/i29Fxe2wyW0XLEo6Z7KG6N3d19/4mSYGq2tcWdr0mwWefoPlJ
 it+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=uktd7XQDdDULr5leGV0KZGf/+ljezZrUJm/HKaIvbqI=;
 b=KHaIck6N/Bj16st48UB+L/x1iyizFj2s2GYtoJxz1ho2fd6uQuBfnYH3hAtX/BTciE
 kRr4fTHv+1DWZyc+wgvZFI5aZetLsUZ1WWehMm7naZC1ulBolVX4UgF7GXI6XdDeU+mN
 Ar9xB25+3Q98axZjYdNtYo9h7pedNflwUB4LlNFws/qPJhvV2Ri6GB4aqDfqkG3BjmWx
 sHjPp/Cj+5As9wF458Sui24dthfLx4w0tX+fLgK7a3AElrVdydpXJLe15UJAUqvOX0k2
 dZxLhvz3B71468fMTUxYd0EeVmbPCZZ5BTWmQDjEp4qdaNvg03Q09m7thKb7/gOST+y1
 +CJQ==
X-Gm-Message-State: APjAAAUF57tGJNETgAU3BzlWffZuBRcAdWr41yMPNbNyxpDyKO1c7BuP
 SuVVQR+nC+aNu8HZBz+JSVb+0IVz
X-Google-Smtp-Source: APXvYqxs2u00xmIx5LZqdbBUaIgVWgi+vCIJVeS76fvd2w+hJ7Bl3CiP21KCsUVxuNiEMxNCEfFsGQ==
X-Received: by 2002:a17:902:f081:: with SMTP id
 go1mr546461plb.211.1557982549783; 
 Wed, 15 May 2019 21:55:49 -0700 (PDT)
Received: from localhost (193-116-124-212.tpgi.com.au. [193.116.124.212])
 by smtp.gmail.com with ESMTPSA id v4sm9053844pff.45.2019.05.15.21.55.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 21:55:48 -0700 (PDT)
Date: Thu, 16 May 2019 14:55:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/1] Forced-wakeup for stop lite states on Powernv
To: Abhishek <huntbag@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20190422063231.51043-1-huntbag@linux.vnet.ibm.com>
 <1557291178.ow4spjzq5t.astroid@bobo.none>
 <b2fcf69a-aecd-ea81-b497-737642354736@linux.vnet.ibm.com>
In-Reply-To: <b2fcf69a-aecd-ea81-b497-737642354736@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1557981860.eltms77ctp.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: ego@linux.vnet.ibm.com, daniel.lezcano@linaro.org, rjw@rjwysocki.net,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Abhishek's on May 13, 2019 7:49 pm:
> On 05/08/2019 10:29 AM, Nicholas Piggin wrote:
>> Abhishek Goel's on April 22, 2019 4:32 pm:
>>> Currently, the cpuidle governors determine what idle state a idling CPU
>>> should enter into based on heuristics that depend on the idle history o=
n
>>> that CPU. Given that no predictive heuristic is perfect, there are case=
s
>>> where the governor predicts a shallow idle state, hoping that the CPU w=
ill
>>> be busy soon. However, if no new workload is scheduled on that CPU in t=
he
>>> near future, the CPU will end up in the shallow state.
>>>
>>> Motivation
>>> ----------
>>> In case of POWER, this is problematic, when the predicted state in the
>>> aforementioned scenario is a lite stop state, as such lite states will
>>> inhibit SMT folding, thereby depriving the other threads in the core fr=
om
>>> using the core resources.
>>>
>>> So we do not want to get stucked in such states for longer duration. To
>>> address this, the cpuidle-core can queue timer to correspond with the
>>> residency value of the next available state. This timer will forcefully
>>> wakeup the cpu. Few such iterations will essentially train the governor=
 to
>>> select a deeper state for that cpu, as the timer here corresponds to th=
e
>>> next available cpuidle state residency. Cpu will be kicked out of the l=
ite
>>> state and end up in a non-lite state.
>>>
>>> Experiment
>>> ----------
>>> I performed experiments for three scenarios to collect some data.
>>>
>>> case 1 :
>>> Without this patch and without tick retained, i.e. in a upstream kernel=
,
>>> It would spend more than even a second to get out of stop0_lite.
>>>
>>> case 2 : With tick retained in a upstream kernel -
>>>
>>> Generally, we have a sched tick at 4ms(CONF_HZ =3D 250). Ideally I expe=
cted
>>> it to take 8 sched tick to get out of stop0_lite. Experimentally,
>>> observation was
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> sample          min            max           99percentile
>>> 20              4ms            12ms          4ms
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> It would take atleast one sched tick to get out of stop0_lite.
>>>
>>> case 2 :  With this patch (not stopping tick, but explicitly queuing a
>>>            timer)
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> sample          min             max             99percentile
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> 20              144us           192us           144us
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> In this patch, we queue a timer just before entering into a stop0_lite
>>> state. The timer fires at (residency of next available state + exit lat=
ency
>>> of next available state * 2). Let's say if next state(stop0) is availab=
le
>>> which has residency of 20us, it should get out in as low as (20+2*2)*8
>>> [Based on the forumla (residency + 2xlatency)*history length] microseco=
nds
>>> =3D 192us. Ideally we would expect 8 iterations, it was observed to get=
 out
>>> in 6-7 iterations. Even if let's say stop2 is next available state(stop=
0
>>> and stop1 both are unavailable), it would take (100+2*10)*8 =3D 960us t=
o get
>>> into stop2.
>>>
>>> So, We are able to get out of stop0_lite generally in 150us(with this
>>> patch) as compared to 4ms(with tick retained). As stated earlier, we do=
 not
>>> want to get stuck into stop0_lite as it inhibits SMT folding for other
>>> sibling threads, depriving them of core resources. Current patch is usi=
ng
>>> forced-wakeup only for stop0_lite, as it gives performance benefit(prim=
ary
>>> reason) along with lowering down power consumption. We may extend this
>>> model for other states in future.
>> I still have to wonder, between our snooze loop and stop0, what does
>> stop0_lite buy us.
>>
>> That said, the problem you're solving here is a generic one that all
>> stop states have, I think. Doesn't the same thing apply going from
>> stop0 to stop5? You might under estimate the sleep time and lose power
>> savings and therefore performance there too. Shouldn't we make it
>> generic for all stop states?
>>
>> Thanks,
>> Nick
>>
>>
> When a cpu is in snooze, it takes both space and time of core. When in=20
> stop0_lite,
> it free up time but it still takes space.

True, but snooze should only be taking less than 1% of front end
cycles. I appreciate there is some non-zero difference here, I just
wonder in practice what exactly we gain by it.

We should always have fewer states unless proven otherwise.

That said, we enable it today so I don't want to argue this point
here, because it is a different issue from your patch.

> When it is in stop0 or deeper,=20
> it free up both
> space and time slice of core.
> In stop0_lite, cpu doesn't free up the core resources and thus inhibits=20
> thread
> folding. When a cpu goes to stop0, it will free up the core resources=20
> thus increasing
> the single thread performance of other sibling thread.
> Hence, we do not want to get stuck in stop0_lite for long duration, and=20
> want to quickly
> move onto the next state.
> If we get stuck in any other state we would possibly be losing on to=20
> power saving,
> but will still be able to gain the performance benefits for other=20
> sibling threads.

That's true, but stop0 -> deeper stop is also a benefit (for
performance if we have some power/thermal constraints, and/or for power
usage).

Sure it may not be so noticable as the SMT switch, but I just wonder
if the infrastructure should be there for the same reason.

I was testing interrupt frequency on some tickless workloads configs,
and without too much trouble you can get CPUs to sleep with no
interrupts for many minutes. Hours even. We wouldn't want the CPU to
stay in stop0 for that long.

Just thinking about the patch itself, I wonder do you need a full
kernel timer, or could we just set the decrementer? Is there much=20
performance cost here?

Thanks,
Nick
=
