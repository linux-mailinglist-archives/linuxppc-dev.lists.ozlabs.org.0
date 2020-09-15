Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B758B269C20
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 04:51:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Br76C6pCZzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 12:51:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HQMAsT5C; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Br73p6s43zDqP4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 12:49:26 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id gf14so974853pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 19:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=KwNAiWJRGAv99MLMgUjio/0RK3rO7RqLOWZGiQVH4cs=;
 b=HQMAsT5Cpi3ZVvE6aUzwNqCmoc+hJimdldWrYhjJnMo9GKThwYcs1ehJDOOYUfEVs+
 c3uIHv0eSV+/Z0EaTKGSN0/InpbN2a43KUp1UjVs/p7ytQ7/12/TwpUe89rkbOk+ztk2
 AUq6aYP4vM4W7iGIdlRtk5H29sBPyvTJ75Ftk5ae7rJuwT/W0LfBGl4ZV1Tt8923pp/l
 HPpe+vFnBMkWjZDyhcV9oiimti8Jj8XBzVm/TyprP09Q10iZ8r/fmMdMT2tJI7f0n/tx
 yF1uXbmYMJgORI4On7seltzHM8cbKJ3TjFjEKo+7e1XSTCybLnV0SAiFtd/DS4DwiSjq
 9wAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=KwNAiWJRGAv99MLMgUjio/0RK3rO7RqLOWZGiQVH4cs=;
 b=QB2MEDAJqpm2cdDgJFV6XzO4UjMxMv44X2QFkMDhBypc+muVhCvvSMA0DZr05aQKID
 qjrAn3T4yBcHin3ErNQIid2GDYA3/YoSKR5yWXvF+9IKsY7UfBJPQEZvt6l+gk3Hfg/p
 SxuuP6jbvqUoOB507vio56I7VrJaCxxfrsweXSsgGlGzS90aEZSRdCha+H+/BovbIfs0
 bRORCG+rBgk4SAIS+eJHGRxrsRmToLpnwIJC5YhsCN/Q6Hs3YjqRGAD7l7wLzbTQ8OyW
 9vtuHUto526Wf26Hazyu9b2xseeJmbXTqb3BZsSB7eaQOJKLBkwyKdcs2iPZiuEWcJz0
 EcXA==
X-Gm-Message-State: AOAM530HJAYfF9N6ymxIKzIad6FJlhPWHXcYySm9xRfHHlVf/rtx6+Yv
 MA6LJaKUXroi4g/xHzDrLXw=
X-Google-Smtp-Source: ABdhPJyTc6EOwxZ5jsKaWPo8x1RkVddn24PJQuDSbAXRaYhCLAyTFVl/PXqlACqvjkAx8OXV2NSCxw==
X-Received: by 2002:a17:90b:793:: with SMTP id
 l19mr2206291pjz.154.1600138163637; 
 Mon, 14 Sep 2020 19:49:23 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id a9sm10556060pjm.40.2020.09.14.19.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 19:49:23 -0700 (PDT)
Date: Tue, 15 Sep 2020 12:49:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/4] sparc64: remove mm_cpumask clearing to fix
 kthread_use_mm race
To: Anatoly Pugachev <matorola@gmail.com>
References: <20200914045219.3736466-1-npiggin@gmail.com>
 <20200914045219.3736466-4-npiggin@gmail.com>
 <1600066040.vnmz9nxhwt.astroid@bobo.none>
 <CADxRZqxkB9tzO+nf56vFfvdYBooo1rqEbst=QGZQJA3jWhKLYw@mail.gmail.com>
In-Reply-To: <CADxRZqxkB9tzO+nf56vFfvdYBooo1rqEbst=QGZQJA3jWhKLYw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1600138100.0flxk0qjzs.astroid@bobo.none>
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
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Sparc kernel list <sparclinux@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Anatoly Pugachev's message of September 14, 2020 8:23 pm:
> On Mon, Sep 14, 2020 at 10:00 AM Nicholas Piggin <npiggin@gmail.com> wrot=
e:
>>
>> Excerpts from Nicholas Piggin's message of September 14, 2020 2:52 pm:
>>
>> [...]
>>
>> > The basic fix for sparc64 is to remove its mm_cpumask clearing code. T=
he
>> > optimisation could be effectively restored by sending IPIs to mm_cpuma=
sk
>> > members and having them remove themselves from mm_cpumask. This is mor=
e
>> > tricky so I leave it as an exercise for someone with a sparc64 SMP.
>> > powerpc has a (currently similarly broken) example.
>>
>> So this compiles and boots on qemu, but qemu does not support any
>> sparc64 machines with SMP. Attempting some simple hacks doesn't get
>> me far because openbios isn't populating an SMP device tree, which
>> blows up everywhere.
>>
>> The patch is _relatively_ simple, hopefully it shouldn't explode, so
>> it's probably ready for testing on real SMP hardware, if someone has
>> a few cycles.
>=20
> Nick,
>=20
> applied this patch to over 'v5.9-rc5' tag , used my test VM (ldom)
> with 32 vcpus.
> Machine boot, stress-ng test ( run as
> "stress-ng --cpu 8 --io 8 --vm 8 --vm-bytes 2G --fork 8 --timeout 15m" )
> finishes without errors.
>=20

Thank you very much Anatoly.

Thanks,
Nick
