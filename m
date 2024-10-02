Return-Path: <linuxppc-dev+bounces-1730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1F98D2E8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 14:17:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJYhZ3T14z2yNv;
	Wed,  2 Oct 2024 22:17:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727870476;
	cv=none; b=Q8SCwp8juoUD3vM9F8BZdD7+WxWk3rKYxKJ5UaqtrZIK1toVthr6Co55dg53xEXGXq1w15JlypU3SzC5WoqWg/fqRip7394zjosuoJq3zvhWO7BRHCh7/CTJgzoYRG9yIXm77jpjWa48RwS/tYp12fxH8GN6HfD+d9jQQP3V+dAB7LWvW96DF1osZpa9265kDo5ykcIwMshFlzgbChu/RPoqhOUHhbjClbHdb7R6xfnEC2BoY8rmWv2fzDyyg0HoOpW663NLYmayeB0OzWF/eAXr6EL10xl72Tf/lNAo87+XWeDTM01DWDBAHPxlV+UzHCYt2Rx8Nshm+xDmllXnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727870476; c=relaxed/relaxed;
	bh=iztEn2bXOGHKqLMz9umpFeOSGqxGMqp9GCEQezWIfnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPvxXXQOaEbo/+10eXyJjekJkXSUSVM6nIJxI5e5ZDaoRJgw62NR4kI4mJtOwq4j15slLTVSN2FzSIOhiKDYmZNaHp6iEbEsX3qEVKLe3lHSd/NDzu/fM6w61BuLTUuRahBZY1dsXr5fJkIsWMgmKi8YKq3k1sltFOC1UtTwfXL12/JNI3nLQpIawu1+Zgec8Id3RWT9K9N9n+31XRnWqd9yFgEZJgqa6tFWrddU/E6F4+04EwycohV2UoXEniwXGa7XcVHeL2E507gXCukSXvMNHadULuab+rE7Cy9lzxliCPq50AclkzqgGxjtoDdFLlg8o8GipWO2cw2ytQHfgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=IafF/LEp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=clabbe@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=IafF/LEp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=clabbe@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJYLL5pFMz2xnX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 22:01:13 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37cc9aeb01dso3807041f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2024 05:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727870467; x=1728475267; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iztEn2bXOGHKqLMz9umpFeOSGqxGMqp9GCEQezWIfnc=;
        b=IafF/LEplHdzzoea8zo32BVRJhEZzL8LjG5p7FrA9a8HBrz4sR2JXxj94UIPX6BI5w
         h6OQlgfV2ZmGxZTjI8L2bADfMQR/8J0fxqLp2Fcnnbkda8PJ7c5bJV54M7wyxbbPEqHv
         ejYR6DKZpx8lzdCfYor/ze029q58pXuPFj8iae+8t4oG9OSbLNAgjpLhymULtC7DDkUO
         zHlLfgfURi1ABJoPbpRO3/x1eghT8Qzl4jvFcVEFC3izqZoAda+ebDVHY385ULmhf0w0
         RNjRPA1YaL/9oS5VKyqrpjBZEMLViPlKAbGHM88MD0ws86MxVSar6+bXmRN7enDA7HOQ
         F6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727870467; x=1728475267;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iztEn2bXOGHKqLMz9umpFeOSGqxGMqp9GCEQezWIfnc=;
        b=KbE16IKo5FTzWou3wLzDml1MyXkEAufk3DZ3muPs1W99cIQPtaByUXxHHDIxAx94s0
         AkvI0Fjspme+S3mAVzrUUzkYgk3wUq0c39ShUfYqXBrzGZ021x81P7Jt0siByXG7IbHP
         mELdnzSShwWEYnJPabi0X9o+ulePPga5D5dKylvJQ7Ikp1cyNHZUE9Ie6Y/95vre0xnO
         6cfAoZNEValxNw9RqhU10V+5/oUI2AokTmB0T23EbxsWxxnuoCAnrjUPqoNR+eKcj9Y1
         +59dsDT50TJA+6OeyHP5WyNY/C4MdRBjuF9MJGQE+G26OXYGNj/3KFPL064mCUFP13Hl
         O+Wg==
