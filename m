Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081776C6A59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 15:03:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj6W35rdMz3fCh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 01:03:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p8EJy2mB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p8EJy2mB;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj6V61yd7z3cB1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 01:02:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1AA5B81EC7;
	Thu, 23 Mar 2023 14:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6EBC433EF;
	Thu, 23 Mar 2023 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679580137;
	bh=4BlmXMRr26YZCeH8C6Q4S+NzUoEcZ7BqkJlz8QeKf7E=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=p8EJy2mB1R7yx87veUnHtbAshdKvVmlfCwVAP4SUX4YqsIQzsPhl/f2ngog2ZBj8M
	 bTG2yI9c6c2NHrzFIThlvt1W8OY2VjuGpv39xNEVrvuTVHMAaXroFXdMtmMcwG8pOw
	 uhDjDXMPrHGk19+JzMXwpL3U23HC2CedoJwgXSc3xVJNF7zqIEO5liafzYRduWkskf
	 DmRUcOXJriLXqifnTGt4AdDlyvFWnmQMY8MChaqCNA5hybHJj1mTJJYCQZy1rD+xRp
	 LfFeMa8vWzpDG/PCeQKSmSuri7upewGTh7ymoHYTrrTEryRNZdU0k+dFFZJhjrmz3q
	 LtbHkdo7vRWPw==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
	id 078391540398; Thu, 23 Mar 2023 07:02:17 -0700 (PDT)
Date: Thu, 23 Mar 2023 07:02:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [next-20230322] Kernel WARN at kernel/workqueue.c:3182
 (rcutorture)
