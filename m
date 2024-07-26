Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65093DA01
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 22:49:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TlIGYp4X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW0HJ1VkHz3dVr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 06:49:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TlIGYp4X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=chunkeey@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW0GY0R8cz3dHj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 06:48:52 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a7a81bd549eso194246866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722026925; x=1722631725; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBMgfixy+x8J4chK+XEr8yM6u1+DycWp9/E02fNR+AA=;
        b=TlIGYp4XS6FFIjwdxg4tU969ISajEcbuy0fm0gbgBhcX9XP5UigC8qgkcyfKhUzU4K
         HxtIRxhiEhzoYY/xWwjHPvCnGnWKzd1CRH4QvfYnntcLXF5xTDKstV4vL+91E7C3/P4+
         LAInP1CY22RLQWSX90hSkdrKp0es6deTwVJGqoVWL0PHDoenujbRbX5nOECUvwgh6tTy
         SmgqSHDjML+vlGTQHcU+TRC7ZXX6tIYOO9rzd2DSHfweLipZ45clyKzlv5MiHm0+TxOy
         jV+iEEq+4K9KpWqfMsIGfyRuEptDkKrNqyfN/DRmJOShPbL5VuOgFI9Z8rmMZaGeq2oY
         udHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722026925; x=1722631725;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBMgfixy+x8J4chK+XEr8yM6u1+DycWp9/E02fNR+AA=;
        b=k0O1YimooFCzCOvrRUJWzbmunuAWpA4OcA3lk4pNQCLXaM4MVj4Fp54HdQub+f1DNb
         5dAIDXzhjJwm71AVnNCJjheCBU7XogWzu/EmnGHqNh/M1tXq/8JWIgarQ3kjfoCDvkpF
         nAnIcMNGkfPG04l+jnABy2mU2aNq6RsNxcIAfgLr0dGOxM3yTIoF1ZdwIKgy1pva+z4f
         OWZroOTUyWORBU9xAXClQa9xpzv+iZSEEbHQyVI4xwkQGxsHiMKXf1GQMC02bKmeoq/D
         D1eGQBx2HR/L20KAJCQc3LzFVAbr6kuE2YgsWtawS5iy4DRrlI97LHq8oBUr/sMdmqpH
         1hTA==
X-Forwarded-Encrypted: i=1; AJvYcCVLckWP2034BtCGDZGuRZxNXcRffZ5xDeDBEmWjqfU2VPEPfaTLWpgarBiT6qs3cpTScsKm+EUtHb6zjAo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbibDTuuGwy43iiM5U0TBY4sQ0NkCPnKZZon/aM63TaPo+Jj39
	FT4p2MSMnjGtl15qd0u+ycC3RhoCjjn2b1uyWmjsurbm1HpLbhMs
X-Google-Smtp-Source: AGHT+IH/Wk3yKHVOGm6Q2V0uGvjeJYCJriHVdyxX3OVHO2TxkE0uWiwh2D6R3c+mhA8SO2IVFuazNQ==
X-Received: by 2002:a17:907:72cc:b0:a7a:9d74:21c3 with SMTP id a640c23a62f3a-a7d400a1a61mr52676966b.35.1722026924592;
        Fri, 26 Jul 2024 13:48:44 -0700 (PDT)
Received: from shift.daheim (p200300d5ff30930050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff30:9300:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab2302dsm212952766b.39.2024.07.26.13.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 13:48:44 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=shift.localnet)
	by shift.daheim with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <chunkeey@gmail.com>)
	id 1sXSkR-00000000zGU-3SKI;
	Fri, 26 Jul 2024 22:48:43 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: hch@lst.de
Subject: Re: [PATCH 04/15] block: add an API to atomically update queue limits
Date: Fri, 26 Jul 2024 22:48:43 +0200
Message-ID: <2011786.tdWV9SEqCh@shift>
In-Reply-To: <20240213073425.1621680-5-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: axboe@kernel.dk, xuanzhuo@linux.alibaba.com, sagi@grimberg.me, martin.petersen@oracle.com, mst@redhat.com, jasowang@redhat.com, virtualization@lists.linux.dev, linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, dlemoal@kernel.org, stefanha@redhat.com, kbusch@kernel.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

