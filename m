Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE1445D83
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 02:48:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlk1543PPz30RK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 12:48:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YG8/+XaV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YG8/+XaV; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlk0Q0lN2z2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 12:47:33 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id x64so7521110pfd.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 18:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=RYQvW3gYgNWZLXwXv6LJCFArVSQe9BKw3ODOnU+eVTA=;
 b=YG8/+XaVLw3Zk8a10TbDgqc/6xZyU/v16HuLL1Q0ISzN5D43c4ckOzoSOycGfw9lLL
 uCp6qVFuyYwCQJI1VAjfFiGDoiuolUtRFWcflIFeif0iXCQIOz0wyTq6IZsuxExh6zUt
 tJ0bw1N7uZkkH+y3x31xsueM4cMlJB0BBSoBI1aAnPREHUvCnsrJfEiQzgOaAd0TieQw
 xHPlHik9jdLXdWr8E5rX+rlu2xQrzdzoJJwyY3/eLcAxuUqASqdyv86qsw2LJF8HVVt2
 wH/4N6EDE+IO+n5LhbR0hnC/UTV97jAtBjUPxNYBSkqQ0vkHpsDvHdYhO88HyU2KE3KH
 59tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=RYQvW3gYgNWZLXwXv6LJCFArVSQe9BKw3ODOnU+eVTA=;
 b=cajOPvIKUhcWZ7TebFEBj4fi6fC6BTJ/IrCXNtbOkDao3bMwR6X97QmIXf4JjvkUlH
 SZjW/xuoqrA0au79lKcWHNeE2APHGY/xbq2BzZZ4Su0BAzwhc66TcVprtKeSelylXre5
 mS3UXDCP+4mALyBtA8eziNA9BvZskj2l/ljkjErBWiCWMyzFT8qy0if8Eat6R7LNiqHU
 8RbpVO8JQzfDjevnq0ydHGs5vsZkNd+KR66KjgZADmR4PE0XktAuGusqrNEZTVyk3cK6
 rH8igKww8EhB4lz/YzvefX+GtsBPvETpsUQxoikdIYg7b5x56N3B6BwcJ7JTgv24yQ30
 ezFQ==
X-Gm-Message-State: AOAM532lYXcdjn99SCIb9icLANaG9wgHHqEdjYLC2hBlaRgi2lKDI5bX
 7/yGMfFo9XHL3JggVjIX4yY=
X-Google-Smtp-Source: ABdhPJytuFT8ksE98hkXQDdKSkJq/n00qK8+qkf7Me1/Ho9Pkj0Sv4VcSk0BY5NyYB28K24l2JTAJw==
X-Received: by 2002:a05:6a00:1593:b0:492:67eb:355f with SMTP id
 u19-20020a056a00159300b0049267eb355fmr15414673pfk.32.1636076851947; 
 Thu, 04 Nov 2021 18:47:31 -0700 (PDT)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id i68sm5716293pfc.158.2021.11.04.18.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 18:47:31 -0700 (PDT)
Date: Fri, 05 Nov 2021 11:47:26 +1000
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
 <1603082970.5545yt7raj.astroid@bobo.none>
 <20210114124023.GL6564@kitsune.suse.cz>
 <1610628922.o1ihbt98xg.astroid@bobo.none>
 <20211102154835.GQ11195@kunlun.suse.cz>
