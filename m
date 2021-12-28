Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B089C481A91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 08:58:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPgdR483Zz2ygC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 18:58:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-ipv6.be header.i=@linux-ipv6.be header.a=rsa-sha256 header.s=502B7754-045F-11E5-BBC5-64595FD46BE8 header.b=GflGRvJy;
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
 header.b=GflGRvJy; dkim-atps=neutral
Received: from mail.tintel.eu (mail.tintel.eu [51.83.127.189])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNT056tSBz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 19:55:48 +1100 (AEDT)
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id EFDE34473704;
 Tue, 28 Dec 2021 09:55:41 +0100 (CET)
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id OuqZUjR7-cqE; Tue, 28 Dec 2021 09:55:40 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id 267484473707;
 Tue, 28 Dec 2021 09:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.tintel.eu 267484473707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-ipv6.be;
 s=502B7754-045F-11E5-BBC5-64595FD46BE8; t=1640681740;
 bh=qqrYeFs4BV3Anunx3h3LfJVIUlx12qlDdLD4CH9dj3U=;
 h=Message-ID:Date:MIME-Version:From:To;
 b=GflGRvJyOGTJoSPF0IO3t3T5H2ZsWbwek8uLXhdFIBY4Ne/OC42fT8mon3vgSCeL/
 wVQhm1H9tC+yoC1nOqV63uPyAWkGl5LK7DAQtaayHrU8RRdma3i6McpEcyOQURJ/WO
 BzLx7FtOMvGdcCTnTLwH/d4XmD97Z0lCbUNXCFK4=
X-Virus-Scanned: amavisd-new at mail.tintel.eu
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id azqTXl09mnNf; Tue, 28 Dec 2021 09:55:40 +0100 (CET)
Received: from [172.16.3.230] (unknown [213.222.45.238])
 (Authenticated sender: stijn@tintel.eu)
 by mail.tintel.eu (Postfix) with ESMTPSA id C70174473704;
 Tue, 28 Dec 2021 09:55:34 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------0ENhQImFm0ohq5vyvwvxz775"
Message-ID: <19581339-a081-8135-2879-c4fab06ecefc@linux-ipv6.be>
Date: Tue, 28 Dec 2021 10:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Stijn Tintel <stijn@linux-ipv6.be>
Subject: Re: [BISECTED] power8: watchdog: CPU 3 self-detected hard LOCKUP @
 queued_spin_lock_slowpath+0x154/0x2d0
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Davidlohr Bueso <dbueso@suse.de>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <c9abdadc-bc38-dbba-7f96-1ce15db8ab79@linux-ipv6.be>
 <1640427851.k47q6y3qjb.astroid@bobo.none>
Content-Language: en-US
In-Reply-To: <1640427851.k47q6y3qjb.astroid@bobo.none>
X-Mailman-Approved-At: Thu, 30 Dec 2021 18:58:16 +1100
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

This is a multi-part message in MIME format.
--------------0ENhQImFm0ohq5vyvwvxz775
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 25/12/2021 12:31, Nicholas Piggin wrote:
> Excerpts from Stijn Tintel's message of December 22, 2021 11:20 am:
>> Hi,
>>
>> After upgrading my Power8 server from 5.10 LTS to 5.15 LTS, I started
>> experiencing CPU hard lockups, usually rather quickly after boot:
>>
>>
>> watchdog: CPU 3 self-detected hard LOCKUP @
>> queued_spin_lock_slowpath+0x154/0x2d0
>> watchdog: CPU 3 TB:265651929071, last heartbeat TB:259344820187 (12318=
ms
>> ago)
snip
>> Bisecting lead to the following commit:
>>
>> deb9b13eb2571fbde164ae012c77985fd14f2f02 is the first bad commit
>> commit deb9b13eb2571fbde164ae012c77985fd14f2f02
>> Author: Davidlohr Bueso<dave@stgolabs.net>
>> Date: =C2=A0=C2=A0Mon Mar 8 17:59:50 2021 -0800
>>
>>  =C2=A0=C2=A0=C2=A0powerpc/qspinlock: Use generic smp_cond_load_relaxe=
d
> Thanks for bisecting and reporting this.
Thanks for your response, much appreciated.
> As far as I can see, the code should be functionally identical,
> the difference is slightly in loop structure and priority nops
> but that shouldn't cause complete lock ups.
>
> I suspect possibly something is getting miscompiled. What distro
> do you use, what gcc version? And would you be able to send the
> output of objdump --disassemble=3Dqueued_spin_lock_slowpath vmlinux
> for your bad kernel?
>
Gentoo hardened musl, both gcc 10.3.0 and 11.2.0 exhibit the lockups.

/boot/disable/vmlinuz-5.12.0-rc3-ppc64le-00024-gdeb9b13eb257: =C2=A0=C2=A0=
=C2=A0=C2=A0file=20
format elf64-powerpcle


Disassembly of section .head.text:

Disassembly of section .text:

