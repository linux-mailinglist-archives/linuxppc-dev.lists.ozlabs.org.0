Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7815ED242
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 02:53:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McdKX53wDz3c8b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 10:53:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DhEeQ6tX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=zlang@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DhEeQ6tX;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc1vH2X2wz2yZf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 11:17:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 40E27B80D31;
	Tue, 27 Sep 2022 01:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A284C433D6;
	Tue, 27 Sep 2022 01:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664241445;
	bh=omNLUPEUvZRricyz4MwOlHbbzYTBCy5G/swpivEfH+U=;
	h=Date:From:To:Cc:Subject:From;
	b=DhEeQ6tXii3h3jT1Amtw5kIhQ8NEzj3RHRzfRshp/7zn2CeSgDKtpKVj+SJKc4ntw
	 CFxQD/s9A1BKJC7w5nzA9tNPX5Q1DHDXkimrfW3zdnWtKfm+9TEDV+gbn8WV9wiiR0
	 PAdFr2dBU4NUfPy8arVLjj9fJDOt1llGi9oWc9dTZW2NwtCjkIhHPr4DlMZsAE0nKZ
	 iGubkA7vOlaArVRe77JyLrCEXz4ALgzs4xvWPJW/Ks2mh6mMDpz/nICqDEo6VROwzk
	 gleFS7FAOXyFQvgNe3kjRn2NPlqIRRZ6yndHPOumJ38OOGwz0R9w2mN38Ve6bqulgL
	 tYdtKPIphXYOQ==
Date: Tue, 27 Sep 2022 09:17:20 +0800
From: Zorro Lang <zlang@kernel.org>
To: linux-mm@kvack.org
Subject: [Bug report] BUG: Kernel NULL pointer dereference at 0x00000069,
 filemap_release_folio+0x88/0xb0
Message-ID: <20220927011720.7jmugevxc7ax26qw@zlang-mailbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:50:40 +1000
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
Cc: linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi mm and ppc list,

Recently I started to hit a kernel panic [2] rarely on *ppc64le* with *1k
blocksize* ext4. It's not easy to reproduce, but still has chance to trigger
by loop running generic/048 on ppc64le (not sure all kind of ppc64le can
reproduce it).

Although I've reported a bug to ext4 [1] (more details refer to [1]), but I only
hit it on ppc64le until now, and I'm not sure if it's an ext4 related bug, more
likes folio related issue, so I cc mm and ppc mail list, hope to get more
reviewing.

Thanks,
Zorro

[1]
https://bugzilla.kernel.org/show_bug.cgi?id=216529