Message-ID: <fbb628c1-08bd-44ff-a613-794b134f6d46@paulmck-laptop>
References: <139BEB3F-BC1C-4ABA-8928-9A8EF3FB5EDD@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <139BEB3F-BC1C-4ABA-8928-9A8EF3FB5EDD@linux.ibm.com>
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
Reply-To: paulmck@kernel.org
Cc: Zqiang <qiang1.zhang@intel.com>, linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 23, 2023 at 04:55:54PM +0530, Sachin Sant wrote:
> While running rcutorture tests from LTP on an IBM Power10 server booted with
> 6.3.0-rc3-next-20230322 following warning is observed:
> 
> [ 3629.242831] ------------[ cut here ]------------
> [ 3629.242835] WARNING: CPU: 8 PID: 614614 at kernel/workqueue.c:3182 __flush_work.isra.44+0x44/0x370
> [ 3629.242845] Modules linked in: rcutorture(-) torture vmac poly1305_generic chacha_generic chacha20poly1305 n_gsm pps_ldisc ppp_synctty ppp_async ppp_generic serport slcan can_dev slip slhc snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore pcrypt crypto_user n_hdlc dummy veth tun nfsv3 nfs_acl nfs lockd grace fscache netfs brd overlay exfat vfat fat btrfs blake2b_generic xor raid6_pq zstd_compress xfs loop sctp ip6_udp_tunnel udp_tunnel libcrc32c dm_mod bonding rfkill tls sunrpc kmem device_dax nd_pmem nd_btt dax_pmem papr_scm pseries_rng libnvdimm vmx_crypto ext4 mbcache jbd2 sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth fuse [last unloaded: ltp_uaccess(O)]
> [ 3629.242911] CPU: 8 PID: 614614 Comm: modprobe Tainted: G O 6.3.0-rc3-next-20230322 #1
> [ 3629.242917] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
> [ 3629.242923] NIP: c00000000018c204 LR: c00000000022306c CTR: c0000000002233c0
> [ 3629.242927] REGS: c0000005c14e3880 TRAP: 0700 Tainted: G O (6.3.0-rc3-next-20230322)
> [ 3629.242932] MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 48002222 XER: 0000000a
> [ 3629.242943] CFAR: c00000000018c5b0 IRQMASK: 0 
> [ 3629.242943] GPR00: c00000000022306c c0000005c14e3b20 c000000001401200 c00800000c4419e8 
> [ 3629.242943] GPR04: 0000000000000001 0000000000000001 0000000000000011 fffffffffffe0000 
> [ 3629.242943] GPR08: c000000efe9a8300 0000000000000001 0000000000000000 c00800000c42afe0 
> [ 3629.242943] GPR12: c0000000002233c0 c000000effff6700 0000000000000000 0000000000000000 
> [ 3629.242943] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [ 3629.242943] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [ 3629.242943] GPR24: c00800000c443400 c00800000c440f60 c00800000c4418c8 c000000002abb368 
> [ 3629.242943] GPR28: c00800000c440f58 0000000000000000 c00800000c4419e8 c00800000c443400 
> [ 3629.242987] NIP [c00000000018c204] __flush_work.isra.44+0x44/0x370
> [ 3629.242993] LR [c00000000022306c] cleanup_srcu_struct+0x6c/0x1e0
> [ 3629.242998] Call Trace:
> [ 3629.243000] [c0000005c14e3b20] [c00800000c440f58] srcu9+0x0/0xfffffffffffef0a8 [rcutorture] (unreliable)
> [ 3629.243009] [c0000005c14e3bb0] [c00000000022306c] cleanup_srcu_struct+0x6c/0x1e0
> [ 3629.243015] [c0000005c14e3c50] [c000000000223428] srcu_module_notify+0x68/0x180
> [ 3629.243021] [c0000005c14e3c90] [c00000000019a1e0] notifier_call_chain+0xc0/0x1b0
> [ 3629.243027] [c0000005c14e3cf0] [c00000000019ad24] blocking_notifier_call_chain+0x64/0xa0
> [ 3629.243033] [c0000005c14e3d30] [c00000000024a4c8] sys_delete_module+0x1f8/0x3c0
> [ 3629.243039] [c0000005c14e3e10] [c000000000037480] system_call_exception+0x140/0x350
> [ 3629.243044] [c0000005c14e3e50] [c00000000000d6a0] system_call_common+0x160/0x2e4
> [ 3629.243050] --- interrupt: c00 at 0x7fff8cd39558
> [ 3629.243054] NIP: 00007fff8cd39558 LR: 000000010d800398 CTR: 0000000000000000
> [ 3629.243057] REGS: c0000005c14e3e80 TRAP: 0c00 Tainted: G O (6.3.0-rc3-next-20230322)
> [ 3629.243062] MSR: 800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> CR: 28008282 XER: 00000000
> [ 3629.243072] IRQMASK: 0 
> [ 3629.243072] GPR00: 0000000000000081 00007fffe99fd9c0 00007fff8ce07300 000000013df30ec8 
> [ 3629.243072] GPR04: 0000000000000800 000000000000000a 1999999999999999 0000000000000000 
> [ 3629.243072] GPR08: 00007fff8cd98160 0000000000000000 0000000000000000 0000000000000000 
> [ 3629.243072] GPR12: 0000000000000000 00007fff8d5fcb50 000000010d80a650 000000010d80a648 
> [ 3629.243072] GPR16: 0000000000000000 0000000000000001 0000000000000000 000000010d80a428 
> [ 3629.243072] GPR20: 000000010d830068 0000000000000000 00007fffe99ff2f8 000000013df304f0 
> [ 3629.243072] GPR24: 0000000000000000 00007fffe99ff2f8 000000013df30ec8 0000000000000000 
> [ 3629.243072] GPR28: 0000000000000000 000000013df30e60 000000013df30ec8 000000013df30e60 
> [ 3629.243115] NIP [00007fff8cd39558] 0x7fff8cd39558
> [ 3629.243118] LR [000000010d800398] 0x10d800398
> [ 3629.243121] --- interrupt: c00
> [ 3629.243123] Code: 89292e39 f821ff71 e94d0c78 f9410068 39400000 69290001 0b090000 fbc10080 7c7e1b78 e9230018 7d290074 7929d182 <0b090000> 7c0802a6 fb810070 f80100a0 
> [ 3629.243138] ---[ end trace 0000000000000000 ]—
> 
> Followed by following traces:
> 
> [ 3629.243149] ------------[ cut here ]------------
> [ 3629.243152] WARNING: CPU: 8 PID: 614614 at kernel/rcu/srcutree.c:663 cleanup_srcu_struct+0x11c/0x1e0
> [ 3629.243159] Modules linked in: rcutorture(-) torture vmac poly1305_generic chacha_generic chacha20poly1305 n_gsm pps_ldisc ppp_synctty ppp_async ppp_generic serport slcan can_dev slip slhc snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore pcrypt crypto_user n_hdlc dummy veth tun nfsv3 nfs_acl nfs lockd grace fscache netfs brd overlay exfat vfat fat btrfs blake2b_generic xor raid6_pq zstd_compress xfs loop sctp ip6_udp_tunnel udp_tunnel libcrc32c dm_mod bonding rfkill tls sunrpc kmem device_dax nd_pmem nd_btt dax_pmem papr_scm pseries_rng libnvdimm vmx_crypto ext4 mbcache jbd2 sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth fuse [last unloaded: ltp_uaccess(O)]
> [ 3629.243217] CPU: 8 PID: 614614 Comm: modprobe Tainted: G W O 6.3.0-rc3-next-20230322 #1
> [ 3629.243222] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
> [ 3629.243227] NIP: c00000000022311c LR: c0000000002230d8 CTR: c0000000002233c0
> [ 3629.243230] REGS: c0000005c14e3910 TRAP: 0700 Tainted: G W O (6.3.0-rc3-next-20230322)
> [ 3629.243235] MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 28002228 XER: 0000000a
> [ 3629.243245] CFAR: c0000000008040c0 IRQMASK: 0 
> [ 3629.243245] GPR00: c0000000002230b8 c0000005c14e3bb0 c000000001401200 0000000000000040 
> [ 3629.243245] GPR04: 0000000000000040 0000000000000040 0000000000000011 fffffffffffe0000 
> [ 3629.243245] GPR08: ffffffffffffffff 0000000000000001 0000000000000000 c00800000c42afe0 
> [ 3629.243245] GPR12: c0000000002233c0 c000000effff6700 0000000000000000 0000000000000000 
> [ 3629.243245] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [ 3629.243245] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [ 3629.243245] GPR24: c00800000c443400 c00800000c440f60 c00800000c4418c8 c000000002bdabe0 
> [ 3629.243245] GPR28: c00800000c440f58 c000000002bdbe00 0000000000000040 c009fffffeb8c500 
> [ 3629.243288] NIP [c00000000022311c] cleanup_srcu_struct+0x11c/0x1e0
> [ 3629.243293] LR [c0000000002230d8] cleanup_srcu_struct+0xd8/0x1e0
> [ 3629.243298] Call Trace:
> [ 3629.243300] [c0000005c14e3bb0] [c0000000002230b8] cleanup_srcu_struct+0xb8/0x1e0 (unreliable)
> [ 3629.243306] [c0000005c14e3c50] [c000000000223428] srcu_module_notify+0x68/0x180
> [ 3629.243312] [c0000005c14e3c90] [c00000000019a1e0] notifier_call_chain+0xc0/0x1b0
> [ 3629.243318] [c0000005c14e3cf0] [c00000000019ad24] blocking_notifier_call_chain+0x64/0xa0
> [ 3629.243324] [c0000005c14e3d30] [c00000000024a4c8] sys_delete_module+0x1f8/0x3c0
> [ 3629.243329] [c0000005c14e3e10] [c000000000037480] system_call_exception+0x140/0x350
> [ 3629.243335] [c0000005c14e3e50] [c00000000000d6a0] system_call_common+0x160/0x2e4
> [ 3629.243341] --- interrupt: c00 at 0x7fff8cd39558
> [ 3629.243344] NIP: 00007fff8cd39558 LR: 000000010d800398 CTR: 0000000000000000
> [ 3629.243348] REGS: c0000005c14e3e80 TRAP: 0c00 Tainted: G W O (6.3.0-rc3-next-20230322)
> [ 3629.243353] MSR: 800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> CR: 28008282 XER: 00000000
> [ 3629.243363] IRQMASK: 0 
> [ 3629.243363] GPR00: 0000000000000081 00007fffe99fd9c0 00007fff8ce07300 000000013df30ec8 
> [ 3629.243363] GPR04: 0000000000000800 000000000000000a 1999999999999999 0000000000000000 
> [ 3629.243363] GPR08: 00007fff8cd98160 0000000000000000 0000000000000000 0000000000000000 
> [ 3629.243363] GPR12: 0000000000000000 00007fff8d5fcb50 000000010d80a650 000000010d80a648 
> [ 3629.243363] GPR16: 0000000000000000 0000000000000001 0000000000000000 000000010d80a428 
> [ 3629.243363] GPR20: 000000010d830068 0000000000000000 00007fffe99ff2f8 000000013df304f0 
> [ 3629.243363] GPR24: 0000000000000000 00007fffe99ff2f8 000000013df30ec8 0000000000000000 
> [ 3629.243363] GPR28: 0000000000000000 000000013df30e60 000000013df30ec8 000000013df30e60 
> [ 3629.243407] NIP [00007fff8cd39558] 0x7fff8cd39558
> [ 3629.243410] LR [000000010d800398] 0x10d800398
> [ 3629.243413] --- interrupt: c00
> [ 3629.243415] Code: 419dffa4 e93a0078 39400001 552907be 2f890000 7d20579e 0b090000 e95a0078 e91a0080 39200001 7fa85000 7d204f9e <0b090000> 7f23cb78 4bfffd65 0b030000 
> [ 3629.243430] ---[ end trace 0000000000000000 ]—
> 
> These warnings are repeated few times. The LTP test is marked as PASS.
> 
> Git bisect point to the following patch
> commit f46a5170e6e7d5f836f2199fe82cdb0b4363427f
>     srcu: Use static init for statically allocated in-module srcu_struct

