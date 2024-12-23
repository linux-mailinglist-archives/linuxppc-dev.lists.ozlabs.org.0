Return-Path: <linuxppc-dev+bounces-4448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2C9FAE1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 13:08:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGxcG2N44z2yn2;
	Mon, 23 Dec 2024 23:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::232"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734935554;
	cv=none; b=E3kL4DG/ySDGxqH3opzvTZd1epPA4IYRbsmidbuOyl2F5HsES91SDm4qfsO+2SA+GdNMXLJQKGW8M6IvwhtDp/LNmkzFMEu3sDFRzkFlE5j+rWmYEEEm1OY850NilcEud9Sv3guKjStRwzt+hPeUL50AYr0gPQlYeH6x2EMcmM+umhPpF3x35v6YeCou2f0DSivG8tkfpJtndkp/8rFQHjfZG+hwd3eNfW186+zrQp0Ym1Gi33KQegyu7q+0tRmDKtg2SHSiEttQ8IqxfqjER4bXyzSvpfLQGtvfql3wpaGXrCszMV2AI8DFtNnL0gnU053p3SVg3SBgb19ckz16iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734935554; c=relaxed/relaxed;
	bh=qVJvRPTBIFpD3yYTqLHsJbssgHiWsdf3cvr085jaL54=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jgmO4m/pmF7JXuidXTob8sKwROJZB8L6TQghxT+S5GmTst9pyfS1a3Co4q7XvZM1MUkYDkXWzLhLBgAveSGAJ8clI1HYgutms+2Da2kUa+D1OPTD+Ky0wLFTNa+iO6lN96mWVI2qKha+Fei2yprTra1jK1zibOeTfSDVpL23sFbtJMNfiR2bPXjLNPyIh6j8IrtPbT5JWg6gqZFLPGpxP/rHDzbBGQbsYddOqYI2gk4auIqJ/UZQp5PVeDwiZMqfLIpX1qC1R8xuwLHecXI2D9nULR8/1DsimVGITCUXkLYxy9YEu0CHA0Szixl+6qVlPU7TG8gQy7ZRxDufi2W4pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F0SxRc9T; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=wangzhengshu39@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F0SxRc9T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=wangzhengshu39@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGp9D5Kymz2x9j
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 17:32:31 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-303548a933aso32034901fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 22:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734935544; x=1735540344; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qVJvRPTBIFpD3yYTqLHsJbssgHiWsdf3cvr085jaL54=;
        b=F0SxRc9TCO49X/Jk3XI0JLgHm2DPfaNwybvhtSNWFdOyb7+VzYoHhYTEGaygXzSXQD
         8IotvbHo37SwyLRAN3Ix4Us65MgSzsXV4CdgTNPJRAjjH4om9JT36dlmsO5OHO5US4dK
         +qqYGD5JfQ2vIiE2WYT7Flz27jN1BrRVwulJm4wh+6XjAXP+rPU402lkZxRz12eljz1/
         hPivRBTGTdAEcXOz7J0RUwri1LcI8hUizRV+fEHmiXc5FnY9DuUU3a1QkApaE0Bxf2Qc
         IV8xp5BwHkOUihZ9fd2O0wll7EdJERhXn1u3zY967whcyW6kYT9PzzyGDWMPtdcKdPpX
         8H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734935544; x=1735540344;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVJvRPTBIFpD3yYTqLHsJbssgHiWsdf3cvr085jaL54=;
        b=TLio15856Cf+EC5eRyL2x2uyZ6TY+8JQjTeIOBoSa6KUSH/94iNJ6pLp+D5KlFuUJy
         UO3ebVlApTq+p46UrqgVCi4VNtTA+DV0Ijrgo+TmUZPcd4zjRZKdfyae6Aft03+tdmEH
         wAX+oMPFUQCDOR9w/uptR7mBiiaoPgyLi15Ss1hmyjA++QTSoWKobtuLjmq+YG2so/c8
         4WjjLBITfRZhzi5LdFYufXOylVwAhE/VcpjS3RsKRxavBvcFo5tt+D6kZstjZ1CcMLoD
         iL1ggf18Zoc31ch860AARZgtCkijZmph8SotXzHZxPGTyAO8JkduhKGk6nPxExYlcqxB
         xZjw==
