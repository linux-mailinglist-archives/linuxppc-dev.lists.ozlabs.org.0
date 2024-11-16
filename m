Return-Path: <linuxppc-dev+bounces-3332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B1A9CFEF0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 13:56:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrDRq4VD1z30VZ;
	Sat, 16 Nov 2024 23:56:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731761815;
	cv=none; b=dp4Iro8chgQYA7xsifxogimdbWyjTTelO7fqvSE0zIvCAXBfzLQM3Glslj4pyaG2PhmFiwJgx6Ph2+sPlSB+K70Gha2+9nTIObSwBBnkwLBKAamvxQwlNboSyCTGRPkptmCIAPWw8BXBhyy9eovcDy41AwvxcDMifVvEdBjQ/R9z60ko+04VRDV9WHq5FecGg7m19kewyrM4akfYqLyvJsB3XONGq9dE9qbbElG69p5wDYBWR9jjFYi9Ov9/1L8P9RUQwLTG8soormvBcor1ugKGLeCF58Bsniol3V8aOfdZ6KAxaPOY374AyhOVyhcq4ojMc217bV5k54Ov6DOOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731761815; c=relaxed/relaxed;
	bh=AY+QySMyUFsBKAqxcHPf5uPK541w48uF4Ev2qyQhC0s=;
	h=From:To:Subject:In-Reply-To:Date:Message-ID:References; b=EKHGica7CGJZUl4tSqSz33QUU84OqjDCLPdJGUzGyhXQNtshDuo05JeYx0Rs25O/zDoniZ6l2fVF0uCbZRDEUTYjqDG2y1F6toccESRv6goAeCv+QPg4xZxQBG8y0CdQXS05gmiPmT/4OwuRuJVvE0cK1Xjq5CKxkInN3i4h0YSCZv3bRjMopMgfvp9v3sBKMs/Ez7IsC0JvoRy/LrPKkgKMYI5oKxVY40vrlWe2uoPIMfb28RVv7Tb9A197YdOT+PKORIJI4ImkPm/dPyxkBnY/qw8SlvHRWSkdlclz6z8deUDcrI8VcMG9zUmwd/G2lc+p/qFCVqRMZYaiQdrFng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I+WS7CSr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I+WS7CSr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrDRj34Zhz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 23:56:48 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20ca388d242so3455345ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 04:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731761807; x=1732366607; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AY+QySMyUFsBKAqxcHPf5uPK541w48uF4Ev2qyQhC0s=;
        b=I+WS7CSrIK8i+EL/xKRoQFyyUkzwvcqTgmExge5n9Xzco2yWDVQjJD/viXIVM0rj7B
         x3wx/kLDCbiTvF7+pfXjPUbOusHKfr1EiKkyEZZ26Fg79MvfY0YqupOfVP/hi+K3XTfn
         cYB/LjTeEXGojydVLEJm5lBq0JAW/NTHi2aVl7OWUqea5peteBOGcsDIh5lAabffZqhH
         jUNQPqwmnoGCvlPhsqa1CGAAzldWPn70TIyfveEbcD9OcW7uwRak6JxmJzNPUl8chnIW
         Agq65UMqUsnMv6UaO2D9LhOBuRIFvIpP+KbDqVOdMeiZUjm37pGxJCfSjtrhmiQy2zMk
         Z7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731761807; x=1732366607;
        h=references:message-id:date:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AY+QySMyUFsBKAqxcHPf5uPK541w48uF4Ev2qyQhC0s=;
        b=fQmFIZdeQC9X43EOpi17YFp0vGKLvilN97qPvu5YTVlt1zrkINhMjd/+4V7QnONtwb
         bk8v0Vif39OdQq9q12rpM+Vmcqw6B3+ZHTl0kBVGi4JvyYJQwDcpeGHJPxaBUdVOLC62
         SpORNABVB2j5nUKUB7Tmi5P0A1tC6XUwcsk36aqv0/V2TBrGOFWHego3LBl1dNNlAsMR
         +wALztmCWTN08zOyIK2DrPxtwi6r8cPLfrvCa7Pi3rYHI10O3Jzs8gGVn8fyJOF0l1Ch
         6Xj+yGyc9Ak50YAXUHK+lxrun5ZK5sXCf0OMEdMHRtCOzdeiz1K3RW92MJb1cnkFMCwc
         8t2g==
