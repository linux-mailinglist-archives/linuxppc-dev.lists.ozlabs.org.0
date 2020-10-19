Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4520292203
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 06:52:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF49z5cgxzDqZb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 15:52:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U02Q9Imz; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF48N6PvCzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 15:51:00 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id 1so4376782ple.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 21:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=VP/SJWlyjIPk8BZHzgCHKYeG7WO6++eqQoSElHzrNws=;
 b=U02Q9Imz2JnxVFRQ+rzeHXF4MBXM5UFe1sK5UiUZ2v6yK/pVUo4TWAlrVHFGau4z66
 HA7wtdJPF9Sp9r4za8ukVZw8lCeDDPZD1U+j/xLbb/c2KmbKJ9+XlRFPSzGgPxNmTXQ1
 ti2jzQXOsZ72LbgDavDwhZTy1+UxijdKdIDDe5TttvVsi7x3OyPk2GTWhrkB+QL7TK1y
 M+ZOSmLV74akbc5MUrO0cCQOLko0zCKP8SNuakFCRzLgB2jK37v+G06K5IOCs+KyV9KN
 cXOpR25O40TVkxKhs7uVC2hf6ntYU9Uo6ft1u+kthzebhxrZ19UmPUsMPvNz0axtWQa5
 Z6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=VP/SJWlyjIPk8BZHzgCHKYeG7WO6++eqQoSElHzrNws=;
 b=cBTxq3aWnJ6rjTuUB9h9kv/8I0S1BDKAAWA0IfIGVUuJ5YWu6PYNdrz7RrNya38ScK
 A+5iSLbYo0QKlLYEalByHNmjygO+2z/0EAEtnUqAaQBX0Rr4y9vXboyoeO+zULbJcO1I
 3EzUlFcOh3xxH1IveHG19touFrub30IoL2ObBg27l02Vz7qpmfwdiJQJy8etEAk8wHyp
 DfFRguAPnrPuucgX1vJqm15FAwvwf5o/ydLCg6jXo6QpU3YFVMDnEntVOgpLuwoEXnVL
 8fT0tYk9KvI2384ybhhgssvBVf1Ba6vM+3pZDGc7HlWP5M1Zi78gBpXo0PDiH/BAePBQ
 nO5w==
X-Gm-Message-State: AOAM533NTJlAf4iAAWFegfbavXp1okLjZkpwDut5jh5OpO8GpezGT/Kn
 0u4KdUa6jozSEYBzMMlsn6A=
X-Google-Smtp-Source: ABdhPJyY3nDmpxcFzbcWd57NkUhVZYzMu0aJYcB+T8R0dR9f6ubJn5ZQV+bR0QtpjJO025QRP9abVA==
X-Received: by 2002:a17:902:b78c:b029:d4:da94:8766 with SMTP id
 e12-20020a170902b78cb02900d4da948766mr15798700pls.31.1603083057319; 
 Sun, 18 Oct 2020 21:50:57 -0700 (PDT)
Received: from localhost ([1.129.224.124])
 by smtp.gmail.com with ESMTPSA id y14sm10204222pfe.107.2020.10.18.21.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 21:50:56 -0700 (PDT)
