Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EB647D00A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 11:34:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJqSM2j7Tz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 21:34:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-ipv6.be header.i=@linux-ipv6.be header.a=rsa-sha256 header.s=502B7754-045F-11E5-BBC5-64595FD46BE8 header.b=LtjSdDAW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-ipv6.be (client-ip=51.83.127.189; helo=mail.tintel.eu;
 envelope-from=stijn@linux-ipv6.be; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=linux-ipv6.be header.i=@linux-ipv6.be
 header.a=rsa-sha256 header.s=502B7754-045F-11E5-BBC5-64595FD46BE8
 header.b=LtjSdDAW; dkim-atps=neutral
X-Greylist: delayed 430 seconds by postgrey-1.36 at boromir;
 Wed, 22 Dec 2021 12:28:11 AEDT
Received: from mail.tintel.eu (mail.tintel.eu [51.83.127.189])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJbLN068Jz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 12:28:08 +1100 (AEDT)
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id 4ECC944765F0;
 Wed, 22 Dec 2021 02:20:52 +0100 (CET)
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id du51wOW9K5_c; Wed, 22 Dec 2021 02:20:51 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id 9CA9E447661B;
 Wed, 22 Dec 2021 02:20:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.tintel.eu 9CA9E447661B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-ipv6.be;
 s=502B7754-045F-11E5-BBC5-64595FD46BE8; t=1640136051;
 bh=sgZi3FX1MEN1jsNrcB4hRvGin5TRbonOnvMI4OQeeQY=;
 h=Message-ID:Date:MIME-Version:From:To;
 b=LtjSdDAWslhvch5XHpD7f7d84SrZtUA5aioNVjyI8YHg7imEeYsxgHRJaKuzpKHH3
 AehEKGH/+mOcOwm/W+SQvp8fCviooX3G/R2+jIt8uh4Al6DYWS4ia6xpkI8ffacNwd
 U2rTKyIvGApISBQ1Yj/fzxwbELRlEXvx5hrTAg1A=
X-Virus-Scanned: amavisd-new at mail.tintel.eu
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id W_J_Qe-LSKhs; Wed, 22 Dec 2021 02:20:51 +0100 (CET)
Received: from [10.50.16.10] (ar0.sof.bg.adlevio.net [87.227.188.250])
 (Authenticated sender: stijn@tintel.eu)
 by mail.tintel.eu (Postfix) with ESMTPSA id 67AA244765F0;
 Wed, 22 Dec 2021 02:20:46 +0100 (CET)
Message-ID: <c9abdadc-bc38-dbba-7f96-1ce15db8ab79@linux-ipv6.be>
Date: Wed, 22 Dec 2021 03:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
From: Stijn Tintel <stijn@linux-ipv6.be>
Subject: [BISECTED] power8: watchdog: CPU 3 self-detected hard LOCKUP @
 queued_spin_lock_slowpath+0x154/0x2d0
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Davidlohr Bueso <dbueso@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 22 Dec 2021 21:33:35 +1100
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

Hi,

After upgrading my Power8 server from 5.10 LTS to 5.15 LTS, I started
experiencing CPU hard lockups, usually rather quickly after boot:


watchdog: CPU 3 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x154/0x2d0
watchdog: CPU 3 TB:265651929071, last heartbeat TB:259344820187 (12318ms
ago)
watchdog: CPU 4 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x22c/0x2d0
watchdog: CPU 4 TB:265651929059, last heartbeat TB:259344820045 (12318ms
ago)
watchdog: CPU 5 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 5 TB:265651929037, last heartbeat TB:259349940303 (12308ms
ago)
watchdog: CPU 6 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x144/0x2d0
watchdog: CPU 6 TB:265651929056, last heartbeat TB:259349940294 (12308ms
ago)
watchdog: CPU 12 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x280/0x2d0
watchdog: CPU 12 TB:242479050267, last heartbeat TB:236822174350
(11048ms ago)
watchdog: CPU 26 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x22c/0x2d0
watchdog: CPU 26 TB:265657049348, last heartbeat TB:259355060595
(12308ms ago)
watchdog: CPU 40 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 40 TB:265657049289, last heartbeat TB:259360180427
(12298ms ago)
watchdog: CPU 47 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x21c/0x2d0
watchdog: CPU 47 TB:265657049213, last heartbeat TB:259365300321
(12288ms ago)
watchdog: CPU 60 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 60 TB:265651929348, last heartbeat TB:259370420527
(12268ms ago)
watchdog: CPU 72 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 72 TB:265718488733, last heartbeat TB:259375540545
(12388ms ago)
watchdog: CPU 13 detected hard LOCKUP on other CPUs 0-2,7,10,44
watchdog: CPU 13 TB:267541867921, last SMP heartbeat TB:259380660378
(15939ms ago)
watchdog: CPU 34 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 34 TB:269913954376, last heartbeat TB:263456144470
(12612ms ago)
watchdog: CPU 41 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 41 TB:267865972392, last heartbeat TB:261408162383
(12612ms ago)
watchdog: CPU 74 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 74 TB:267766470637, last heartbeat TB:261423522630
(12388ms ago)
watchdog: CPU 8 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 8 TB:274978264599, last heartbeat TB:269237436681 (11212ms
ago)
watchdog: CPU 9 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 9 TB:268029810836, last heartbeat TB:261397922093 (12952ms
ago)
watchdog: CPU 11 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 11 TB:279685725759, last heartbeat TB:273685814104
(11718ms ago)
watchdog: CPU 16 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 16 TB:267865972449, last heartbeat TB:261397922458
(12632ms ago)
watchdog: CPU 18 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 18 TB:269913954314, last heartbeat TB:263445904285
(12632ms ago)
watchdog: CPU 24 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 24 TB:267865972338, last heartbeat TB:261403042311
(12622ms ago)
watchdog: CPU 31 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x22c/0x2d0
watchdog: CPU 31 TB:268029811095, last heartbeat TB:261403042673
(12942ms ago)
watchdog: CPU 32 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 32 TB:267865972528, last heartbeat TB:261403042589
(12622ms ago)
watchdog: CPU 33 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 33 TB:268029811013, last heartbeat TB:261408162474
(12932ms ago)
watchdog: CPU 35 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 35 TB:280174344471, last heartbeat TB:273696054625
(12652ms ago)
watchdog: CPU 37 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x230/0x2d0
watchdog: CPU 37 TB:269913954356, last heartbeat TB:263456144501
(12612ms ago)
watchdog: CPU 38 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x228/0x2d0
watchdog: CPU 38 TB:290393774681, last heartbeat TB:283946212510
(12592ms ago)

Bisecting lead to the following commit:

deb9b13eb2571fbde164ae012c77985fd14f2f02 is the first bad commit
commit deb9b13eb2571fbde164ae012c77985fd14f2f02
Author: Davidlohr Bueso <dave@stgolabs.net>
Date: =C2=A0=C2=A0Mon Mar 8 17:59:50 2021 -0800

=C2=A0=C2=A0=C2=A0powerpc/qspinlock: Use generic smp_cond_load_relaxed
=C2=A0=C2=A0=C2=A0

The problem persists in 2f47a9a4dfa3674fad19a49b40c5103a9a8e1589 and
goes away if I revert deb9b13eb2571fbde164ae012c77985fd14f2f02 on top of
that. As deb9b13eb2571fbde164ae012c77985fd14f2f02 seems to be a revert
of 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe, I suspect this problem
might have existed before 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe. I
therefore tried to build 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe and
49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe^1 to verify if the problem
exists there as well, unfortunately these commits don't build due to the
following compile error:

kernel/smp.c:In function 'smp_init':
./include/linux/compiler.h:392:38:error: call to
'__compiletime_assert_150' declared with attribute error: BUILD_BUG_ON
failed: offsetof(struct task_struct, wake_entry_type) - offsetof(struct
task_struct, wake_entry) !=3D offsetof(struct __call_single_data, flags) =
-
offsetof(struct __call_single_data, llist)
=C2=A0392 | =C2=A0_compiletime_assert(condition, msg, __compiletime_asser=
t_,
__COUNTER__)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^

Is this report enough to revert deb9b13eb2571fbde164ae012c77985fd14f2f02
for now?

Stijn

