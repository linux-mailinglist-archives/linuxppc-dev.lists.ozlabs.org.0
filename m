Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDF347F2FB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 11:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLgHB2GsBz3bXV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 21:32:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GkLp4gXM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GkLp4gXM; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLgGV0sdWz2ywm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 21:32:00 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id f125so9631065pgc.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 02:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=KN6PIQquCgk03dWkG9XL/kIzWdXLnNmWHChE1GRrZAE=;
 b=GkLp4gXMCdlVzRzp/ktZHR6riB2nIdanwM41i7NhAeDRz/U4ejuds3tqeXlXFCmEBC
 N7DsUhjemU7EB5VU/mKlr6CMTM4Prgnbe3BwbyPhXNNNpPD49lzrAbVTAPDnZCCxp+p3
 PLmz5UFbYnMzcGfUu9h6td9e0SarVArr679wnocDQip7HnPR85x3IesXMUjqmbsvLDpN
 9sTlHua9q23cyKCZAosUOMzejtYi5hNzvpN+2JKKStuHL9tFw7/HMQne/BfXhjxegVqU
 RLFFyO3bWAv7uaEH3Z7L4k4Ruorom7sKpWKpX2Qkf8qAPWZ1RbGH11lhdTLdkDZ0jm//
 fgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=KN6PIQquCgk03dWkG9XL/kIzWdXLnNmWHChE1GRrZAE=;
 b=UZFlZejbGh7R7cGgiXVBKYrIB8WAD/9KBEe+osOgwBzf4UQJkfHbQLPZrPDSxzachq
 xsKTw4qNF1ClSsqDCkPZfSXseHi6ueDjY+TYMvqgwMJFvRXuFqS5PWxmFyPuC8DIVpzk
 wdTFSrzpfXkU1OLFMV8wDDZ9N1B0ViBSmUaZyxGqsx8BOF+EGUhD7jlK0SpvGldqy2yX
 UE05nWV3uyDtU1HUgGOLqSKl/rpCBde0tLT/uPvw9qNOtmH6Hjnr8CdhnqckeiHk1ofO
 73d6HYKj9vu943YGUMM+6+A12lEwKZLHlgTOhqALpmHG2DjW4vBPYOt9fYkU5M1jeqbu
 meHA==
X-Gm-Message-State: AOAM5315rzZAPxV+9/ob6YJf9XkW/Mr3kgqY6lhrWM4mX49mjfydUIJY
 R34UubkAKWh+EJS+nHhfpuM=
X-Google-Smtp-Source: ABdhPJxvyTH+PcEJGwXpy9zyPgomb0JXdQ1sZgBWbC21x8DiYARCWc4SlbwIUmgspEF4kiah7uDFXA==
X-Received: by 2002:a63:43c6:: with SMTP id q189mr9005296pga.424.1640428317079; 
 Sat, 25 Dec 2021 02:31:57 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id x6sm10235097pge.50.2021.12.25.02.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:31:56 -0800 (PST)
