Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDBF867E0E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 18:20:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6nw3Vtwz3vds
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 04:20:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=nkce=kd=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6nR2XQjz2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 04:20:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6292D60DBF;
	Mon, 26 Feb 2024 17:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C68C433C7;
	Mon, 26 Feb 2024 17:20:08 +0000 (UTC)
Date: Mon, 26 Feb 2024 12:22:08 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: Kernel WARNING at lib/vsprintf.c:2721 while running ftrace
 kernel selftests
Message-ID: <20240226122208.344447f1@gandalf.local.home>
In-Reply-To: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
References: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 25 Feb 2024 22:01:50 +0530
Sachin Sant <sachinp@linux.ibm.com> wrote:

> While running ftrace specific kernel selftests following warning
> is seen on a Power10 logical partition (LPAR) booted with
> latest mainline kernel.
>=20
> ------------[ cut here ]------------
> precision 63492 too large
> WARNING: CPU: 15 PID: 2538829 at lib/vsprintf.c:2721 set_precision+0x68/0=
xa4

Interesting. I'm guessing something went negative.

> Modules linked in: nvram rpadlpar_io rpaphp uinput torture vmac poly1305_=
generic chacha_generic chacha20poly1305 n_gsm pps_ldisc ppp_synctty ppp_asy=
nc ppp_generic serport slcan can_dev slip slhc snd_hrtimer snd_seq snd_seq_=
device snd_timer snd soundcore pcrypt crypto_user n_hdlc dummy veth tun nfs=
v3 nfs netfs brd overlay exfat vfat fat btrfs blake2b_generic xor raid6_pq =
zstd_compress xfs loop sctp ip6_udp_tunnel udp_tunnel nfsd auth_rpcgss nfs_=
acl lockd grace configs dm_mod nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_f=
ib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chai=
n_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill tls =
ip_set nf_tables libcrc32c nfnetlink sunrpc pseries_rng vmx_crypto ext4 mbc=
ache jbd2 sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi ibmveth scsi_trans=
port_srp fuse [last unloaded: test_cpuidle_latency(O)]
> CPU: 15 PID: 2538829 Comm: awk Tainted: G M O K 6.8.0-rc5-gfca7526b7d89 #1
> Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW106=
0.00 (NH1060_018) hv:phyp pSeries
> NIP: c000000000f57c34 LR: c000000000f57c30 CTR: c000000000f5cdf0
> REGS: c000000a58e4f5f0 TRAP: 0700 Tainted: G M O K (6.8.0-rc5-gfca7526b7d=
89)
> MSR: 8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE> CR: 48000824 XER: 000000=
05
> CFAR: c00000000016154c IRQMASK: 0=20
> GPR00: c000000000f57c30 c000000a58e4f890 c000000001482800 000000000000001=
9=20
> GPR04: 0000000100011559 c000000a58e4f660 c000000a58e4f658 000000000000002=
7=20
> GPR08: c000000e84e37c10 0000000000000001 0000000000000027 c000000002a47e5=
0=20
> GPR12: 0000000000000000 c000000e87bf7300 0000000000000000 000000000000000=
0=20
> GPR16: 0000000000000000 0000000000000000 0000000000000000 000000000000000=
0=20
> GPR20: c0000004a43ec590 0000000000400cc0 0000000000000003 c0000000012c3e6=
5=20
> GPR24: c000000a58e4fa18 0000000000000025 0000000000000020 000000000001ff9=
7=20
> GPR28: c0000001168a00dd c0000001168c0074 c000000a58e4f920 000000000000f80=
4=20
> NIP [c000000000f57c34] set_precision+0x68/0xa4
> LR [c000000000f57c30] set_precision+0x64/0xa4
> Call Trace:
> [c000000a58e4f890] [c000000000f57c30] set_precision+0x64/0xa4 (unreliable)
> [c000000a58e4f900] [c000000000f5ccc4] vsnprintf+0x198/0x4c8
> [c000000a58e4f980] [c000000000f53228] seq_buf_vprintf+0x50/0xa0
> [c000000a58e4f9b0] [c00000000031cec0] trace_seq_printf+0x60/0xe0
> [c000000a58e4f9e0] [c00000000031b5f0] trace_print_print+0x78/0xa4
> [c000000a58e4fa60] [c0000000003133a4] print_trace_line+0x2ac/0x6d8
> [c000000a58e4fb20] [c0000000003145c0] s_show+0x58/0x2c0
> [c000000a58e4fba0] [c0000000005dfb2c] seq_read_iter+0x448/0x618
> [c000000a58e4fc70] [c0000000005dfe08] seq_read+0x10c/0x174
> [c000000a58e4fd10] [c00000000059a7e0] vfs_read+0xe0/0x39c
> [c000000a58e4fdc0] [c00000000059b59c] ksys_read+0x7c/0x140
> [c000000a58e4fe10] [c000000000035d74] system_call_exception+0x134/0x330
> [c000000a58e4fe50] [c00000000000d6a0] system_call_common+0x160/0x2e4
> --- interrupt: c00 at 0x7fff84521684
> NIP: 00007fff84521684 LR: 00000001252f0dc4 CTR: 0000000000000000
> REGS: c000000a58e4fe80 TRAP: 0c00 Tainted: G M O K (6.8.0-rc5-gfca7526b7d=
89)
> MSR: 800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE> CR: 22000202 XER: 0000=
0000
> IRQMASK: 0=20
> GPR00: 0000000000000003 00007fffcd076c30 00007fff84607300 000000000000000=
5=20
> GPR04: 000000012a8a1a20 0000000000010000 fffffffffffffff5 000000012a9bcce=
6=20
> GPR08: 0000000000000001 0000000000000000 0000000000000000 000000000000000=
0=20
> GPR12: 0000000000000000 00007fff84a5d2a0 0000000000000001 000000012a8851d=
8=20
> GPR16: 000000012a884268 00007fff84601888 0000000125377f50 00007fff8460188=
0=20
> GPR20: 0000000000000044 000000000000000f ffffffffffffffff 000000000000000=
0=20
> GPR24: 00007fffcd076e48 00007fffcd076d98 0000000000000000 000000000000000=
0=20
> GPR28: 00007fffcd076e48 0000000000000000 00007fffcd076da0 000000012a8a190=
0=20
> NIP [00007fff84521684] 0x7fff84521684
> LR [00000001252f0dc4] 0x1252f0dc4
> --- interrupt: c00
> Code: f821ff91 2f890000 409e0034 7c0802a6 3c62fff0 39200001 3d420177 3863=
e310 992ad6db f8010080 4b209899 60000000 <0fe00000> e8010080 7c0803a6 2f9f0=
000=20
> ---[ end trace 0000000000000000 ]=E2=80=94
>=20
> This warning is seen while running test that was added by
> following commit:
>=20
> commit 3bf7009251f0f41cdd0188ab7b3879df81810703
>      tracing/selftests: Add test to test the trace_marker

This adds the user space selftest that triggered this warning, but it is
not the cause of it. Could you run this test against kernel builds before
this commit. Does this test cause this to trigger on older versions of the
kernel?

-- Steve
