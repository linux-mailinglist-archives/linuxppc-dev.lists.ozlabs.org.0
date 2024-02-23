Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D218611EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 13:48:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=mUYB9tym;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th8v92T5Xz3vXZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 23:48:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=mUYB9tym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::102; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 40819 seconds by postgrey-1.37 at boromir; Fri, 23 Feb 2024 23:47:38 AEDT
Received: from mout-p-102.mailbox.org (unknown [IPv6:2001:67c:2050:0:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th8tL5W36z3cZL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 23:47:36 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Th8sw0Jlhz9sSH;
	Fri, 23 Feb 2024 13:47:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1708692436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/crhX6cW2pmjl6WLBniM1V2UxrSq0U67T/TCqCk2fE=;
	b=mUYB9tymaNcIiry/ypmaIWEIm+VX4A35VPVSnf5R/1sLWhpMyc5kuAZnxBmWsOsZ/F7PDw
	Y3UpkKuja0v61FOv3dmeUdqON7Wo1fnPyLAUagk19gk9MRNtgS6Eb4nhoHq2cnqd4LOYQz
	sLN+mQcOUzgVzURTCpfeN4fMTe3J5OXNvtwgQJdc6t755Vp8WldS3ijrh18V330slrCn9L
	9OzHgUdvI5TcQFiiwbuir5rWWcQbfZKaDJ2wiYNuZQlDgqfFcD6dC7Ayzkn2IL/liKu+nx
	CIZpCcPX4crKboISuWnDqMijsnACdZHltlcc5/iLETw9uyvgrtFSjKCPlQD1AQ==
Date: Fri, 23 Feb 2024 13:47:13 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: "BUG: Kernel NULL pointer dereference on read at 0x00000000" at
 running drm_gem_shmem_test on a Talos II, kernel 6.8-rc5
Message-ID: <20240223134537.41a7eb16@yea>
In-Reply-To: <20240223024222.6852d94b@yea>
References: <20240223024222.6852d94b@yea>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zfsodhci5reufiskpur3pzhti5933wr8
X-MBO-RS-ID: be16f0b82e34daef8bd
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
Cc: Linux DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 23 Feb 2024 02:42:22 +0100
Erhard Furtner <erhard_f@mailbox.org> wrote:

> Greetings!
> 
> Looks like my Talos II (running a BE kernel+system) fails some of the kernels internal unit tests. At running drm_gem_shmem_test via 'modprobe -v drm_gem_shmem_test' I get:

KASAN gets some additional information out of it:

[...]
KTAP version 1
1..1
    KTAP version 1
    # Subtest: drm_gem_shmem
    # module: drm_gem_shmem_test
    1..8
    ok 1 drm_gem_shmem_test_obj_create
==================================================================
BUG: KASAN: null-ptr-deref in dma_unmap_sg_attrs+0x7c/0x210
Read of size 8 at addr 0000000000000000 by task kunit_try_catch/4023

CPU: 24 PID: 4023 Comm: kunit_try_catch Tainted: G        W       TN 6.8.0-rc5-P9-dirty #4
Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
Call Trace:
[c00020004560f920] [c0000000013c2618] dump_stack_lvl+0x74/0xb8 (unreliable)
[c00020004560f950] [c00000000055831c] print_report+0x200/0xa64
[c00020004560fa50] [c000000000558f5c] kasan_report+0x160/0x28c
[c00020004560fb70] [c00000000055b3f8] __asan_load8+0xec/0x140
[c00020004560fb90] [c000000000283d9c] dma_unmap_sg_attrs+0x7c/0x210
[c00020004560fbf0] [c0080000227ed3bc] drm_gem_shmem_free+0x160/0x398 [drm_shmem_helper]
[c00020004560fc80] [c008000022812cf8] drm_gem_shmem_test_obj_create_private+0x288/0x588 [drm_gem_shmem_test]
[c00020004560fe90] [c000000000b15ca4] kunit_try_run_case+0xfc/0x34c
[c00020004560ff50] [c000000000b1a698] kunit_generic_run_threadfn_adapter+0x50/0x7c
[c00020004560ff80] [c0000000001cd7bc] kthread+0x1d4/0x1e0
[c00020004560ffe0] [c00000000000d030] start_kernel_thread+0x14/0x18
==================================================================
BUG: Kernel NULL pointer dereference on read at 0x00000000
Faulting instruction address: 0xc000000000283da4
Oops: Kernel access of bad area, sig: 7 [#1]
BE PAGE_SIZE=4K MMU=Radix SMP NR_CPUS=32 NUMA PowerNV
Modules linked in: drm_gem_shmem_test drm_shmem_helper slub_kunit drm_rect_test drm_modes_test drm_mm_test drm_managed_test drm_framebuffer_test drm_format_test drm_exec_test drm_kunit_helpers drm_exec drm_dp_mst_helper_test drm_damage_helper_test drm_connector_test drm_cmdline_parser_test drm_buddy_test drm_buddy snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore evdev input_leds hid_generic usbhid hid radeon xts ctr cbc xhci_pci xhci_hcd drm_suballoc_helper i2c_algo_bit drm_ttm_helper ofpart aes_generic libaes cfg80211 ttm drm_display_helper vmx_crypto powernv_flash gf128mul
 usbcore mtd backlight rfkill at24 usb_common regmap_i2c opal_prd ibmpowernv lz4 lz4_compress lz4_decompress zram pkcs8_key_parser powernv_cpufreq dm_mod loop configfs
CPU: 24 PID: 4023 Comm: kunit_try_catch Tainted: G    B   W       TN 6.8.0-rc5-P9-dirty #4
Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
NIP:  c000000000283da4 LR: c000000000283d9c CTR: 0000000000000000
REGS: c00020004560f8f0 TRAP: 0300   Tainted: G    B   W       TN  (6.8.0-rc5-P9-dirty)
MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 28000200  XER: 00000000
CFAR: c00000000055b42c DAR: 0000000000000000 DSISR: 00080000 IRQMASK: 0 
GPR00: 0000000000000000 c00020004560fb90 c0000000018f1c00 0000000000000000 
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR12: 0000000000000000 c0002005fc3ffd80 c0000000001cd5f0 c000000098368940 
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR24: 0000000000000000 0000000000000001 c00020000a992340 0000000000000000 
GPR28: 0000000000000000 0000000000000000 0000000000000000 c000200046dfe400 
NIP [c000000000283da4] dma_unmap_sg_attrs+0x84/0x210
LR [c000000000283d9c] dma_unmap_sg_attrs+0x7c/0x210
Call Trace:
[c00020004560fb90] [c000000000283d9c] dma_unmap_sg_attrs+0x7c/0x210 (unreliable)
[c00020004560fbf0] [c0080000227ed3bc] drm_gem_shmem_free+0x160/0x398 [drm_shmem_helper]
[c00020004560fc80] [c008000022812cf8] drm_gem_shmem_test_obj_create_private+0x288/0x588 [drm_gem_shmem_test]
[c00020004560fe90] [c000000000b15ca4] kunit_try_run_case+0xfc/0x34c
[c00020004560ff50] [c000000000b1a698] kunit_generic_run_threadfn_adapter+0x50/0x7c
[c00020004560ff80] [c0000000001cd7bc] kthread+0x1d4/0x1e0
[c00020004560ffe0] [c00000000000d030] start_kernel_thread+0x14/0x18
Code: 39200001 eb7f0238 7d20481e 0b090000 387f0240 482d758d 60000000 eb9f0240 7f83e378 482d757d 60000000 2c3b0000 <eb9c0000> 40820078 7fa7eb78 7fc6f378 
---[ end trace 0000000000000000 ]---


Regards,
Erhard