c00000000010d0d4 <queued_spin_lock_slowpath>:
c00000000010d0d4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e9 00 4c 3c =C2=A0=C2=
=A0=C2=A0=C2=A0addis =C2=A0=C2=A0r2,r12,233
c00000000010d0d8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c f3 42 38 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r2,r2,-3284
c00000000010d0dc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 01 04 28 =C2=A0=C2=
=A0=C2=A0=C2=A0cmplwi =C2=A0r4,256
c00000000010d0e0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 00 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d10c=20
<queued_spin_lock_slowpath+0x38>
c00000000010d0e4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 02 20 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,513
c00000000010d0e8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0a6 03 29 7d =C2=A0=C2=
=A0=C2=A0=C2=A0mtctr =C2=A0=C2=A0r9
c00000000010d0ec: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A002 00 83 e8 =C2=A0=C2=
=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r4,0(r3)
c00000000010d0f0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 01 04 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r4,256
c00000000010d0f4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A014 00 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d108=20
<queued_spin_lock_slowpath+0x34>
c00000000010d0f8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 40 42 =C2=A0=C2=
=A0=C2=A0=C2=A0bdz =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d108=20
<queued_spin_lock_slowpath+0x34>
c00000000010d0fc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
c00000000010d100: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
c00000000010d104: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e8 ff ff 4b =C2=A0=C2=
=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c00000000010d0ec=20
<queued_spin_lock_slowpath+0x18>
c00000000010d108: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 84 78 =C2=A0=C2=
=A0=C2=A0=C2=A0clrldi =C2=A0r4,r4,32
c00000000010d10c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 00 84 54 =C2=A0=C2=
=A0=C2=A0=C2=A0rlwinm =C2=A0r4,r4,0,0,23
c00000000010d110: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 04 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r4,0
c00000000010d114: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A038 00 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d14c=20
<queued_spin_lock_slowpath+0x78>
c00000000010d118: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 01 40 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r10,256
c00000000010d11c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 18 20 7d =C2=A0=C2=
=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r9,0,r3
c00000000010d120: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 4b 48 7d =C2=A0=C2=
=A0=C2=A0=C2=A0or =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,r10,r9
c00000000010d124: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 19 00 7d =C2=A0=C2=
=A0=C2=A0=C2=A0stwcx. =C2=A0r8,0,r3
c00000000010d128: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f4 ff c2 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d11c=20
<queued_spin_lock_slowpath+0x48>
c00000000010d12c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 01 00 4c =C2=A0=C2=
=A0=C2=A0=C2=A0isync
c00000000010d130: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 00 28 55 =C2=A0=C2=
=A0=C2=A0=C2=A0rlwinm =C2=A0r8,r9,0,0,23
c00000000010d134: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 2a 79 =C2=A0=C2=
=A0=C2=A0=C2=A0clrldi =C2=A0r10,r9,32
c00000000010d138: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 08 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r8,0
c00000000010d13c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 00 82 41 =C2=A0=C2=
=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d220=20
<queued_spin_lock_slowpath+0x14c>
c00000000010d140: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 ff 29 71 =C2=A0=C2=
=A0=C2=A0=C2=A0andi. =C2=A0=C2=A0r9,r9,65280
c00000000010d144: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A008 00 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d14c=20
<queued_spin_lock_slowpath+0x78>
c00000000010d148: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 23 99 =C2=A0=C2=
=A0=C2=A0=C2=A0stb =C2=A0=C2=A0=C2=A0=C2=A0r9,1(r3)
c00000000010d14c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 00 2d e9 =C2=A0=C2=
=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,40(r13)
c00000000010d150: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cf ff 42 3d =C2=A0=C2=
=A0=C2=A0=C2=A0addis =C2=A0=C2=A0r10,r2,-49
c00000000010d154: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 00 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,1
c00000000010d158: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A080 15 4a 39 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r10,r10,5504
c00000000010d15c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 53 46 7d =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r6,r10
c00000000010d160: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A014 4a c6 7c =C2=A0=C2=
=A0=C2=A0=C2=A0add =C2=A0=C2=A0=C2=A0=C2=A0r6,r6,r9
c00000000010d164: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00e 00 26 e9 =C2=A0=C2=
=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r9,12(r6)
c00000000010d168: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 e9 38 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r7,r9,1
c00000000010d16c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A003 00 09 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r9,3
c00000000010d170: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00c 00 e6 90 =C2=A0=C2=
=A0=C2=A0=C2=A0stw =C2=A0=C2=A0=C2=A0=C2=A0r7,12(r6)
c00000000010d174: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 ed a0 =C2=A0=C2=
=A0=C2=A0=C2=A0lhz =C2=A0=C2=A0=C2=A0=C2=A0r7,0(r13)
c00000000010d178: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 00 81 41 =C2=A0=C2=
=A0=C2=A0=C2=A0bgt =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d25c=20
<queued_spin_lock_slowpath+0x188>
c00000000010d17c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 26 20 79 =C2=A0=C2=
=A0=C2=A0=C2=A0rldicr =C2=A0r0,r9,4,59
c00000000010d180: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A014 02 66 7d =C2=A0=C2=
=A0=C2=A0=C2=A0add =C2=A0=C2=A0=C2=A0=C2=A0r11,r6,r0
c00000000010d184: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 00 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,0
c00000000010d188: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A008 00 0b 91 =C2=A0=C2=
=A0=C2=A0=C2=A0stw =C2=A0=C2=A0=C2=A0=C2=A0r8,8(r11)
c00000000010d18c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 00 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,0
c00000000010d190: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02a 01 06 7d =C2=A0=C2=
=A0=C2=A0=C2=A0stdx =C2=A0=C2=A0=C2=A0r8,r6,r0
c00000000010d194: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 03 81 =C2=A0=C2=
=A0=C2=A0=C2=A0lwz =C2=A0=C2=A0=C2=A0=C2=A0r8,0(r3)
c00000000010d198: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b5 07 08 7d =C2=A0=C2=
=A0=C2=A0=C2=A0extsw. =C2=A0r8,r8
c00000000010d19c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A004 01 82 41 =C2=A0=C2=
=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d2a0=20
<queued_spin_lock_slowpath+0x1cc>
c00000000010d1a0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 e7 38 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r7,r7,1
c00000000010d1a4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01e 80 29 55 =C2=A0=C2=
=A0=C2=A0=C2=A0rlwinm =C2=A0r9,r9,16,0,15
c00000000010d1a8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f8 ff e1 fb =C2=A0=C2=
=A0=C2=A0=C2=A0std =C2=A0=C2=A0=C2=A0=C2=A0r31,-8(r1)
c00000000010d1ac: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01a 90 e7 54 =C2=A0=C2=
=A0=C2=A0=C2=A0rlwinm =C2=A0r7,r7,18,0,13
c00000000010d1b0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 3b 27 7d =C2=A0=C2=
=A0=C2=A0=C2=A0or =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r7,r9,r7
c00000000010d1b4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c =C2=A0=C2=
=A0=C2=A0=C2=A0lwsync
c00000000010d1b8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 80 38 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r4,0
c00000000010d1bc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A002 00 03 39 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r8,r3,2
c00000000010d1c0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f8 1e 0c 55 =C2=A0=C2=
=A0=C2=A0=C2=A0rlwinm =C2=A0r12,r8,3,27,28
c00000000010d1c4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03e 84 e5 54 =C2=A0=C2=
=A0=C2=A0=C2=A0rlwinm =C2=A0r5,r7,16,16,31
c00000000010d1c8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ff ff 84 60 =C2=A0=C2=
=A0=C2=A0=C2=A0ori =C2=A0=C2=A0=C2=A0=C2=A0r4,r4,65535
c00000000010d1cc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A064 07 08 79 =C2=A0=C2=
=A0=C2=A0=C2=A0rldicr =C2=A0r8,r8,0,61
c00000000010d1d0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A030 60 a5 7c =C2=A0=C2=
=A0=C2=A0=C2=A0slw =C2=A0=C2=A0=C2=A0=C2=A0r5,r5,r12
c00000000010d1d4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A030 60 84 7c =C2=A0=C2=
=A0=C2=A0=C2=A0slw =C2=A0=C2=A0=C2=A0=C2=A0r4,r4,r12
c00000000010d1d8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 40 20 7d =C2=A0=C2=
=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r9,0,r8
c00000000010d1dc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 20 3f 7d =C2=A0=C2=
=A0=C2=A0=C2=A0andc =C2=A0=C2=A0=C2=A0r31,r9,r4
c00000000010d1e0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 2b ff 7f =C2=A0=C2=
=A0=C2=A0=C2=A0or =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r31,r31,r5
c00000000010d1e4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 41 e0 7f =C2=A0=C2=
=A0=C2=A0=C2=A0stwcx. =C2=A0r31,0,r8
c00000000010d1e8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff c2 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d1d8=20
<queued_spin_lock_slowpath+0x104>
c00000000010d1ec: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A030 64 29 7d =C2=A0=C2=
=A0=C2=A0=C2=A0srw =C2=A0=C2=A0=C2=A0=C2=A0r9,r9,r12
c00000000010d1f0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A029 80 25 79 =C2=A0=C2=
=A0=C2=A0=C2=A0rldic. =C2=A0r5,r9,16,32
c00000000010d1f4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01e 80 28 55 =C2=A0=C2=
=A0=C2=A0=C2=A0rlwinm =C2=A0r8,r9,16,0,15
c00000000010d1f8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d0 00 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d2c8=20
<queued_spin_lock_slowpath+0x1f4>
c00000000010d1fc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 20 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,0
c00000000010d200: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A002 00 c3 e8 =C2=A0=C2=
=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r6,0(r3)
c00000000010d204: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 03 81 =C2=A0=C2=
=A0=C2=A0=C2=A0lwz =C2=A0=C2=A0=C2=A0=C2=A0r8,0(r3)
c00000000010d208: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03e 04 05 55 =C2=A0=C2=
=A0=C2=A0=C2=A0clrlwi =C2=A0r5,r8,16
c00000000010d20c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 05 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r5,0
c00000000010d210: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 01 82 41 =C2=A0=C2=
=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d320=20
<queued_spin_lock_slowpath+0x24c>
c00000000010d214: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
c00000000010d218: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
c00000000010d21c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 ff ff 4b =C2=A0=C2=
=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c00000000010d200=20
<queued_spin_lock_slowpath+0x12c>
c00000000010d220: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 2a 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r10,0
c00000000010d224: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A024 00 82 41 =C2=A0=C2=
=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d248=20
<queued_spin_lock_slowpath+0x174>
c00000000010d228: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A002 00 23 e9 =C2=A0=C2=
=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r9,0(r3)
c00000000010d22c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03e 06 29 55 =C2=A0=C2=
=A0=C2=A0=C2=A0clrlwi =C2=A0r9,r9,24
c00000000010d230: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 09 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r9,0
c00000000010d234: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 82 41 =C2=A0=C2=
=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d244=20
<queued_spin_lock_slowpath+0x170>
c00000000010d238: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
c00000000010d23c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
c00000000010d240: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e8 ff ff 4b =C2=A0=C2=
=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c00000000010d228=20
<queued_spin_lock_slowpath+0x154>
c00000000010d244: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c =C2=A0=C2=
=A0=C2=A0=C2=A0lwsync
c00000000010d248: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 20 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,1
c00000000010d24c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 23 b1 =C2=A0=C2=
=A0=C2=A0=C2=A0sth =C2=A0=C2=A0=C2=A0=C2=A0r9,0(r3)
c00000000010d250: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 80 4e =C2=A0=C2=
=A0=C2=A0=C2=A0blr
c00000000010d254: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
c00000000010d258: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
c00000000010d25c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 23 81 =C2=A0=C2=
=A0=C2=A0=C2=A0lwz =C2=A0=C2=A0=C2=A0=C2=A0r9,0(r3)
c00000000010d260: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b5 07 29 7d =C2=A0=C2=
=A0=C2=A0=C2=A0extsw. =C2=A0r9,r9
c00000000010d264: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d254=20
<queued_spin_lock_slowpath+0x180>
c00000000010d268: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 18 e0 7c =C2=A0=C2=
=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r7,0,r3
c00000000010d26c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 48 07 7c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r7,r9
c00000000010d270: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 c2 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d280=20
<queued_spin_lock_slowpath+0x1ac>
c00000000010d274: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 19 00 7d =C2=A0=C2=
=A0=C2=A0=C2=A0stwcx. =C2=A0r8,0,r3
c00000000010d278: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff c2 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d268=20
<queued_spin_lock_slowpath+0x194>
c00000000010d27c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 01 00 4c =C2=A0=C2=
=A0=C2=A0=C2=A0isync
c00000000010d280: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 07 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r7,0
c00000000010d284: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d0 ff 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d254=20
<queued_spin_lock_slowpath+0x180>
c00000000010d288: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 00 0d e9 =C2=A0=C2=
=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,40(r13)
c00000000010d28c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00c 00 2a 39 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r9,r10,12
c00000000010d290: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 40 49 7d =C2=A0=C2=
=A0=C2=A0=C2=A0lwzx =C2=A0=C2=A0=C2=A0r10,r9,r8
c00000000010d294: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ff ff 4a 39 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r10,r10,-1
c00000000010d298: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 41 49 7d =C2=A0=C2=
=A0=C2=A0=C2=A0stwx =C2=A0=C2=A0=C2=A0r10,r9,r8
c00000000010d29c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 80 4e =C2=A0=C2=
=A0=C2=A0=C2=A0blr
c00000000010d2a0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 a0 38 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r5,1
c00000000010d2a4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 18 80 7c =C2=A0=C2=
=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r4,0,r3
c00000000010d2a8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 40 04 7c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r4,r8
c00000000010d2ac: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 c2 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d2bc=20
<queued_spin_lock_slowpath+0x1e8>
c00000000010d2b0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 19 a0 7c =C2=A0=C2=
=A0=C2=A0=C2=A0stwcx. =C2=A0r5,0,r3
c00000000010d2b4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff c2 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d2a4=20
<queued_spin_lock_slowpath+0x1d0>
c00000000010d2b8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 01 00 4c =C2=A0=C2=
=A0=C2=A0=C2=A0isync
c00000000010d2bc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 04 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r4,0
c00000000010d2c0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c8 ff 82 41 =C2=A0=C2=
=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d288=20
<queued_spin_lock_slowpath+0x1b4>
c00000000010d2c4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dc fe ff 4b =C2=A0=C2=
=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c00000000010d1a0=20
<queued_spin_lock_slowpath+0xcc>
c00000000010d2c8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0be 74 08 55 =C2=A0=C2=
=A0=C2=A0=C2=A0rlwinm =C2=A0r8,r8,14,18,31
c00000000010d2cc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A004 00 a2 3c =C2=A0=C2=
=A0=C2=A0=C2=A0addis =C2=A0=C2=A0r5,r2,4
c00000000010d2d0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 cf a5 38 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r5,r5,-12304
c00000000010d2d4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0a8 26 29 79 =C2=A0=C2=
=A0=C2=A0=C2=A0rldic =C2=A0=C2=A0r9,r9,4,58
c00000000010d2d8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ff ff 08 39 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r8,r8,-1
c00000000010d2dc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A014 4a 2a 7d =C2=A0=C2=
=A0=C2=A0=C2=A0add =C2=A0=C2=A0=C2=A0=C2=A0r9,r10,r9
c00000000010d2e0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b4 07 08 7d =C2=A0=C2=
=A0=C2=A0=C2=A0extsw =C2=A0=C2=A0r8,r8
c00000000010d2e4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A024 1f 08 79 =C2=A0=C2=
=A0=C2=A0=C2=A0rldicr =C2=A0r8,r8,3,60
c00000000010d2e8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02a 40 05 7d =C2=A0=C2=
=A0=C2=A0=C2=A0ldx =C2=A0=C2=A0=C2=A0=C2=A0r8,r5,r8
c00000000010d2ec: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02a 41 69 7d =C2=A0=C2=
=A0=C2=A0=C2=A0stdx =C2=A0=C2=A0=C2=A0r11,r9,r8
c00000000010d2f0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00a 00 2b e9 =C2=A0=C2=
=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r9,8(r11)
c00000000010d2f4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 29 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r9,0
c00000000010d2f8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d308=20
<queued_spin_lock_slowpath+0x234>
c00000000010d2fc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
c00000000010d300: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
c00000000010d304: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ec ff ff 4b =C2=A0=C2=
=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c00000000010d2f0=20
<queued_spin_lock_slowpath+0x21c>
c00000000010d308: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c =C2=A0=C2=
=A0=C2=A0=C2=A0lwsync
c00000000010d30c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02a 00 26 7d =C2=A0=C2=
=A0=C2=A0=C2=A0ldx =C2=A0=C2=A0=C2=A0=C2=A0r9,r6,r0
c00000000010d310: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 29 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r9,0
c00000000010d314: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ec fe 82 41 =C2=A0=C2=
=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d200=20
<queued_spin_lock_slowpath+0x12c>
c00000000010d318: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ec 49 00 7c =C2=A0=C2=
=A0=C2=A0=C2=A0dcbtstct 0,r9
c00000000010d31c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 fe ff 4b =C2=A0=C2=
=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c00000000010d200=20
<queued_spin_lock_slowpath+0x12c>
c00000000010d320: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c =C2=A0=C2=
=A0=C2=A0=C2=A0lwsync
c00000000010d324: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01e 00 08 55 =C2=A0=C2=
=A0=C2=A0=C2=A0rlwinm =C2=A0r8,r8,0,0,15
c00000000010d328: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 38 08 7c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r8,r7
c00000000010d32c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 00 82 41 =C2=A0=C2=
=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d358=20
<queued_spin_lock_slowpath+0x284>
c00000000010d330: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 29 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r9,0
c00000000010d334: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 00 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,1
c00000000010d338: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 03 99 =C2=A0=C2=
=A0=C2=A0=C2=A0stb =C2=A0=C2=A0=C2=A0=C2=A0r8,0(r3)
c00000000010d33c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A058 00 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d394=20
<queued_spin_lock_slowpath+0x2c0>
c00000000010d340: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 2b e9 =C2=A0=C2=
=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,0(r11)
c00000000010d344: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 29 2c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r9,0
c00000000010d348: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04c 00 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d394=20
<queued_spin_lock_slowpath+0x2c0>
c00000000010d34c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
c00000000010d350: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c =C2=A0=C2=
=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
c00000000010d354: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ec ff ff 4b =C2=A0=C2=
=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c00000000010d340=20
<queued_spin_lock_slowpath+0x26c>
c00000000010d358: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 00 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,1
c00000000010d35c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 18 e0 7c =C2=A0=C2=
=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r7,0,r3
c00000000010d360: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 30 07 7c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r7,r6
c00000000010d364: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00c 00 c2 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d370=20
<queued_spin_lock_slowpath+0x29c>
c00000000010d368: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 19 00 7d =C2=A0=C2=
=A0=C2=A0=C2=A0stwcx. =C2=A0r8,0,r3
c00000000010d36c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff c2 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d35c=20
<queued_spin_lock_slowpath+0x288>
c00000000010d370: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 38 06 7c =C2=A0=C2=
=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r6,r7
c00000000010d374: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bc ff 82 40 =C2=A0=C2=
=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d330=20
<queued_spin_lock_slowpath+0x25c>
c00000000010d378: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 00 0d e9 =C2=A0=C2=
=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,40(r13)
c00000000010d37c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00c 00 2a 39 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r9,r10,12
c00000000010d380: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 40 49 7d =C2=A0=C2=
=A0=C2=A0=C2=A0lwzx =C2=A0=C2=A0=C2=A0r10,r9,r8
c00000000010d384: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ff ff 4a 39 =C2=A0=C2=
=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r10,r10,-1
c00000000010d388: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 41 49 7d =C2=A0=C2=
=A0=C2=A0=C2=A0stwx =C2=A0=C2=A0=C2=A0r10,r9,r8
c00000000010d38c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f8 ff e1 eb =C2=A0=C2=
=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r31,-8(r1)
c00000000010d390: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 80 4e =C2=A0=C2=
=A0=C2=A0=C2=A0blr
c00000000010d394: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c =C2=A0=C2=
=A0=C2=A0=C2=A0lwsync
c00000000010d398: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 00 39 =C2=A0=C2=
=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,1
c00000000010d39c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A008 00 09 91 =C2=A0=C2=
=A0=C2=A0=C2=A0stw =C2=A0=C2=A0=C2=A0=C2=A0r8,8(r9)
c00000000010d3a0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d8 ff ff 4b =C2=A0=C2=
=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c00000000010d378=20
<queued_spin_lock_slowpath+0x2a4>