X-Gm-Message-State: AOJu0YxS8+zOkqJMPXpachz93bhll9RvJWJB73Zem5f9osss/9xVPmWL
	QG5VqqYe9MCh5PkN2awPY0UW4geo8l3OblbEXOL4j2exwwCsRXny5QcdWTNJboE=
X-Google-Smtp-Source: AGHT+IFqIAIZk1Bx3gWa7LK81D9E5Pbk20XkTAU0YsnnIt8UZsFh/wrxV6rBQkzeroeOKYmBZtcNYg==
X-Received: by 2002:a5d:598c:0:b0:374:c9f0:752d with SMTP id ffacd0b85a97d-37cfba0468cmr1777372f8f.47.1727870466592;
        Wed, 02 Oct 2024 05:01:06 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d3:3500:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37cd57427b9sm13776516f8f.95.2024.10.02.05.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 05:01:06 -0700 (PDT)
Date: Wed, 2 Oct 2024 14:01:04 +0200
From: Corentin LABBE <clabbe@baylibre.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	naveen@kernel.org, maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au
Subject: BUG: Kernel NULL pointer dereference on read at 0x00000000 in
 pnv_get_random_long()
Message-ID: <Zv02AMOBJ5a2lrF0@Red>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello

I have a 8335-GCA POWER8 which got a kernel crash during boot:
[   11.754238] Kernel attempted to read user page (0) - exploit attempt? (uid: 0)
[   11.754437] BUG: Kernel NULL pointer dereference on read at 0x00000000
[   11.754499] Faulting instruction address: 0xc0000000000c3758
[   11.754518] Oops: Kernel access of bad area, sig: 11 [#1]
[   11.754534] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
[   11.754699] Modules linked in: powernv_rng(+) ecb ctr sr_mod hid ofpart fb_sys_fops cdrom i2c_algo_bit powernv_flash sg mtd vmx_crypto(+) ipmi_powernv ipmi_devintf at24(+) ipmi_msghandler opal_prd regmap_i2c nfsd gf128mul auth_rpcgss nfs_acl lockd grace sunrpc drm fuse configfs loop drm_panel_orientation_quirks ip_tables x_tables autofs4 uas usb_storage ext4 crc16 mbcache jbd2 crc32c_generic dm_mod xhci_pci xhci_hcd sd_mod t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_generic crct10dif_common usbcore tg3 libphy crc32c_vpmsum ahci usb_common libahci
[   11.754869] CPU: 25 PID: 1332 Comm: (udev-worker) Not tainted 6.1.106 #4 
[   11.754890] Hardware name: 8335-GCA POWER8 (raw) 0x4d0200 opal:skiboot-5.4.8-5787ad3 PowerNV
[   11.754926] NIP:  c0000000000c3758 LR: c0000000000c3754 CTR: 0000000000000000
[   11.754947] REGS: c00000000ec3af70 TRAP: 0300   Not tainted  (6.1.106)
[   11.754966] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44222282  XER: 20000000
[   11.755168] CFAR: c0000000001dfbb4 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0 
               GPR00: c0000000000c3754 c00000000ec3b210 c00000000113cd00 000000000000002c 
               GPR04: 00000000ffff7fff c00000000ec3b010 c00000000ec3b008 0000000ff57e0000 
               GPR08: 0000000000000027 c000000ff7907f98 0000000000000001 0000000000002200 
               GPR12: 0000000000000000 c000000ffffeaf00 0000000000000020 0000000022000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000009 000000013c86f5d8 
               GPR20: 0000000000000000 000001002cd75d90 0000000000000000 0000000000000005 
               GPR24: 000001002cd794a0 000001002cd75d90 c00000000285e6fc c000000000f9e4a0 
               GPR28: 0000000000000003 0000000000000004 0000000000000000 c0000010103ca180 
[   11.755363] NIP [c0000000000c3758] pnv_get_random_long+0x88/0x170
[   11.755386] LR [c0000000000c3754] pnv_get_random_long+0x84/0x170
[   11.755407] Call Trace:
[   11.755416] [c00000000ec3b210] [c0000000000c3754] pnv_get_random_long+0x84/0x170 (unreliable)
[   11.755444] [c00000000ec3b280] [c008000021c50130] powernv_rng_read+0x98/0x120 [powernv_rng]
[   11.755473] [c00000000ec3b300] [c00000000091ac88] add_early_randomness+0x88/0x150
[   11.755577] [c00000000ec3b340] [c00000000091b2c4] hwrng_register+0x344/0x420
[   11.755678] [c00000000ec3b3a0] [c00000000091b408] devm_hwrng_register+0x68/0xf0
[   11.755703] [c00000000ec3b3e0] [c008000021c5003c] powernv_rng_probe+0x34/0x90 [powernv_rng]
[   11.755728] [c00000000ec3b450] [c000000000949218] platform_probe+0x78/0x110
[   11.755750] [c00000000ec3b4d0] [c0000000009442d8] really_probe+0x108/0x590
[   11.755773] [c00000000ec3b560] [c000000000944814] __driver_probe_device+0xb4/0x230
[   11.755799] [c00000000ec3b5e0] [c0000000009449e4] driver_probe_device+0x54/0x130
[   11.755824] [c00000000ec3b620] [c0000000009456d8] __driver_attach+0x158/0x2b0
[   11.755850] [c00000000ec3b6a0] [c000000000940764] bus_for_each_dev+0xb4/0x140
[   11.755874] [c00000000ec3b700] [c000000000943734] driver_attach+0x34/0x50
[   11.755896] [c00000000ec3b720] [c000000000942d88] bus_add_driver+0x218/0x300
[   11.755921] [c00000000ec3b7b0] [c000000000946b84] driver_register+0xb4/0x1c0
[   11.755947] [c00000000ec3b820] [c000000000948b98] __platform_driver_register+0x38/0x50
[   11.755969] [c00000000ec3b840] [c008000021c501e8] powernv_rng_driver_init+0x30/0x4c [powernv_rng]
[   11.755997] [c00000000ec3b860] [c0000000000121b0] do_one_initcall+0x80/0x320
[   11.756020] [c00000000ec3b940] [c0000000002198bc] do_init_module+0x6c/0x290
[   11.756042] [c00000000ec3b9c0] [c00000000021d118] __do_sys_finit_module+0xd8/0x190
[   11.756066] [c00000000ec3baf0] [c00000000002b038] system_call_exception+0x138/0x260
[   11.756091] [c00000000ec3be10] [c00000000000c654] system_call_common+0xf4/0x258
[   11.756117] --- interrupt: c00 at 0x7fffaae9a9e4
[   11.756134] NIP:  00007fffaae9a9e4 LR: 00007fffab110500 CTR: 0000000000000000
[   11.756153] REGS: c00000000ec3be80 TRAP: 0c00   Not tainted  (6.1.106)
[   11.762944] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24222248  XER: 00000000
[   11.765251] IRQMASK: 0 
               GPR00: 0000000000000161 00007ffff4b57210 00007fffaafa6f00 0000000000000006 
               GPR04: 00007fffab11be88 0000000000000000 0000000000000006 0000000000000000 
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
               GPR12: 0000000000000000 00007fffab1fe240 0000000000000020 0000000022000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000009 000000013c86f5d8 
               GPR20: 0000000000000000 000001002cd75d90 0000000000000000 0000000000000005 
               GPR24: 000001002cd794a0 000001002cd75d90 0000000022000000 000001002cd32120 
               GPR28: 00007fffab11be88 0000000000020000 0000000000000000 000001002cd75d90 
[   11.773845] NIP [00007fffaae9a9e4] 0x7fffaae9a9e4
[   11.774334] LR [00007fffab110500] 0x7fffab110500
[   11.774347] --- interrupt: c00
[   11.779698] Instruction dump:
[   11.779711] e88952f8 38634198 3bde52f8 4811c439 60000000 e94d0030 3c62ffe4 386341c0 
[   11.779739] 7fcaf02a 7fc4f378 4811c41d 60000000 <e93e0000> 7c0004ac e9490000 0c0a0000 
[   11.779782] ---[ end trace 0000000000000000 ]---

This happen on stock debian 6.1.0-23-powerpc64le.

I debugged a bit and the crash happen in arch/powerpc/platforms/powernv/rng.c in pnv_get_random_long()
The call rng = get_cpu_var(pnv_rng) return null and so rng is dereferenced via ->regs just after.

I have no real idea on how to fix properly (appart adding a "!rng return 0" test)

Regards

