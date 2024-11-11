Return-Path: <linuxppc-dev+bounces-3092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBF99C3F87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 14:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xn9KR6kTWz2xps;
	Tue, 12 Nov 2024 00:25:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731331547;
	cv=none; b=CYUUms/4kjM3pO53OWOhl0aJRSq8lL2sVcRY/fE/aTyMfV3aMUNOIa5tTbjPm5EPYKf3ym6gEhLhc2rwEvp3/aJm2fmZVcsudAYjaXYe70S8IfRPhxuPgVeJwPNeDBaYnuC3JTNKf9smfsn9V3E5yQBulQbJK6gMFXQPhVjUMLWWYZQDC5Dh7ln5Ze5IvGEqK7UE1a2+odk7IcPSoQD+7Toqy87JQYqr2uIuNJxOV0yHjyYZSb+0D7q7FYPxKaFIZateaQftVVddgQYKLQNTnVRdmtrmvLKMTSRtjun5A7MEBxOrXDQuSfgN4ZGfohzScO3ym9jiqZXGxyqfCAgPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731331547; c=relaxed/relaxed;
	bh=q13eH4MbYhj/Wnk8O4ymQCmr4ZeS4IJroHrYd9MTA28=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqHWzTJHStwj6BwZw6AILTjs0o/4o/ZuDOjiGvklHY7V+ybuspjbGpKGvXtBGBtaZajs1ZvWtRXg0//c55oEqNRsZUtnWLjXndlF1ko/jjMFhD6yGF9F0YN2L07z0VuUrlMitHZ1IDq1zlFXnQAFH5SmEqLt8gMlNixUNpZVUE7ckUsAk0Sb0fEVT3CmOQNo/c/5xANZDZjVAMCSCYW830Yr5Rmg7ldBR/OOTVYp0IjqGlPoaXSNdSdGrtBODJcxg6GPSJ/rsDGAll9pViLq4AQgWB/4lNjnNzbfdyU3gtPKdWKpeOcWxiiY2BOfGjwDiEXXb+8KPUlZ3uBvlcsBIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ADlrPtRt; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1k71VsA; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=zlang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ADlrPtRt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1k71VsA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=zlang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xn9KP6Wn1z2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 00:25:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731331538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=q13eH4MbYhj/Wnk8O4ymQCmr4ZeS4IJroHrYd9MTA28=;
	b=ADlrPtRtQ+1CWbpWRDqC0YNtV3NQEZHJLG7uTzm8WOfHJ4RMUyaNc6Lxos74LuPRDS+FFJ
	s2YcoEjMZT/SYjfbiLvV+WQvAmzX0q9VTWQGwxLZS2DBJIKRNcU0jwRHs6TROYhBLBbbu8
	5w3h0tOYZcCyFLwwOr7NpjK1DphbS5c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731331539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=q13eH4MbYhj/Wnk8O4ymQCmr4ZeS4IJroHrYd9MTA28=;
	b=T1k71VsAXMEuYWq7RQKa7mxS0nuo4YNcTs6LFyrUi6CoHNxgik7dwxGUScn9WYZjsyW2g8
	1gmFb75rGWQ+DJSRRX8fTh0kroWOupHHS8VQXNAsA9LlBHxMiI1BYUahSWd/nquYJiW/I2
	0W7Mvei4hESU8lM81hiGPkgHl9hDTyQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-NFprCecJNLScfW68xaxxKA-1; Mon, 11 Nov 2024 08:25:37 -0500
X-MC-Unique: NFprCecJNLScfW68xaxxKA-1
X-Mimecast-MFC-AGG-ID: NFprCecJNLScfW68xaxxKA
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7d4dee4dfdcso3549051a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 05:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731331536; x=1731936336;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q13eH4MbYhj/Wnk8O4ymQCmr4ZeS4IJroHrYd9MTA28=;
        b=ZxUHqtHgQpL39+D8AxEruxOmbcoD/8gXWRgXspDOVbPMaEe9uj2n3jx2gfCym0JjRV
         kIMK2yXp5Ert44KqFgYWPCQQcglufCxm5ONEP4Dj1KfYTD69d3IY2SwKbiapyYePP2Pu
         sAqU07OgpcLEYOGRv4GcpMrP7s9o0asBStlASCfyz2Gd30p14nxRS09CbMYw9ItNg+W2
         94YIOPTMri6bI1f7kvYFOAI3N9ICLHxXceXXPuPiq+DyPwLZ1qFdLIqGctuEDHLLvdnh
         b8qJWyTT3yJqCg/p61I3nQLm5iSKHRN0X2n++JlczKdQhMKxnvVPgoJQPpWGyQDiOOFE
         drWA==