X-Forwarded-Encrypted: i=1; AJvYcCUqyBnWgDwjzfG/S7ugkxFtngIEtO5w1i/gZXLUtvVTQrTYF0WV7Q/ToKi3jyT4wO0vfWhpZwfvWodtMK4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVA3k/ANw5Ng4uaCZqZn3g0GRbQ/T4G8fYIzdapEx4KjZVo6f6
	1NUpL3U9zHAES4KWXXV+fSx4Ao2hns6MOb8A1sLFTVGqXN2urSU0ZF1p6zMq
X-Google-Smtp-Source: AGHT+IGih0JqZxo7OMQiCbe3aSIGP1/mqIcjcR8nEQytnEFm6+cHWuAt81OdIAN9ZfVFjnDmv5UV/w==
X-Received: by 2002:a17:902:f611:b0:20c:7be3:2832 with SMTP id d9443c01a7336-211d0d85b8fmr98140805ad.31.1731761806787;
        Sat, 16 Nov 2024 04:56:46 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f47ae7sm26525425ad.208.2024.11.16.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 04:56:46 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Zorro Lang <zlang@redhat.com>, linuxppc-dev@lists.ozlabs.org, Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com> 
Subject: Re: [bug report from fstests] WARNING: CPU: 1 PID: 0 at arch/powerpc/mm/mmu_context.c:106 switch_mm_irqs_off+0x220/0x270
In-Reply-To: <20241111132532.2ikhu3q56klfhvte@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Date: Sat, 16 Nov 2024 18:13:36 +0530
Message-ID: <87mshzcps7.fsf@gmail.com>
References: <20241111132532.2ikhu3q56klfhvte@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Zorro Lang <zlang@redhat.com> writes:

> Hi,
>
> Recently fstests generic/650 hit a kernel warning on ppc64le [1] with
> xfs (default mkfs option). My latest test on mainline linux v6.12-rc6+
> with HEAD=da4373fbcf006deda90e5e6a87c499e0ff747572 .

I tried this on KVM pseries machine type, but I am unable to hit it. 
Let me try that on an actual LPAR and confirm whether I can still hit
this or not. Then maybe we can see if we could get a git bisect log of it.

Thanks for reporting it.

-ritesh