Date: Mon, 19 Oct 2020 14:50:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: KVM on POWER8 host lock up since 10d91611f426 ("powerpc/64s:
 Reimplement book3s idle code in C")
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20200830201145.GA29521@kitsune.suse.cz>
 <1598835313.5688ngko4f.astroid@bobo.none>
 <20200831091523.GC29521@kitsune.suse.cz> <87y2lv1430.fsf@mpe.ellerman.id.au>
 <1599484062.vgmycu6q5i.astroid@bobo.none>
 <20201016201410.GH29778@kitsune.suse.cz>
 <1603066878.gtbyofrzyo.astroid@bobo.none>
In-Reply-To: <1603066878.gtbyofrzyo.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1603082970.5545yt7raj.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of October 19, 2020 11:00 am:
> Excerpts from Michal Such=C3=A1nek's message of October 17, 2020 6:14 am:
>> On Mon, Sep 07, 2020 at 11:13:47PM +1000, Nicholas Piggin wrote:
>>> Excerpts from Michael Ellerman's message of August 31, 2020 8:50 pm:
>>> > Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>>> >> On Mon, Aug 31, 2020 at 11:14:18AM +1000, Nicholas Piggin wrote:
>>> >>> Excerpts from Michal Such=C3=A1nek's message of August 31, 2020 6:1=
1 am:
>>> >>> > Hello,
>>> >>> >=20
>>> >>> > on POWER8 KVM hosts lock up since commit 10d91611f426 ("powerpc/6=
4s:
>>> >>> > Reimplement book3s idle code in C").
>>> >>> >=20
>>> >>> > The symptom is host locking up completely after some hours of KVM
>>> >>> > workload with messages like
>>> >>> >=20
>>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't gra=
b cpu 47
>>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't gra=
b cpu 71
>>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't gra=
b cpu 47
>>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't gra=
b cpu 71
>>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't gra=
b cpu 47
>>> >>> >=20
>>> >>> > printed before the host locks up.
>>> >>> >=20
>>> >>> > The machines run sandboxed builds which is a mixed workload resul=
ting in
>>> >>> > IO/single core/mutiple core load over time and there are periods =
of no
>>> >>> > activity and no VMS runnig as well. The VMs are shortlived so VM
>>> >>> > setup/terdown is somewhat excercised as well.
>>> >>> >=20
>>> >>> > POWER9 with the new guest entry fast path does not seem to be aff=
ected.
>>> >>> >=20
>>> >>> > Reverted the patch and the followup idle fixes on top of 5.2.14 a=
nd
>>> >>> > re-applied commit a3f3072db6ca ("powerpc/powernv/idle: Restore IA=
MR
>>> >>> > after idle") which gives same idle code as 5.1.16 and the kernel =
seems
>>> >>> > stable.
>>> >>> >=20
>>> >>> > Config is attached.
>>> >>> >=20
>>> >>> > I cannot easily revert this commit, especially if I want to use t=
he same
>>> >>> > kernel on POWER8 and POWER9 - many of the POWER9 fixes are applic=
able
>>> >>> > only to the new idle code.
>>> >>> >=20
>>> >>> > Any idea what can be the problem?
>>> >>>=20
>>> >>> So hwthread_state is never getting back to to HWTHREAD_IN_IDLE on
>>> >>> those threads. I wonder what they are doing. POWER8 doesn't have a =
good
>>> >>> NMI IPI and I don't know if it supports pdbg dumping registers from=
 the
>>> >>> BMC unfortunately.
>>> >>
>>> >> It may be possible to set up fadump with a later kernel version that
>>> >> supports it on powernv and dump the whole kernel.
>>> >=20
>>> > Your firmware won't support it AFAIK.
>>> >=20
>>> > You could try kdump, but if we have CPUs stuck in KVM then there's a
>>> > good chance it won't work :/
>>>=20
>>> I haven't had any luck yet reproducing this still. Testing with sub=20
>>> cores of various different combinations, etc. I'll keep trying though.
>>=20
>> Hello,
>>=20
>> I tried running some KVM guests to simulate the workload and what I get
>> is guests failing to start with a rcu stall. Tried both 5.3 and 5.9
>> kernel and qemu 4.2.1 and 5.1.0
>>=20
>> To start some guests I run
>>=20
>> for i in $(seq 0 9) ; do /opt/qemu/bin/qemu-system-ppc64 -m 2048 -accel =
kvm -smp 8 -kernel /boot/vmlinux -initrd /boot/initrd -nodefaults -nographi=
c -serial mon:telnet::444$i,server,wait & done
>>=20
>> To simulate some workload I run
>>=20
>> xz -zc9T0 < /dev/zero > /dev/null &
>> while true; do
>>     killall -STOP xz; sleep 1; killall -CONT xz; sleep 1;
>> done &
>>=20
>> on the host and add a job that executes this to the ramdisk. However, mo=
st
>> guests never get to the point where the job is executed.
>>=20
>> Any idea what might be the problem?
>=20
> I would say try without pv queued spin locks (but if the same thing is=20
> happening with 5.3 then it must be something else I guess).=20
>=20
> I'll try to test a similar setup on a POWER8 here.

Couldn't reproduce the guest hang, they seem to run fine even with=20
queued spinlocks. Might have a different .config.

I might have got a lockup in the host (although different symptoms than=20
the original report). I'll look into that a bit further.

Thanks,
Nick
