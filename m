Return-Path: <linuxppc-dev+bounces-3100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D847F9C4F16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 08:03:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xncnc3wfYz2xmk;
	Tue, 12 Nov 2024 18:03:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731394996;
	cv=none; b=PMcnBwMBEkOFphnGfmG/bhTjvVrKRUf1R6Bth136C5CdlD5tLrrzPP2DCMcLa8r74qu++SxHuSUAQTEIGFP8+bZEdJtPAANeJ6ruzTY0V2btKWgMOKlDUQ1BeW79d9C7bZCrLDh+8HRIF7YJP4wsjQVzqXriU0lXEcv2BQM5vex5rpPJ0ZGlU4BFtDy8Fw53SSXcnxaqZk0mIc0Mt9HqCUVP2DS383a9a4ommhuDQrjWKP3EZcfEmxzvdQ6qUkwH6fEe1Rph9xIIx2cRAEWbi3blwM+mVGUS9cW12pqrZauJ/G4gbEe3oh2NoA33EZHbwn3YDj2yMDNKrgi4eX58rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731394996; c=relaxed/relaxed;
	bh=YWUcLfRTu8aVq4mUQdiosajDCWJe6rRtB6jKq/Cjwz0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=cMLDDuI1rdP8InTCEeMuAqhW2tqYvClCXon40sZ/Z8zhUJcI5OgUr+IAL5Q48iX9FeqdevP2uNoyQj6FR6rJ+LJlckYXBYfMvRCLAgnPl2wWnGCgY6hP9uSl8/Zn/UjzyOSIitVG4apnO5TEIV+lajOyWIq+kDNwSnpddFban2UaGN/dTC28N4Pe4L83hoTzFkyUiT9ex65I1cNyfDOflnHu0qFK0Dfa1vT1fsKO4C6MieEBgBJxWT6Prv3O1IHnLTE1+JactuAgnr1TuXjTlAYvhjfP2D0zFidCAP3ndCkoQ1JPfhHUeOQmg5X7baVWw0+NrY93lq8K+g/qI9xn8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RGVJfsCx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RGVJfsCx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xncnb0Bxmz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 18:03:14 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20cbca51687so52152585ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 23:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731394992; x=1731999792; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWUcLfRTu8aVq4mUQdiosajDCWJe6rRtB6jKq/Cjwz0=;
        b=RGVJfsCxtdiSRdaPiv7fb9qCoIN4Lxtc8+hit0ejgdi3LR2maGBKkdpFuKBqfThn2t
         z2qQD4oGq7phBRrTWQ5lBspMm9Sr5yXmNY+OO/yzZ2E6wl/L/lE2B/oD4fmJIqogRh6T
         9Xx2CcCDBG3dl4t2/g4Wk1UC1GIAwtUvTIUcuj6c49lBkKplzOsEI7ZWrulCD1gAsxe+
         8JPvZnffuKGMNl9Rl+ReriU6/Kn4yCS3QpabYQ5Zv7xPrgYbHxcbZlHAW6wA3Rq4X6L0
         lXIV8YyV45gf/SHU7Poj+EiK+WJuLErYqW3uVLOEbSJeIVzXV5OVJ7vZJ/wcIV0dEuOG
         MTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731394992; x=1731999792;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWUcLfRTu8aVq4mUQdiosajDCWJe6rRtB6jKq/Cjwz0=;
        b=tI2qUo0hbATUJaAqjTwPyvHclKHY5HvtYoqVvtR6rwRqFs28of9SJ25rJouPbJLEiq
         nrNSbn+CD+5SRmRDfih87VmzuvwxQZkZXXIIljS9xM+F6hPu+2FXB/+2vzQsUV0J1lgP
         7CkVkBppjEAa+OOfc9Y/xkioFvxJovf1OwXjmYa41o1pP6HXmhNEP7v/uSJBH827BUfg
         sM3UMFAXouocTZdBqQwGMH4USEB7LYn/RWLJKVVObyQ9J/kNSTX9bN1OKFvxneP148Yf
         0tpyWwEVcU0DwQP4xhH+KMKAMQK5SDDlTDuHweGAUicmDNVHsCGC/0pG0LUL5bs1y6mn
         Ar3A==
X-Forwarded-Encrypted: i=1; AJvYcCWMyza9h2QFs3UHNh6LpyJu0YAUAeJxTiJMXlYlQ+8PuvdKEyp2n+pcUh/6CwF+E7JuCAgZdprKglM8Rak=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJtYoIaD50O8FT9qHdytgINE7AoWMcoDo9KVjEWWo44rRKv6xG
	eZgXv6tYlnEzW/AVQ7xPRl3eiPqZdzQTmLvmMaB8BYS0xdZSpFIk
X-Google-Smtp-Source: AGHT+IGUwUqfU2X7ON0Zi7Y2E2SHugPFVf13hwYJ9FZdE/YByyRVsHKQhNtCrrw+we5L4mnnMN+uAg==
X-Received: by 2002:a17:902:e88e:b0:211:aa9e:b808 with SMTP id d9443c01a7336-211aa9eb9cbmr28688575ad.6.1731394991844;
        Mon, 11 Nov 2024 23:03:11 -0800 (PST)
Received: from dw-tp ([171.76.87.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e5d7a6sm86535695ad.215.2024.11.11.23.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:03:11 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] fadump: reserve param area if below boot_mem_top
In-Reply-To: <20241107055817.489795-2-sourabhjain@linux.ibm.com>
Date: Tue, 12 Nov 2024 11:51:42 +0530
Message-ID: <87zfm5m0p5.fsf@gmail.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com> <20241107055817.489795-2-sourabhjain@linux.ibm.com>
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

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> The param area is a memory region where the kernel places additional
> command-line arguments for fadump kernel. Currently, the param memory
> area is reserved in fadump kernel if it is above boot_mem_top. However,
> it should be reserved if it is below boot_mem_top because the fadump
> kernel already reserves memory from boot_mem_top to the end of DRAM.

did you mean s/reserves/preserves ?

>
> Currently, there is no impact from not reserving param memory if it is
> below boot_mem_top, as it is not used after the early boot phase of the
> fadump kernel. However, if this changes in the future, it could lead to
> issues in the fadump kernel.

This will only affect Hash and not radix correct? Because for radix your
param_area is somewhere within [memblock_end_of_DRAM() / 2, memblock_end_of_DRAM()]
which is anyway above boot_mem_top so it is anyway preserved as is... 

... On second thoughts since param_area during normal kernel boot anyway
comes from memblock now. And irrespective of where it falls (above or below
boot_mem_top), we anyway append the bootargs to that. So we don't really
preserve the original contents :) right? So why not just always call for
memblock_reserve() on param_area during capture kernel run?

Thoughts?

>
> Fixes: 3416c9daa6b1 ("powerpc/fadump: pass additional parameters when fadump is active")
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>
> Changelog:
>
> Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
>   - Include Fixes and Acked-by tag in the commit message
>   - No functional changes
>
> ---
>  arch/powerpc/kernel/fadump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 3a2863307863..3f3674060164 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -143,7 +143,7 @@ void __init fadump_append_bootargs(void)
>  	if (!fw_dump.dump_active || !fw_dump.param_area_supported || !fw_dump.param_area)
>  		return;
>  
> -	if (fw_dump.param_area >= fw_dump.boot_mem_top) {
> +	if (fw_dump.param_area < fw_dump.boot_mem_top) {
>  		if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
>  			pr_warn("WARNING: Can't use additional parameters area!\n");
>  			fw_dump.param_area = 0;
> -- 
> 2.46.2

