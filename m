Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E4E25FB0E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 15:16:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlTM31FVXzDq99
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 23:16:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A6zoVzE9; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlTJ82fCKzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 23:13:58 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id a8so4487989plm.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Sep 2020 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4cA1hdTIL5rnmMd1FI6T1WqSlZWjic9dUfeIvRe1r0Q=;
 b=A6zoVzE9Lg083llQzuvljA2m2JrDP85wdaaeHCqxhdC/f+C95v5GV433eVrUqtjxX4
 Pmx2cfG+/WQyQp5hp+sAkEwqFgVH1HS3NU3/WrSSEAS91x6m7rP+1TQXYlFSxmdd1Og3
 4WtNKBzYRfHcf9a7wGM2ejR33K+jpl6cFGvlmIeKwht4V7IONWi8aMR5Oj511clXzYjY
 68WhzRScQVGbMD7bxYrZuCRnscZzNXVauIreLKmwMR/oQmwrDyUYMnPmz9KZHLhQYteX
 EQ7Kck85NWmMD9z9hG7OKkMdEB/IeVuua2E3rlFskAE9eqDI97DMVNNif5xYc/CjtJ1h
 eqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4cA1hdTIL5rnmMd1FI6T1WqSlZWjic9dUfeIvRe1r0Q=;
 b=kkyGtdchu3+y7NNShajNB38wOjLhQBBGoqVQn4dOJqzbdRlCFxJk2Wmz04xtBMTcBn
 fJbgA8h2FRGsBy7MiqYBURbV97PVXMuCZgJno6NOylLYxWNuweOtYj6BDuHPU+/hMD2g
 MRsYDzbb8JNS24CwVlHQ6KHMdqlSq5GzjOV5Z/vPySa+5q/KTskQFG8Tn06rUwU7DYgZ
 dwH8A+BHDx77V1aSoHMvEyNOsCZ/ZVCrhiDmSxcY9zeo12imhSM+2+jozld+J3l2ssmZ
 aBnYv0sBohGp6rB4+Knvw6bo+pZwMribht69Hr9l/NfxeiZQyYhdkDItvClnb9LxHbQ9
 Tdtg==
X-Gm-Message-State: AOAM531s+VNjMKdqpkCPFM0Nmx1VFzR5Jpzg5jafWDQ6zmvil2AGjFId
 5yA9LA5Ln/NGNM5YbxQtFwM=
X-Google-Smtp-Source: ABdhPJwnwJvQqJH8Ev6ASW6YyuowtvdDuWqpBQ8OQAKmJnMllx1S54L6l2xIjzVwajzYsgCVYtahIQ==
X-Received: by 2002:a17:90b:208b:: with SMTP id
 hb11mr20795153pjb.201.1599484434153; 
 Mon, 07 Sep 2020 06:13:54 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id s125sm15268140pfb.125.2020.09.07.06.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 06:13:53 -0700 (PDT)
Date: Mon, 07 Sep 2020 23:13:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: KVM on POWER8 host lock up since 10d91611f426 ("powerpc/64s:
 Reimplement book3s idle code in C")
To: Michael Ellerman <mpe@ellerman.id.au>, Michal =?iso-8859-1?q?Such=E1nek?=
 <msuchanek@suse.de>
References: <20200830201145.GA29521@kitsune.suse.cz>
 <1598835313.5688ngko4f.astroid@bobo.none>
 <20200831091523.GC29521@kitsune.suse.cz> <87y2lv1430.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y2lv1430.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1599484062.vgmycu6q5i.astroid@bobo.none>
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
Cc: ro@suse.de, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of August 31, 2020 8:50 pm:
> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> On Mon, Aug 31, 2020 at 11:14:18AM +1000, Nicholas Piggin wrote:
>>> Excerpts from Michal Such=C3=A1nek's message of August 31, 2020 6:11 am=
:
>>> > Hello,
>>> >=20
>>> > on POWER8 KVM hosts lock up since commit 10d91611f426 ("powerpc/64s:
>>> > Reimplement book3s idle code in C").
>>> >=20
>>> > The symptom is host locking up completely after some hours of KVM
>>> > workload with messages like
>>> >=20
>>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cp=
u 47
>>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cp=
u 71
>>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cp=
u 47
>>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cp=
u 71
>>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cp=
u 47
>>> >=20
>>> > printed before the host locks up.
>>> >=20
>>> > The machines run sandboxed builds which is a mixed workload resulting=
 in
>>> > IO/single core/mutiple core load over time and there are periods of n=
o
>>> > activity and no VMS runnig as well. The VMs are shortlived so VM
>>> > setup/terdown is somewhat excercised as well.
>>> >=20
>>> > POWER9 with the new guest entry fast path does not seem to be affecte=
d.
>>> >=20
>>> > Reverted the patch and the followup idle fixes on top of 5.2.14 and
>>> > re-applied commit a3f3072db6ca ("powerpc/powernv/idle: Restore IAMR
>>> > after idle") which gives same idle code as 5.1.16 and the kernel seem=
s
>>> > stable.
>>> >=20
>>> > Config is attached.
>>> >=20
>>> > I cannot easily revert this commit, especially if I want to use the s=
ame
>>> > kernel on POWER8 and POWER9 - many of the POWER9 fixes are applicable
>>> > only to the new idle code.
>>> >=20
>>> > Any idea what can be the problem?
>>>=20
>>> So hwthread_state is never getting back to to HWTHREAD_IN_IDLE on
>>> those threads. I wonder what they are doing. POWER8 doesn't have a good
>>> NMI IPI and I don't know if it supports pdbg dumping registers from the
>>> BMC unfortunately.
>>
>> It may be possible to set up fadump with a later kernel version that
>> supports it on powernv and dump the whole kernel.
>=20
> Your firmware won't support it AFAIK.
>=20
> You could try kdump, but if we have CPUs stuck in KVM then there's a
> good chance it won't work :/

I haven't had any luck yet reproducing this still. Testing with sub=20
cores of various different combinations, etc. I'll keep trying though.

I don't know if there's much we can add to debug it. Can we run pdbg
on the BMCs on these things?

Thanks,
Nick
