Return-Path: <linuxppc-dev+bounces-7290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79354A6CA95
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Mar 2025 15:33:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKhd95pGXz2yVX;
	Sun, 23 Mar 2025 01:33:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742654013;
	cv=none; b=VeLAXMSItQXbomsjhWYxMPXmuW3rnnLxJAFihDTqRwF1fTVCJCTz+IEpOFo95xbMe9A3SM70vSJ9wGh6tcwFA5tv977FXclO9CoHNkiN3vkRq2JS4MIeB2VIS3pJa6p6F5lSqP9XGo5DIZt7upo00lNgni6jv5vlXui8C1VQg/oHEkvL+ea2RWV2Gk9DZtLSwkIfs/gI6uL/VVmJJvAft/nJBSTUjnGfgn3GtkfoCmpQU3VV1Lvu7PJdJBlmU1Beh10B/y3gS+EIlOaWz5CaaEnTmhHR/vMSLLSXlx4e8UeiGy9QGWuogaHTBd+M950lSeG9hDqMj3YlPbznF+V5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742654013; c=relaxed/relaxed;
	bh=CIBZE6KgWtHZM48TAyKomWUpshgbZruN/nT+wM0z3cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUVEzxmhI59ExW0vgJIeuowQn4gk4/wMO1Ogbgws4LADuP3IwjLzrYo24gKh5MlN6tpfiHoVvekV1yMPRXgYPQMwnyFEgiQNQdQ3x02TMVs6ZBqtJajPPDlvPoCk6i//J20M+wf863pAIOlaG8G8My1DftA2EMNHayRxz7DA8MJ+6JdeZKlTv8/eQ1MnB1ZmW2FQS8M+vlSadmjwE1QZ1ExBeM1Xy/ldFwJxdjKlmJeMBZAS6kfsHP9yrxcOK8Rt08y/cY9qB4nTK6K0Kxccb3Pv3U9jMN1LIeZP76+YXyObmBKfHoFe/O5sy6tO1sTWZIBfwJ2TdsEc+lKaKqwdtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xd7+w1pa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xd7+w1pa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKhd818S1z2ySm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 01:33:30 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22622ddcc35so39281865ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742654008; x=1743258808; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIBZE6KgWtHZM48TAyKomWUpshgbZruN/nT+wM0z3cY=;
        b=Xd7+w1paYUsbI3FJDJGZvr4pyzmJlZjB/AjIcKqw/ukLlNo3dPvfHINQxJ5zvTJ6jM
         nzVLY68zLlBuchEW7RY77+/L0SSf8/ePeFNcNMXMCCx44Nak5zXPSfZKJ7nq2/q9GTfk
         IC4woDZM48ew7TN08TUIpTgzR5/6zje6oTu1PB9ae8EnWsd2QbTJ7c9dGHaO8l6Qv2pX
         7C6lQUy0Z+RxSd2ULpz7/29IKaV9d2nDWW38x+1hbPRIdCr+77oQcZrrumwT3k9h69AX
         HfmiUemlPVb0zUjWXdpScTZ/X7beJ9eACMVNdKOo36DSZW3RZmdtLw5HVOEjGS7H9Kn/
         TjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742654008; x=1743258808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIBZE6KgWtHZM48TAyKomWUpshgbZruN/nT+wM0z3cY=;
        b=sJKowBeXS7mJb+BZiJCf91nwiyIl9RQIFAvJ761sp95G4u2bXdIz+ewWZwdT52vr9I
         UE71m/63m25Ka+159wiVLxuarhNcBQHCkENE2GB6Uu0AROeQF1XjNMWhgfhx3abqoBsx
         a/pO6GlhXN28mVO7CsKaI4/GlD8MIctjiQzEw2/UTcKH0T5Uc91P4/VkD1TQb9pT1Id6
         FceFOkGnpJWa7FDKe4B7KsBYc2/P7zVa7OPcYmq1Z2hWnyK6EYHKleUGrvevioh/ICXc
         O9osZ0woaed/3whVdoxrsCHMhyztAwMMRRWbnbRPzDm0vnPMxgRE9JSSRA3jVUJxB43s
         LmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo1mYosbsZq+BoktYEbLJfnkEs8fYo79KX79gVvcjW9aJsopQYHA5L2uksX8oDNTFZgo5zjIkUEJIy6HY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzwh5q2BLtgv7CyaotQXdJz3g8j7u4xjzQzRcopOIgo7ljCWJa8
	be+UcQWktFKlU7VrtTxlNjUmNQDBBRxQRA7qgq2TXKFwgZwtffNv
X-Gm-Gg: ASbGncuC7vS1n0xVZWn+XtsGrQRDDYOn4iZWVzgkJT7TgYFTLe6ZvfzNH1FlztHsaJa
	bMkd99Bc9yT6TkBxEBOCFnefJqM4EsAwXDvTxINeKuhYoasIKELtXmhuAkO4Ju67lREjKonuhj9
	XH/tp9yWTubIV97oKWxnEerFxPW576t9OETyr5yljfhwOnZarWVPaeC0jFVgrSKJ75/k7G12AWi
	NWFQkD+c7sAwZhHYEfrUy5SAKJn9c76x9HF+p6cCPxu1WtPWR5vjZvP3xor//qcITm8utRmR9+v
	Dvlju9ezxV3aLbUJzMrKjPJWcRYNhiMCtnR87g9TS4JKtAmj6k3wL4XoVEaEpodOBy6+