[2]
[ 4638.919160] run fstests generic/048 at 2022-09-23 21:00:41 
[ 4641.700564] EXT4-fs (sda3): mounted filesystem with ordered data mode. Quota mode: none. 
[ 4641.710999] EXT4-fs (sda3): shut down requested (1) 
[ 4641.718544] Aborting journal on device sda3-8. 
[ 4641.740342] EXT4-fs (sda3): unmounting filesystem. 
[ 4643.000415] EXT4-fs (sda3): mounted filesystem with ordered data mode. Quota mode: none. 
[ 4681.230907] BUG: Kernel NULL pointer dereference at 0x00000069 
[ 4681.230922] Faulting instruction address: 0xc00000000068ee0c 
[ 4681.230929] Oops: Kernel access of bad area, sig: 11 [#1] 
[ 4681.230934] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries 
[ 4681.230942] Modules linked in: dm_flakey ext2 dm_snapshot dm_bufio dm_zero dm_mod loop ext4 mbcache jbd2 bonding rfkill tls sunrpc pseries_rng drm fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp vmx_crypto 
[ 4681.230991] CPU: 0 PID: 82 Comm: kswapd0 Kdump: loaded Not tainted 6.0.0-rc6+ #1 
[ 4681.230999] NIP:  c00000000068ee0c LR: c00000000068f2b8 CTR: 0000000000000000 
[ 4681.238525] REGS: c000000006c0b560 TRAP: 0380   Not tainted  (6.0.0-rc6+) 
[ 4681.238532] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24028242  XER: 00000000 
[ 4681.238556] CFAR: c00000000068edf4 IRQMASK: 0  
[ 4681.238556] GPR00: c00000000068f2b8 c000000006c0b800 c000000002cf1700 c00c00000042f1c0  
[ 4681.238556] GPR04: c000000006c0b860 0000000000000000 0000000000000002 0000000000000000  
[ 4681.238556] GPR08: c000000002d404b0 0000000000000000 c00c00000042f1c0 0000000000000000  
[ 4681.238556] GPR12: c0000000001cf080 c000000005100000 c000000000194298 c0000001fff9c480  
[ 4681.238556] GPR16: c000000048cdb850 0000000000000007 0000000000000000 0000000000000000  
[ 4681.238556] GPR20: 0000000000000001 c000000006c0b8f8 c00000000146b9d8 5deadbeef0000100  
[ 4681.238556] GPR24: 5deadbeef0000122 c000000048cdb800 c000000006c0bc00 c000000006c0b8e8  
[ 4681.238556] GPR28: c000000006c0b860 c00c00000042f1c0 0000000000000009 0000000000000009  
[ 4681.238634] NIP [c00000000068ee0c] drop_buffers.constprop.0+0x4c/0x1c0 
[ 4681.238643] LR [c00000000068f2b8] try_to_free_buffers+0x128/0x150 
[ 4681.238650] Call Trace: 
[ 4681.238654] [c000000006c0b800] [c000000006c0b880] 0xc000000006c0b880 (unreliable) 
[ 4681.238663] [c000000006c0b840] [c000000006c0bc00] 0xc000000006c0bc00 
[ 4681.238670] [c000000006c0b890] [c000000000498708] filemap_release_folio+0x88/0xb0 
[ 4681.238679] [c000000006c0b8b0] [c0000000004c51c0] shrink_active_list+0x490/0x750 
[ 4681.238688] [c000000006c0b9b0] [c0000000004c9f88] shrink_lruvec+0x3f8/0x430 
[ 4681.238697] [c000000006c0baa0] [c0000000004ca1f4] shrink_node_memcgs+0x234/0x290 
[ 4681.238704] [c000000006c0bb10] [c0000000004ca3c4] shrink_node+0x174/0x6b0 
[ 4681.238711] [c000000006c0bbc0] [c0000000004cacf0] balance_pgdat+0x3f0/0x970 
[ 4681.238718] [c000000006c0bd20] [c0000000004cb440] kswapd+0x1d0/0x450 
[ 4681.238726] [c000000006c0bdc0] [c0000000001943d8] kthread+0x148/0x150 
[ 4681.238735] [c000000006c0be10] [c00000000000cbe4] ret_from_kernel_thread+0x5c/0x64 
[ 4681.238745] Instruction dump: 
[ 4681.238749] fbc1fff0 f821ffc1 7c7d1b78 7c9c2378 ebc30028 7fdff378 48000018 60000000  
[ 4681.238765] 60000000 ebff0008 7c3ef840 41820048 <815f0060> e93f0000 5529077c 7d295378  
[ 4681.238782] ---[ end trace 0000000000000000 ]--- 
[ 4681.270607]  
[ 4681.337460] Kernel attempted to read user page (6a) - exploit attempt? (uid: 0) 
[ 4681.337469] BUG: Kernel NULL pointer dereference on read at 0x0000006a 
[ 4681.337474] Faulting instruction address: 0xc00000000068ee0c 
[ 4681.337478] Oops: Kernel access of bad area, sig: 11 [#2] 
[ 4681.337481] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries 
[ 4681.337486] Modules linked in: dm_flakey ext2 dm_snapshot dm_bufio dm_zero dm_mod loop ext4 mbcache jbd2 bonding rfkill tls sunrpc pseries_rng drm fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp vmx_crypto 
[ 4681.337517] CPU: 2 PID: 704157 Comm: xfs_io Kdump: loaded Tainted: G      D            6.0.0-rc6+ #1 
[ 4681.337523] NIP:  c00000000068ee0c LR: c00000000068f2b8 CTR: 0000000000000000 
[ 4681.337527] REGS: c000000036006ef0 TRAP: 0300   Tainted: G      D             (6.0.0-rc6+) 
[ 4681.337532] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 28428242  XER: 00000001 
[ 4681.337546] CFAR: c00000000000c80c DAR: 000000000000006a DSISR: 40000000 IRQMASK: 0  
[ 4681.337546] GPR00: c00000000068f2b8 c000000036007190 c000000002cf1700 c00c000000424740  
[ 4681.337546] GPR04: c0000000360071f0 0000000000000000 0000000000000002 0000000000000000  
[ 4681.337546] GPR08: c000000002d404b0 0000000000000000 c00c000000424740 0000000000000002  
[ 4681.337546] GPR12: 0000000000000000 c00000000ffce400 0000000000000000 c0000001fff9c480  
[ 4681.337546] GPR16: c00000004960e050 0000000000000007 0000000000000000 0000000000000000  
[ 4681.337546] GPR20: 0000000000000001 c000000036007288 c00000000146b9d8 5deadbeef0000100  
[ 4681.337546] GPR24: 5deadbeef0000122 c00000004960e000 c000000036007678 c000000036007278  
[ 4681.337546] GPR28: c0000000360071f0 c00c000000424740 000000000000000a 000000000000000a  
[ 4681.337602] NIP [c00000000068ee0c] drop_buffers.constprop.0+0x4c/0x1c0 
[ 4681.337608] LR [c00000000068f2b8] try_to_free_buffers+0x128/0x150 
[ 4681.337613] Call Trace: 
[ 4681.337616] [c000000036007190] [c000000036007210] 0xc000000036007210 (unreliable) 
[ 4681.337622] [c0000000360071d0] [c000000036007678] 0xc000000036007678 
[ 4681.337627] [c000000036007220] [c000000000498708] filemap_release_folio+0x88/0xb0 
[ 4681.337633] [c000000036007240] [c0000000004c51c0] shrink_active_list+0x490/0x750 
[ 4681.337640] [c000000036007340] [c0000000004c9f88] shrink_lruvec+0x3f8/0x430 
[ 4681.337645] [c000000036007430] [c0000000004ca1f4] shrink_node_memcgs+0x234/0x290 
[ 4681.337651] [c0000000360074a0] [c0000000004ca3c4] shrink_node+0x174/0x6b0 
[ 4681.337656] [c000000036007550] [c0000000004cbd34] shrink_zones.constprop.0+0xd4/0x3e0 
[ 4681.337661] [c0000000360075d0] [c0000000004cc158] do_try_to_free_pages+0x118/0x470 
[ 4681.337667] [c000000036007650] [c0000000004cd084] try_to_free_pages+0x194/0x4c0 
[ 4681.337673] [c000000036007720] [c00000000054cca4] __alloc_pages_slowpath.constprop.0+0x4f4/0xd80 
[ 4681.337680] [c000000036007880] [c00000000054d95c] __alloc_pages+0x42c/0x580 
[ 4681.337686] [c000000036007910] [c000000000587d88] alloc_pages+0xd8/0x1d0 
[ 4681.337692] [c000000036007960] [c000000000587eb4] folio_alloc+0x34/0x90 
[ 4681.337698] [c000000036007990] [c000000000498bc0] filemap_alloc_folio+0x40/0x60 
[ 4681.337703] [c0000000360079b0] [c0000000004a0f54] __filemap_get_folio+0x224/0x790 
[ 4681.337709] [c000000036007ab0] [c0000000004b4830] pagecache_get_page+0x30/0xb0 
[ 4681.337715] [c000000036007ae0] [c008000003a9e4dc] ext4_da_write_begin+0x1a4/0x4f0 [ext4] 
[ 4681.337742] [c000000036007b70] [c000000000498e54] generic_perform_write+0xf4/0x2b0 
[ 4681.337748] [c000000036007c20] [c008000003a7d190] ext4_buffered_write_iter+0xa8/0x1a0 [ext4] 
[ 4681.337770] [c000000036007c70] [c000000000615fc8] vfs_write+0x358/0x4b0 
[ 4681.337776] [c000000036007d40] [c0000000006161f4] sys_pwrite64+0xd4/0x120 
[ 4681.337782] [c000000036007da0] [c0000000000318d0] system_call_exception+0x180/0x430 
[ 4681.337788] [c000000036007e10] [c00000000000be68] system_call_vectored_common+0xe8/0x278 
[ 4681.337795] --- interrupt: 3000 at 0x7fff95651da4 
[ 4681.337799] NIP:  00007fff95651da4 LR: 0000000000000000 CTR: 0000000000000000 
[ 4681.337803] REGS: c000000036007e80 TRAP: 3000   Tainted: G      D             (6.0.0-rc6+) 
[ 4681.337807] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48082402  XER: 00000000 
[ 4681.337822] IRQMASK: 0  
[ 4681.337822] GPR00: 00000000000000b4 00007ffffaa52530 00007fff95767200 0000000000000003  
[ 4681.337822] GPR04: 0000010031ac0000 0000000000010000 0000000000490000 00007fff9581a5a0  
[ 4681.337822] GPR08: 00007fff95812e68 0000000000000000 0000000000000000 0000000000000000  
[ 4681.337822] GPR12: 0000000000000000 00007fff9581a5a0 0000000000a00000 ffffffffffffffff  
[ 4681.337822] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000  
[ 4681.337822] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000490000  
[ 4681.337822] GPR24: 0000000000000049 0000000000000000 0000000000000000 0000000000010000  
[ 4681.337822] GPR28: 0000010031ac0000 0000000000000003 0000000000000000 0000000000490000  
[ 4681.337875] NIP [00007fff95651da4] 0x7fff95651da4 
[ 4681.337878] LR [0000000000000000] 0x0 
[ 4681.337881] --- interrupt: 3000 
[ 4681.337884] Instruction dump: 
[ 4681.337887] fbc1fff0 f821ffc1 7c7d1b78 7c9c2378 ebc30028 7fdff378 48000018 60000000  
[ 4681.337897] 60000000 ebff0008 7c3ef840 41820048 <815f0060> e93f0000 5529077c 7d295378  
[ 4681.337908] ---[ end trace 0000000000000000 ]---