X-Forwarded-Encrypted: i=1; AJvYcCVa+GHIwMH0uF0Fc9BQWTfTY931Delk8ehS36pNn/mdNj3Vt5Col7GONawutBp+7OS/RwkaBazpZpjljZs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyuNrOOoC4cyi3LcY6cDuVjGL/5V30nO/6ht2y4KOdadL+pHqwL
	R+KYAYMlglgee+R2AetIENeQPeenfGARcvOYFj8qv89VTeFnoW8VhtmqWIU27OD4TmGZVmRwx+Y
	brXwm864e/C7Jx8qlayrt5BmAQ3g=
X-Gm-Gg: ASbGncv5OVWTbazvF5LTnnwHcn7Jp9ekdovIAwyrRdmEysWl1hUUBHx1PL4n2px4pQX
	5wc3Yt2MwNiZluIHSi2jEm2/2hTEFv83Bjl8G1cQ=
X-Google-Smtp-Source: AGHT+IG60kb6cJfOMmZ1bG5/M5xMxjemR9Pdx5iDvLwYktHqnMK2Mgz4af/PZBelPrIoamMOdUtZcKKqUXO25sfXeRo=
X-Received: by 2002:a05:651c:4007:b0:2ff:d7cf:a6cb with SMTP id
 38308e7fff4ca-304685506f3mr31586341fa.11.1734935543687; Sun, 22 Dec 2024
 22:32:23 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
From: wzs <wangzhengshu39@gmail.com>
Date: Mon, 23 Dec 2024 14:32:11 +0800
Message-ID: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
Subject: watchdog: BUG: soft lockup
To: dianders@chromium.org, tglx@linutronix.de, liusong@linux.alibaba.com, 
	akpm@linux-foundation.org, pmladek@suse.com, kernelfans@gmail.com, 
	deller@gmx.de, npiggin@gmail.com, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, jan.kiszka@siemens.com
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	yaoma@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,
when fuzzing the Linux kernel,
I triggered many "watch: BUG: soft lockup" warnings.
I am not sure whether this is an issue with the kernel or with the
fuzzing program I ran.
(The same fuzzing program, when tested on kernel versions from
Linux-6.7.0 to 6.12.0, triggers the 'watchdog: BUG: soft lockup'
warning on some versions, while others do not. Linux 6.12.0 is the
latest stable release where this error occurs.)

The bug information I provided below is from the Linux-6.12.0 kernel.
If you need bug information from other versions, I would be happy to provide it.

kernel config :https://pastebin.com/i4LPXNAN
console output :https://pastebin.com/uKVpvJ78

