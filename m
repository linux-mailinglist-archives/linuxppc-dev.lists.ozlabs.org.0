Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E32318C56C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 03:44:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k7Qz1x3czDrL7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 13:44:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=V1EccXjY; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k7PJ5TcTzDrRZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 13:43:16 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x2so2465675pfn.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 19:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=lqbBBHHfnUrWWSSWC60BfZieexCMPJ1bON7UrXQgnSM=;
 b=V1EccXjYj068FqmBhcJKL38QNWsJs2WxO5xyEU4xPlwB5YGJHo2/O4tRnLPVD/Y4fL
 j22rmr46cq+v258OO3W+DB0Cp+fkdaSk6OYtSJH0tEI+QEpuKyGqF5phU4IemUlT9W0s
 FWmz0Uxzx6jJdfoc095idFsXNlW5Gia4uWzcoeb+iy52JY7Jkhfitccta/iWQcGOR1dc
 WaSsF+TsOlUP6mCInpBOcC8djznktflkXIJ3rJWTtE4TH3rbEkH4i3J//w7bEjCbr38v
 f8mQXy9tm9aANqPlgLtlC3zD7zSykCZ+VLGJhxE5rK9DZvEPfQfPvxZaAkz4OFlTKyXz
 2/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=lqbBBHHfnUrWWSSWC60BfZieexCMPJ1bON7UrXQgnSM=;
 b=aTzSfESGkPWxtzbrmuSlaiPjqMTu1xWyMWLJVfBBziPXqJ6YbHmy0AD7r0j60SE7nv
 IwS6pkr0xUavhx3z5l7MnMPbOjdt6kp4rmvb4ijM+Ro8IpJ/IxliUNa0o9F0Fe5WTV/g
 rDvb3Ug683xAQPBCrf2PeHZUlckUUXF6ofDMMisygSYtbeKrqijQV0yhJQ5KM5neF7mV
 fxt7fOHn/oB5DDJL1yNjUkEdVsrgaAq0GpfMvldBhQO4kHi3vXl/u7sUVF56Lx8zSK13
 dB0qqaBKhFwKFbOEi5t4+AYly/DRG9DH9cCuDNdFpX18UA0KRs4x1Uop2MYujiaPehs4
 JjNw==
X-Gm-Message-State: ANhLgQ0aVcUGXVZ/rvJmQA5SFM/XWjVHCK38YK9DzZQzYB50uD+z0cHj
 QBl3pPYLTAdY16BYa9WjxpI=
X-Google-Smtp-Source: ADFU+vvTm2tXUEtRFU9l4jF5LLwR91rl0vC6m5bqwqYwMpZ0MuReb7DOlTp4Cxx1JOrTJBx50zRGzQ==
X-Received: by 2002:a63:a65:: with SMTP id z37mr6253330pgk.31.1584672194543;
 Thu, 19 Mar 2020 19:43:14 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id p1sm3715154pfq.114.2020.03.19.19.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 19:43:13 -0700 (PDT)
Date: Fri, 20 Mar 2020 12:41:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix MCE handling on pseries
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200313140418.7940-1-ganeshgr@linux.ibm.com>
 <1584157063.g5s75uhbdu.astroid@bobo.none>
 <d22f9ef9-07db-9615-6420-001b85dd2742@linux.ibm.com>
 <1584437866.2pbq6ca4ia.astroid@bobo.none>
 <3d8acf3d-4996-3b4d-bc06-0ef7525035bb@linux.ibm.com>