Disassembly of section .init.text:

Disassembly of section .exit.text:

>
>>    =20
>>
>> The problem persists in 2f47a9a4dfa3674fad19a49b40c5103a9a8e1589 and
>> goes away if I revert deb9b13eb2571fbde164ae012c77985fd14f2f02 on top =
of
>> that. As deb9b13eb2571fbde164ae012c77985fd14f2f02 seems to be a revert
>> of 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe, I suspect this problem
>> might have existed before 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe. I
>> therefore tried to build 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe and
>> 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe^1 to verify if the problem
>> exists there as well, unfortunately these commits don't build due to t=
he
>> following compile error:
>>
>> kernel/smp.c:In function 'smp_init':
>> ./include/linux/compiler.h:392:38:error: call to
>> '__compiletime_assert_150' declared with attribute error: BUILD_BUG_ON
>> failed: offsetof(struct task_struct, wake_entry_type) - offsetof(struc=
t
>> task_struct, wake_entry) !=3D offsetof(struct __call_single_data, flag=
s) -
>> offsetof(struct __call_single_data, llist)
>>  =C2=A0392 | =C2=A0_compiletime_assert(condition, msg, __compiletime_a=
ssert_,
>> __COUNTER__)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
>>
Switching from gcc 10.3.0 to gcc 11.2.0 made the above compile error go=20
away, and as expected, 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe boots=20
fine and 49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe^1 exhibits the same=20
problem. I started bisecting the 2nd part but I'll pause that effort for=20
now.

