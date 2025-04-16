Return-Path: <linuxppc-dev+bounces-7685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF4A8B6D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 12:36:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcyBT4t1gz3bpG;
	Wed, 16 Apr 2025 20:36:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744799809;
	cv=none; b=HYyMT9EojHxxqY2KvFlOyzRSD7orNAWggMQVOI1uzg1tF9NzLKbdMXp/lymVSqtRyrS1cZIUFfU7aJRtj3l2F/DL89ZAmzGoVOOPBLo0Uk8T+rYif0/loH+5RdPynhTTq0wXlVSra7YFe3Del9GnxIaV+J5CX/P3wNwlry2p66/Yq80ZPT1jmf2B1FU4hs5vV7YS+NSFd7LsNiDWSX82RgZ5n/vwi3xSLaOt04oT4PK593Bq+NzojJZPVr7MXP4NtxklfY8x77yLPwkJmsRqUaHIBs0I1u91M9n4ovbO72r0TIu0Au0t6MWtdYWijoRulSuHKMRYuejVld/paXYbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744799809; c=relaxed/relaxed;
	bh=Yu0OduG/XcnOoBxlcEmr0a/9UEUCE8uBsUHPQf781es=;
	h=From:To:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=VUFqNOAdpBLDlTZxgB6Col009u9AClm9yiUQq5jq6HsprRADPTyR7mxacs9Cz5XuNL/3T+f0c64XMIPHW3yOVV0M4pbrwg77y2cVxnkJND1L2u/wd1YlIneSJ49CQf5pNke+cUanujWehYFUtojyO3CHfvKQ1MkF6xwP29xGTbBUmCuAcoyCwwtHg9dcO7Zt2D60V6Rl+Rw0a6mfWrXeL5MLs0fn4ZL6PtvIY3k3EKhfDzW9tISJCN6C0AH+wGLaH/r5H6rmRce/GzEiGapTTqV9fteMqFCZZREiEPQPXzxKTRzqI6IYJTrQ514DwJ3vONm5OQWQJyYYPfB6mZH7ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ss95Vbdi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ss95Vbdi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcyBR4khqz2yS7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 20:36:46 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-303a66af07eso5468184a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744799803; x=1745404603; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu0OduG/XcnOoBxlcEmr0a/9UEUCE8uBsUHPQf781es=;
        b=Ss95Vbdi217BX/rgSO9BM5ePHwM33l8gIsz0pah1ZHFMTADOP30vNHgG/SAloo8YyD
         yDUt1o/RLyy89tbpizZib4uQeaO1JANN7VW+pjl2G/uThtc0m54iPG6SXbqAihL3m2N4
         W4OAngV8muVG1a02OtgvfvL2rOCleQXzNUtAQSD5wHgZZxzBNXh1hhYpZZHX7lrVI9+Q
         1fyOWrHW2IPTXwkst8rln6BWNEZY2nSwD6/igWPJp+PdRDVLigOjFECtM7UtvRUMPr5u
         VsaDrjXmnHAoNA0mKBs7n4ZVD8gShyAmMlv4jWGjKzyDP07BqX88Zn1/corF6GFBLe2Q
         Gkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744799803; x=1745404603;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yu0OduG/XcnOoBxlcEmr0a/9UEUCE8uBsUHPQf781es=;
        b=KTEYQZNPsVSMk4UX28ru24wm8Cqnv8wAH1CvXmJG/N1Wc17sUvjZraxN3774OYLxA/
         g3ZZ7FWGfR5qwnwBFxA99HRnrN3OAdmKw/OYL62m/3i2SpGcFQUuvS9+Q6AhZ2KalnBc
         nOFCGA6JF7uxgnw+hK7UiJxg8bsRDtfnsIm2omzHsH+3/9vvI/5deJLACicU6Vmpb8ex
         TyunmcdjHyXRDEjldyREy+fBQMLMWdwixFpZ9VQeykt+ZJPZ8vWt1BOXci3bYatS2Qsb
         7t4u3tfmgojzHYw+AiXUqZt/uW5e9SxDj6V42NDFLBpQojX+hLV9JOC5+7GC/ObqImvJ
         qytw==
