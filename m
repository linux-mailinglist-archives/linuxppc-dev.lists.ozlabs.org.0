Return-Path: <linuxppc-dev+bounces-13961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11867C424F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 03:35:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3Km60Tqnz3bfN;
	Sat,  8 Nov 2025 13:35:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762569333;
	cv=none; b=ZHxzdo4URJGcU7v4A0eZWUwAj64FAWy7RZuRUuS8G4kvSYMwsmJ5sm3FctI6qIsofFpN7D3GX5dUj/QI9yuVOIqabc4aDiC893AAAf1q8GiYrvAEjk0f9AHJKrW22YxcZKcIJ9FxkrEo+BhaQ/j0SFHDrcVKO+4J3N+LTL8xDjlx7A/dogMuYuUgrVmTfdp+MQPOYneJCqvdh2LVpGwKYJxibvPocEPPmlImeFLPuCVJue2C8dv9WlA4lWQqWCD0N32eBZndhfDCP8mOCDTickAshLtw2d0M5ez2aAQ5keMRSxZLaoITkxx7yDfyJN/+72+vGfJSktJto9jA6tRCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762569333; c=relaxed/relaxed;
	bh=0raRQ0ssYlq/5weqfViO0IEsrLnTC7FleMi+v0hsXlY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=hj4Zus6Nbv3ecFAkt4R2M3TPvmL+b+/gs1tctTd6TzJfHlPfZGgDc93jeM6JgRcMf4YGxrhF/+QLyRH+/bzyqOU7vWB63KGbyOwCwcURdZLUtj45iQKnBCvyfZuZfBEaf7qV/O0t1ZbwYEYfEpFl1coSmli4OS/saLAYOXSE7v4wFn5DG4n6EAFdsPGaGVH5zf1DuLLtLAXpy1SH00okvMLnY6vKX/jvbBXAdtdOOx3k5h+/wNN9d19JjwnZg2Wil3HkFkpIDxAxrZEYS6p81dybEZlKZvlrhY+4/RS++rW/5aKmHNMp3eF4gTuS7py4eCOHLnPItnbmesBM4vW4+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F2h/sajX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F2h/sajX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3Km52wTPz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 13:35:33 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3436d6aa66dso199711a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 18:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762569331; x=1763174131; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0raRQ0ssYlq/5weqfViO0IEsrLnTC7FleMi+v0hsXlY=;
        b=F2h/sajX3hDMpK2hV3GLZKOMF7fPgQW6V9qpUH0qIaV9VHbRwimZPl08OJvkf7Zu2d
         vqk2apgUykD4bbHOab9O4dvm6G7VokDOmJpcpM2sx47IDqjqMbETG3ksJASu6+Bz97TF
         vUf4R/sDiLxurxwpso6oKu9UiyBdDEqbO54Fx0tJEPZCnU+dFwx/ruJiMu6Qd+Ro9l00
         87UFZ00Pw0Duk8kxQYfxU44ZSPqNHWNNYzc+vwZ3LgvnKhW/n3kn0IuUZAyPHpVnNMxj
         4onqZsemVrowj7i6AJk68EJ8nXE2Awk8k2dlgW4qQ7nLYhut/vG0+tzvUxk3xR9E0nY2
         w8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569331; x=1763174131;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0raRQ0ssYlq/5weqfViO0IEsrLnTC7FleMi+v0hsXlY=;
        b=CX2K2roQAmUQAjNXeXFXFUG7cOA6V7gNGYLYXS5fZiu5nrZzvakJw7FKGmQ+STMxwt
         kXWGJpINUUlyPe9C5UGnBa1/RV61dEGNB3b+5CETvi8/osavTKbr+ZINYGBTvPy5FSDQ
         mn8u9b/3tmO0sv4kNRpUEo/3EHttgSSGpJK4J3HzXWSLLk8GocJQ4rt8m8qyluyGQaFE
         1pIr2ccPkNIq3DqA+YIYQotU5M23Gs+XXYLosIGOFEOFHfNW8iF1Yt7bXT8CaWY2FmFz
         x4sZVOz3K97SddASwhVKhwpxnyq9Uaw6icS9g3PeKhcPviEOZZIBNjKKgSSKJtxQVsxR
         nHHw==
X-Gm-Message-State: AOJu0YwnibhI+Yg3/gq3PsGOJl1evh0a4BAqd3LXSx2Pb/ngANTy6R2z
	OW85pAbUyvsSrENtK8vY7aJRz7cPe1TS0tirPUBCYJOF2XofiaQuPEUD