Thanks,
Stijn

--------------0ENhQImFm0ohq5vyvwvxz775
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 25/12/2021 12:31, Nicholas Piggin
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:1640427851.k47q6y3qjb.astroid@bobo.none">
      <pre class=3D"moz-quote-pre" wrap=3D"">Excerpts from Stijn Tintel's=
 message of December 22, 2021 11:20 am:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Hi,

After upgrading my Power8 server from 5.10 LTS to 5.15 LTS, I started
experiencing CPU hard lockups, usually rather quickly after boot:


watchdog: CPU 3 self-detected hard LOCKUP @
queued_spin_lock_slowpath+0x154/0x2d0
watchdog: CPU 3 TB:265651929071, last heartbeat TB:259344820187 (12318ms
ago)
</pre>
      </blockquote>
    </blockquote>
    snip<br>
    <blockquote type=3D"cite"
      cite=3D"mid:1640427851.k47q6y3qjb.astroid@bobo.none">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Bisecting lead to the foll=
owing commit:

deb9b13eb2571fbde164ae012c77985fd14f2f02 is the first bad commit
commit deb9b13eb2571fbde164ae012c77985fd14f2f02
Author: Davidlohr Bueso <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:dave@stgolabs.net">&lt;dave@stgolabs.net&gt;</a>
Date: =C2=A0=C2=A0Mon Mar 8 17:59:50 2021 -0800