>
> Thanks,
> Zorro
>
>
> [1]
> FSTYP         -- xfs (debug)
> PLATFORM      -- Linux/ppc64le rdma-cert-03-lp10 6.12.0-rc6+ #1 SMP Sat Nov  9 13:18:41 EST 2024
> MKFS_OPTIONS  -- -f -m crc=1,finobt=1,rmapbt=1,reflink=1,inobtcount=1,bigtime=1 /dev/sda3
> MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch
>
> generic/650       _check_dmesg: something found in dmesg (see /var/lib/xfstests/results//generic/650.dmesg)
>
>
> HINT: You _MAY_ be missing kernel fix:
>       ecd49f7a36fb xfs: fix per-cpu CIL structure aggregation racing with dying cpus
>
> Ran: generic/650
> Failures: generic/650
> Failed 1 of 1 tests
>
>
> # cat /var/lib/xfstests/results//generic/650.dmesg
> [16630.359077] run fstests generic/650 at 2024-11-09 18:03:21
> [16631.058519] ------------[ cut here ]------------
> [16631.058531] WARNING: CPU: 1 PID: 0 at arch/powerpc/mm/mmu_context.c:106 switch_mm_irqs_off+0x220/0x270
> [16631.058542] Modules linked in: overlay dm_zero dm_log_writes dm_thin_pool dm_persistent_data dm_bio_prison dm_snapshot dm_bufio ext4 mbcache jbd2 dm_flakey bonding tls rfkill sunrpc ibmveth pseries_rng vmx_crypto sg dm_mod fuse loop nfnetlink xfs sd_mod nvme nvme_core ibmvscsi scsi_transport_srp nvme_auth [last unloaded: scsi_debug]
> [16631.058617] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: G        W          6.12.0-rc6+ #1
> [16631.058623] Tainted: [W]=WARN
> [16631.058625] Hardware name: IBM,9009-22G POWER9 (architected) 0x4e0203 0xf000005 of:IBM,FW950.11 (VL950_075) hv:phyp pSeries
> [16631.058629] NIP:  c0000000000b02c0 LR: c0000000000b0220 CTR: c000000000152a20
> [16631.058633] REGS: c000000008bd7ad0 TRAP: 0700   Tainted: G        W           (6.12.0-rc6+)
> [16631.058637] MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR: 2800440a  XER: 20040000
> [16631.058660] CFAR: c0000000000b0230 IRQMASK: 3 
>                GPR00: c0000000000b027c c000000008bd7d70 c000000002616800 c00000016131a900 
>                GPR04: 0000000000000000 000000000000000a 0000000000000000 0000000000000000 
>                GPR08: 0000000000000000 0000000000000000 0000000000000001 0000000000000000 
>                GPR12: c000000000152a20 c00000000ffcf300 0000000000000000 000000001ef31820 
>                GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>                GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
>                GPR24: 0000000000000001 c0000000089acb00 c000000004fafcb0 0000000000000000 
>                GPR28: c000000004f24880 c00000016131a900 0000000000000001 c000000004f25180 
> [16631.058740] NIP [c0000000000b02c0] switch_mm_irqs_off+0x220/0x270
> [16631.058746] LR [c0000000000b0220] switch_mm_irqs_off+0x180/0x270
> [16631.058751] Call Trace:
> [16631.058754] [c000000008bd7d70] [c0000000000b027c] switch_mm_irqs_off+0x1dc/0x270 (unreliable)
> [16631.058763] [c000000008bd7de0] [c0000000002572f8] idle_task_exit+0x118/0x1b0
> [16631.058771] [c000000008bd7e40] [c000000000152a70] pseries_cpu_offline_self+0x50/0x150
> [16631.058780] [c000000008bd7eb0] [c000000000078678] arch_cpu_idle_dead+0x68/0x7c
> [16631.058787] [c000000008bd7ee0] [c00000000029f504] do_idle+0x1c4/0x290
> [16631.058793] [c000000008bd7f40] [c00000000029fa90] cpu_startup_entry+0x60/0x70
> [16631.058800] [c000000008bd7f70] [c00000000007825c] start_secondary+0x44c/0x480
> [16631.058807] [c000000008bd7fe0] [c00000000000e258] start_secondary_prolog+0x10/0x14
> [16631.058815] Code: 38800004 387c00f8 487f7a51 60000000 813c00f8 7129000a 4182ff40 2c3d0000 4182ff38 7c0004ac 4bffffb8 4bffff30 <0fe00000> 4bffff70 60000000 60000000 
> [16631.058848] irq event stamp: 15169028
> [16631.058850] hardirqs last  enabled at (15169027): [<c0000000003eb510>] tick_nohz_idle_exit+0x1c0/0x3b0
> [16631.058858] hardirqs last disabled at (15169028): [<c000000001ab7eac>] __schedule+0x5ac/0xc30
> [16631.058865] softirqs last  enabled at (15169016): [<c0000000001d24c8>] handle_softirqs+0x578/0x620
> [16631.058871] softirqs last disabled at (15168957): [<c00000000001b1dc>] do_softirq_own_stack+0x6c/0x90
> [16631.058878] ---[ end trace 0000000000000000 ]---
> [16631.814920] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> [16635.633774] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16635.752583] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16635.764402] XFS (sda5): Ending clean mount
> [16637.842353] clockevent: decrementer mult[83126f] shift[24] cpu[6]
> [16640.956776] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16641.078711] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16641.090273] XFS (sda5): Ending clean mount
> [16646.729241] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16646.850952] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16646.863752] XFS (sda5): Ending clean mount
> [16653.467205] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16653.594764] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16653.606795] XFS (sda5): Ending clean mount
> [16659.346160] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16659.465528] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16659.478422] XFS (sda5): Ending clean mount
> [16665.517371] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16665.656116] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16665.668005] XFS (sda5): Ending clean mount
> [16672.655768] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16672.781813] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16672.794638] XFS (sda5): Ending clean mount
> [16679.551991] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16679.668639] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16679.683949] XFS (sda5): Ending clean mount
> [16685.384912] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16685.510632] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16685.522819] XFS (sda5): Ending clean mount
> [16691.213987] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16691.347125] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16691.358483] XFS (sda5): Ending clean mount
> [16712.697103] XFS (sda5): EXPERIMENTAL online scrub feature in use. Use at your own risk!
> [16715.846166] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16716.047814] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
> [16716.058628] XFS (sda5): Ending clean mount