X-Gm-Message-State: AOJu0YyOrPdWlaz6ibocM6LcyCnT2pQJZsn0zhWe2KOlmrI6POiQead2
	/NeZ3svMifUB4HnAFCfbVZiwZQn4vYAdgtHBm4hzy52nPgMwf7EkO78gVc3rCuPhcbdVVzg9/8Q
	UhTDEyp5WSSFUEcPqnvk+pjjzjhZIQbUt6mO3I26QILxge/XUTEP9W0e5YOIdLVNmntUQ7IQzTJ
	wAseO9OhprcIB5Xno1+VzHkRaZMQ7C3in2MoZdjDYPimpwqA==
X-Received: by 2002:a05:6a20:3d86:b0:1db:d980:440e with SMTP id adf61e73a8af0-1dc22941361mr17412807637.14.1731331536111;
        Mon, 11 Nov 2024 05:25:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGS3mq7ltNYBNDQ+5J/JNIxu0LweVI4GTcK17AjWPoCOxsIgaB4xdCIEzqkQK++6MyM9nC31w==
X-Received: by 2002:a05:6a20:3d86:b0:1db:d980:440e with SMTP id adf61e73a8af0-1dc22941361mr17412753637.14.1731331535440;
        Mon, 11 Nov 2024 05:25:35 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a41cfsm9170381b3a.41.2024.11.11.05.25.34
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 05:25:35 -0800 (PST)
Date: Mon, 11 Nov 2024 21:25:32 +0800
From: Zorro Lang <zlang@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [bug report from fstests] WARNING: CPU: 1 PID: 0 at
 arch/powerpc/mm/mmu_context.c:106 switch_mm_irqs_off+0x220/0x270
Message-ID: <20241111132532.2ikhu3q56klfhvte@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 33QcPQzTAkgl-3-PsrZLVLKB_ApEurxm4FLVmNqmQI8_1731331536
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

Recently fstests generic/650 hit a kernel warning on ppc64le [1] with
xfs (default mkfs option). My latest test on mainline linux v6.12-rc6+
with HEAD=da4373fbcf006deda90e5e6a87c499e0ff747572 .

Thanks,
Zorro


[1]
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/ppc64le rdma-cert-03-lp10 6.12.0-rc6+ #1 SMP Sat Nov  9 13:18:41 EST 2024
MKFS_OPTIONS  -- -f -m crc=1,finobt=1,rmapbt=1,reflink=1,inobtcount=1,bigtime=1 /dev/sda3
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch

generic/650       _check_dmesg: something found in dmesg (see /var/lib/xfstests/results//generic/650.dmesg)


HINT: You _MAY_ be missing kernel fix:
      ecd49f7a36fb xfs: fix per-cpu CIL structure aggregation racing with dying cpus

Ran: generic/650
Failures: generic/650
Failed 1 of 1 tests


# cat /var/lib/xfstests/results//generic/650.dmesg
[16630.359077] run fstests generic/650 at 2024-11-09 18:03:21
[16631.058519] ------------[ cut here ]------------
[16631.058531] WARNING: CPU: 1 PID: 0 at arch/powerpc/mm/mmu_context.c:106 switch_mm_irqs_off+0x220/0x270
[16631.058542] Modules linked in: overlay dm_zero dm_log_writes dm_thin_pool dm_persistent_data dm_bio_prison dm_snapshot dm_bufio ext4 mbcache jbd2 dm_flakey bonding tls rfkill sunrpc ibmveth pseries_rng vmx_crypto sg dm_mod fuse loop nfnetlink xfs sd_mod nvme nvme_core ibmvscsi scsi_transport_srp nvme_auth [last unloaded: scsi_debug]
[16631.058617] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: G        W          6.12.0-rc6+ #1
[16631.058623] Tainted: [W]=WARN
[16631.058625] Hardware name: IBM,9009-22G POWER9 (architected) 0x4e0203 0xf000005 of:IBM,FW950.11 (VL950_075) hv:phyp pSeries
[16631.058629] NIP:  c0000000000b02c0 LR: c0000000000b0220 CTR: c000000000152a20
[16631.058633] REGS: c000000008bd7ad0 TRAP: 0700   Tainted: G        W           (6.12.0-rc6+)
[16631.058637] MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR: 2800440a  XER: 20040000
[16631.058660] CFAR: c0000000000b0230 IRQMASK: 3 
               GPR00: c0000000000b027c c000000008bd7d70 c000000002616800 c00000016131a900 
               GPR04: 0000000000000000 000000000000000a 0000000000000000 0000000000000000 
               GPR08: 0000000000000000 0000000000000000 0000000000000001 0000000000000000 
               GPR12: c000000000152a20 c00000000ffcf300 0000000000000000 000000001ef31820 
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
               GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
               GPR24: 0000000000000001 c0000000089acb00 c000000004fafcb0 0000000000000000 
               GPR28: c000000004f24880 c00000016131a900 0000000000000001 c000000004f25180 
[16631.058740] NIP [c0000000000b02c0] switch_mm_irqs_off+0x220/0x270
[16631.058746] LR [c0000000000b0220] switch_mm_irqs_off+0x180/0x270
[16631.058751] Call Trace:
[16631.058754] [c000000008bd7d70] [c0000000000b027c] switch_mm_irqs_off+0x1dc/0x270 (unreliable)
[16631.058763] [c000000008bd7de0] [c0000000002572f8] idle_task_exit+0x118/0x1b0
[16631.058771] [c000000008bd7e40] [c000000000152a70] pseries_cpu_offline_self+0x50/0x150
[16631.058780] [c000000008bd7eb0] [c000000000078678] arch_cpu_idle_dead+0x68/0x7c
[16631.058787] [c000000008bd7ee0] [c00000000029f504] do_idle+0x1c4/0x290
[16631.058793] [c000000008bd7f40] [c00000000029fa90] cpu_startup_entry+0x60/0x70
[16631.058800] [c000000008bd7f70] [c00000000007825c] start_secondary+0x44c/0x480
[16631.058807] [c000000008bd7fe0] [c00000000000e258] start_secondary_prolog+0x10/0x14
[16631.058815] Code: 38800004 387c00f8 487f7a51 60000000 813c00f8 7129000a 4182ff40 2c3d0000 4182ff38 7c0004ac 4bffffb8 4bffff30 <0fe00000> 4bffff70 60000000 60000000 
[16631.058848] irq event stamp: 15169028
[16631.058850] hardirqs last  enabled at (15169027): [<c0000000003eb510>] tick_nohz_idle_exit+0x1c0/0x3b0
[16631.058858] hardirqs last disabled at (15169028): [<c000000001ab7eac>] __schedule+0x5ac/0xc30
[16631.058865] softirqs last  enabled at (15169016): [<c0000000001d24c8>] handle_softirqs+0x578/0x620
[16631.058871] softirqs last disabled at (15168957): [<c00000000001b1dc>] do_softirq_own_stack+0x6c/0x90
[16631.058878] ---[ end trace 0000000000000000 ]---
[16631.814920] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
[16635.633774] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16635.752583] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16635.764402] XFS (sda5): Ending clean mount
[16637.842353] clockevent: decrementer mult[83126f] shift[24] cpu[6]
[16640.956776] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16641.078711] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16641.090273] XFS (sda5): Ending clean mount
[16646.729241] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16646.850952] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16646.863752] XFS (sda5): Ending clean mount
[16653.467205] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16653.594764] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16653.606795] XFS (sda5): Ending clean mount
[16659.346160] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16659.465528] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16659.478422] XFS (sda5): Ending clean mount
[16665.517371] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16665.656116] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16665.668005] XFS (sda5): Ending clean mount
[16672.655768] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16672.781813] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16672.794638] XFS (sda5): Ending clean mount
[16679.551991] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16679.668639] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16679.683949] XFS (sda5): Ending clean mount
[16685.384912] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16685.510632] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16685.522819] XFS (sda5): Ending clean mount
[16691.213987] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16691.347125] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16691.358483] XFS (sda5): Ending clean mount
[16712.697103] XFS (sda5): EXPERIMENTAL online scrub feature in use. Use at your own risk!
[16715.846166] XFS (sda5): Unmounting Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16716.047814] XFS (sda5): Mounting V5 Filesystem 3e7de15a-300a-41f2-8745-5be808cc3f7b
[16716.058628] XFS (sda5): Ending clean mount