=C2=A0=C2=A0=C2=A0powerpc/qspinlock: Use generic smp_cond_load_relaxed
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Thanks for bisecting and rep=
orting this.</pre>
    </blockquote>
    Thanks for your response, much appreciated.
    <blockquote type=3D"cite"
      cite=3D"mid:1640427851.k47q6y3qjb.astroid@bobo.none">
      <pre class=3D"moz-quote-pre" wrap=3D"">As far as I can see, the cod=
e should be functionally identical,
the difference is slightly in loop structure and priority nops
but that shouldn't cause complete lock ups.

I suspect possibly something is getting miscompiled. What distro
do you use, what gcc version? And would you be able to send the
output of objdump --disassemble=3Dqueued_spin_lock_slowpath vmlinux
for your bad kernel?

</pre>
    </blockquote>
    <p>Gentoo hardened musl, both gcc 10.3.0 and 11.2.0 exhibit the
      lockups.</p>
    <p><span style=3D"font-family:monospace"><span
          style=3D"color:#000000;background-color:#ffffff;">/boot/disable=
/vmlinuz-5.12.0-rc3-ppc64le-00024-gdeb9b13eb257:
          =C2=A0=C2=A0=C2=A0=C2=A0file format elf64-powerpcle
        </span><br>
        <br>
        <br>
        Disassembly of section .head.text:
        <br>
        <br>
        Disassembly of section .text:
        <br>
        <br>
        c00000000010d0d4 &lt;queued_spin_lock_slowpath&gt;:
        <br>
        c00000000010d0d4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e9 00 4c 3c=
 =C2=A0=C2=A0=C2=A0=C2=A0addis =C2=A0=C2=A0r2,r12,233
        <br>
        c00000000010d0d8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c f3 42 38=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r2,r2,-3284
        <br>
        c00000000010d0dc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 01 04 28=
 =C2=A0=C2=A0=C2=A0=C2=A0cmplwi =C2=A0r4,256
        <br>
        c00000000010d0e0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 00 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d10c
        &lt;queued_spin_lock_slowpath+0x38&gt;
        <br>
        c00000000010d0e4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 02 20 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,513
        <br>
        c00000000010d0e8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0a6 03 29 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0mtctr =C2=A0=C2=A0r9
        <br>
        c00000000010d0ec: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A002 00 83 e8=
 =C2=A0=C2=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r4,0(r3)
        <br>
        c00000000010d0f0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 01 04 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r4,256
        <br>
        c00000000010d0f4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A014 00 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d108
        &lt;queued_spin_lock_slowpath+0x34&gt;
        <br>
        c00000000010d0f8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 40 42=
 =C2=A0=C2=A0=C2=A0=C2=A0bdz =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d108
        &lt;queued_spin_lock_slowpath+0x34&gt;
        <br>
        c00000000010d0fc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
        <br>
        c00000000010d100: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
        <br>
        c00000000010d104: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e8 ff ff 4b=
 =C2=A0=C2=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c000000000=
