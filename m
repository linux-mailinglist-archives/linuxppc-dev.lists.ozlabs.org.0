Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC62F6192
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 14:11:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGl822HhgzDsM2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 00:11:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OmBR1Bn/; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGl3w4QSSzDrT5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:08:12 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id c12so3297390pfo.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=V5mBBcc1pjGGwRJQjUnzrQlgeQFUaJGngHzEvAldn7U=;
 b=OmBR1Bn//cDynJ9MsHrhy3y38bHmg/GCtKYjoJjulMbCGTLrRVg0O0b3HcDMJ8dSq5
 5INUgnMfVCphKArsaBelMVM0qpgULZMsdtCbGwBNaWRNbsXcIn4uskoxlVs0HTSm0VtM
 eCWydJwGwOxaC7UDQKSjTgWRltnCC1dNut6WF4URpkQ+qxaqHnSHMMrxReFlg2ILMQ7U
 MXGFIOMReR/Wa+aTB3BnCSZ1WuIU0TjuwKo2Cqh4RCyjgo4gxFbKVWsTElERh7+tU/VA
 U6+3BNZGlALxhN6MGl5cFGxHEw/y51B79N7ViRT+uCK0xodY+oUdHf0WO0QV/p7zy7lu
 lwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=V5mBBcc1pjGGwRJQjUnzrQlgeQFUaJGngHzEvAldn7U=;
 b=UjcP4nzwzrdEfkRgr2uXYz5wg0EQ48qd9F+7QywcT5Cl5qUY8HeUA5BXPBfJC7IZ1m
 h2ufntdfj9y313RUW/0E4rwFScP9M6O0egsc9/xJ1zNgFd0GafssVnM6BsP8Vnpyi2mm
 OZSMBWwOPROpU1teQbNOoYZccZ4qA2AlIRw3cPRjzIpcowRj0mh/1DCxe0aglgS7J7KX
 YvKH2AgP5fecfSdIcns1yzm0fMpSprjvhuGv449hcJLtiKSNqjFT+9ufx/VRKKnVrgE0
 yxAHVHIFtQO324AhV1QKQZSHZtpNMqJFyK/ZTweWadZNUjeLpUrE8NYAcwblrXyHCJgK
 N/Kg==
X-Gm-Message-State: AOAM533Cn1oZ8B9UJ4BlK8GbV7Jqn7DIXuQsISi+x1/Pb196idqkJp5V
 Nf5C9KLNB/gXF3aw9MhQQ9s=
X-Google-Smtp-Source: ABdhPJyDX52tq0NAghsdIbcddA+MMQdCV7v35i+R9Oe/DuK0f5Gcx0ag83mEIH33ZEYlsO6KRu2Xfw==
X-Received: by 2002:a62:e906:0:b029:1ae:6d80:1338 with SMTP id
 j6-20020a62e9060000b02901ae6d801338mr7263852pfh.24.1610629689858; 
 Thu, 14 Jan 2021 05:08:09 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id x23sm5440617pgk.14.2021.01.14.05.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 05:08:08 -0800 (PST)
Date: Thu, 14 Jan 2021 23:08:03 +1000
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
In-Reply-To: <20210114124023.GL6564@kitsune.suse.cz>
MIME-Version: 1.0
Message-Id: <1610628922.o1ihbt98xg.astroid@bobo.none>
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