In-Reply-To: <20211102154835.GQ11195@kunlun.suse.cz>
MIME-Version: 1.0
Message-Id: <1636076786.9byigbkr8k.astroid@bobo.none>
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
Cc: ro@suse.de, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michal Such=C3=A1nek's message of November 3, 2021 1:48 am:
> On Thu, Jan 14, 2021 at 11:08:03PM +1000, Nicholas Piggin wrote:
>> Excerpts from Michal Such=C3=A1nek's message of January 14, 2021 10:40 p=
m:
>> > On Mon, Oct 19, 2020 at 02:50:51PM +1000, Nicholas Piggin wrote:
>> >> Excerpts from Nicholas Piggin's message of October 19, 2020 11:00 am:
>> >> > Excerpts from Michal Such=C3=A1nek's message of October 17, 2020 6:=
14 am:
>> >> >> On Mon, Sep 07, 2020 at 11:13:47PM +1000, Nicholas Piggin wrote:
>> >> >>> Excerpts from Michael Ellerman's message of August 31, 2020 8:50 =
pm:
>> >> >>> > Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> >> >>> >> On Mon, Aug 31, 2020 at 11:14:18AM +1000, Nicholas Piggin wrot=
e:
>> >> >>> >>> Excerpts from Michal Such=C3=A1nek's message of August 31, 20=
20 6:11 am:
>> >> >>> >>> > Hello,
>> >> >>> >>> >=20
>> >> >>> >>> > on POWER8 KVM hosts lock up since commit 10d91611f426 ("pow=
erpc/64s:
>> >> >>> >>> > Reimplement book3s idle code in C").
>> >> >>> >>> >=20
>> >> >>> >>> > The symptom is host locking up completely after some hours =
of KVM
>> >> >>> >>> > workload with messages like
>> >> >>> >>> >=20
>> >> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn=
't grab cpu 47
>> >> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn=
't grab cpu 71
>> >> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn=
't grab cpu 47
>> >> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn=
't grab cpu 71
>> >> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn=
't grab cpu 47
>> >> >>> >>> >=20
>> >> >>> >>> > printed before the host locks up.
>> >> >>> >>> >=20
>> >> >>> >>> > The machines run sandboxed builds which is a mixed workload=
 resulting in
>> >> >>> >>> > IO/single core/mutiple core load over time and there are pe=
riods of no
>> >> >>> >>> > activity and no VMS runnig as well. The VMs are shortlived =
so VM
>> >> >>> >>> > setup/terdown is somewhat excercised as well.
>> >> >>> >>> >=20
>> >> >>> >>> > POWER9 with the new guest entry fast path does not seem to =
be affected.
>> >> >>> >>> >=20
>> >> >>> >>> > Reverted the patch and the followup idle fixes on top of 5.=
2.14 and
>> >> >>> >>> > re-applied commit a3f3072db6ca ("powerpc/powernv/idle: Rest=
ore IAMR
>> >> >>> >>> > after idle") which gives same idle code as 5.1.16 and the k=
ernel seems
>> >> >>> >>> > stable.
>> >> >>> >>> >=20
>> >> >>> >>> > Config is attached.
>> >> >>> >>> >=20
>> >> >>> >>> > I cannot easily revert this commit, especially if I want to=
 use the same
>> >> >>> >>> > kernel on POWER8 and POWER9 - many of the POWER9 fixes are =
applicable
>> >> >>> >>> > only to the new idle code.
>> >> >>> >>> >=20
>> >> >>> >>> > Any idea what can be the problem?
>> >> >>> >>>=20
>> >> >>> >>> So hwthread_state is never getting back to to HWTHREAD_IN_IDL=
E on
>> >> >>> >>> those threads. I wonder what they are doing. POWER8 doesn't h=
ave a good
>> >> >>> >>> NMI IPI and I don't know if it supports pdbg dumping register=
s from the
>> >> >>> >>> BMC unfortunately.
>> >> >>> >>
>> >> >>> >> It may be possible to set up fadump with a later kernel versio=
n that
>> >> >>> >> supports it on powernv and dump the whole kernel.
>> >> >>> >=20
>> >> >>> > Your firmware won't support it AFAIK.
>> >> >>> >=20
>> >> >>> > You could try kdump, but if we have CPUs stuck in KVM then ther=
e's a
>> >> >>> > good chance it won't work :/
>> >> >>>=20
>> >> >>> I haven't had any luck yet reproducing this still. Testing with s=
ub=20
>> >> >>> cores of various different combinations, etc. I'll keep trying th=
ough.
>> >> >>=20
>> >> >> Hello,
>> >> >>=20
>> >> >> I tried running some KVM guests to simulate the workload and what =
I get
>> >> >> is guests failing to start with a rcu stall. Tried both 5.3 and 5.=
9
>> >> >> kernel and qemu 4.2.1 and 5.1.0
>> >> >>=20
>> >> >> To start some guests I run
>> >> >>=20
>> >> >> for i in $(seq 0 9) ; do /opt/qemu/bin/qemu-system-ppc64 -m 2048 -=
accel kvm -smp 8 -kernel /boot/vmlinux -initrd /boot/initrd -nodefaults -no=
graphic -serial mon:telnet::444$i,server,wait & done
>> >> >>=20
>> >> >> To simulate some workload I run
>> >> >>=20
>> >> >> xz -zc9T0 < /dev/zero > /dev/null &
>> >> >> while true; do
>> >> >>     killall -STOP xz; sleep 1; killall -CONT xz; sleep 1;
>> >> >> done &
>> >> >>=20
>> >> >> on the host and add a job that executes this to the ramdisk. Howev=
er, most
>> >> >> guests never get to the point where the job is executed.
>> >> >>=20
>> >> >> Any idea what might be the problem?
>> >> >=20
>> >> > I would say try without pv queued spin locks (but if the same thing=
 is=20
>> >> > happening with 5.3 then it must be something else I guess).=20
>> >> >=20
>> >> > I'll try to test a similar setup on a POWER8 here.
>> >>=20
>> >> Couldn't reproduce the guest hang, they seem to run fine even with=20
>> >> queued spinlocks. Might have a different .config.
>> >>=20
>> >> I might have got a lockup in the host (although different symptoms th=
an=20
>> >> the original report). I'll look into that a bit further.
>> >=20
>> > Hello,
>> >=20
>> > any progress on this?
>>=20
>> No progress, I still wasn't able to reproduce, and it fell off the=20
>> radar sorry.
>>=20
>> I expect hwthred_state must be getting corrupted somewhere or a
>> secondary thread getting stuck but I couldn't see where. I try pick
>> it up again thanks for the reminder.
>=20
> Hello,
>=20
> the fixes pointed out in
> https://lore.kernel.org/linuxppc-dev/87pmrtbbdt.fsf@mpe.ellerman.id.au/T/=
#u
> resolve the problem.
>=20
> Thanks
>=20
> Michal

Hey Michal, great thanks for testing. Sorry I couldn't fix it, but a=20
good result in the end.

Thanks,
Nick