10d0ec
        &lt;queued_spin_lock_slowpath+0x18&gt;
        <br>
        c00000000010d108: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 84 78=
 =C2=A0=C2=A0=C2=A0=C2=A0clrldi =C2=A0r4,r4,32
        <br>
        c00000000010d10c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 00 84 54=
 =C2=A0=C2=A0=C2=A0=C2=A0rlwinm =C2=A0r4,r4,0,0,23
        <br>
        c00000000010d110: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 04 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r4,0
        <br>
        c00000000010d114: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A038 00 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d14c
        &lt;queued_spin_lock_slowpath+0x78&gt;
        <br>
        c00000000010d118: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 01 40 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r10,256
        <br>
        c00000000010d11c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 18 20 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r9,0,r3
        <br>
        c00000000010d120: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 4b 48 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0or =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,r10,r9
        <br>
        c00000000010d124: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 19 00 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0stwcx. =C2=A0r8,0,r3
        <br>
        c00000000010d128: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f4 ff c2 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d11c
        &lt;queued_spin_lock_slowpath+0x48&gt;
        <br>
        c00000000010d12c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 01 00 4c=
 =C2=A0=C2=A0=C2=A0=C2=A0isync
        <br>
        c00000000010d130: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 00 28 55=
 =C2=A0=C2=A0=C2=A0=C2=A0rlwinm =C2=A0r8,r9,0,0,23
        <br>
        c00000000010d134: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 2a 79=
 =C2=A0=C2=A0=C2=A0=C2=A0clrldi =C2=A0r10,r9,32
        <br>
        c00000000010d138: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 08 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r8,0
        <br>
        c00000000010d13c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 00 82 41=
 =C2=A0=C2=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d220
        &lt;queued_spin_lock_slowpath+0x14c&gt;
        <br>
        c00000000010d140: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 ff 29 71=
 =C2=A0=C2=A0=C2=A0=C2=A0andi. =C2=A0=C2=A0r9,r9,65280
        <br>
        c00000000010d144: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A008 00 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d14c
        &lt;queued_spin_lock_slowpath+0x78&gt;
        <br>
        c00000000010d148: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 23 99=
 =C2=A0=C2=A0=C2=A0=C2=A0stb =C2=A0=C2=A0=C2=A0=C2=A0r9,1(r3)
        <br>
        c00000000010d14c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 00 2d e9=
 =C2=A0=C2=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,40(r13)
        <br>
        c00000000010d150: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cf ff 42 3d=
 =C2=A0=C2=A0=C2=A0=C2=A0addis =C2=A0=C2=A0r10,r2,-49
        <br>
        c00000000010d154: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 00 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,1
        <br>
        c00000000010d158: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A080 15 4a 39=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r10,r10,5504
        <br>
        c00000000010d15c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 53 46 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r6,r10
        <br>
        c00000000010d160: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A014 4a c6 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0add =C2=A0=C2=A0=C2=A0=C2=A0r6,r6,r9
        <br>
        c00000000010d164: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00e 00 26 e9=
 =C2=A0=C2=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r9,12(r6)
        <br>
        c00000000010d168: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 e9 38=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r7,r9,1
        <br>
        c00000000010d16c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A003 00 09 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r9,3
        <br>
        c00000000010d170: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00c 00 e6 90=
 =C2=A0=C2=A0=C2=A0=C2=A0stw =C2=A0=C2=A0=C2=A0=C2=A0r7,12(r6)
        <br>
        c00000000010d174: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 ed a0=
 =C2=A0=C2=A0=C2=A0=C2=A0lhz =C2=A0=C2=A0=C2=A0=C2=A0r7,0(r13)
        <br>
        c00000000010d178: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 00 81 41=
 =C2=A0=C2=A0=C2=A0=C2=A0bgt =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d25c
        &lt;queued_spin_lock_slowpath+0x188&gt;
        <br>
        c00000000010d17c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 26 20 79=
 =C2=A0=C2=A0=C2=A0=C2=A0rldicr =C2=A0r0,r9,4,59
        <br>
        c00000000010d180: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A014 02 66 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0add =C2=A0=C2=A0=C2=A0=C2=A0r11,r6,r0
        <br>
        c00000000010d184: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 00 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,0
        <br>
        c00000000010d188: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A008 00 0b 91=
 =C2=A0=C2=A0=C2=A0=C2=A0stw =C2=A0=C2=A0=C2=A0=C2=A0r8,8(r11)
        <br>
        c00000000010d18c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 00 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,0
        <br>
        c00000000010d190: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02a 01 06 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0stdx =C2=A0=C2=A0=C2=A0r8,r6,r0
        <br>
        c00000000010d194: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 03 81=
 =C2=A0=C2=A0=C2=A0=C2=A0lwz =C2=A0=C2=A0=C2=A0=C2=A0r8,0(r3)
        <br>
        c00000000010d198: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b5 07 08 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0extsw. =C2=A0r8,r8
        <br>
        c00000000010d19c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A004 01 82 41=
 =C2=A0=C2=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d2a0
        &lt;queued_spin_lock_slowpath+0x1cc&gt;
        <br>
        c00000000010d1a0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 e7 38=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r7,r7,1
        <br>
        c00000000010d1a4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01e 80 29 55=
 =C2=A0=C2=A0=C2=A0=C2=A0rlwinm =C2=A0r9,r9,16,0,15
        <br>
        c00000000010d1a8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f8 ff e1 fb=
 =C2=A0=C2=A0=C2=A0=C2=A0std =C2=A0=C2=A0=C2=A0=C2=A0r31,-8(r1)
        <br>
        c00000000010d1ac: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01a 90 e7 54=
 =C2=A0=C2=A0=C2=A0=C2=A0rlwinm =C2=A0r7,r7,18,0,13
        <br>
        c00000000010d1b0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 3b 27 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0or =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r7,r9,r7
        <br>
        c00000000010d1b4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0lwsync
        <br>
        c00000000010d1b8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 80 38=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r4,0
        <br>
        c00000000010d1bc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A002 00 03 39=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r8,r3,2
        <br>
        c00000000010d1c0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f8 1e 0c 55=
 =C2=A0=C2=A0=C2=A0=C2=A0rlwinm =C2=A0r12,r8,3,27,28
        <br>
        c00000000010d1c4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03e 84 e5 54=
 =C2=A0=C2=A0=C2=A0=C2=A0rlwinm =C2=A0r5,r7,16,16,31
        <br>
        c00000000010d1c8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ff ff 84 60=
 =C2=A0=C2=A0=C2=A0=C2=A0ori =C2=A0=C2=A0=C2=A0=C2=A0r4,r4,65535
        <br>
        c00000000010d1cc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A064 07 08 79=
 =C2=A0=C2=A0=C2=A0=C2=A0rldicr =C2=A0r8,r8,0,61
        <br>
        c00000000010d1d0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A030 60 a5 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0slw =C2=A0=C2=A0=C2=A0=C2=A0r5,r5,r12
        <br>
        c00000000010d1d4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A030 60 84 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0slw =C2=A0=C2=A0=C2=A0=C2=A0r4,r4,r12
        <br>
        c00000000010d1d8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 40 20 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r9,0,r8
        <br>
        c00000000010d1dc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 20 3f 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0andc =C2=A0=C2=A0=C2=A0r31,r9,r4
        <br>
        c00000000010d1e0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 2b ff 7f=
 =C2=A0=C2=A0=C2=A0=C2=A0or =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r31,r31,r5
        <br>
        c00000000010d1e4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 41 e0 7f=
 =C2=A0=C2=A0=C2=A0=C2=A0stwcx. =C2=A0r31,0,r8
        <br>
        c00000000010d1e8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff c2 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d1d8
        &lt;queued_spin_lock_slowpath+0x104&gt;
        <br>
        c00000000010d1ec: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A030 64 29 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0srw =C2=A0=C2=A0=C2=A0=C2=A0r9,r9,r12
        <br>
        c00000000010d1f0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A029 80 25 79=
 =C2=A0=C2=A0=C2=A0=C2=A0rldic. =C2=A0r5,r9,16,32
        <br>
        c00000000010d1f4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01e 80 28 55=
 =C2=A0=C2=A0=C2=A0=C2=A0rlwinm =C2=A0r8,r9,16,0,15
        <br>
        c00000000010d1f8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d0 00 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d2c8
        &lt;queued_spin_lock_slowpath+0x1f4&gt;
        <br>
        c00000000010d1fc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 20 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,0
        <br>
        c00000000010d200: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A002 00 c3 e8=
 =C2=A0=C2=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r6,0(r3)
        <br>
        c00000000010d204: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 03 81=
 =C2=A0=C2=A0=C2=A0=C2=A0lwz =C2=A0=C2=A0=C2=A0=C2=A0r8,0(r3)
        <br>
        c00000000010d208: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03e 04 05 55=
 =C2=A0=C2=A0=C2=A0=C2=A0clrlwi =C2=A0r5,r8,16
        <br>
        c00000000010d20c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 05 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r5,0
        <br>
        c00000000010d210: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 01 82 41=
 =C2=A0=C2=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d320
        &lt;queued_spin_lock_slowpath+0x24c&gt;
        <br>
        c00000000010d214: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
        <br>
        c00000000010d218: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
        <br>
        c00000000010d21c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 ff ff 4b=
 =C2=A0=C2=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c000000000=