Hello, Sachin, and it looks like you hit something that Zqiang and I
have been tracking down.  I am guessing that you were using modprobe
and rmmod to make this happen, and that this happened at rmmod time.

Whatever the reproducer, does the following patch help?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 1fb078abbdc9..06f8ed1ce272 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1921,7 +1921,6 @@ static int srcu_module_coming(struct module *mod)
 		ssp->sda = alloc_percpu(struct srcu_data);
 		if (WARN_ON_ONCE(!ssp->sda))
 			return -ENOMEM;
-		init_srcu_struct_data(ssp);
 	}
 	return 0;
 }
@@ -1930,10 +1929,17 @@ static int srcu_module_coming(struct module *mod)
 static void srcu_module_going(struct module *mod)
 {
 	int i;
+	struct srcu_data __percpu *sda;
+	struct srcu_struct *ssp;
 	struct srcu_struct **sspp = mod->srcu_struct_ptrs;
 
-	for (i = 0; i < mod->num_srcu_structs; i++)
-		cleanup_srcu_struct(*(sspp++));
+	for (i = 0; i < mod->num_srcu_structs; i++) {
+		ssp = *(sspp++);
+		sda = ssp->sda;
+		if (!rcu_seq_state(smp_load_acquire(&ssp->srcu_sup->srcu_gp_seq_needed)))
+			cleanup_srcu_struct(ssp);
+		free_percpu(sda);
+	}
 }
 
 /* Handle one module, either coming or going. */
