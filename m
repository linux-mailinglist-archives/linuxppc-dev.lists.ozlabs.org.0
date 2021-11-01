Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD1A441235
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 03:44:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjHRt1kRHz2yPQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 13:44:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QEjohzc9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QEjohzc9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QEjohzc9; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=QEjohzc9; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjHR60TJrz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Nov 2021 13:43:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635734618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vdvnnd+T5ZBlQ5mLqGNUvJDSXvFCxOPbjTGBtJeFh4s=;
 b=QEjohzc9/CgaE09pVMBfM+Bpyxs2mW5tWiabpd8u+Wb4FanobY24XPKCw/W58dDtLbAV4/
 w7kywoXk74cBGPCXxqgAIjSijBAK0N9HA7lsXT0+8iCqUENCLn4HyMOu8hexmJAsc96XpG
 lMuN0kC7iNLouD0CCyJHv8nbkA6EeAo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635734618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vdvnnd+T5ZBlQ5mLqGNUvJDSXvFCxOPbjTGBtJeFh4s=;
 b=QEjohzc9/CgaE09pVMBfM+Bpyxs2mW5tWiabpd8u+Wb4FanobY24XPKCw/W58dDtLbAV4/
 w7kywoXk74cBGPCXxqgAIjSijBAK0N9HA7lsXT0+8iCqUENCLn4HyMOu8hexmJAsc96XpG
 lMuN0kC7iNLouD0CCyJHv8nbkA6EeAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-rKVNv_R1P6GOe85mDPyi-Q-1; Sun, 31 Oct 2021 22:43:34 -0400
X-MC-Unique: rKVNv_R1P6GOe85mDPyi-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AE861808304;
 Mon,  1 Nov 2021 02:43:33 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EE1719D9F;
 Mon,  1 Nov 2021 02:43:30 +0000 (UTC)
Date: Sun, 31 Oct 2021 22:43:28 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add() crashes
Message-ID: <YX9UUBeudSUuJs01@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Jordan Niethe <jniethe5@gmail.com>, Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Starting with 5.14 kernels, I can reliably reproduce a crash [1] on
ppc64le when loading livepatches containing late klp-relocations [2].
These are relocations, specific to livepatching, that are resolved not
when a livepatch module is loaded, but only when a livepatch-target
module is loaded.

There was previously related work by Josh and Peter [3] to simplify a
lot of x86 and s390x code (at the time, the only two arches to
HAVE_LIVEPATCH and STRICT_MODULE_RWX) as part of disallowing writable
executable mappings.

Now that Power has STRICT_MODULE_RWX, I think we will need to consider
this architecture as well.

The crash was originally spotted by the external kpatch-build tool [4]
when building its integration tests on rhel-9-beta.  It can also be
reproduced by the endless-WIP klp-convert patchset [5], which brings
klp-relocation creation from kpatch-build to the upstream build.

I further verified:
  - turning STRICT_MODULE_RWX off resulted in no crash
  - alternatively, reverting the following commits resulted in no crash:

    d556e1be3332 ("livepatch: Remove module_disable_ro() usage")
    0d9fbf78fefb ("module: Remove module_disable_ro()")

I haven't started looking at a fix yet, but in the case of the x86 code
update, its apply_relocate_add() implementation was modified to use a
common text_poke() function to allowed us to drop
module_{en,dis}ble_ro() games by the livepatching code.

I can take a closer look this week, but thought I'd send out a report
in case this may be a known todo for STRICT_MODULE_RWX on Power.

-- Joe


[1] crashing kernel log