In-Reply-To: <3d8acf3d-4996-3b4d-bc06-0ef7525035bb@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584670525.n2ybablt2y.astroid@bobo.none>
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh's on March 18, 2020 12:35 am:
>=20
>=20
> On 3/17/20 3:31 PM, Nicholas Piggin wrote:
>> Ganesh's on March 16, 2020 9:47 pm:
>>>
>>> On 3/14/20 9:18 AM, Nicholas Piggin wrote:
>>>> Ganesh Goudar's on March 14, 2020 12:04 am:
>>>>> MCE handling on pSeries platform fails as recent rework to use common
>>>>> code for pSeries and PowerNV in machine check error handling tries to
>>>>> access per-cpu variables in realmode. The per-cpu variables may be
>>>>> outside the RMO region on pSeries platform and needs translation to b=
e
>>>>> enabled for access. Just moving these per-cpu variable into RMO regio=
n
>>>>> did'nt help because we queue some work to workqueues in real mode, wh=
ich
>>>>> again tries to touch per-cpu variables.
>>>> Which queues are these? We should not be using Linux workqueues, but t=
he
>>>> powerpc mce code which uses irq_work.
>>> Yes, irq work queues accesses memory outside RMO.
>>> irq_work_queue()->__irq_work_queue_local()->[this_cpu_ptr(&lazy_list) |=
 this_cpu_ptr(&raised_list)]
>> Hmm, okay.
>>
>>>>> Also fwnmi_release_errinfo()
>>>>> cannot be called when translation is not enabled.
>>>> Why not?
>>> It crashes when we try to get RTAS token for "ibm, nmi-interlock" devic=
e
>>> tree node. But yes we can avoid it by storing it rtas_token somewhere b=
ut haven't
>>> tried it, here is the backtrace I got when fwnmi_release_errinfo() call=
ed from
>>> realmode handler.
>> Okay, I actually had problems with that messing up soft-irq state too
>> and so I sent a patch to get rid of it, but that's the least of your
>> problems really.
>>
>>>>> This patch fixes this by enabling translation in the exception handle=
r
>>>>> when all required real mode handling is done. This change only affect=
s
>>>>> the pSeries platform.
>>>> Not supposed to do this, because we might not be in a state
>>>> where the MMU is ready to be turned on at this point.
>>>>
>>>> I'd like to understand better which accesses are a problem, and whethe=
r
>>>> we can fix them all to be in the RMO.
>>> I faced three such access problems,
>>>    * accessing per-cpu data (like mce_event,mce_event_queue and mce_eve=
nt_queue),
>>>      we can move this inside RMO.
>>>    * calling fwnmi_release_errinfo().
>>>    * And queuing work to irq_work_queue, not sure how to fix this.
>> Yeah. The irq_work_queue one is the biggest problem.
>>
>> This code "worked" prior to the series unifying pseries and powernv
>> machine check handlers, 9ca766f9891d ("powerpc/64s/pseries: machine
>> check convert to use common event code") and friends. But it does in
>> basically the same way as your fix (i.e., it runs this early handler
>> in virtual mode), but that's not really the right fix.
>>
>> Consider: you get a SLB multi hit on a kernel address due to hardware or
>> software error. That access causes a MCE, but before the error can be
>> decode to save and flush the SLB, you turn on relocation and that
>> causes another SLB multi hit...
>=20
> We turn on relocation only after all the realmode handling/recovery is do=
ne
> like SLB flush and reload, All we do after we turn relocation on is savin=
g
> mce event to array and queuing the work to irq_workqueue.

Oh I see, fwnmi_release_errinfo is done after mce_handle_error, I didnt
read your comment closely!

That means the recovery is done with MSR[ME]=3D0, which means saving the
SLB entries can take a machine check which will turn into a checkstop,
or walking user page tables and loading memory to handle memory=20
failures.

We really should release that immediately so we get ME back on.

> So we are good to turn it on here.

Possibly. I don't think it's generally a good idea enable relocation
from an interrupted relocation off context, but yeah this might be okay.

I think FWNMI mce needs to be fixed to not do this, and do the
nmi-interlock earlier, but for now your patch I guess improves things
significantly. So, okay let's go with it.

You should be able to just use mtmsrd to switch to virtual mode, so no
need for the asm code.

  mtmsr(mfmsr()|MSR_IR|MSR_DR);

Otherwise,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick
=