X-Forwarded-Encrypted: i=1; AJvYcCVbG1ksf+zPWmuvHgDDMEGDGPvrwMS05KpSQvuRsncGUvmRrHOQHV5ma6l9Z5y3Nx6dXoKvPC0sxLQVFHo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwiCWQb5xZ9MOLstCS1DMTz6GJQRf7lRBQ4igaYfgX+8Zwi1wB
	rmRPh0RDMqB60wLJ0Clow1rW2Ab1t+07Tys9vBLyDN9DGfg92G3QOXyu6A==
X-Gm-Gg: ASbGncsBJCLzIIKKmJr2WsQIj4FM3BrTK6LRPxOAUPtKcjGRE7VU8RdGubimtcEco9O
	emEpp4frYxD22MO9OZGx9BoQ5dhFfV7Ii2Tnqa5dWRooVqDyZUrDWOIdTC03CPDcQFw3bO6pLSZ
	zLNiikFp7GgF8373bhUPwLt9LfzmGDaZaxgbw0YUaJV+tKCT9mTkJApw3F7V+QWYj7iC7J/vqhp
	UvKHq6Br3XAtMCG33rAY5CJNuoHkJO5Y7JcL74iaEZWw0/FZpVHBcA6Am+lsVuZw7dWFwmbaGwj
	s6dNqSJc4rsqapHDImb49UvHhUw+qfU=
X-Google-Smtp-Source: AGHT+IFhPXLRyPQn1mosGv2aEiyshy4TIGY7tQ77kHQs/toKOoz1Ep201Fbg3Dk3fQlSI8d5rKTclg==
X-Received: by 2002:a17:90a:e187:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-30863d1d97emr2033323a91.1.1744799803221;
        Wed, 16 Apr 2025 03:36:43 -0700 (PDT)