[   84.837986] ===== TEST: klp-convert symbols =====
[   84.858937] % modprobe test_klp_convert_mod
[   84.879040] % modprobe test_klp_convert1
[   84.908056] BUG: Unable to handle kernel data access on write at 0xc0080000018402f0
[   84.908067] Faulting instruction address: 0xc000000000056b58
[   84.908072] Oops: Kernel access of bad area, sig: 11 [#1]
[   84.908077] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[   84.908082] Modules linked in: test_klp_convert1(K+) test_klp_convert_mod bonding tls rfkill pseries_rng drm fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp vmx_crypto dm_mirror dm_region_hash dm_log dm_mod [last unloaded: test_klp_atomic_replace]
[   84.908114] CPU: 1 PID: 4205 Comm: modprobe Kdump: loaded Tainted: G              K   5.14.0+ #2
[   84.908121] NIP:  c000000000056b58 LR: c000000000056b1c CTR: 0000000000000009
[   84.908127] REGS: c00000005dce3480 TRAP: 0300   Tainted: G              K    (5.14.0+)
[   84.908132] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24224484  XER: 00000000
[   84.908147] CFAR: c000000000056a68 DAR: c0080000018402f0 DSISR: 0a000000 IRQMASK: 0 
GPR00: c000000000056b1c c00000005dce3720 c000000002a2af00 0000000000000000 
GPR04: c0080000018402f0 396b00003d620000 e98b0020f8410018 00000000ffffffff 
GPR08: 4e8004207d8903a6 0000000080000000 c0080000018382f0 000000000000000d 
GPR12: 0000000000004000 c000000007fcf480 c00000004d7e2000 c0080000018706d8 
GPR16: c008000001850228 c00000004d7e2c00 00000000ffffffff c0000000010d6248 
GPR20: c00000000298c1c8 c008000001860380 c0080000018706f0 aaaaaaaaaaaaaaab 
GPR24: c00000004d7e2b40 c008000001870000 c00800000184005c 000000000000008c 
GPR28: c008000001860380 c008000000770008 c00000004d7e2000 c0080000018402f0 
[   84.908209] NIP [c000000000056b58] create_stub+0x78/0x240
[   84.908217] LR [c000000000056b1c] create_stub+0x3c/0x240
[   84.908223] Call Trace:
[   84.908225] [c00000005dce3720] [c00000004d7e2b40] 0xc00000004d7e2b40 (unreliable)
[   84.908232] [c00000005dce37a0] [c000000000056e0c] stub_for_addr+0xec/0x120
[   84.908240] [c00000005dce37d0] [c000000000057f14] apply_relocate_add+0x814/0x9a0
[   84.908247] [c00000005dce38d0] [c00000000021ca38] klp_apply_section_relocs+0x208/0x2d0
[   84.908255] [c00000005dce39c0] [c00000000021cb90] klp_init_object_loaded+0x90/0x1d0
[   84.908262] [c00000005dce3a50] [c00000000021d2dc] klp_enable_patch+0x32c/0x540
[   84.908269] [c00000005dce3b10] [c008000001840030] test_klp_convert_init+0x28/0x48 [test_klp_convert1]
[   84.908277] [c00000005dce3b30] [c000000000012230] do_one_initcall+0x60/0x2c0
[   84.908284] [c00000005dce3c00] [c00000000026012c] do_init_module+0x7c/0x3b0
[   84.908290] [c00000005dce3c90] [c000000000262b74] __do_sys_finit_module+0xd4/0x160
[   84.908296] [c00000005dce3db0] [c000000000030664] system_call_exception+0x144/0x280
[   84.908303] [c00000005dce3e10] [c00000000000bff0] system_call_vectored_common+0xf0/0x280
[   84.908310] --- interrupt: 3000 at 0x7fffa06d6b9c
[   84.908315] NIP:  00007fffa06d6b9c LR: 0000000000000000 CTR: 0000000000000000
[   84.908320] REGS: c00000005dce3e80 TRAP: 3000   Tainted: G              K    (5.14.0+)
[   84.908325] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28224244  XER: 00000000
[   84.908340] IRQMASK: 0 
GPR00: 0000000000000161 00007fffc4f74ad0 00007fffa07d7100 0000000000000005 
GPR04: 000000012a926ca0 0000000000000000 0000000000000005 0000000000000000 
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR12: 0000000000000000 00007fffa0f9c380 0000000000000020 0000000000000000 
GPR16: 00000100010a1de0 0000000000000000 000000012a927d50 00000100010a02f8 
GPR20: 0000000000000001 0000000000000908 00000100010a2020 00000100010a19b0 
GPR24: 0000000000000000 0000000000000000 00000100010a2040 00000100010a03f0 
GPR28: 00000100010a1e00 000000012a926ca0 0000000000040000 00000100010a19b0 
[   84.908399] NIP [00007fffa06d6b9c] 0x7fffa06d6b9c
[   84.908403] LR [0000000000000000] 0x0
[   84.908406] --- interrupt: 3000
[   84.908410] Instruction dump:
[   84.908413] 3d02ffb2 395f8000 3d208000 3ce0ffff 38c68d70 39088d84 79290020 60e7ffff 
[   84.908423] e8a60014 e8c80008 e9080010 78e70020 <f8bf0000> f8df0008 f91f0010 811c0224 
[   84.908435] ---[ end trace 961b4b817da4a53b ]---

[2] https://www.kernel.org/doc/html/latest/livepatch/module-elf-format.html
[3] https://lore.kernel.org/lkml/cover.1588173720.git.jpoimboe@redhat.com/
[4] https://github.com/dynup/kpatch/issues/1228
[5] https://github.com/joe-lawrence/linux/tree/klp-convert-v5-expanded-v5.14-rebase1

