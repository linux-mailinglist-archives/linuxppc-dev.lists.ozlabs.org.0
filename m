Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5203E6FFF8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 06:11:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHb0w1d1hz3fP6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 14:11:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qIZp8R1n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHb0062CNz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 14:10:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qIZp8R1n;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QHZzx1T1wz4wgq;
	Fri, 12 May 2023 14:10:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683864622;
	bh=oPl2u+/zOEaXoqgX2SzPHpQZUB4sh8X/PGH3dqm+ybA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qIZp8R1n4cIyH/hNyjZkk2IV4G0ZOXKDQqy2cJhfbmBuplc3obqPfoXxG+xjLSrPN
	 m/5+Cb/9dP1m0OdyVYbBqSmEsBni/+zSx7ENgMxcH5B3lKZLZ8+Tld2Lb70yMbe4A4
	 oGsOsLV/NKaD0inXUGddjlwl7iMDdPixS/1g2nkBcA7IUNRK+C1hMbiUOwF71VwG3M
	 TJcqbzr25oq0p/8wyelcbKOFqtORfvH3JY/ZeiFaizyGzUyqC3iL5pyZtNeI2zfd8w
	 1FjTjGc+6KHW28kAtNzc3JgUsDqIsOTBAGlyUSilsoAuDTHMEimP13UPE4Yn16vmaM
	 ncFj2L2LuO39Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Regressions
 <regressions@lists.linux.dev>, Linux for PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux AMDGPU
 <amd-gfx@lists.freedesktop.org>
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted
 to read user page (1128) - exploit attempt? (uid: 0)
In-Reply-To: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
Date: Fri, 12 May 2023 14:10:11 +1000
Message-ID: <87zg6ajil8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alex Deucher <alexander.deucher@amd.com>, darkbasic@linuxsystems.it
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bagas Sanjaya <bagasdotme@gmail.com> writes:
> Hi,
>
> I notice a regression report on bugzilla ([1]). As many developers
> don't keep an eye on it, I decide to forward it by email.

Bugs filed against powerpc do get Cc'ed to linuxppc-dev, so we do see
them. Though that doesn't always mean we have time to fix them :)

I have a talos machine with an AMD GPU, but not this model, and mainline
is booting fine for me. So we'll need the original reporter to do some
more debugging.

Looks like there's a possible culprit identified on the gitlab issue:
https://gitlab.freedesktop.org/drm/amd/-/issues/2553

cheers