X-Gm-Gg: ASbGnctPT/ej0OGiVAPXCqiqc4u3gjbeSm6LPvgBG4nWiWkMx6HWTTz7YM8uhssduZY
	XILgsgZ+dgYeeFDkaBTOaNrw/i32mB/jPiRGEG8tXbc6kIZlp90aTBI6AswKEHNUJQ6QOIfSb83
	7UODddGLtsL0Gxdnr/5XB5+Ei8yMEm9n17OgnN2pa5Md4/Be1DHb1zGBlVlxnA1N+k185maSv/z
	AIbfr+WwQ34GBIHc8RjmDV/9JHqSiaJVb5FUWcQ0skmW82RuKpvyg4CqpKJHgBGzyuV30K1mzal
	vZ6UEj5dz66gvh+eUQnvUeJ9awyn7j/yc8U6o1hHJvh8kj+sTGltdxvNUKW5CHAcWomm+UNtdXN
	EtUkHb5W0gjRjjRK9w/kEqAnoJao0vmkr3R/7QBSm7x40w5mJVZhvSaMUiIu5J/DvE8+P3b7MQP
	ACFP0KulJV3QiXMQo=
X-Google-Smtp-Source: AGHT+IHa2Z3arkNDPFWeViGCj9GYPRQ4/5C5mYBE0qK4mhJ8QW/aU/CZCNeF/L3z11fR+wH6Bbs2Vw==
X-Received: by 2002:a17:90b:510a:b0:32e:3592:581a with SMTP id 98e67ed59e1d1-3436acda427mr1665118a91.17.1762569331183;
        Fri, 07 Nov 2025 18:35:31 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343727dcf3dsm217502a91.19.2025.11.07.18.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 18:35:30 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: pavrampu <pavrampu@imap.linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@ozlabs.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.ibm.com>, Pavithra
 Prakash <pavrampu@linux.ibm.com>
Subject: Re: [PATCH v2 11/11] powerpc/64s/slb: Add no_slb_preload early cmdline param
In-Reply-To: <2197e5654ffff3960ccd4563f88e9396@imap.linux.ibm.com>
Date: Sat, 08 Nov 2025 08:04:24 +0530
Message-ID: <87bjld45hr.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com> <de484b55c45d831bc2db63945f455153c89a9a65.1761834163.git.ritesh.list@gmail.com> <2197e5654ffff3960ccd4563f88e9396@imap.linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

pavrampu <pavrampu@imap.linux.ibm.com> writes:

>
> Thanks for the patches, I have verified patches with below tests and no 
> issues are observed.
>
> Run below tests in hash mode
> 1. slb multihit error injection module, test from 
> https://github.ibm.com/mahesh-salgaonkar/mce_err_inject.git
>     [ insmod mcetest_slb.ko ]
> 2. perf stat -e context-switches hackbench -l 1000 -g 50
> 3. perf stat -e context-switches stress-ng --cpu 0 --timeout 60s
> 4. Regression tests:
> LTP mm tests
> HTX mdt.mem
> stress-ng Memory
> memtester
> kselftest
> 5. Boot with dyndbg="file arch/powerpc/mm/book3s64/hash_utils.c +p" and 
> check there are no errors
> 6. echo "file arch/powerpc/mm/book3s64/hash_utils.c +p" > 
> /sys/kernel/debug/dynamic_debug/control
> 7. Verify hash mmu messages in dmesg
> # dmesg | grep -Eai "Page orders"
> # dmesg | grep -Eai "Using 1TB"
> # dmesg | grep -Eai "Huge page(16GB)"
> 8. hpt_order is updated properly based on "Maximum Memory" value and it 
> is no affected by dlpar operations.
> 9. Boot lpar in radix mode and verify 
> /sys/kernel/debug/powerpc/hpt_order is not available
> 10.Boot lpar in hash mode and check DirectMap16M has valid value,
> 11. Verify DirectMap16M is updated properly with memory dlpar 
> operations.
> 12. Create devdax device and check DirectMap16M is updated, Convert it 
> to system RAM and back to devdax and verify DirectMap16M
> 13. Boot kernel in radix mode and /sys/kernel/debug/kernel_page_tables 
> has PXX level info.
> 14. Boot lpar with no_slb_preload cmd line argument systemd-analyze with 
> and without no_slb_preload
> 15. Check slb_faults with and without no_slb_preload
> 16. kdump/fadump on 1TB system with above patches in radix and hash 
> mode.
> 17. 31TB P8 system boot with above patches
>
>
> Feel free to add:
> Tested-by: Pavithra Prakash (IBM) <pavrampu@linux.ibm.com>

Thanks a lot Pavithra for an extensive testing of this patch series!

-ritesh