Received: from dw-tp ([129.41.58.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30861212fc9sm1230597a91.26.2025.04.16.03.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:36:42 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Dan =?utf-8?Q?Hor=C3=A1k?= <dan@danny.cz>, linuxppc-dev@lists.ozlabs.org
Subject: Re: early soft lockup in 6.15-rc2 on PowerNV
In-Reply-To: <20250416104552.1b2c63939d42a9bc20f2ef8d@danny.cz>
Date: Wed, 16 Apr 2025 15:55:15 +0530
Message-ID: <87ecxsh08k.fsf@gmail.com>
References: <20250416104552.1b2c63939d42a9bc20f2ef8d@danny.cz>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dan Horák <dan@danny.cz> writes:

> Hi,
>
> after updating to Fedora built 6.15-rc2 kernel from 6.14 I am getting a
> soft lockup early in the boot and NVME related timeout/crash later
> (could it be related?). I am first checking if this is a known issue
> as I have not started bisecting yet.
>
> [    2.866399] Memory: 63016960K/67108864K available (25152K kernel code, 4416K rwdata, 24000K rodata, 9792K init, 1796K bss, 476160K reserved, 3356672K cma-reserved)
> [    2.874121] devtmpfs: initialized
> [   24.037685] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
> [   24.037690] CPU#0 Utilization every 4s during lockup:
> [   24.037692] 	#1: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   24.037697] 	#2: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   24.037701] 	#3: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   24.037704] 	#4: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   24.037707] 	#5: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   24.037711] Modules linked in:
> [   24.037716] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-0.rc2.22.fc43.ppc64le #1 VOLUNTARY 
> [   24.037722] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
> [   24.037725] NIP:  c00000000308a72c LR: c00000000308a7d0 CTR: c0000000018012c0
> [   24.037729] REGS: c000200006637a50 TRAP: 0900   Not tainted  (6.15.0-0.rc2.22.fc43.ppc64le)
> [   24.037733] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 48000828  XER: 00000000
> [   24.037750] CFAR: 0000000000000000 IRQMASK: 0 
> [   24.037750] GPR00: c00000000308a7d0 c000200006637cf0 c0000000025baa00 0000000000000040 
> [   24.037750] GPR04: c0002007ff390b00 0000000000010000 0000000000000000 c0002007ff3a0b00 
> [   24.037750] GPR08: 00000000002007ff 000000000012d092 0000000000000000 0000000000000000 
> [   24.037750] GPR12: 0000000000000000 c000000003fb0000 c000000000011320 0000000000000000 
> [   24.037750] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [   24.037750] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [   24.037750] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [   24.037750] GPR28: 0000000000000000 c000000003f10be0 c0000000019efaf8 0000000000037940 
> [   24.037806] NIP [c00000000308a72c] memory_dev_init+0xb4/0x194
> [   24.037815] LR [c00000000308a7d0] memory_dev_init+0x158/0x194
> [   24.037820] Call Trace:
> [   24.037822] [c000200006637cf0] [c00000000308a7d0] memory_dev_init+0x158/0x194 (unreliable)
> [   24.037830] [c000200006637d70] [c000000003089bd0] driver_init+0x74/0xa0
> [   24.037836] [c000200006637d90] [c00000000300f628] kernel_init_freeable+0x204/0x288
> [   24.037843] [c000200006637df0] [c000000000011344] kernel_init+0x2c/0x1b8
> [   24.037849] [c000200006637e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
> [   24.037855] --- interrupt: 0 at 0x0
> [   24.037858] Code: 7c651b78 40820010 3fa20195 3bbd61e0 48000080 3c62ff89 389e00c8 3863e510 4bf7a625 60000000 39290001 7c284840 <41800088> 792aaac2 7c2a2840 4080ffec 
> [   48.045039] watchdog: BUG: soft lockup - CPU#0 stuck for 44s! [swapper/0:1]
> [   48.045043] CPU#0 Utilization every 4s during lockup:
> [   48.045045] 	#1: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   48.045049] 	#2: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   48.045053] 	#3: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   48.045056] 	#4: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   48.045059] 	#5: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> [   48.045063] Modules linked in:
> [   48.045067] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G             L     ------  ---  6.15.0-0.rc2.22.fc43.ppc64le #1 VOLUNTARY 
> [   48.045073] Tainted: [L]=SOFTLOCKUP
> [   48.045075] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
> [   48.045077] NIP:  c00000000308a72c LR: c00000000308a7d0 CTR: c0000000018012c0
> [   48.045081] REGS: c000200006637a50 TRAP: 0900   Tainted: G             L     ------  ---   (6.15.0-0.rc2.22.fc43.ppc64le)
> [   48.045085] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 48000828  XER: 00000000
> [   48.045100] CFAR: 0000000000000000 IRQMASK: 0 
> [   48.045100] GPR00: c00000000308a7d0 c000200006637cf0 c0000000025baa00 0000000000000040 
> [   48.045100] GPR04: c0002007ff390b00 0000000000010000 0000000000000000 c0002007ff3a0b00 
> [   48.045100] GPR08: 00000000002007ff 00000000000a65fd 0000000000000000 0000000000000000 
> [   48.045100] GPR12: 0000000000000000 c000000003fb0000 c000000000011320 0000000000000000 
> [   48.045100] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [   48.045100] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [   48.045100] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [   48.045100] GPR28: 0000000000000000 c000000003f10be0 c0000000019efaf8 000000000007f880 
> [   48.045155] NIP [c00000000308a72c] memory_dev_init+0xb4/0x194
> [   48.045161] LR [c00000000308a7d0] memory_dev_init+0x158/0x194
> [   48.045166] Call Trace:
> [   48.045167] [c000200006637cf0] [c00000000308a7d0] memory_dev_init+0x158/0x194 (unreliable)
> [   48.045175] [c000200006637d70] [c000000003089bd0] driver_init+0x74/0xa0
> [   48.045181] [c000200006637d90] [c00000000300f628] kernel_init_freeable+0x204/0x288
> [   48.045187] [c000200006637df0] [c000000000011344] kernel_init+0x2c/0x1b8
> [   48.045193] [c000200006637e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
> [   48.045199] --- interrupt: 0 at 0x0

The above looks similar to
https://lore.kernel.org/all/20250410125110.1232329-1-gshan@redhat.com/

Maybe you can give this patch a try for above softlockup.

-ritesh