The beginning part of the crash report is as follows:
[283539.715873] rcu: INFO: rcu_preempt self-detected stall on CPU
[283540.766023] watchdog: BUG: soft lockup - CPU#9 stuck for 64s!
[kworker/u515:2:86301]
[283540.766046] Modules linked in: raw_gadget(OE) dummy_hcd(OE)
snd_ctl_led hid_sensor_hub hid_multitouch udc_core veth xt_conntrack
nft_chain_nat xt_MASQUERADE bridge stp llc nf_conntrack_netlink
xfrm_user xfrm_algo xt_addrtype nft_compat nf_tables overlay
nfnetlink_cttimeout nfnetlink bnep intel_rapl_msr intel_rapl_common
intel_uncore_frequency_common intel_pmc_core intel_vsec pmt_telemetry
pmt_class openvswitch vsock_loopback vmw_vsock_virtio_transport_common
nsh nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
kvm_intel psample snd_ens1371 crct10dif_pclmul libcrc32c
polyval_clmulni snd_ac97_codec vmw_vsock_vmci_transport
polyval_generic vsock sunrpc binfmt_misc gameport ghash_clmulni_intel
kvm sha256_ssse3 sha1_ssse3 ac97_bus vmw_balloon aesni_intel
crypto_simd
[283545.281916] rcu: 2-...!: (137 ticks this GP)
idle=ecec/1/0x4000000000000000 softirq=11168967/11168969 fqs=0
[283545.291031]  snd_pcm cryptd snd_seq_midi btusb snd_seq_midi_event
btrtl rapl nls_iso8859_1 btintel snd_rawmidi btbcm btmtk snd_seq
[283545.301366] rcu: (t=73327 jiffies g=69763773 q=104 ncpus=16)
[283545.301387] rcu: rcu_preempt kthread timer wakeup didn't happen
for 73324 jiffies! g69763773 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[283545.307516] rcu: Possible timer handling issue on cpu=4
timer-softirq=4703160
[283545.308817]  input_leds snd_seq_device joydev bluetooth snd_timer
serio_raw snd soundcore vmw_vmci mac_hid sch_fq_codel vmwgfx
drm_ttm_helper ttm msr parport_pc ppdev lp
[283545.316000] rcu: rcu_preempt kthread starved for 73327 jiffies!
g69763773 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=4
[283545.316032] rcu: Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
[283545.316035] rcu: RCU grace-period kthread stack dump:
[283545.316038] task:rcu_preempt     state:I
[283545.779182]  parport efi_pstore ip_tables x_tables autofs4
hid_generic crc32_pclmul
[283545.783533] ------------[ cut here ]------------
[283545.785609]  psmouse usbhid hid mptspi mptscsih i2c_piix4 ahci
mptbase e1000 libahci scsi_transport_spi i2c_smbus pata_acpi [last
unloaded: raw_gadget(OE)]
[283545.789981] CPU: 9 UID: 0 PID: 86301 Comm: kworker/u515:2 Tainted:
G           OE      6.12.0 #1
[283545.790017] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[283545.790019] Hardware name: VMware, Inc. VMware Virtual
Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
[283545.790027] Workqueue: events_freezable_pwr_efficient disk_events_workfn
[283545.808817]  stack:29152 pid:17    tgid:17    ppid:2      flags:0x00004000
[283545.808838] Call Trace:
[283545.808843]  <TASK>
[283545.803556] RIP: 0010:_raw_spin_unlock_irqrestore+0x21/0x60
[283545.808853]  __schedule+0xc0c/0x4ee0
[283545.841937] Code: 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 49
89 f0 48 89 e5 c6 07 00 0f 1f 00 41 f7 c0 00 02 00 00 74 06 fb 0f 1f
44 00 00 <65> ff 0d 20 8d e9 73 74 13 5d 31 c0 31 d2 31 c9 31 f6 31 ff
45 31
[283545.841978] RSP: 0018:ffffc900309af550 EFLAGS: 00000206
[283545.841988] RAX: dffffc0000000000 RBX: ffff888114cf4000 RCX:
0000000000000000
[283545.841992] RDX: 1ffff1102299e802 RSI: 0000000000000246 RDI:
ffff888106bcd000
[283545.841995] RBP: ffffc900309af550 R08: 0000000000000246 R09:
0000000000000000
[283545.841997] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000000
[283545.842001] R13: 0000000000000246 R14: ffff888114cf4010 R15:
ffff88822caa4000
[283545.842005] FS:  0000000000000000(0000) GS:ffff88862ea80000(0000)
knlGS:0000000000000000
[283545.846254] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[283545.787091] WARNING: CPU: 13 PID: 2974 at
kernel/sched/deadline.c:1995 enqueue_dl_entity+0x167f/0x3300
[283545.812128]  ? sched_clock_cpu+0x6a/0x520
[283545.847597]  ? __kasan_check_write+0x14/0x30
[283545.847607]  ? __pfx___schedule+0x10/0x10
[283545.847616]  ? save_fpregs_to_fpstate+0xb0/0x230
[283545.847621]  ? raw_spin_rq_unlock+0x17/0xa0
[283545.847627]  schedule+0x83/0x350
[283545.847634]  schedule_timeout+0x106/0x350
[283545.847640]  ? __kasan_check_write+0x14/0x30
[283545.847639] Modules linked in:
[283545.847644]  ? __pfx_schedule_timeout+0x10/0x10
[283545.847647]  raw_gadget(OE)
[283545.847648]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[283545.847651]  dummy_hcd(OE) snd_ctl_led
[283545.847652]  ? __pfx_process_timeout+0x10/0x10
[283545.847657]  hid_sensor_hub hid_multitouch
[283545.847659]  ? __kasan_check_write+0x14/0x30
[283545.847664]  ? prepare_to_swait_event+0xb8/0x350
[283545.847665] CR2: 00002a0000c65280 CR3: 000000011b16e000 CR4:
0000000000752ef0
[283545.847670]  udc_core veth xt_conntrack nft_chain_nat
xt_MASQUERADE bridge stp llc nf_conntrack_netlink xfrm_user xfrm_algo
xt_addrtype nft_compat nf_tables overlay nfnetlink_cttimeout nfnetlink
bnep intel_rapl_msr intel_rapl_common
[283545.847709] PKRU: 55555554
[283545.847711]  intel_uncore_frequency_common intel_pmc_core
[283545.847715] Call Trace:
[283545.847718]  intel_vsec pmt_telemetry
[283545.847720]  <IRQ>
[283545.847723]  pmt_class openvswitch vsock_loopback
vmw_vsock_virtio_transport_common nsh nf_conncount nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 kvm_intel psample snd_ens1371
crct10dif_pclmul libcrc32c polyval_clmulni snd_ac97_codec
vmw_vsock_vmci_transport polyval_generic vsock sunrpc binfmt_misc
gameport ghash_clmulni_intel kvm sha256_ssse3 sha1_ssse3 ac97_bus
vmw_balloon aesni_intel crypto_simd snd_pcm cryptd snd_seq_midi btusb
snd_seq_midi_event btrtl rapl nls_iso8859_1 btintel snd_rawmidi btbcm
btmtk snd_seq input_leds snd_seq_device joydev bluetooth snd_timer
serio_raw snd soundcore vmw_vmci mac_hid sch_fq_codel vmwgfx
drm_ttm_helper ttm msr parport_pc ppdev lp parport efi_pstore
ip_tables x_tables autofs4 hid_generic crc32_pclmul psmouse usbhid hid
mptspi mptscsih i2c_piix4 ahci mptbase e1000 libahci
scsi_transport_spi i2c_smbus pata_acpi [last unloaded: raw_gadget(OE)]
[283545.847881] CPU: 13 UID: 1000 PID: 2974 Comm: gsd-housekeepin
Tainted: G           OE      6.12.0 #1
[283545.847888] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[283545.847891] Hardware name: VMware, Inc. VMware Virtual
Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
[283545.847895] RIP: 0010:enqueue_dl_entity+0x167f/0x3300
[283545.847901] Code: e8 f6 bb 8b 00 4c 8b 5d c8 4c 8b 55 d0 e9 18 f7
ff ff 85 c9 0f 84 51 fa ff ff 44 89 c6 4c 89 e7 e8 76 2b ff ff e9 41
fa ff ff <0f> 0b e9 bb e9 ff ff 0f 0b e9 c2 ef ff ff 48 b8 00 00 00 00
00 fc
[283545.847905] RSP: 0018:ffffc90005fd6ce0 EFLAGS: 00010082
[283545.847909] RAX: dffffc0000000000 RBX: ffff88862ecc7ca8 RCX:
0000000000000001
[283545.847912] RDX: 1ffff110c5d98f95 RSI: 0000000000000001 RDI:
ffff88862ecc7ca8
[283545.847915] RBP: ffffc90005fd6d40 R08: 0000000000000001 R09:
0000000000000000
[283545.847917] R10: 0000000000000000 R11: 0000000000000000 R12:
ffff88862ecc7ca8
[283545.847920] R13: ffff88862ecc7d80 R14: ffff88862ecc72c0 R15:
dffffc0000000000
[283545.847923] FS:  000073dc1824d800(0000) GS:ffff88862ec80000(0000)
knlGS:0000000000000000
[283545.847926] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[283545.847928] CR2: 0000049400328000 CR3: 000000018a21c000 CR4:
0000000000752ef0
[283545.847965] PKRU: 55555554
[283545.847968] Call Trace:
[283545.847971]  <TASK>
[283545.847668]  rcu_gp_fqs_loop+0x1a3/0x970
[283545.848430]  ? rcu_gp_init+0x8b7/0x1410
[283545.848436]  ? __pfx_rcu_gp_fqs_loop+0x10/0x10
[283545.848440]  ? finish_swait+0x12a/0x1f0
[283545.848445]  ? prepare_to_swait_event+0xb8/0x350
[283545.848449]  rcu_gp_kthread+0x27a/0x430
[283545.848452]  ? __pfx_rcu_gp_kthread+0x10/0x10
[283545.848456]  ? __kasan_check_read+0x11/0x20
[283545.847725]  ? show_regs+0x71/0x90
[283545.848459]  ? __kthread_parkme+0x8f/0x150
[283545.850678]  ? schedule+0x83/0x350
[283545.850687]  kthread+0x2b5/0x390
[283545.850691]  ? __pfx_rcu_gp_kthread+0x10/0x10
[283545.850695]  ? __pfx_kthread+0x10/0x10
[283545.850699]  ret_from_fork+0x43/0x90
[283545.850705]  ? __pfx_kthread+0x10/0x10
[283545.847975]  ? show_regs+0x71/0x90
[283545.850100]  ? watchdog_timer_fn+0x305/0x3d0
[283545.851262]  ? __hrtimer_run_queues+0x2f0/0x7b0
[283545.851399]  ? __pfx_watchdog_timer_fn+0x10/0x10
[283545.851405]  ? __pfx___hrtimer_run_queues+0x10/0x10
[283545.851409]  ? hrtimer_interrupt+0x2bc/0x750
[283545.850709]  ret_from_fork_asm+0x1a/0x30
[283545.853112]  </TASK>
[283545.853172] Sending NMI from CPU 2 to CPUs 0:
[283545.850722]  ? __warn+0xd3/0x2d0
[283545.854922]  ? enqueue_dl_entity+0x167f/0x3300
[283545.851414]  ? __sysvec_apic_timer_interrupt+0x8e/0x310
[283545.875438]  ? sysvec_apic_timer_interrupt+0x91/0xb0
[283545.875446]  </IRQ>
[283545.875449]  <TASK>
[283545.875471]  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
[283545.875483]  ? _raw_spin_unlock_irqrestore+0x21/0x60
[283545.854928]  ? report_bug+0x2ad/0x300
[283545.900589]  ? handle_bug+0x6e/0xc0
[283545.900593]  ? exc_invalid_op+0x19/0x50
[283545.900596]  ? asm_exc_invalid_op+0x1b/0x20
[283545.900602]  ? enqueue_dl_entity+0x167f/0x3300
[283545.900607]  ? update_cfs_group+0x274/0x2f0
[283545.901798]  dl_server_start+0xd3/0x8a0
[283545.901805]  enqueue_task_fair+0xb41/0x1830
[283545.901810]  ? __pfx_sched_mm_cid_migrate_to+0x10/0x10
[283545.901814]  enqueue_task+0x7f/0x540
[283545.901819]  activate_task+0x5f/0xd0
[283545.901822]  sched_balance_rq+0x13ba/0x3200
[283545.901825]  ? sched_clock_cpu+0x6a/0x520
[283545.901830]  ? sched_clock_noinstr+0x9/0x10
[283545.901836]  ? __pfx_sched_balance_rq+0x10/0x10
[283545.901841]  sched_balance_newidle+0x615/0x1040
[283545.901845]  ? __pfx_sched_balance_newidle+0x10/0x10
[283545.901848]  ? dequeue_entities+0x8ce/0x1330
[283545.901852]  ? sched_clock_cpu+0x6a/0x520
[283545.901856]  pick_next_task_fair+0x35/0xdb0
[283545.901859]  ? dequeue_task_fair+0x232/0x5a0
[283545.901863]  __pick_next_task+0x101/0x6d0
[283545.901866]  __schedule+0x53e/0x4ee0
[283545.901871]  ? update_stack_state+0x2d9/0x610
[283545.901877]  ? __pfx___schedule+0x10/0x10
[283545.901880]  ? _raw_write_unlock_irqrestore+0x80/0x90
[283545.901883]  ? enqueue_hrtimer+0x10b/0x290
[283545.901888]  ? hrtimer_start_range_ns+0x2f8/0xb60
[283545.901892]  schedule+0x83/0x350
[283545.901895]  schedule_hrtimeout_range_clock+0x15c/0x490
[283545.901900]  ? __pfx_schedule_hrtimeout_range_clock+0x10/0x10
[283545.901904]  ? __pfx_hrtimer_wakeup+0x10/0x10
[283545.901908]  schedule_hrtimeout_range+0x13/0x30
[283545.901912]  poll_schedule_timeout.constprop.0+0x79/0x100
[283545.901916]  do_sys_poll+0x6f6/0xc10
[283545.901921]  ? __pfx_do_sys_poll+0x10/0x10
[283545.901925]  ? is_bpf_text_address+0x24/0x40
[283545.901929]  ? kernel_text_address+0xd7/0xe0
[283545.901933]  ? __kernel_text_address+0x12/0x50
[283545.901936]  ? unwind_get_return_address+0x65/0xb0
[283545.901940]  ? __pfx_stack_trace_consume_entry+0x10/0x10
[283545.901945]  ? arch_stack_walk+0x9e/0x100
[283545.901951]  ? __pfx_pollwake+0x10/0x10
[283545.901954]  ? __pfx_pollwake+0x10/0x10
[283545.901748] INFO: NMI handler (perf_event_nmi_handler) took too
long to run: 2.846 msecs
[283545.901956]  ? lockref_get_not_dead+0xd8/0x1f0
[283545.904986]  ? putname+0xf4/0x150
[283545.904991]  ? kasan_save_stack+0x3c/0x60
[283545.904995]  ? kasan_save_stack+0x28/0x60
[283545.904999]  ? kasan_save_track+0x18/0x70
[283545.905002]  ? kasan_save_free_info+0x3b/0x60
[283545.905006]  ? __kasan_slab_free+0x54/0x80
[283545.905009]  ? kmem_cache_free+0x165/0x590
[283545.905014]  ? putname+0xf4/0x150
[283545.905017]  ? user_path_at+0x46/0x70
[283545.905020]  ? user_statfs+0x8f/0x130
[283545.905751]  ? __do_sys_statfs+0x87/0x120
[283545.905757]  ? __x64_sys_statfs+0x54/0x80
[283545.905760]  ? x64_sys_call+0xa30/0x2670
[283545.905764]  ? do_syscall_64+0x7c/0x170
[283545.905768]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[283545.905775]  ? try_to_unlazy+0x1cc/0x4b0
[283545.905779]  ? terminate_walk+0x173/0x540
[283545.905783]  ? path_lookupat+0x172/0x670
[283545.905786]  ? x64_sys_call+0xa30/0x2670
[283545.905790]  ? filename_lookup+0x1a6/0x520
[283545.905793]  ? __pfx_timespec64_add_safe+0x10/0x10
[283545.905797]  ? sched_clock_noinstr+0x9/0x10
[283545.905802]  ? ktime_get_ts64+0x81/0x270
[283545.905807]  __x64_sys_poll+0x180/0x500
[283545.905811]  ? __pfx___x64_sys_poll+0x10/0x10
[283545.905814]  ? lockref_put_return+0xd0/0x150
[283545.905818]  ? __pfx_mntput_no_expire+0x10/0x10
[283545.905823]  x64_sys_call+0x140e/0x2670
[283545.905826]  do_syscall_64+0x7c/0x170
[283545.905829]  ? mntput+0x57/0x90
[283545.905832]  ? path_put+0x50/0x80
[283545.905836]  ? user_statfs+0xbe/0x130
[283545.905839]  ? __pfx_user_statfs+0x10/0x10
[283545.905842]  ? __pfx_cp_new_stat+0x10/0x10
[283545.907651]  ? __kasan_check_read+0x11/0x20
[283545.907656]  ? _copy_to_user+0x3b/0x80
[283545.909759]  ? __do_sys_statfs+0x101/0x120
[283545.909764]  ? __pfx___do_sys_statfs+0x10/0x10
[283545.909793]  ? __kasan_check_read+0x11/0x20
[283545.909803]  ? fpregs_assert_state_consistent+0x21/0xb0
[283545.909810]  ? syscall_exit_to_user_mode+0x4e/0x270
[283545.909815]  ? do_syscall_64+0x88/0x170
[283545.909818]  ? syscall_exit_to_user_mode+0x4e/0x270
[283545.909821]  ? __kasan_check_read+0x11/0x20
[283545.909825]  ? fpregs_assert_state_consistent+0x21/0xb0
[283545.909829]  ? syscall_exit_to_user_mode+0x4e/0x270
[283545.909832]  ? do_syscall_64+0x88/0x170
[283545.909834]  ? clear_bhb_loop+0x15/0x70
[283545.909838]  ? clear_bhb_loop+0x15/0x70
[283545.909842]  ? clear_bhb_loop+0x15/0x70
[283545.909845]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[283545.909849] RIP: 0033:0x73dc18118bcf
[283545.909855] Code: 54 24 1c 48 89 74 24 10 48 89 7c 24 08 e8 39 7e
f7 ff 8b 54 24 1c 48 8b 74 24 10 41 89 c0 48 8b 7c 24 08 b8 07 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 89 44 24 08 e8 7d 7e f7 ff
8b 44
[283545.909859] RSP: 002b:00007fffd38bae60 EFLAGS: 00000293 ORIG_RAX:
0000000000000007
[283545.909865] RAX: ffffffffffffffda RBX: 000073dc1844e7a0 RCX:
000073dc18118bcf
[283545.875487]  ata_scsi_queuecmd+0x180/0x200
[283545.909868] RDX: 000000000000e9c5 RSI: 0000000000000002 RDI:
00005b604981cec0
[283545.909872] RBP: 00005b604981cec0 R08: 0000000000000000 R09:
0000000000000000
[283545.909875] R10: 0000000000000000 R11: 0000000000000293 R12:
0000000000000002
[283545.909874]  ? blk_mq_start_request+0xc1/0x770
[283545.909878] R13: 00007fffd38baea4 R14: 000000000000e9c5 R15:
00005b60497f9970
[283545.909883]  </TASK>
[283545.909886] ---[ end trace 0000000000000000 ]---
[283545.909883]  scsi_queue_rq+0xb34/0x3320
[283545.922100]  blk_mq_dispatch_rq_list+0x391/0x2570
[283545.922107]  ? __kasan_check_read+0x11/0x20
[283545.922113]  ? __pfx_blk_mq_dispatch_rq_list+0x10/0x10
[283545.922118]  ? _raw_write_lock_nested+0x41/0xe0
[283545.922123]  __blk_mq_sched_dispatch_requests+0x1dd/0x1620
[283545.922127]  ? bio_kmalloc+0x23/0x40
[283545.923317]  ? sr_check_events+0x1bc/0xa50
[283545.924738]  ? cdrom_check_events+0x60/0x120
[283545.925485]  ? __pfx___blk_mq_sched_dispatch_requests+0x10/0x10
[283545.925491]  ? _raw_spin_lock+0x82/0xf0
[283545.925495]  ? __pfx__raw_spin_lock+0x10/0x10
[283545.925498]  ? policy_nodemask+0x239/0x360
[283545.925504]  blk_mq_sched_dispatch_requests+0xb9/0x100
[283545.925510]  blk_mq_run_hw_queue+0x32f/0x560
[283545.925514]  blk_execute_rq+0x1a6/0x3d0
[283545.925518]  ? __pfx_bio_add_pc_page+0x10/0x10
[283545.925521]  ? __pfx_blk_execute_rq+0x10/0x10
[283545.925526]  scsi_execute_cmd+0x39d/0xcc0
[283545.925530]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[283545.925533]  ? __pfx_scsi_execute_cmd+0x10/0x10
[283545.925536]  ? _raw_spin_lock+0x82/0xf0
[283545.925539]  ? __kasan_check_write+0x14/0x30
[283545.925542]  ? enqueue_timer+0xec/0x5b0
[283545.925548]  sr_check_events+0x1bc/0xa50
[283545.925552]  ? __pfx_sr_check_events+0x10/0x10
[283545.925554]  ? __kasan_check_write+0x14/0x30
[283545.925558]  ? _raw_spin_lock_irqsave+0x96/0x110
[283545.925561]  ? rt_mutex_post_schedule+0x118/0x160
[283545.925580]  ? add_timer_global+0x90/0xd0
[283545.925584]  cdrom_check_events+0x60/0x120
[283545.925587]  sr_block_check_events+0xab/0xe0
[283545.925590]  disk_check_events+0xbb/0x3f0
[283545.925594]  ? wake_up_process+0x15/0x30
[283545.925597]  ? kick_pool+0x26c/0x680
[283545.926093]  disk_events_workfn+0x19/0x30
[283545.926100]  process_one_work+0x5f7/0x1060
[283545.926104]  ? __kasan_check_write+0x14/0x30
[283545.926109]  worker_thread+0x779/0x1200
[283545.926112]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[283545.926117]  kthread+0x2b5/0x390
[283545.926121]  ? __pfx_worker_thread+0x10/0x10
[283545.926124]  ? __pfx_kthread+0x10/0x10
[283545.926128]  ret_from_fork+0x43/0x90
[283545.926132]  ? __pfx_kthread+0x10/0x10
[283545.926136]  ret_from_fork_asm+0x1a/0x30
[283545.926141]  </TASK>

