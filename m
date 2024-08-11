Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 475D494E3D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 01:23:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ufal.mff.cuni.cz header.i=@ufal.mff.cuni.cz header.a=rsa-sha256 header.s=9D3691E2-3533-11E9-988E-D2516E4D0B60 header.b=v6mJ7amC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WhtxM1lkmz2yK8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 09:23:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ufal.mff.cuni.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ufal.mff.cuni.cz header.i=@ufal.mff.cuni.cz header.a=rsa-sha256 header.s=9D3691E2-3533-11E9-988E-D2516E4D0B60 header.b=v6mJ7amC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:195.113.16.19) smtp.mailfrom=ufal.mff.cuni.cz (client-ip=195.113.20.158; helo=ufal-mail.mff.cuni.cz; envelope-from=vidra@ufal.mff.cuni.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 459 seconds by postgrey-1.37 at boromir; Mon, 12 Aug 2024 03:00:18 AEST
Received: from ufal-mail.mff.cuni.cz (ufal-mail.mff.cuni.cz [195.113.20.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WhkRQ5hVKz2xTq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 03:00:18 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by ufal-mail.mff.cuni.cz (Postfix) with ESMTP id EBEAC4F2B69;
	Sun, 11 Aug 2024 18:52:30 +0200 (CEST)
Received: from ufal-mail.mff.cuni.cz ([127.0.0.1])
 by localhost (ufal-mail.mff.cuni.cz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id DhOUQqr-HnCG; Sun, 11 Aug 2024 18:52:30 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by ufal-mail.mff.cuni.cz (Postfix) with ESMTP id BD4844F3831;
	Sun, 11 Aug 2024 18:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 ufal-mail.mff.cuni.cz BD4844F3831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ufal.mff.cuni.cz;
	s=9D3691E2-3533-11E9-988E-D2516E4D0B60; t=1723395150;
	bh=0KjhO2xt++CVNuvKu9eIW/EKcmpGMJULps5rYcCKbok=;
	h=From:To:MIME-Version:Message-Id:Date;
	b=v6mJ7amCoSiQkBsOzh6SUTpoPx3MYFzIVyW4B8dKa0Awl/jDt+yPWP0hMrrGF30k2
	 p1W3zf/YsfFthPap2o2DT4zrNuqh+HUKr2uaVVPy5dhZ88JINRSnkvbtYcjVmClL1L
	 YcPB290DV4D0VCvP0tyAWKfNEvdLRWC7TWSt/0fs3mMoePAyxkwRnKqn1ChBQVGY1h
	 lceFGgKNNywYIhUuzJQHue/pzKFuqhLxShGeDFytB/trbJYUWUKyBmBEei59xbauHK
	 flme1EQIXOcjmPXii3yyL0XPS14tMcc9T+PKbFWlSXvqoSuie3IhtsNXFTnEPM18wa
	 ebtUZ3NgSUeXw==
X-Virus-Scanned: amavis at ufal.mff.cuni.cz
Received: from ufal-mail.mff.cuni.cz ([127.0.0.1])
 by localhost (ufal-mail.mff.cuni.cz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Sucev-Xru4Rx; Sun, 11 Aug 2024 18:52:30 +0200 (CEST)
Received: from freki.localdomain (freki.ms.mff.cuni.cz [195.113.18.207])
	by ufal-mail.mff.cuni.cz (Postfix) with ESMTP id 98B344F3830;
	Sun, 11 Aug 2024 18:52:30 +0200 (CEST)
Received: by freki.localdomain (Postfix, from userid 6172)
	id 91DCFA0660; Sun, 11 Aug 2024 18:52:30 +0200 (CEST)
From: Jonas Vidra <vidra@ufal.mff.cuni.cz>
To: erhard_f@mailbox.org
Subject: Re: BUG: Bad page map in process init pte:c0ab684c pmd:01182000 (on a PowerMac G4 DP)
In-Reply-To: <20240620004237.2338f82b@yea>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Message-Id: <20240811165230.91DCFA0660@freki.localdomain>
Date: Sun, 11 Aug 2024 18:52:30 +0200 (CEST)
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 12 Aug 2024 09:22:44 +1000
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
Cc: linux-mm@kvack.org, rmclure@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Jun 2024 00:42:37 +0200, Erhard Furtner wrote:

>> Le 29/02/2024 =C3=A0 02:09, Erhard Furtner a =C3=A9crit :
>> >=20
>> > Revisited the issue on kernel v6.8-rc6 and I can still reproduce it.
>> >=20
>> > Short summary as my last post was over a year ago:
>> >   (x) I get this memory corruption only when CONFIG_VMAP_STACK=3Dy a=
nd CONFIG_SMP=3Dy is enabled.
>> >   (x) I don't get this memory corruption when only one of the above =
is enabled. ^^
>> >   (x) memtester says the 2 GiB RAM in my G4 DP are fine.
>> >   (x) I don't get this issue on my G5 11,2 or Talos II.
>> >   (x) "stress -m 2 --vm-bytes 965M" provokes the issue in < 10 secs.=
 (https://salsa.debian.org/debian/stress)
>> >=20
> The "pagealloc: memory corruption" remains however as of kernel v6.10-r=
c4.

I've reproduced the bug on similar hardware, also a dual-processor Power
Mac G4 with 2 GiB RAM.

With the 6.6.30 kernel without extra debugging options, the system was
stable and could e.g. compile GCC or the kernel without an issue. That
doesn't mean there wasn't silent corruption going on, of course. :-)
Running the `stress` program as listed above did, however, cause the
system to get into an unstable state where heavier workloads, such as
compiling the kernel, would randomly fail.

I updated the kernel to 6.10.3, enabled SLUB_DEBUG, PAGE_POISONING and
DEBUG_PAGEALLOC and turned them on at boot-time with slub_debug=3DFZ
page_poison=3Don debug_pagealloc=3Don.

The updated kernel exhibits the same symptoms as described by Erhard,
running `stress -m 2 --vm-bytes 965M` almost immediately causes a memory
corruption with the following messages in dmesg:

```
pagealloc: memory corruption
fffcfff0: 00 00 00 00                                      ....
CPU: 1 PID: 1845 Comm: stress Tainted: G                T  6.10.3-gentoo =
#1
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[f2d05ca0] [c08ff18c] dump_stack_lvl+0x60/0xbc (unreliable)
[f2d05cc0] [c01db7e0] __kernel_unpoison_pages+0x128/0x1f0
[f2d05d10] [c01bc6c4] get_page_from_freelist+0xeb0/0xf6c
[f2d05db0] [c01bcf7c] __alloc_pages_noprof+0x160/0xdf0
[f2d05e70] [c01be388] __folio_alloc_noprof+0x14/0x44
[f2d05e80] [c0199690] handle_mm_fault+0x99c/0xdac
[f2d05f00] [c00218c8] do_page_fault+0x264/0x73c
[f2d05f30] [c000433c] DataAccess_virt+0x124/0x17c
--- interrupt: 300 at 0x7c2db0
NIP:  007c2db0 LR: 007c2d90 CTR: 00000000
REGS: f2d05f40 TRAP: 0300   Tainted: G                T   (6.10.3-gentoo)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 20882004  XER: 00000000
DAR: 8fe18020 DSISR: 42000000
GPR00: 007c2d90 afb6a160 a7a00100 6b416020 ffffffa0 00000000 a7916ffc 000=
00000
GPR08: 24a03000 24a02000 00000000 404347fa 404344c7 00000000 00000000 000=
0005a
GPR16: 6b416020 00000002 00000000 00000000 ffffffff 00000000 40882002 007=
e0004
GPR24: 00000001 ffffffff ffffffff 3c500000 00000000 66b7cd68 007e7cf8 000=
01000
NIP [007c2db0] 0x7c2db0
LR [007c2d90] 0x7c2d90
--- interrupt: 300
page: refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x31069
flags: 0x80000000(zone=3D2)
raw: 80000000 00000100 00000122 00000000 00000000 00000000 ffffffff 00000=
001
page dumped because: pagealloc: corrupted page details
```

Other activity can also trigger it, compilation of larger programs with
`make -j2` does it within an hour, typically resulting in an ICE.

When booted with the `maxcpus=3D0` kernel parameter, the corruptions do
not occur.
