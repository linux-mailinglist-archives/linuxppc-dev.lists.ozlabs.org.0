Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A646269C1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 04:49:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Br7472TZdzDqP3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 12:49:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UNowgRQA; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Br72N2CSrzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 12:48:11 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id f1so567740plo.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 19:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=aaOa8JjlqjTYS++ZFG8V22WjJNOWJKLkYNHW3VsHVMc=;
 b=UNowgRQAskv4ypUvq6XstkGMFUL+0a1LNQ7XnYyO/kh7MT3kChrzvcNUDLkFn3mdsP
 s6O81eOoQInRV7/VIJQghCVOhnXRT8CmjJ6UZEPVNdNRkhl7faweiUcYa8ejPeFk/hXD
 qHKkGcwa1bRPPFWqTlRF2Aixi2xAx6LqDVi30iEbRoW6qt/PXhrh2NpuwCQRlOnPa3l3
 Khvk76AG8oUaeIZC2ZfBPhqbc7Z9QD65bknPwkW2VmQb/L2HMLqw4iVbQh09TI1yJW25
 1NVtwZT+zEFws8QlQtUcHofwO8Tj+XiNf++GFb3dbX6nbz6pwgFzbHc6wLkUftWrYGXU
 NHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=aaOa8JjlqjTYS++ZFG8V22WjJNOWJKLkYNHW3VsHVMc=;
 b=Dvr+yRJHgjdrzYSjlPZPK2DZkcb0r6Qzw8jJidwWV2Ej7Ah1ZAN/EULaURzYDqx2qR
 A4QNBHjrmQdEUSShDL8MaYAq5lzEC6ll2PHaLNA4lYLO2nm+CpBpjX6ie4KV4JWlmOcW
 V3iAoMFBGLZ/m/MIVX/zO86qz6+2b/y1Ah45FSEGB73Gi9V1cnOqs9LIMiKv34YOZ9D+
 cTAQOI5BNtPj3qgNTrgXSAHQ6r7sv8COJnAElXzjFa56R14Jb1cwinMEkpOJ59NeO7OP
 qanFO4PxiQ0Ncm1ekhvJRliRnu6Wucs/X4nMirfsvsvir905P5/pBuhZv387TJsdMwMw
 hTVQ==
X-Gm-Message-State: AOAM533yD2QB9+7kbF08gaEdcMZqEN0lK6rExOeZH6lf+xhtSda8wj0l
 RGAnUfZvo4eTKS/FD8+O3SI=
X-Google-Smtp-Source: ABdhPJyjUmqnGNxdYzpnpKmbQbS/ctXbaoS1dXlPnCU1j530Lt4t/dt/Xq3lLLFQcXT1ZBfX4DE48Q==
X-Received: by 2002:a17:902:b193:: with SMTP id
 s19mr17069704plr.125.1600138088501; 
 Mon, 14 Sep 2020 19:48:08 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id t24sm9858396pgo.51.2020.09.14.19.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 19:48:08 -0700 (PDT)
Date: Tue, 15 Sep 2020 12:48:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: fix exec activate_mm vs TLB shootdown and lazy
 tlb switching race
To: peterz@infradead.org
References: <20200914045219.3736466-1-npiggin@gmail.com>
 <20200914045219.3736466-2-npiggin@gmail.com>
 <20200914105617.GP1362448@hirez.programming.kicks-ass.net>
In-Reply-To: <20200914105617.GP1362448@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1600137586.nypnz3sbcl.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-arch@vger.kernel.org,
 "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dave Hansen <dave.hansen@intel.com>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from peterz@infradead.org's message of September 14, 2020 8:56 pm:
> On Mon, Sep 14, 2020 at 02:52:16PM +1000, Nicholas Piggin wrote:
>> Reading and modifying current->mm and current->active_mm and switching
>> mm should be done with irqs off, to prevent races seeing an intermediate
>> state.
>>=20
>> This is similar to commit 38cf307c1f20 ("mm: fix kthread_use_mm() vs TLB
>> invalidate"). At exec-time when the new mm is activated, the old one
>> should usually be single-threaded and no longer used, unless something
>> else is holding an mm_users reference (which may be possible).
>>=20
>> Absent other mm_users, there is also a race with preemption and lazy tlb
>> switching. Consider the kernel_execve case where the current thread is
>> using a lazy tlb active mm:
>>=20
>>   call_usermodehelper()
>>     kernel_execve()
>>       old_mm =3D current->mm;
>>       active_mm =3D current->active_mm;
>>       *** preempt *** -------------------->  schedule()
>>                                                prev->active_mm =3D NULL;
>>                                                mmdrop(prev active_mm);
>>                                              ...
>>                       <--------------------  schedule()
>>       current->mm =3D mm;
>>       current->active_mm =3D mm;
>>       if (!old_mm)
>>           mmdrop(active_mm);
>>=20
>> If we switch back to the kernel thread from a different mm, there is a
>> double free of the old active_mm, and a missing free of the new one.
>>=20
>> Closing this race only requires interrupts to be disabled while ->mm
>> and ->active_mm are being switched, but the TLB problem requires also
>> holding interrupts off over activate_mm. Unfortunately not all archs
>> can do that yet, e.g., arm defers the switch if irqs are disabled and
>> expects finish_arch_post_lock_switch() to be called to complete the
>> flush; um takes a blocking lock in activate_mm().
>>=20
>> So as a first step, disable interrupts across the mm/active_mm updates
>> to close the lazy tlb preempt race, and provide an arch option to
>> extend that to activate_mm which allows architectures doing IPI based
>> TLB shootdowns to close the second race.
>>=20
>> This is a bit ugly, but in the interest of fixing the bug and backportin=
g
>> before all architectures are converted this is a compromise.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>=20
> I'm thinking we want this selected on x86 as well. Andy?

Thanks for the ack. The plan was to take it through the powerpc tree,
but if you'd want x86 to select it, maybe a topic branch? Although
Michael will be away during the next merge window so I don't want to
get too fancy. Would you mind doing it in a follow up merge after
powerpc, being that it's (I think) a small change?

I do think all archs should be selecting this, and we want to remove
the divergent code paths from here as soon as possible. I was planning
to send patches for the N+1 window at least for all the easy archs.
But the sooner the better really, we obviously want to share code
coverage with x86 :)

Thanks,
Nick