10d200
        &lt;queued_spin_lock_slowpath+0x12c&gt;
        <br>
        c00000000010d220: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 2a 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r10,0
        <br>
        c00000000010d224: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A024 00 82 41=
 =C2=A0=C2=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d248
        &lt;queued_spin_lock_slowpath+0x174&gt;
        <br>
        c00000000010d228: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A002 00 23 e9=
 =C2=A0=C2=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r9,0(r3)
        <br>
        c00000000010d22c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03e 06 29 55=
 =C2=A0=C2=A0=C2=A0=C2=A0clrlwi =C2=A0r9,r9,24
        <br>
        c00000000010d230: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 09 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r9,0
        <br>
        c00000000010d234: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 82 41=
 =C2=A0=C2=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d244
        &lt;queued_spin_lock_slowpath+0x170&gt;
        <br>
        c00000000010d238: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
        <br>
        c00000000010d23c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
        <br>
        c00000000010d240: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e8 ff ff 4b=
 =C2=A0=C2=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c000000000=
10d228
        &lt;queued_spin_lock_slowpath+0x154&gt;
        <br>
        c00000000010d244: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0lwsync
        <br>
        c00000000010d248: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 20 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,1
        <br>
        c00000000010d24c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 23 b1=
 =C2=A0=C2=A0=C2=A0=C2=A0sth =C2=A0=C2=A0=C2=A0=C2=A0r9,0(r3)
        <br>
        c00000000010d250: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 80 4e=
 =C2=A0=C2=A0=C2=A0=C2=A0blr
        <br>
        c00000000010d254: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
        <br>
        c00000000010d258: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
        <br>
        c00000000010d25c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 23 81=
 =C2=A0=C2=A0=C2=A0=C2=A0lwz =C2=A0=C2=A0=C2=A0=C2=A0r9,0(r3)
        <br>
        c00000000010d260: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b5 07 29 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0extsw. =C2=A0r9,r9
        <br>
        c00000000010d264: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d254
        &lt;queued_spin_lock_slowpath+0x180&gt;
        <br>
        c00000000010d268: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 18 e0 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r7,0,r3
        <br>
        c00000000010d26c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 48 07 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r7,r9
        <br>
        c00000000010d270: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 c2 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d280
        &lt;queued_spin_lock_slowpath+0x1ac&gt;
        <br>
        c00000000010d274: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 19 00 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0stwcx. =C2=A0r8,0,r3
        <br>
        c00000000010d278: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff c2 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d268
        &lt;queued_spin_lock_slowpath+0x194&gt;
        <br>
        c00000000010d27c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 01 00 4c=
 =C2=A0=C2=A0=C2=A0=C2=A0isync
        <br>
        c00000000010d280: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 07 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r7,0
        <br>
        c00000000010d284: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d0 ff 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d254
        &lt;queued_spin_lock_slowpath+0x180&gt;
        <br>
        c00000000010d288: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 00 0d e9=
 =C2=A0=C2=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,40(r13)
        <br>
        c00000000010d28c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00c 00 2a 39=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r9,r10,12
        <br>
        c00000000010d290: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 40 49 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0lwzx =C2=A0=C2=A0=C2=A0r10,r9,r8
        <br>
        c00000000010d294: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ff ff 4a 39=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r10,r10,-1
        <br>
        c00000000010d298: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 41 49 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0stwx =C2=A0=C2=A0=C2=A0r10,r9,r8
        <br>
        c00000000010d29c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 80 4e=
 =C2=A0=C2=A0=C2=A0=C2=A0blr
        <br>
        c00000000010d2a0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 a0 38=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r5,1
        <br>
        c00000000010d2a4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 18 80 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r4,0,r3
        <br>
        c00000000010d2a8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 40 04 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r4,r8
        <br>
        c00000000010d2ac: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 c2 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d2bc
        &lt;queued_spin_lock_slowpath+0x1e8&gt;
        <br>
        c00000000010d2b0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 19 a0 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0stwcx. =C2=A0r5,0,r3
        <br>
        c00000000010d2b4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff c2 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d2a4
        &lt;queued_spin_lock_slowpath+0x1d0&gt;
        <br>
        c00000000010d2b8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 01 00 4c=
 =C2=A0=C2=A0=C2=A0=C2=A0isync
        <br>
        c00000000010d2bc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 04 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpwi =C2=A0=C2=A0r4,0
        <br>
        c00000000010d2c0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c8 ff 82 41=
 =C2=A0=C2=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d288
        &lt;queued_spin_lock_slowpath+0x1b4&gt;
        <br>
        c00000000010d2c4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dc fe ff 4b=
 =C2=A0=C2=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c000000000=
10d1a0
        &lt;queued_spin_lock_slowpath+0xcc&gt;
        <br>
        c00000000010d2c8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0be 74 08 55=
 =C2=A0=C2=A0=C2=A0=C2=A0rlwinm =C2=A0r8,r8,14,18,31
        <br>
        c00000000010d2cc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A004 00 a2 3c=
 =C2=A0=C2=A0=C2=A0=C2=A0addis =C2=A0=C2=A0r5,r2,4
        <br>
        c00000000010d2d0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 cf a5 38=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r5,r5,-12304
        <br>
        c00000000010d2d4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0a8 26 29 79=
 =C2=A0=C2=A0=C2=A0=C2=A0rldic =C2=A0=C2=A0r9,r9,4,58
        <br>
        c00000000010d2d8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ff ff 08 39=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r8,r8,-1
        <br>
        c00000000010d2dc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A014 4a 2a 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0add =C2=A0=C2=A0=C2=A0=C2=A0r9,r10,r9
        <br>
        c00000000010d2e0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b4 07 08 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0extsw =C2=A0=C2=A0r8,r8
        <br>
        c00000000010d2e4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A024 1f 08 79=
 =C2=A0=C2=A0=C2=A0=C2=A0rldicr =C2=A0r8,r8,3,60
        <br>
        c00000000010d2e8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02a 40 05 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0ldx =C2=A0=C2=A0=C2=A0=C2=A0r8,r5,r8
        <br>
        c00000000010d2ec: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02a 41 69 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0stdx =C2=A0=C2=A0=C2=A0r11,r9,r8
        <br>
        c00000000010d2f0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00a 00 2b e9=
 =C2=A0=C2=A0=C2=A0=C2=A0lwa =C2=A0=C2=A0=C2=A0=C2=A0r9,8(r11)
        <br>
        c00000000010d2f4: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 29 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r9,0
        <br>
        c00000000010d2f8: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 00 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d308
        &lt;queued_spin_lock_slowpath+0x234&gt;
        <br>
        c00000000010d2fc: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
        <br>
        c00000000010d300: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
        <br>
        c00000000010d304: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ec ff ff 4b=
 =C2=A0=C2=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c000000000=
