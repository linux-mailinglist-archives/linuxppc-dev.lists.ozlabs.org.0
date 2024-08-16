Return-Path: <linuxppc-dev+bounces-147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9D89553E4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 01:46:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qvaoaxNg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlzCv2hS6z2ysf;
	Sat, 17 Aug 2024 09:46:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qvaoaxNg;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlzCv0h9dz2xFq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 09:46:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723851995;
	bh=ZMZbIojl7FpylGqV64BXYP8kTFTEQ6oAfPllyZLp8pc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qvaoaxNgnv80fP+qTi+04woa7oNYPquPEU+WRub/c0MGgl9zPp1W+4OFzEggYu46V
	 ANnVvM8wRX3epbmhWOYHYH8l04YQmQI9HOi/O0oIj9i42OWzizVB1WVR/6PiQNd1wY
	 p4L0JYcFEhFhUy8DB24+siBSOREdJ9G9wUI6XMPm/K9tRxWTFSU/PTwTqa9lChz6SE
	 0hUiT+r1J0aSZ6bVsxrSkIOO1nB12ziOq5cN+Ic+SdtCJfrbeFZqQzl2Csrcyi2AK9
	 SfDx/+GzR04Weu7clsaXqnlzqPEe/WTRqIMwyDCK/qZetxgWBT2ClXjltE9qct0SkP
	 E30jx5sVURs0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WlzCq3ZT0z4wbv;
	Sat, 17 Aug 2024 09:46:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Niklas Cassel <cassel@kernel.org>
Cc: =?utf-8?Q?Kolbj=C3=B8rn?= Barmen <linux-ppc@kolla.no>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, =?utf-8?B?Sm9u?=
 =?utf-8?B?w6HFoQ==?= Vidra
 <vidra@ufal.mff.cuni.cz>, Christoph Hellwig <hch@lst.de>,
 linux@roeck-us.net
Subject: Re: Since 6.10 - kernel oops/panics on G4 macmini due to change in
 drivers/ata/pata_macio.c
In-Reply-To: <Zry58qB80V80uS38@ryzen.lan>
References: <62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no>
 <3b6441b8-06e6-45da-9e55-f92f2c86933e@ufal.mff.cuni.cz>
 <Zrstcei9WN9sRfdX@x1-carbon.wireless.wdc> <87sev81u3f.fsf@mail.lhotse>
 <Zrt028rSVT5hVPbU@ryzen.lan> <87jzgj1ejc.fsf@mail.lhotse>
 <Zry58qB80V80uS38@ryzen.lan>
