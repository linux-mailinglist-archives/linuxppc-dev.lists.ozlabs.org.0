Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17532A5A34
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 23:43:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQlDX5BQ3zDqp5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 09:43:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=storix.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=cjacobsen@storix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=storix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=storix-com.20150623.gappssmtp.com
 header.i=@storix-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=wCBm9dnB; dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQkVK6SL8zDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 09:09:59 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id s24so13324155ioj.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 14:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=storix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XE+q1bkiHu8lroBoP8alvf+p6LtNm3JoaX6rydhSBQY=;
 b=wCBm9dnBX2JscS5sy+F8pPHkPvoN2rWISI4vrFU2Z0ykMUw/LE5G056znI3oq7eZyo
 PiZz7Zi+18pZ9WszlEG7ceZe4eyIGTbt55wjsocR+oWoKcRcOoHHKznvlc+BkWFaPSu0
 tRPt6MRHa+V/uKSYnr6pNxtWZ8+l5pRAeDLN4ooofPv6GEb0/Tic83yfd6+H4ZCW6vzD
 M8gHgo/g26ewUs68PyJS0c3KMsIeEldvoCHSPeQ8l0UCAKdmlzSwh07nk9dIFgv67k7k
 pVEFLl3XeM3k9kFAZ8O3dvTnsILLSNu/tQ+lGZdppJLdr/xUhzIiPzZ4VaioJu4lvrA9
 wc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XE+q1bkiHu8lroBoP8alvf+p6LtNm3JoaX6rydhSBQY=;
 b=FXAsgmyKus9XHHVPDX9vROEKJqVVn4XcwGZnSTDjCFcBS8qYpVlVA1z1g5nxFLhRf+
 xVkxmddsy1Eh+0ALsjzrMET7fKW5pKT8H2FVmijjiPhImvuEUfcOoIY6wnZ64hJZvsoz
 YRYygXSkiN25/LljxFHyFTFVDf1Kqpq64esiL52HTvKcxeiJzh+eBmu4ytHj7rtFWmyK
 AxlKEQQEwBX5SW+HrVeGyq7kqDZ5vl/W5MoO/3N/7ytXcSDIIsZ/m3O3pUC/64y1UAwV
 14luZyi7oRt4F9Ef2wHuDfX3B9opF+Enf35CjgtXv4Wdli/X3n2Mhz6reI4prtiR/MgG
 PBkA==
X-Gm-Message-State: AOAM53140WcpxudIip0UWn//kKR9mAR+oPmWE3OFrvRu1AkGDkJ+/AMK
 N8Kvl5JoWlqkkg+MJXKbcskJnfJj0IKn7e+ph/NM6cv8KOy++vNA
X-Google-Smtp-Source: ABdhPJy+//GAPE+sZb2coeJeQlDF7onjKQChauh9GTDLIj2XfRPgFCKQ6rRqgFnF4FPrFI6Nhns+yV9onGphxIGEcRw=
X-Received: by 2002:a02:ccd6:: with SMTP id k22mr11096789jaq.93.1604441395704; 
 Tue, 03 Nov 2020 14:09:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKkwB_S6Bs_+5At2aajbQbJg==WE_4NLdhSK=Bj+td67215Htg@mail.gmail.com>
 <878sbjuqe6.fsf@mpe.ellerman.id.au>
In-Reply-To: <878sbjuqe6.fsf@mpe.ellerman.id.au>
From: Carl Jacobsen <cjacobsen@storix.com>
Date: Tue, 3 Nov 2020 14:09:44 -0800
Message-ID: <CAKkwB_RD0_=9SSwyYn-8Vo2dr2Li4X-v_KJ4qBWZRgxZuGUeRw@mail.gmail.com>
Subject: Re: Kernel panic from malloc() on SUSE 15.1?
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="00000000000074508805b33b1f3f"
X-Mailman-Approved-At: Wed, 04 Nov 2020 09:41:50 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000074508805b33b1f3f
Content-Type: text/plain; charset="UTF-8"

The panic (on a call to malloc from static linked libcrypto) looks like
this:

Bad kernel stack pointer 7fffffffeac0 at 700
Oops: Bad kernel stack pointer, sig: 6 [#1]
SMP NR_CPUS=2048
NUMA
pSeries
Modules linked in: scsi_transport_iscsi af_packet xt_tcpudp ip6t_rpfilter
ip6t_REJECT ipt_REJECT xt_conntrack ip_set nfnetlink ebtable_nat
ebtable_broute br_netfilter bridge stp llc ip6table_nat nf_conntrack_ipv6
nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw ip6table_security
iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat
nf_conntrack libcrc32c iptable_mangle iptable_raw iptable_security
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter ip_tables
x_tables ibmveth(X) vmx_crypto gf128mul crct10dif_vpmsum rtc_generic btrfs
xor zstd_decompress zstd_compress xxhash raid6_pq sr_mod cdrom sd_mod
ibmvscsi(X) scsi_transport_srp crc32c_vpmsum sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua scsi_mod autofs4
Supported: Yes, External
CPU: 0 PID: 14144 Comm: rand_test_no_pt Tainted: G
4.12.14-197.18-default #1 SLE15-SP1
task: c00000002fa23b80 task.stack: c000000032824000
NIP: 0000000000000700 LR: 0000000010004ad0 CTR: 0000000000000000
REGS: c00000001ec2fd40 TRAP: 0300   Tainted: G
 (4.12.14-197.18-default)
MSR: 8000000000001000 <SF,ME>
  CR: 44000844  XER: 20000000
CFAR: 00000000000010f0 DAR: ffffffffffffb27a DSISR: 40000000 SOFTE: 0
GPR00: 0000000020000000 00007fffffffeac0 00000000102af788 fffffffffffffffd
GPR04: 0000000000000020 0000000000000030 00000000102b0550 0000000000000001
GPR08: 0000000000000000 00007fffb7dacc00 00000000102b0520 800000010280f033
GPR12: 0000000000004000 00007fffb7ffa100 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: 0000000000000000 0000000000000000 0000000000000000 00007fffb7fef4b8
GPR28: 00007fffb7ff0000 0000000000000000 0000000000000000 00007fffffffeac0
NIP [0000000000000700] 0x700
LR [0000000010004ad0] 0x10004ad0
Call Trace:
Instruction dump:
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 7db243a6 7db142a6 f92d0080 7d20e2a6
---[ end trace cc04515f274cfbf6 ]---

Sending IPI to other CPUs
IPI complete
kexec: Starting switchover sequence.
I'm in purgatory
 -> smp_release_cpus()
spinning_secondaries = 0
 <- smp_release_cpus()
Kernel panic - not syncing: Out of memory and no killable processes...

CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.12.14-197.18-default #1
SLE15-SP1
Call Trace:
[c000000012457210] [c000000008a20140] dump_stack+0xb0/0xf0 (unreliable)
[c000000012457250] [c000000008a1ccd4] panic+0x144/0x31c
[c0000000124572e0] [c0000000082efcc0] out_of_memory+0x3f0/0x700
[c000000012457380] [c0000000082f7ed4] __alloc_pages_nodemask+0x1004/0x10b0
[c000000012457570] [c00000000837f4d8] alloc_page_interleave+0x58/0x110
[c0000000124575b0] [c0000000083800bc] alloc_pages_current+0x16c/0x1d0
[c000000012457610] [c0000000082e8398] __page_cache_alloc+0xd8/0x150
[c000000012457650] [c0000000082e8574] pagecache_get_page+0x164/0x440
[c0000000124576b0] [c0000000082e8884] grab_cache_page_write_begin+0x34/0x70
[c0000000124576e0] [c00000000840ede8] simple_write_begin+0x48/0x190
[c000000012457720] [c0000000082e7c7c] generic_perform_write+0xec/0x270
[c0000000124577b0] [c0000000082ea2e0] __generic_file_write_iter+0x250/0x2a0
[c000000012457810] [c0000000082ea53c] generic_file_write_iter+0x20c/0x2e0
[c000000012457850] [c0000000083cc0e0] __vfs_write+0x120/0x1e0
[c0000000124578e0] [c0000000083cdfc8] vfs_write+0xd8/0x220
[c000000012457930] [c0000000083cfeec] SyS_write+0x6c/0x110
[c000000012457980] [c000000008d154c4] xwrite+0x54/0xb8
[c0000000124579c0] [c000000008d15574] do_copy+0x4c/0x17c
[c0000000124579f0] [c000000008d15140] write_buffer+0x64/0x90
[c000000012457a20] [c000000008d151d4] flush_buffer+0x68/0xf4
[c000000012457a70] [c000000008d62268] unxz+0x210/0x398
[c000000012457b10] [c000000008d15efc] unpack_to_rootfs+0x1f0/0x360
[c000000012457bc0] [c000000008d16108] populate_rootfs+0x9c/0x188
[c000000012457c40] [c00000000800f5d4] do_one_initcall+0x64/0x1d0
[c000000012457d00] [c000000008d14474] kernel_init_freeable+0x294/0x388
[c000000012457dc0] [c00000000801026c] kernel_init+0x2c/0x160
[c000000012457e30] [c00000000800b560] ret_from_kernel_thread+0x5c/0x7c
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at ../drivers/tty/vt/vt.c:3887
do_unblank_screen+0x1d0/0x270
Modules linked in:
Supported: Yes
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.12.14-197.18-default #1
SLE15-SP1
task: c000000012449680 task.stack: c000000012454000
NIP: c0000000086d1ac0 LR: c0000000086d1918 CTR: c0000000085fc390
REGS: c000000012456f60 TRAP: 0700   Not tainted  (4.12.14-197.18-default)
MSR: 8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>
  CR: 28242222  XER: 20000008
CFAR: c0000000086d1934 SOFTE: 0
GPR00: c0000000086d1918 c0000000124571e0 c000000009240000 0000000000000000
GPR04: 0000000000000000 c00000001237e00e 00000000000010b9 c000000012457170
GPR08: 000000000a610000 0000000000000000 c0000000090f38f0 c0000000122bc3d7
GPR12: 0000000028242428 c00000000f6c0000 00000000014200c2 00000000014200c2
GPR16: 00000000014200c2 0000000000000001 0000000000000000 0000000000000240
GPR20: 0000000000000001 0000000000000240 0000000000000000 c0000000140e1d10
GPR24: 0000000000000000 0000000000000000 0000000000000115 c000000009282374
GPR28: c000000009403508 c0000000094034d8 0000000000000000 0000000000000000
NIP [c0000000086d1ac0] do_unblank_screen+0x1d0/0x270
LR [c0000000086d1918] do_unblank_screen+0x28/0x270
Call Trace:
[c0000000124571e0] [c000000012457250] 0xc000000012457250 (unreliable)
[c000000012457250] [c000000008a1cd44] panic+0x1b4/0x31c
[c0000000124572e0] [c0000000082efcc0] out_of_memory+0x3f0/0x700
[c000000012457380] [c0000000082f7ed4] __alloc_pages_nodemask+0x1004/0x10b0
[c000000012457570] [c00000000837f4d8] alloc_page_interleave+0x58/0x110
[c0000000124575b0] [c0000000083800bc] alloc_pages_current+0x16c/0x1d0
[c000000012457610] [c0000000082e8398] __page_cache_alloc+0xd8/0x150
[c000000012457650] [c0000000082e8574] pagecache_get_page+0x164/0x440
[c0000000124576b0] [c0000000082e8884] grab_cache_page_write_begin+0x34/0x70
[c0000000124576e0] [c00000000840ede8] simple_write_begin+0x48/0x190
[c000000012457720] [c0000000082e7c7c] generic_perform_write+0xec/0x270
[c0000000124577b0] [c0000000082ea2e0] __generic_file_write_iter+0x250/0x2a0
[c000000012457810] [c0000000082ea53c] generic_file_write_iter+0x20c/0x2e0
[c000000012457850] [c0000000083cc0e0] __vfs_write+0x120/0x1e0
[c0000000124578e0] [c0000000083cdfc8] vfs_write+0xd8/0x220
[c000000012457930] [c0000000083cfeec] SyS_write+0x6c/0x110
[c000000012457980] [c000000008d154c4] xwrite+0x54/0xb8
[c0000000124579c0] [c000000008d15574] do_copy+0x4c/0x17c
[c0000000124579f0] [c000000008d15140] write_buffer+0x64/0x90
[c000000012457a20] [c000000008d151d4] flush_buffer+0x68/0xf4
[c000000012457a70] [c000000008d62268] unxz+0x210/0x398
[c000000012457b10] [c000000008d15efc] unpack_to_rootfs+0x1f0/0x360
[c000000012457bc0] [c000000008d16108] populate_rootfs+0x9c/0x188
[c000000012457c40] [c00000000800f5d4] do_one_initcall+0x64/0x1d0
[c000000012457d00] [c000000008d14474] kernel_init_freeable+0x294/0x388
[c000000012457dc0] [c00000000801026c] kernel_init+0x2c/0x160
[c000000012457e30] [c00000000800b560] ret_from_kernel_thread+0x5c/0x7c
Instruction dump:
3d22001c 39293920 81290000 2f890000 409cff00 ebe10068 38210070 e8010010
ebc1fff0 7c0803a6 4e800020 60000000 <0fe00000> 4bfffe74 60000000 60000000
---[ end trace ad1803c957b45442 ]---
---[ end Kernel panic - not syncing: Out of memory and no killable
processes...


On Mon, Nov 2, 2020 at 6:26 PM Michael Ellerman <mpe@ellerman.id.au> wrote:

> Carl Jacobsen <cjacobsen@storix.com> writes:
> > I've got a SUSE 15.1 install (on ppc64le) that kernel panics on a very
> > simple
> > test program, built in a slightly unusual way.
> >
> > I'm compiling on SUSE 12, using gcc 4.8.3. I'm linking to a static
> > copy of libcrypto.a (from openssl-1.1.1g), built without threads.
> > I have a 10 line C test program that compiles and runs fine on the
> > SUSE 12 system. If I compile the same program on SUSE 15.1 (with
> > gcc 7.4.1), it runs fine on SUSE 15.1.
> >
> > But, if I run the version that I compiled on SUSE 12, on the SUSE 15.1
> > system, the call to RAND_status() gets to a malloc() and then panics.
> > (And, of course, if I just compile a call to malloc(), that runs fine
> > on both systems.) Here's the test program, it's really just a call to
> > RAND_status():
> >
> >     #include <stdio.h>
> >     #include <openssl/rand.h>
> >
> >     int main(int argc, char **argv)
> >     {
> >         int has_enough_data = RAND_status();
> >         printf("The PRNG %s been seeded with enough data\n",
> >                has_enough_data ? "HAS" : "has NOT");
> >         return 0;
> >     }
> >
> > openssl is configured/built with:
> >     ./config no-shared no-dso no-threads -fPIC -ggdb3 -debug -static
> >     make
> >
> > and the test program is compiled with:
> >     gcc -ggdb3 -o rand_test rand_test.c libcrypto.a
> >
> > The kernel on SUSE 12 is: 3.12.28-4-default
> > And glibc is: 2.19
> >
> > The kernel on SUSE 15.1 is: 4.12.14-197.18-default
> > And glibc is: 2.26
> >
> > In a previous iteration it was panicking in pthread_once(), so
> > I compiled openssl without pthreads support, and now it panics
> > calling malloc().
>
> What's the panic look like?
>
> cheers
>


-- 
Carl Jacobsen
Storix, Inc.

--00000000000074508805b33b1f3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The panic (on a call to malloc from static linked libcrypt=
o) looks like this:<div><br></div><div>Bad kernel stack pointer 7fffffffeac=
0 at 700<br>Oops: Bad kernel stack pointer, sig: 6 [#1]<br>SMP NR_CPUS=3D20=
48 <br>NUMA <br>pSeries<br>Modules linked in: scsi_transport_iscsi af_packe=
t xt_tcpudp ip6t_rpfilter ip6t_REJECT ipt_REJECT xt_conntrack ip_set nfnetl=
ink ebtable_nat ebtable_broute br_netfilter bridge stp llc ip6table_nat nf_=
conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw ip6t=
able_security iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_n=
at nf_conntrack libcrc32c iptable_mangle iptable_raw iptable_security ebtab=
le_filter ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_ta=
bles ibmveth(X) vmx_crypto gf128mul crct10dif_vpmsum rtc_generic btrfs xor =
zstd_decompress zstd_compress xxhash raid6_pq sr_mod cdrom sd_mod ibmvscsi(=
X) scsi_transport_srp crc32c_vpmsum sg dm_multipath dm_mod scsi_dh_rdac scs=
i_dh_emc scsi_dh_alua scsi_mod autofs4<br>Supported: Yes, External<br>CPU: =
0 PID: 14144 Comm: rand_test_no_pt Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4.12.14-197.18-default #1 SLE15-SP1<br>t=
ask: c00000002fa23b80 task.stack: c000000032824000<br>NIP: 0000000000000700=
 LR: 0000000010004ad0 CTR: 0000000000000000<br>REGS: c00000001ec2fd40 TRAP:=
 0300 =C2=A0 Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(4.12.14-197.18-default)<br>MSR: 8000000000001000 &lt;S=
F,ME&gt;<br>=C2=A0 CR: 44000844 =C2=A0XER: 20000000<br>CFAR: 00000000000010=
f0 DAR: ffffffffffffb27a DSISR: 40000000 SOFTE: 0 <br>GPR00: 00000000200000=
00 00007fffffffeac0 00000000102af788 fffffffffffffffd <br>GPR04: 0000000000=
000020 0000000000000030 00000000102b0550 0000000000000001 <br>GPR08: 000000=
0000000000 00007fffb7dacc00 00000000102b0520 800000010280f033 <br>GPR12: 00=
00000000004000 00007fffb7ffa100 0000000000000000 0000000000000000 <br>GPR16=
: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 <br>G=
PR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 <=
br>GPR24: 0000000000000000 0000000000000000 0000000000000000 00007fffb7fef4=
b8 <br>GPR28: 00007fffb7ff0000 0000000000000000 0000000000000000 00007fffff=
ffeac0 <br>NIP [0000000000000700] 0x700<br>LR [0000000010004ad0] 0x10004ad0=
<br>Call Trace:<br>Instruction dump:<br>00000000 00000000 00000000 00000000=
 00000000 00000000 00000000 00000000 <br>00000000 00000000 00000000 0000000=
0 7db243a6 7db142a6 f92d0080 7d20e2a6 <br>---[ end trace cc04515f274cfbf6 ]=
---<br><br>Sending IPI to other CPUs<br>IPI complete<br>kexec: Starting swi=
tchover sequence.<br>I&#39;m in purgatory<br>=C2=A0-&gt; smp_release_cpus()=
<br>spinning_secondaries =3D 0<br>=C2=A0&lt;- smp_release_cpus()<br>Kernel =
panic - not syncing: Out of memory and no killable processes...<br><br>CPU:=
 0 PID: 1 Comm: swapper/0 Not tainted 4.12.14-197.18-default #1 SLE15-SP1<b=
r>Call Trace:<br>[c000000012457210] [c000000008a20140] dump_stack+0xb0/0xf0=
 (unreliable)<br>[c000000012457250] [c000000008a1ccd4] panic+0x144/0x31c<br=
>[c0000000124572e0] [c0000000082efcc0] out_of_memory+0x3f0/0x700<br>[c00000=
0012457380] [c0000000082f7ed4] __alloc_pages_nodemask+0x1004/0x10b0<br>[c00=
0000012457570] [c00000000837f4d8] alloc_page_interleave+0x58/0x110<br>[c000=
0000124575b0] [c0000000083800bc] alloc_pages_current+0x16c/0x1d0<br>[c00000=
0012457610] [c0000000082e8398] __page_cache_alloc+0xd8/0x150<br>[c000000012=
457650] [c0000000082e8574] pagecache_get_page+0x164/0x440<br>[c000000012457=
6b0] [c0000000082e8884] grab_cache_page_write_begin+0x34/0x70<br>[c00000001=
24576e0] [c00000000840ede8] simple_write_begin+0x48/0x190<br>[c000000012457=
720] [c0000000082e7c7c] generic_perform_write+0xec/0x270<br>[c0000000124577=
b0] [c0000000082ea2e0] __generic_file_write_iter+0x250/0x2a0<br>[c000000012=
457810] [c0000000082ea53c] generic_file_write_iter+0x20c/0x2e0<br>[c0000000=
12457850] [c0000000083cc0e0] __vfs_write+0x120/0x1e0<br>[c0000000124578e0] =
[c0000000083cdfc8] vfs_write+0xd8/0x220<br>[c000000012457930] [c0000000083c=
feec] SyS_write+0x6c/0x110<br>[c000000012457980] [c000000008d154c4] xwrite+=
0x54/0xb8<br>[c0000000124579c0] [c000000008d15574] do_copy+0x4c/0x17c<br>[c=
0000000124579f0] [c000000008d15140] write_buffer+0x64/0x90<br>[c00000001245=
7a20] [c000000008d151d4] flush_buffer+0x68/0xf4<br>[c000000012457a70] [c000=
000008d62268] unxz+0x210/0x398<br>[c000000012457b10] [c000000008d15efc] unp=
ack_to_rootfs+0x1f0/0x360<br>[c000000012457bc0] [c000000008d16108] populate=
_rootfs+0x9c/0x188<br>[c000000012457c40] [c00000000800f5d4] do_one_initcall=
+0x64/0x1d0<br>[c000000012457d00] [c000000008d14474] kernel_init_freeable+0=
x294/0x388<br>[c000000012457dc0] [c00000000801026c] kernel_init+0x2c/0x160<=
br>[c000000012457e30] [c00000000800b560] ret_from_kernel_thread+0x5c/0x7c<b=
r>------------[ cut here ]------------<br>WARNING: CPU: 0 PID: 1 at ../driv=
ers/tty/vt/vt.c:3887 do_unblank_screen+0x1d0/0x270<br>Modules linked in:<br=
>Supported: Yes<br>CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.12.14-197.18=
-default #1 SLE15-SP1<br>task: c000000012449680 task.stack: c00000001245400=
0<br>NIP: c0000000086d1ac0 LR: c0000000086d1918 CTR: c0000000085fc390<br>RE=
GS: c000000012456f60 TRAP: 0700 =C2=A0 Not tainted =C2=A0(4.12.14-197.18-de=
fault)<br>MSR: 8000000002029033 &lt;SF,VEC,EE,ME,IR,DR,RI,LE&gt;<br>=C2=A0 =
CR: 28242222 =C2=A0XER: 20000008<br>CFAR: c0000000086d1934 SOFTE: 0 <br>GPR=
00: c0000000086d1918 c0000000124571e0 c000000009240000 0000000000000000 <br=
>GPR04: 0000000000000000 c00000001237e00e 00000000000010b9 c000000012457170=
 <br>GPR08: 000000000a610000 0000000000000000 c0000000090f38f0 c0000000122b=
c3d7 <br>GPR12: 0000000028242428 c00000000f6c0000 00000000014200c2 00000000=
014200c2 <br>GPR16: 00000000014200c2 0000000000000001 0000000000000000 0000=
000000000240 <br>GPR20: 0000000000000001 0000000000000240 0000000000000000 =
c0000000140e1d10 <br>GPR24: 0000000000000000 0000000000000000 0000000000000=
115 c000000009282374 <br>GPR28: c000000009403508 c0000000094034d8 000000000=
0000000 0000000000000000 <br>NIP [c0000000086d1ac0] do_unblank_screen+0x1d0=
/0x270<br>LR [c0000000086d1918] do_unblank_screen+0x28/0x270<br>Call Trace:=
<br>[c0000000124571e0] [c000000012457250] 0xc000000012457250 (unreliable)<b=
r>[c000000012457250] [c000000008a1cd44] panic+0x1b4/0x31c<br>[c000000012457=
2e0] [c0000000082efcc0] out_of_memory+0x3f0/0x700<br>[c000000012457380] [c0=
000000082f7ed4] __alloc_pages_nodemask+0x1004/0x10b0<br>[c000000012457570] =
[c00000000837f4d8] alloc_page_interleave+0x58/0x110<br>[c0000000124575b0] [=
c0000000083800bc] alloc_pages_current+0x16c/0x1d0<br>[c000000012457610] [c0=
000000082e8398] __page_cache_alloc+0xd8/0x150<br>[c000000012457650] [c00000=
00082e8574] pagecache_get_page+0x164/0x440<br>[c0000000124576b0] [c00000000=
82e8884] grab_cache_page_write_begin+0x34/0x70<br>[c0000000124576e0] [c0000=
0000840ede8] simple_write_begin+0x48/0x190<br>[c000000012457720] [c00000000=
82e7c7c] generic_perform_write+0xec/0x270<br>[c0000000124577b0] [c000000008=
2ea2e0] __generic_file_write_iter+0x250/0x2a0<br>[c000000012457810] [c00000=
00082ea53c] generic_file_write_iter+0x20c/0x2e0<br>[c000000012457850] [c000=
0000083cc0e0] __vfs_write+0x120/0x1e0<br>[c0000000124578e0] [c0000000083cdf=
c8] vfs_write+0xd8/0x220<br>[c000000012457930] [c0000000083cfeec] SyS_write=
+0x6c/0x110<br>[c000000012457980] [c000000008d154c4] xwrite+0x54/0xb8<br>[c=
0000000124579c0] [c000000008d15574] do_copy+0x4c/0x17c<br>[c0000000124579f0=
] [c000000008d15140] write_buffer+0x64/0x90<br>[c000000012457a20] [c0000000=
08d151d4] flush_buffer+0x68/0xf4<br>[c000000012457a70] [c000000008d62268] u=
nxz+0x210/0x398<br>[c000000012457b10] [c000000008d15efc] unpack_to_rootfs+0=
x1f0/0x360<br>[c000000012457bc0] [c000000008d16108] populate_rootfs+0x9c/0x=
188<br>[c000000012457c40] [c00000000800f5d4] do_one_initcall+0x64/0x1d0<br>=
[c000000012457d00] [c000000008d14474] kernel_init_freeable+0x294/0x388<br>[=
c000000012457dc0] [c00000000801026c] kernel_init+0x2c/0x160<br>[c0000000124=
57e30] [c00000000800b560] ret_from_kernel_thread+0x5c/0x7c<br>Instruction d=
ump:<br>3d22001c 39293920 81290000 2f890000 409cff00 ebe10068 38210070 e801=
0010 <br>ebc1fff0 7c0803a6 4e800020 60000000 &lt;0fe00000&gt; 4bfffe74 6000=
0000 60000000 <br>---[ end trace ad1803c957b45442 ]---<br>---[ end Kernel p=
anic - not syncing: Out of memory and no killable processes...<br></div><di=
v><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Nov 2, 2020 at 6:26 PM Michael Ellerman &lt;<a href=3D"=
mailto:mpe@ellerman.id.au">mpe@ellerman.id.au</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Carl Jacobsen &lt;<a href=3D"m=
ailto:cjacobsen@storix.com" target=3D"_blank">cjacobsen@storix.com</a>&gt; =
writes:<br>
&gt; I&#39;ve got a SUSE 15.1 install (on ppc64le) that kernel panics on a =
very<br>
&gt; simple<br>
&gt; test program, built in a slightly unusual way.<br>
&gt;<br>
&gt; I&#39;m compiling on SUSE 12, using gcc 4.8.3. I&#39;m linking to a st=
atic<br>
&gt; copy of libcrypto.a (from openssl-1.1.1g), built without threads.<br>
&gt; I have a 10 line C test program that compiles and runs fine on the<br>
&gt; SUSE 12 system. If I compile the same program on SUSE 15.1 (with<br>
&gt; gcc 7.4.1), it runs fine on SUSE 15.1.<br>
&gt;<br>
&gt; But, if I run the version that I compiled on SUSE 12, on the SUSE 15.1=
<br>
&gt; system, the call to RAND_status() gets to a malloc() and then panics.<=
br>
&gt; (And, of course, if I just compile a call to malloc(), that runs fine<=
br>
&gt; on both systems.) Here&#39;s the test program, it&#39;s really just a =
call to<br>
&gt; RAND_status():<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0#include &lt;stdio.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0#include &lt;openssl/rand.h&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int has_enough_data =3D RAND_status()=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;The PRNG %s been seeded =
with enough data\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 has_enough_data=
 ? &quot;HAS&quot; : &quot;has NOT&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; openssl is configured/built with:<br>
&gt;=C2=A0 =C2=A0 =C2=A0./config no-shared no-dso no-threads -fPIC -ggdb3 -=
debug -static<br>
&gt;=C2=A0 =C2=A0 =C2=A0make<br>
&gt;<br>
&gt; and the test program is compiled with:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gcc -ggdb3 -o rand_test rand_test.c libcrypto.a<br>
&gt;<br>
&gt; The kernel on SUSE 12 is: 3.12.28-4-default<br>
&gt; And glibc is: 2.19<br>
&gt;<br>
&gt; The kernel on SUSE 15.1 is: 4.12.14-197.18-default<br>
&gt; And glibc is: 2.26<br>
&gt;<br>
&gt; In a previous iteration it was panicking in pthread_once(), so<br>
&gt; I compiled openssl without pthreads support, and now it panics<br>
&gt; calling malloc().<br>
<br>
What&#39;s the panic look like?<br>
<br>
cheers<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Carl Jacobsen<div>Storix, Inc.<=
/div></div></div>

--00000000000074508805b33b1f3f--