> Quoting from it:
>
>>  darkbasic 2023-05-10 13:36:37 UTC
>> 
>> I'm using Gentoo Linux on a Raptor CS Talos 2 ppc64le, GPU is an AMD RX 570. So far the past dozen of kernels (up to 6.2.14) worked flawlessly, but with 6.3.1 I don't get any video output and I get the following in journalctl:
>> 
>> May 10 15:09:01 talos2 kernel: Kernel attempted to read user page (1128) - exploit attempt? (uid: 0)
>> May 10 15:09:01 talos2 kernel: BUG: Unable to handle kernel data access on read at 0x00001128
>> May 10 15:09:01 talos2 kernel: Faulting instruction address: 0xc00800000d1a805c
>> May 10 15:09:01 talos2 kernel: Oops: Kernel access of bad area, sig: 11 [#1]
>> May 10 15:09:01 talos2 kernel: LE PAGE_SIZE=4K MMU=Radix SMP NR_CPUS=512 NUMA PowerNV
>> May 10 15:09:01 talos2 kernel: Modules linked in: rfkill(+) 8021q garp mrp stp llc binfmt_misc amdgpu uvcvideo uvc videobuf2_vmalloc videobuf2_memops gpu_sched snd_hda_codec_hdmi i2c_algo_bit at24(+) videobuf2_v4l2 drm_ttm_helper regmap_i2c videobuf2_common ttm snd_usb_audio drm_di>
>> May 10 15:09:01 talos2 kernel: CPU: 0 PID: 188 Comm: kworker/0:3 Not tainted 6.3.1-gentoo-dist #1
>> May 10 15:09:01 talos2 kernel: Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1202 opal:skiboot-9858186 PowerNV
>> May 10 15:09:01 talos2 kernel: Workqueue: events_long drm_dp_check_and_send_link_address [drm_display_helper]
>> May 10 15:09:01 talos2 kernel: NIP:  c00800000d1a805c LR: c00800000d1a8018 CTR: c000000000c87900
>> May 10 15:09:01 talos2 kernel: REGS: c00000000beb3370 TRAP: 0300   Not tainted  (6.3.1-gentoo-dist)
>> May 10 15:09:01 talos2 kernel: MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88048223  XER: 0000005a
>> May 10 15:09:01 talos2 kernel: CFAR: c000000000c87980 DAR: 0000000000001128 DSISR: 40000000 IRQMASK: 0 
>>                                GPR00: c00800000d1a8018 c00000000beb3610 c00800000d690f00 0000000000000000 
>>                                GPR04: 0000000000000002 c00800000d6297c0 0000000000000000 c00000002a00b740 
>>                                GPR08: 0000000000000000 0000000000001124 0000000000000000 c00800000d431560 
>>                                GPR12: c000000000c87900 c000000002a6b000 c000000000170ad8 c00000001a460310 
>>                                GPR16: 0000000000000045 c000000022858388 c000000026000340 0000000000000001 
>>                                GPR20: 0000000000000000 0000000000000001 c0000000260001a0 0000000000004000 
>>                                GPR24: 0000000000004000 c000000026000010 c0000000228580b8 fffffffffffffffd 
>>                                GPR28: 0000000000000000 c0000000228580a0 c000000022856000 c000000022858000 
>> May 10 15:09:01 talos2 kernel: NIP [c00800000d1a805c] is_synaptics_cascaded_panamera+0x244/0x600 [amdgpu]
>> May 10 15:09:01 talos2 kernel: LR [c00800000d1a8018] is_synaptics_cascaded_panamera+0x200/0x600 [amdgpu]
>> May 10 15:09:01 talos2 kernel: Call Trace:
>> May 10 15:09:01 talos2 kernel: [c00000000beb3610] [c00800000d1a8018] is_synaptics_cascaded_panamera+0x200/0x600 [amdgpu] (unreliable)
>> May 10 15:09:01 talos2 kernel: [c00000000beb36d0] [c00800000b7c2b18] drm_helper_probe_single_connector_modes+0x230/0x698 [drm_kms_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3810] [c000000000c57174] drm_client_modeset_probe+0x2b4/0x16c0
>> May 10 15:09:01 talos2 kernel: [c00000000beb3a10] [c00800000b7c7a30] __drm_fb_helper_initial_config_and_unlock+0x68/0x640 [drm_kms_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3af0] [c00800000b7c5b08] drm_fbdev_client_hotplug+0x40/0x1d0 [drm_kms_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3b70] [c000000000c55480] drm_client_dev_hotplug+0x120/0x1b0
>> May 10 15:09:01 talos2 kernel: [c00000000beb3c00] [c00800000b7c1130] drm_kms_helper_hotplug_event+0x58/0x80 [drm_kms_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3c30] [c00800000b80b298] drm_dp_check_and_send_link_address+0x330/0x3a0 [drm_display_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3cd0] [c000000000162d84] process_one_work+0x2f4/0x580
>> May 10 15:09:01 talos2 kernel: [c00000000beb3d70] [c0000000001630b8] worker_thread+0xa8/0x600
>> May 10 15:09:01 talos2 kernel: [c00000000beb3e00] [c000000000170bf4] kthread+0x124/0x130
>> May 10 15:09:01 talos2 kernel: [c00000000beb3e50] [c00000000000dd14] ret_from_kernel_thread+0x5c/0x64
>> May 10 15:09:01 talos2 kernel: --- interrupt: 0 at 0x0
>> May 10 15:09:01 talos2 kernel: NIP:  0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
>> May 10 15:09:01 talos2 kernel: REGS: c00000000beb3e80 TRAP: 0000   Not tainted  (6.3.1-gentoo-dist)
>> May 10 15:09:01 talos2 kernel: MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
>> May 10 15:09:01 talos2 kernel: CFAR: 0000000000000000 IRQMASK: 0 
>>                                GPR00: 0000000000000000 c00000000beb4000 0000000000000000 0000000000000000 
>>                                GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR12: 0000000000000000 0000000000000000 c000000000170ad8 c00000000a8fb240 
>>                                GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>> May 10 15:09:01 talos2 kernel: NIP [0000000000000000] 0x0
>> May 10 15:09:01 talos2 kernel: LR [0000000000000000] 0x0
>> May 10 15:09:01 talos2 kernel: --- interrupt: 0
>> May 10 15:09:01 talos2 kernel: Code: 41820094 e91f0568 e95f0000 813f0088 81080030 3d4a0001 39290444 e94a7ca0 79291764 1d0811f0 7d4a4214 7d2a4a14 <81290004> 91270074 813f0088 39290424 
>> May 10 15:09:01 talos2 kernel: ---[ end trace 0000000000000000 ]---
>> May 10 15:09:01 talos2 kernel: at24 4-0054: supply vcc not found, using dummy regulator
>
> See the report for details.
>
> Anyway, I'm adding this to regzbot:
>
> #regzbot introduced: v6.2..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217427
> #regzbot title: No video output from AMD RX 570 and kernel exploit attempt on ppc64le
>
> Thanks.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217427
>
> -- 
> An old man doll... just what I always wanted! - Clara