Date: Sat, 17 Aug 2024 09:46:31 +1000
Message-ID: <87jzgg2fqg.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Niklas Cassel <cassel@kernel.org> writes:
> On Wed, Aug 14, 2024 at 10:20:55PM +1000, Michael Ellerman wrote:
>> Niklas Cassel <cassel@kernel.org> writes:
>> > On Tue, Aug 13, 2024 at 10:32:36PM +1000, Michael Ellerman wrote:
>> >> Niklas Cassel <cassel@kernel.org> writes:
>> >> > On Tue, Aug 13, 2024 at 07:49:34AM +0200, Jon=C3=A1=C5=A1 Vidra wro=
te:
>> ...
>> >> >> ------------[ cut here ]------------
>> >> >> kernel BUG at drivers/ata/pata_macio.c:544!
>> >> >
>> >> > https://github.com/torvalds/linux/blob/v6.11-rc3/drivers/ata/pata_m=
acio.c#L544
>> >> >
>> >> > It seems that the
>> >> > while (sg_len) loop does not play nice with the new .max_segment_si=
ze.
>> >>=20
>> >> Right, but only for 4KB kernels for some reason. Is there some limit
>> >> elsewhere that prevents the bug tripping on 64KB kernels, or is it ju=
st
>> >> luck that no one has hit it?
>> >
>> > Have your tried running fio (flexible I/O tester), with reads with a v=
ery
>> > large block sizes?
>> >
>> > I would be surprised if it isn't possible to trigger the same bug with
>> > 64K page size.
>> >
>> > max segment size =3D 64K
>> > MAX_DCMDS =3D 256
>> > 256 * 64K =3D 16 MiB
>> > What happens if you run fio with a 16 MiB blocksize?
>> >
>> > Something like:
>> > $ sudo fio --name=3Dtest --filename=3D/dev/sdX --direct=3D1 --runtime=
=3D60 --ioengine=3Dio_uring --rw=3Dread --iodepth=3D4 --bs=3D16M
>>=20
>> Nothing interesting happens, fio succeeds.
>>=20
>> The largest request that comes into pata_macio_qc_prep() is 1280KB,
>> which results in 40 DMA list entries.
>>=20
>> I tried with a larger block size but it doesn't change anything. I guess
>> there's some limit somewhere else in the stack?
>>=20
>> That was testing on qemu, but I don't think it should matter?
>>=20
>> I guess there's no way to run the fio test against a file, ie. without a
>> raw partition? My real G5 doesn't have any spare disks/partitions in it.
>
>
> You can definitely run fio against a file.
>
> e.g.
> $ dd if=3D/dev/random of=3D/tmp/my_file bs=3D1M count=3D1024
>
> $ sudo fio --name=3Dtest --filename=3D/tmp/my_file --direct=3D1 --runtime=
=3D60 --ioengine=3Dio_uring --rw=3Dread --iodepth=3D4 --bs=3D16M
>
>
> Perhaps try with 32M block size, so that it is larger than
> max segment size =3D 64K
> MAX_DCMDS =3D 256
> 256 * 64K =3D 16 MiB
>
> Perhaps also try with and without --direct.
> It could be interesting to use the page cache if you do --rw=3Dreadwrite
> that might possibly result in larger bios.

Changing the fio settings didn't help.

I did some tracing and noticed it was always splitting the bio in
__bio_split_to_limits() based on get_max_io_size().

That eventually lead me to max_sectors_kb in sysfs, which is by default
(on my system at least) 1280 (KB) - which is exactly the size I see in
pata-macio.

Increasing max_sectors_kb with:

  # echo 16384 > /sys/devices/pci0000:f0/0000:f0:0c.0/0.80000000:mac-io/0.0=
0020000:ata-3/ata1/host0/target0:0:0/0:0:0:0/block/sda/queue/max_sectors_kb

Allows me to trip the bug (I turned it into a WARN to keep the system alive=
):

  [ 1804.988552] ------------[ cut here ]------------
  [ 1804.988963] DMA table overflow!
  [ 1804.989781] WARNING: CPU: 0 PID: 299 at drivers/ata/pata_macio.c:546 p=
ata_macio_qc_prep+0x27c/0x2a4
  [ 1804.991157] Modules linked in:
  [ 1804.991945] CPU: 0 PID: 299 Comm: iou-wrk-298 Not tainted 6.10.4-dirty=
 #242
  [ 1804.992688] Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
  [ 1804.993512] NIP:  c0000000008bcfb4 LR: c0000000008bcfb0 CTR: 000000000=
0000000
  [ 1804.994244] REGS: c0000000052d6fb0 TRAP: 0700   Not tainted  (6.10.4-d=
irty)
  [ 1804.994998] MSR:  800000000202b032 <SF,VEC,EE,FP,ME,IR,DR,RI>  CR: 444=
84240  XER: 00000000
  [ 1804.996178] IRQMASK: 1
  [ 1804.996178] GPR00: c0000000008bcfb0 c0000000052d7250 c000000000f50b00 =
0000000000000013
  [ 1804.996178] GPR04: 0000000100000282 c0000000014806c0 fffffffffffec230 =
000000003ed10000
  [ 1804.996178] GPR08: 0000000000000027 c00000003fe02410 0000000000000001 =
0000000044484240
  [ 1804.996178] GPR12: c0000000014806a8 c0000000017b0000 c0000000006c9488 =
c000000005026b40
  [ 1804.996178] GPR16: 0000000000000000 0000000002000000 c000000000cecaa8 =