X-Google-Smtp-Source: AGHT+IFuGDrvHo87gSkJ3AgKg7PRhGZxToZM2+HRB79B6clNvtT7xfbYzfwMUOphtPaGeqwrjNJHSw==
X-Received: by 2002:a17:903:320e:b0:224:1294:1d24 with SMTP id d9443c01a7336-22780c51260mr108189625ad.3.1742654008346;
        Sat, 22 Mar 2025 07:33:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4c3a6sm36082255ad.92.2025.03.22.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 07:33:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 22 Mar 2025 07:33:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Vinicius Peixoto <vpeixoto@lkcamp.dev>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v2 08/12] lib/crc_kunit.c: add KUnit test suite for CRC
 library functions
Message-ID: <389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net>
References: <20241202012056.209768-1-ebiggers@kernel.org>
 <20241202012056.209768-9-ebiggers@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202012056.209768-9-ebiggers@kernel.org>
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Sun, Dec 01, 2024 at 05:20:52PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a KUnit test suite for the crc16, crc_t10dif, crc32_le, crc32_be,
> crc32c, and crc64_be library functions.  It avoids code duplication by
> sharing most logic among all CRC variants.  The test suite includes:
> 
> - Differential fuzz test of each CRC function against a simple
>   bit-at-a-time reference implementation.
> - Test for CRC combination, when implemented by a CRC variant.
> - Optional benchmark of each CRC function with various data lengths.
> 
> This is intended as a replacement for crc32test and crc16_kunit, as well
> as a new test for CRC variants which didn't previously have a test.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: Vinicius Peixoto <vpeixoto@lkcamp.dev>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
...
> +
> +		nosimd = rand32() % 8 == 0;
> +
> +		/*
> +		 * Compute the CRC, and verify that it equals the CRC computed
> +		 * by a simple bit-at-a-time reference implementation.
> +		 */
> +		expected_crc = crc_ref(v, init_crc, &test_buffer[offset], len);
> +		if (nosimd)
> +			local_irq_disable();
> +		actual_crc = v->func(init_crc, &test_buffer[offset], len);
> +		if (nosimd)
> +			local_irq_enable();

This triggers a traceback on some arm systems.

[    7.810000]     ok 2 crc16_benchmark # SKIP not enabled
[    7.810000] ------------[ cut here ]------------
[    7.810000] WARNING: CPU: 0 PID: 1145 at kernel/softirq.c:369 __local_bh_enable_ip+0x118/0x194
[    7.810000] Modules linked in:
[    7.810000] CPU: 0 UID: 0 PID: 1145 Comm: kunit_try_catch Tainted: G                 N 6.14.0-rc7-00196-g88d324e69ea9 #1
[    7.810000] Tainted: [N]=TEST
[    7.810000] Hardware name: NPCM7XX Chip family
[    7.810000] Call trace:
[    7.810000]  unwind_backtrace from show_stack+0x10/0x14
[    7.810000]  show_stack from dump_stack_lvl+0x7c/0xac
[    7.810000]  dump_stack_lvl from __warn+0x7c/0x1b8
[    7.810000]  __warn from warn_slowpath_fmt+0x19c/0x1a4
[    7.810000]  warn_slowpath_fmt from __local_bh_enable_ip+0x118/0x194
[    7.810000]  __local_bh_enable_ip from crc_t10dif_arch+0xd4/0xe8
[    7.810000]  crc_t10dif_arch from crc_t10dif_wrapper+0x14/0x1c
[    7.810000]  crc_t10dif_wrapper from crc_main_test+0x178/0x360
[    7.810000]  crc_main_test from kunit_try_run_case+0x78/0x1e0
[    7.810000]  kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
[    7.810000]  kunit_generic_run_threadfn_adapter from kthread+0x118/0x254
[    7.810000]  kthread from ret_from_fork+0x14/0x28
[    7.810000] Exception stack(0xe3651fb0 to 0xe3651ff8)
[    7.810000] 1fa0:                                     00000000 00000000 00000000 00000000
[    7.810000] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.810000] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    7.810000] irq event stamp: 29
[    7.810000] hardirqs last  enabled at (27): [<c037875c>] __local_bh_enable_ip+0xb4/0x194
[    7.810000] hardirqs last disabled at (28): [<c0b09684>] crc_main_test+0x2e4/0x360
[    7.810000] softirqs last  enabled at (26): [<c032a3ac>] kernel_neon_end+0x0/0x1c
[    7.810000] softirqs last disabled at (29): [<c032a3c8>] kernel_neon_begin+0x0/0x70
[    7.810000] ---[ end trace 0000000000000000 ]---
[    8.050000]     # crc_t10dif_test: pass:1 fail:0 skip:0 total:1

kernel_neon_end() calls local_bh_enable() which apparently conflicts with
the local_irq_disable() in above code.

Guenter