Excerpts from Michal Such=C3=A1nek's message of January 14, 2021 10:40 pm:
> On Mon, Oct 19, 2020 at 02:50:51PM +1000, Nicholas Piggin wrote:
>> Excerpts from Nicholas Piggin's message of October 19, 2020 11:00 am:
>> > Excerpts from Michal Such=C3=A1nek's message of October 17, 2020 6:14 =
am:
>> >> On Mon, Sep 07, 2020 at 11:13:47PM +1000, Nicholas Piggin wrote:
>> >>> Excerpts from Michael Ellerman's message of August 31, 2020 8:50 pm:
>> >>> > Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> >>> >> On Mon, Aug 31, 2020 at 11:14:18AM +1000, Nicholas Piggin wrote:
>> >>> >>> Excerpts from Michal Such=C3=A1nek's message of August 31, 2020 =
6:11 am:
>> >>> >>> > Hello,
>> >>> >>> >=20
>> >>> >>> > on POWER8 KVM hosts lock up since commit 10d91611f426 ("powerp=
c/64s:
>> >>> >>> > Reimplement book3s idle code in C").
>> >>> >>> >=20
>> >>> >>> > The symptom is host locking up completely after some hours of =
KVM
>> >>> >>> > workload with messages like
>> >>> >>> >=20
>> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't =
grab cpu 47
>> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't =
grab cpu 71
>> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't =
grab cpu 47
>> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't =
grab cpu 71
>> >>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't =
grab cpu 47
>> >>> >>> >=20
>> >>> >>> > printed before the host locks up.
>> >>> >>> >=20
>> >>> >>> > The machines run sandboxed builds which is a mixed workload re=
sulting in
>> >>> >>> > IO/single core/mutiple core load over time and there are perio=
ds of no
>> >>> >>> > activity and no VMS runnig as well. The VMs are shortlived so =
VM
>> >>> >>> > setup/terdown is somewhat excercised as well.
>> >>> >>> >=20
>> >>> >>> > POWER9 with the new guest entry fast path does not seem to be =
affected.
>> >>> >>> >=20
>> >>> >>> > Reverted the patch and the followup idle fixes on top of 5.2.1=
4 and
>> >>> >>> > re-applied commit a3f3072db6ca ("powerpc/powernv/idle: Restore=
 IAMR
>> >>> >>> > after idle") which gives same idle code as 5.1.16 and the kern=
el seems
>> >>> >>> > stable.
>> >>> >>> >=20
>> >>> >>> > Config is attached.
>> >>> >>> >=20
>> >>> >>> > I cannot easily revert this commit, especially if I want to us=
e the same
>> >>> >>> > kernel on POWER8 and POWER9 - many of the POWER9 fixes are app=
licable
>> >>> >>> > only to the new idle code.
>> >>> >>> >=20
>> >>> >>> > Any idea what can be the problem?
>> >>> >>>=20
>> >>> >>> So hwthread_state is never getting back to to HWTHREAD_IN_IDLE o=
n
>> >>> >>> those threads. I wonder what they are doing. POWER8 doesn't have=
 a good
>> >>> >>> NMI IPI and I don't know if it supports pdbg dumping registers f=
rom the
>> >>> >>> BMC unfortunately.
>> >>> >>
>> >>> >> It may be possible to set up fadump with a later kernel version t=
hat
>> >>> >> supports it on powernv and dump the whole kernel.
>> >>> >=20
>> >>> > Your firmware won't support it AFAIK.
>> >>> >=20
>> >>> > You could try kdump, but if we have CPUs stuck in KVM then there's=
 a
>> >>> > good chance it won't work :/
>> >>>=20
>> >>> I haven't had any luck yet reproducing this still. Testing with sub=20
>> >>> cores of various different combinations, etc. I'll keep trying thoug=
h.
>> >>=20
>> >> Hello,
>> >>=20
>> >> I tried running some KVM guests to simulate the workload and what I g=
et
>> >> is guests failing to start with a rcu stall. Tried both 5.3 and 5.9
>> >> kernel and qemu 4.2.1 and 5.1.0
>> >>=20
>> >> To start some guests I run
>> >>=20
>> >> for i in $(seq 0 9) ; do /opt/qemu/bin/qemu-system-ppc64 -m 2048 -acc=
el kvm -smp 8 -kernel /boot/vmlinux -initrd /boot/initrd -nodefaults -nogra=
phic -serial mon:telnet::444$i,server,wait & done
>> >>=20
>> >> To simulate some workload I run
>> >>=20
>> >> xz -zc9T0 < /dev/zero > /dev/null &
>> >> while true; do
>> >>     killall -STOP xz; sleep 1; killall -CONT xz; sleep 1;
>> >> done &
>> >>=20
>> >> on the host and add a job that executes this to the ramdisk. However,=
 most
>> >> guests never get to the point where the job is executed.
>> >>=20
>> >> Any idea what might be the problem?
>> >=20
>> > I would say try without pv queued spin locks (but if the same thing is=
=20
>> > happening with 5.3 then it must be something else I guess).=20
>> >=20
>> > I'll try to test a similar setup on a POWER8 here.
>>=20
>> Couldn't reproduce the guest hang, they seem to run fine even with=20
>> queued spinlocks. Might have a different .config.
>>=20
>> I might have got a lockup in the host (although different symptoms than=20
>> the original report). I'll look into that a bit further.
>=20
> Hello,
>=20
> any progress on this?

No progress, I still wasn't able to reproduce, and it fell off the=20
radar sorry.

I expect hwthred_state must be getting corrupted somewhere or a
secondary thread getting stuck but I couldn't see where. I try pick
it up again thanks for the reminder.

Thanks,
Nick