c000000000e44ac8
  [ 1804.996178] GPR20: 0000000000800000 0000000000000080 000000000000ff00 =
c000000000d12730
  [ 1804.996178] GPR24: c000000000e20788 c00000000330eae8 0000000000000000 =
0000000000000020
  [ 1804.996178] GPR28: c0000000036c8130 0000000000000100 0000000000000000 =
c000000003fb1000
  [ 1805.003085] NIP [c0000000008bcfb4] pata_macio_qc_prep+0x27c/0x2a4
  [ 1805.003715] LR [c0000000008bcfb0] pata_macio_qc_prep+0x278/0x2a4
  [ 1805.004564] Call Trace:
  [ 1805.004963] [c0000000052d7250] [c0000000008bcfb0] pata_macio_qc_prep+0=
x278/0x2a4 (unreliable)
  [ 1805.005974] [c0000000052d7310] [c00000000089840c] ata_qc_issue+0x170/0=
x390
  [ 1805.006719] [c0000000052d7390] [c0000000008a5160] __ata_scsi_queuecmd+=
0x220/0x7d4
  [ 1805.007472] [c0000000052d7410] [c000000000 8a5778] ata_scsi_queuecmd+0=
x64/0xe8
  [ 1805.008194] [c0000000052d7450] [c00000000085b450] scsi_queue_rq+0x408/=
0xd74
  [ 1805.008904] [c0000000052d7500] [c00000000067bfc8] blk_mq_dispatch_rq_l=
ist+0x160/0x914
  [ 1805.009696] [c0000000052d75b0] [c000000000683d50] __blk_mq_sched_dispa=
tch_requests+0x5fc/0x77c
  [ 1805.010551] [c0000000052d7680] [c000000000683f68] blk_mq_sched_dispatc=
h_requests+0x44/0x90
  [ 1805.011371] [c0000000052d76b0] [c000000000677328] blk_mq_run_hw_queue+=
0x220/0x240
  [ 1805.012138] [c0000000052d76f0] [c00000000067b084] blk_mq_flush_plug_li=
st.part.0+0x214/0x75c
  [ 1805.012975] [c0000000052d77a0] [c00000000067b664] blk_add_rq_to_plug+0=
x98/0x1f0
  [ 1805.013717] [c0000000052d77e0] [c00000000067cd4c] blk_mq_submit_bio+0x=
5b0/0x888
  [ 1805.014457] [c0000000052d7890] [c000000000667bf0] __submit_bio+0xa4/0x=
2e4
  [ 1805.015149] [c0000000052d7910] [c0000000006680bc] submit_bio_noacct_no=
check+0x28c/0x404
  [ 1805.015952] [c0000000052d7980] [c00000000065bf68] blkdev_direct_IO+0x6=
3c/0x824
  [ 1805.016688] [c0000000052d7aa0] [c00000000065c614] blkdev_read_iter+0x1=
0c/0x1c8
  [ 1805.017423] [c0000000052d7af0] [c0000000006b2cdc] __io_read+0xe0/0x5a0
  [ 1805.018091] [c0000000052d7b50] [c0000000006b3a70] io_read+0x30/0x74
  [ 1805.018733] [c0000000052d7b80] [c0000000006a9040] io_issue_sqe+0x8c/0x=
768
  [ 1805.019419] [c0000000052d7c00] [c0000000006a9850] io_wq_submit_work+0x=
118/0x518
  [ 1805.020153] [c0000000052d7c60] [c0000000006c8ebc] io_worker_handle_wor=
k+0x23c/0x800
  [ 1805.020923] [c0000000052d7d00] [c0000000006c95f8] io_wq_worker+0x178/0=
x51c
  [ 1805.021621] [c0000000052d7e50] [c00000000000bd94] ret_from_kernel_user=
_thread+0x14/0x1c
=20=20

Same behaviour on a kernel with PAGE_SIZE =3D 4KB.

I don't know why max_sectors_kb starts out with a different value on my
system, but anyway the bug is lurking there, even if it doesn't trip by
default in some configurations.

I'll clean up and send my patch from earlier in the thread.

cheers