Date: Sat, 25 Dec 2021 20:31:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [BISECTED] power8: watchdog: CPU 3 self-detected hard LOCKUP @
 queued_spin_lock_slowpath+0x154/0x2d0
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Davidlohr Bueso <dbueso@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Stijn Tintel <stijn@linux-ipv6.be>
References: <c9abdadc-bc38-dbba-7f96-1ce15db8ab79@linux-ipv6.be>
In-Reply-To: <c9abdadc-bc38-dbba-7f96-1ce15db8ab79@linux-ipv6.be>
MIME-Version: 1.0
Message-Id: <1640427851.k47q6y3qjb.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Stijn Tintel's message of December 22, 2021 11:20 am:
> Hi,
>=20
> After upgrading my Power8 server from 5.10 LTS to 5.15 LTS, I started
> experiencing CPU hard lockups, usually rather quickly after boot:
>=20
>=20
> watchdog: CPU 3 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x154/0x2d0
> watchdog: CPU 3 TB:265651929071, last heartbeat TB:259344820187 (12318ms
> ago)
> watchdog: CPU 4 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x22c/0x2d0
> watchdog: CPU 4 TB:265651929059, last heartbeat TB:259344820045 (12318ms
> ago)
> watchdog: CPU 5 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 5 TB:265651929037, last heartbeat TB:259349940303 (12308ms
> ago)
> watchdog: CPU 6 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x144/0x2d0
> watchdog: CPU 6 TB:265651929056, last heartbeat TB:259349940294 (12308ms
> ago)
> watchdog: CPU 12 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x280/0x2d0
> watchdog: CPU 12 TB:242479050267, last heartbeat TB:236822174350
> (11048ms ago)
> watchdog: CPU 26 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x22c/0x2d0
> watchdog: CPU 26 TB:265657049348, last heartbeat TB:259355060595
> (12308ms ago)
> watchdog: CPU 40 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 40 TB:265657049289, last heartbeat TB:259360180427
> (12298ms ago)
> watchdog: CPU 47 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x21c/0x2d0
> watchdog: CPU 47 TB:265657049213, last heartbeat TB:259365300321
> (12288ms ago)
> watchdog: CPU 60 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 60 TB:265651929348, last heartbeat TB:259370420527
> (12268ms ago)
> watchdog: CPU 72 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 72 TB:265718488733, last heartbeat TB:259375540545
> (12388ms ago)
> watchdog: CPU 13 detected hard LOCKUP on other CPUs 0-2,7,10,44
> watchdog: CPU 13 TB:267541867921, last SMP heartbeat TB:259380660378
> (15939ms ago)
> watchdog: CPU 34 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 34 TB:269913954376, last heartbeat TB:263456144470
> (12612ms ago)
> watchdog: CPU 41 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 41 TB:267865972392, last heartbeat TB:261408162383
> (12612ms ago)
> watchdog: CPU 74 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 74 TB:267766470637, last heartbeat TB:261423522630
> (12388ms ago)
> watchdog: CPU 8 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 8 TB:274978264599, last heartbeat TB:269237436681 (11212ms
> ago)
> watchdog: CPU 9 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 9 TB:268029810836, last heartbeat TB:261397922093 (12952ms
> ago)
> watchdog: CPU 11 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 11 TB:279685725759, last heartbeat TB:273685814104
> (11718ms ago)
> watchdog: CPU 16 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 16 TB:267865972449, last heartbeat TB:261397922458
> (12632ms ago)
> watchdog: CPU 18 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 18 TB:269913954314, last heartbeat TB:263445904285
> (12632ms ago)
> watchdog: CPU 24 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 24 TB:267865972338, last heartbeat TB:261403042311
> (12622ms ago)
> watchdog: CPU 31 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x22c/0x2d0
> watchdog: CPU 31 TB:268029811095, last heartbeat TB:261403042673
> (12942ms ago)
> watchdog: CPU 32 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 32 TB:267865972528, last heartbeat TB:261403042589
> (12622ms ago)
> watchdog: CPU 33 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 33 TB:268029811013, last heartbeat TB:261408162474
> (12932ms ago)
> watchdog: CPU 35 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 35 TB:280174344471, last heartbeat TB:273696054625
> (12652ms ago)
> watchdog: CPU 37 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x230/0x2d0
> watchdog: CPU 37 TB:269913954356, last heartbeat TB:263456144501
> (12612ms ago)
> watchdog: CPU 38 self-detected hard LOCKUP @
> queued_spin_lock_slowpath+0x228/0x2d0
> watchdog: CPU 38 TB:290393774681, last heartbeat TB:283946212510
> (12592ms ago)
>=20
> Bisecting lead to the following commit:
>=20
> deb9b13eb2571fbde164ae012c77985fd14f2f02 is the first bad commit
> commit deb9b13eb2571fbde164ae012c77985fd14f2f02
> Author: Davidlohr Bueso <dave@stgolabs.net>
> Date: =C2=A0=C2=A0Mon Mar 8 17:59:50 2021 -0800
>=20
> =C2=A0=C2=A0=C2=A0powerpc/qspinlock: Use generic smp_cond_load_relaxed

Thanks for bisecting and reporting this.

As far as I can see, the code should be functionally identical,
the difference is slightly in loop structure and priority nops
but that shouldn't cause complete lock ups.

I suspect possibly something is getting miscompiled. What distro
do you use, what gcc version? And would you be able to send the
output of objdump --disassemble=3Dqueued_spin_lock_slowpath vmlinux
for your bad kernel?

Thanks,
Nick

> =C2=A0=C2=A0=C2=A0
>=20
> The problem persists in 2f47a9a4dfa3674fad19a49b40c5103a9a8e1589 and
> goes away if I revert deb9b13eb2571fbde164ae012c77985fd14f2f02 on top of
> that. As deb9b13eb2571fbde164ae012c77985fd14f2f02 seems to be a revert
> of 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe, I suspect this problem
> might have existed before 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe. I
> therefore tried to build 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe and
> 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe^1 to verify if the problem
> exists there as well, unfortunately these commits don't build due to the
> following compile error:
>=20
> kernel/smp.c:In function 'smp_init':
> ./include/linux/compiler.h:392:38:error: call to
> '__compiletime_assert_150' declared with attribute error: BUILD_BUG_ON
> failed: offsetof(struct task_struct, wake_entry_type) - offsetof(struct
> task_struct, wake_entry) !=3D offsetof(struct __call_single_data, flags) =
-
> offsetof(struct __call_single_data, llist)
> =C2=A0392 | =C2=A0_compiletime_assert(condition, msg, __compiletime_asser=
t_,
> __COUNTER__)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
>=20
> Is this report enough to revert deb9b13eb2571fbde164ae012c77985fd14f2f02
> for now?
>=20
> Stijn
>=20
>=20