got a WARNING splatch (=> boot harddrive is inaccessible - device fails to boot) 

------------[ cut here ]------------
WARNING: CPU: 0 PID: 29 at block/blk-settings.c:185 blk_validate_limits+0x154/0x294
Modules linked in:
CPU: 0 PID: 29 Comm: kworker/u4:2 Tainted: G        W          6.10.0+ #1
Hardware name: MyBook Live APM821XX 0x12c41c83 PowerPC 44x Platform
Workqueue: async async_run_entry_fn
NIP:  c02f1f00 LR: c02eef3c CTR: 00000000
REGS: c114bbc0 TRAP: 0700   Tainted: G        W           (6.10.0+)
MSR:  0002b000 <CE,EE,FP,ME>  CR: 84000008  XER: 00000000

GPR00: c02eef28 c114bcb0 c116cf40 c114bda8 00000082 ffffffff ffffffff 00000200
GPR08: 00000200 0000ffff 00001fff c114bc80 44000008 00000000 c00433f0 c119b440
GPR16: 00000000 00000000 00000000 00000000 c105d505 c1101880 c11b6250 00000001
GPR24: 00000000 c0ab0000 c114bda8 ffffffff c0a1eb68 00000000 00000014 c1b683d0
NIP [c02f1f00] blk_validate_limits+0x154/0x294
LR [c02eef3c] blk_alloc_queue+0x80/0x1f0
Call Trace:
[c114bcb0] [c02ffa54] blk_alloc_queue_stats+0x20/0x48 (unreliable)
[c114bcc0] [c02eef28] blk_alloc_queue+0x6c/0x1f0
[c114bcf0] [c02fde24] blk_mq_alloc_queue+0x50/0xa8
[c114bd90] [c04393b4] scsi_alloc_sdev+0x190/0x2b8
[c114be40] [c04395a8] scsi_probe_and_add_lun+0xcc/0x2a0
[c114bea0] [c043a008] __scsi_add_device+0xe4/0x134
[c114bee0] [c045296c] ata_scsi_scan_host+0x84/0x27c
[c114bf30] [c0048158] async_run_entry_fn+0x34/0xcc
[c114bf50] [c003c800] process_scheduled_works+0x170/0x244
[c114bf90] [c003cc48] worker_thread+0x184/0x1d4
[c114bfc0] [c00434bc] kthread+0xcc/0xd0
[c114bff0] [c000c210] start_kernel_thread+0x10/0x14
Code: 81430050 7c085040 40810008 91030050 81430004 2c0a0000 40820010 3940ffff 91430004 48000014 280a3ffe 41a1000c <0fe00000> 48000130 80c30008 81430020
---[ end trace 0000000000000000 ]---
scsi_alloc_sdev: Allocation failure during SCSI scanning, some SCSI devices might not be configured

---

This is due to this patch adds
| /*
|   * By default there is no limit on the segment boundary alignment,
|   * but if there is one it can't be smaller than the page size as
|   * that would break all the normal I/O patterns.
|   */
|   if (!lim->seg_boundary_mask)
|           lim->seg_boundary_mask = BLK_SEG_BOUNDARY_MASK;
|   if (WARN_ON_ONCE(lim->seg_boundary_mask < PAGE_SIZE - 1)) <----- this warning gets triggered
|          return -EINVAL;

My guess is that this is caused by the kernel has a 16K page size.

CONFIG_HAVE_PAGE_SIZE_16KB=y
CONFIG_PAGE_SIZE_16KB=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_PAGE_SHIFT=14

This worked fine (sata driver is sata_dwc_460ex.c) in the past (and using 16K pages was
slightly faster than 4k pages)... and yes: using a 4K page size works (as in: device boots again).

Regards,
Christian