10d2f0
        &lt;queued_spin_lock_slowpath+0x21c&gt;
        <br>
        c00000000010d308: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0lwsync
        <br>
        c00000000010d30c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02a 00 26 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0ldx =C2=A0=C2=A0=C2=A0=C2=A0r9,r6,r0
        <br>
        c00000000010d310: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 29 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r9,0
        <br>
        c00000000010d314: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ec fe 82 41=
 =C2=A0=C2=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d200
        &lt;queued_spin_lock_slowpath+0x12c&gt;
        <br>
        c00000000010d318: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ec 49 00 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0dcbtstct 0,r9
        <br>
        c00000000010d31c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0e4 fe ff 4b=
 =C2=A0=C2=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c000000000=
10d200
        &lt;queued_spin_lock_slowpath+0x12c&gt;
        <br>
        c00000000010d320: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0lwsync
        <br>
        c00000000010d324: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01e 00 08 55=
 =C2=A0=C2=A0=C2=A0=C2=A0rlwinm =C2=A0r8,r8,0,0,15
        <br>
        c00000000010d328: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 38 08 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r8,r7
        <br>
        c00000000010d32c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02c 00 82 41=
 =C2=A0=C2=A0=C2=A0=C2=A0beq =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d358
        &lt;queued_spin_lock_slowpath+0x284&gt;
        <br>
        c00000000010d330: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 29 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r9,0
        <br>
        c00000000010d334: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 00 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,1
        <br>
        c00000000010d338: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 03 99=
 =C2=A0=C2=A0=C2=A0=C2=A0stb =C2=A0=C2=A0=C2=A0=C2=A0r8,0(r3)
        <br>
        c00000000010d33c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A058 00 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d394
        &lt;queued_spin_lock_slowpath+0x2c0&gt;
        <br>
        c00000000010d340: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 2b e9=
 =C2=A0=C2=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r9,0(r11)
        <br>
        c00000000010d344: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 00 29 2c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpdi =C2=A0=C2=A0r9,0
        <br>
        c00000000010d348: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04c 00 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d394
        &lt;queued_spin_lock_slowpath+0x2c0&gt;
        <br>
        c00000000010d34c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 0b 21 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r1,r1
        <br>
        c00000000010d350: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A078 13 42 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0mr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r2,r2
        <br>
        c00000000010d354: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ec ff ff 4b=
 =C2=A0=C2=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c000000000=
10d340
        &lt;queued_spin_lock_slowpath+0x26c&gt;
        <br>
        c00000000010d358: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 00 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,1
        <br>
        c00000000010d35c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 18 e0 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0lwarx =C2=A0=C2=A0r7,0,r3
        <br>
        c00000000010d360: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 30 07 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r7,r6
        <br>
        c00000000010d364: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00c 00 c2 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d370
        &lt;queued_spin_lock_slowpath+0x29c&gt;
        <br>
        c00000000010d368: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02d 19 00 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0stwcx. =C2=A0r8,0,r3
        <br>
        c00000000010d36c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f0 ff c2 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne- =C2=A0=C2=A0=C2=A0c00000000010d35c
        &lt;queued_spin_lock_slowpath+0x288&gt;
        <br>
        c00000000010d370: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A000 38 06 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0cmpw =C2=A0=C2=A0=C2=A0r6,r7
        <br>
        c00000000010d374: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bc ff 82 40=
 =C2=A0=C2=A0=C2=A0=C2=A0bne =C2=A0=C2=A0=C2=A0=C2=A0c00000000010d330
        &lt;queued_spin_lock_slowpath+0x25c&gt;
        <br>
        c00000000010d378: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A028 00 0d e9=
 =C2=A0=C2=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,40(r13)
        <br>
        c00000000010d37c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00c 00 2a 39=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r9,r10,12
        <br>
        c00000000010d380: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 40 49 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0lwzx =C2=A0=C2=A0=C2=A0r10,r9,r8
        <br>
        c00000000010d384: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ff ff 4a 39=
 =C2=A0=C2=A0=C2=A0=C2=A0addi =C2=A0=C2=A0=C2=A0r10,r10,-1
        <br>
        c00000000010d388: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02e 41 49 7d=
 =C2=A0=C2=A0=C2=A0=C2=A0stwx =C2=A0=C2=A0=C2=A0r10,r9,r8
        <br>
        c00000000010d38c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0f8 ff e1 eb=
 =C2=A0=C2=A0=C2=A0=C2=A0ld =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r31,-8(r1)
        <br>
        c00000000010d390: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A020 00 80 4e=
 =C2=A0=C2=A0=C2=A0=C2=A0blr
        <br>
        c00000000010d394: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ac 04 20 7c=
 =C2=A0=C2=A0=C2=A0=C2=A0lwsync
        <br>
        c00000000010d398: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A001 00 00 39=
 =C2=A0=C2=A0=C2=A0=C2=A0li =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r8,1
        <br>
        c00000000010d39c: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A008 00 09 91=
 =C2=A0=C2=A0=C2=A0=C2=A0stw =C2=A0=C2=A0=C2=A0=C2=A0r8,8(r9)
        <br>
        c00000000010d3a0: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d8 ff ff 4b=
 =C2=A0=C2=A0=C2=A0=C2=A0b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c000000000=
10d378
        &lt;queued_spin_lock_slowpath+0x2a4&gt;
        <br>
        <br>
        Disassembly of section .init.text:
        <br>
        <br>
        Disassembly of section .exit.text:<br>
      </span></p>
    <blockquote type=3D"cite"
      cite=3D"mid:1640427851.k47q6y3qjb.astroid@bobo.none">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">=C2=A0=C2=A0=C2=A0

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

</pre>
      </blockquote>
    </blockquote>
    <p> Switching from gcc 10.3.0 to gcc 11.2.0 made the above compile
      error go away, and as expected,
      49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe boots fine and
      49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe^1 exhibits the same
      problem. I started bisecting the 2nd part but I'll pause that
      effort for now.</p>
    <p>Thanks,<br>
      Stijn<br>
    </p>
  </body>
</html>
--------------0ENhQImFm0ohq5vyvwvxz775--

