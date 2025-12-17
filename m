Return-Path: <linuxppc-dev+bounces-14852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D8CC913C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 18:36:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWgvC3zLmz30V2;
	Thu, 18 Dec 2025 04:36:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765992967;
	cv=none; b=FRP/0ndk/Qi19CsoimB1FBmGS8ztRsILZQkqSnGHRQ/b9T7xRco5tOG6PXYWDQ98zkNsESlfcEBUdm4cMC9GO69K9w5l1pagxSOerZA6/tijN+k/3FdwVUl23Rf4GQWWB0Gjrcu3wZBY+ycImDA0z1Ko842Ubx+N2ESHEgwTKn9uUrDRm62SKLhYRZxJtwG0+yKE3l1UxzpF1E2rMfahUWCwxLOew+OLvcX51907nK5YzKYdgwNXRJSaM1hn4Egy714iNgh8NpLjsNSYjXUGCsP7LhFCcIcUon12otoGbSKeWAlyVpo+f6g8pz4st7r8RSsJEhQs+hDwtqaN8hsZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765992967; c=relaxed/relaxed;
	bh=UH8o3pB31iuBpiUVtG0MKzGA/rlWyHKVyGEZhJtLwzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QM8OHQwjSYcdSlgClm8IAlgCFX9OgLu3i4uNGRr300kgUH1cRSA7xhg1bLz++ydNLNETCNBkFrQmWdOfhsmCd4RZDA1RygtP7+khJokfUn0AdS+MkwKf1K19ZMJPIJZ9tIERRRPDs/DAYdiwd9v1F1OMVL6p6iQwEPP6sQ12Mb8xJaXWW8TwM8UcNVSC974lXdzoW797QAqpYu1rDSWEGwtCctZrw1N4BW4dk/hPXqoZdUM3n3ki3K3n2wzI73D40pp0DFzq2ogyV5O5xhjfgJPWBQzlh7DNgcPaQusDP/7bnd4PQ2hCqoLE4awcU4N1lh0flY135TbQmVQj1TgfRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kxAe536/; dkim-atps=neutral; spf=pass (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kxAe536/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWgv94YMSz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 04:36:04 +1100 (AEDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ed75832448so79352471cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 09:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765992901; x=1766597701; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UH8o3pB31iuBpiUVtG0MKzGA/rlWyHKVyGEZhJtLwzw=;
        b=kxAe536/7cE2cKqZzUTE/NJvu2n/Llj8fm3rJQ/41mUXzOsi90+/gwKrVhSezZsFVg
         WIrh1lcREL0FhDhEUubDiODDkMcco6A0fG6FIdwg+X5Keu4UdOWou+c31vWNd9F2Jsu9
         dag8m9sx7Epa7NX8VkQhg+K6Wv2X4JwV3PrCURd8tSGsZIg5IV9XxI8i07W1WXOYRw6G
         whpiQvKmkWmT/RaSz2/ejtEYetJJSN8MJJ2qAFlMqFYd5rjkKHlYTykRwOgC2jzQwz89
         m6+GfOhUZx+B6YoLohCM44XtdEyj89Ik0JyPXs60eNh/Yei/qsMy3psjHoolz+AKkmjF
         81xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765992901; x=1766597701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UH8o3pB31iuBpiUVtG0MKzGA/rlWyHKVyGEZhJtLwzw=;
        b=RL1/wUatSC495xn5V/46159rjMIfujGrRkV4vKZzwVXYQQZXYfVJFi3k8Xd0c8wXoP
         vHD5uBh/17HVN7KkL3wvqtRLcd+jURGqJD0HmDD4KsxMhCOGcxUHtu/Rw3kI65B7wSsw
         rYQtrB2tCKnw9A5jcDbeS6a4ELaj5/Y1e7GElbR2FDDiSXhQ5yQt7g0e9Ax7PaHRs+1+
         T2CxUJLcBZsuGE6L7C/ba8//c9+8CujY/wymtk8gK1BVsfbD/x91chc0clRTUVuqxVzF
         6pxVybkrnqlE7MWUofmaJkPuA38bLYVyoU/GuczVZCFq0DRwdlTwQGpHrSy3oS/zPukX
         kmRg==
X-Forwarded-Encrypted: i=1; AJvYcCWBvXpMZHrtyKoBQARAIrG4fz1fVw+YAbOC8tAWWBGN/IWs45Z0XaaaQpFqU61FzoMHrQcvFzbe4ulIGeA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxa5wMKzId5klB999kyarhKF38y6MBbnPyW9yT2Xw7vn4zQRF4K
	CYXAU1YH0B2BPvuxLs0rhnRPYa7I6uyzs8QRqJBlI2H4ll1oEiH0MT2HHACatA==
X-Gm-Gg: AY/fxX64ocnLYh1Cz7i4ygsrfVzXPZ/jfy1svdVuXZ+zxGJlK/FCdk0sUU/JThhqjIl
	DP4Tps+kwW/VY6B84FDpVbKE6iOXcs6xKlpzB3rwIUs8xwZaYgWuTXeJnp22Ca++x3snzQDRfno
	HKiF6ZaJ1G4XtMkkHDbp8I+qAZIgR4ySc/xSg1cTuzMqAVrqwJpyYiCFF9LuL7AJ4iw+IvuIChb
	YHIPg3FwQs/Mwh8Imip4xI152l02uZbGc0b3G/8llVQNA/WbD8l2OFC+wicjre0hva7OMzkYxlh
	+Z+N/l7elLWxseTC4d5WrUA4ogpXZLWvpshtVlAyyoqRsP3jmqQMMuxCAV/3AZzxcCrJkrbFjrO
	eHoTmjAYj8YNLfEwpocX31CTziy3P4FI4nHUAttkS2tKitJ7gpCZSHo+NLzhupWN8IiTMbmp5HN
	w6Dlj4154e0B1HONitKVQENpFd
X-Google-Smtp-Source: AGHT+IGOFN32FperdsVql2X5eL6M3oX9RjNZGL0cYZzURvAiUN8gFsV+Mi6HALDAylw2K5lKsVYwig==
X-Received: by 2002:a05:7022:1b0c:b0:11b:ceee:a49f with SMTP id a92af1059eb24-11f349a17bdmr12662667c88.8.1765987404720;
        Wed, 17 Dec 2025 08:03:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm64919804c88.13.2025.12.17.08.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:03:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 17 Dec 2025 08:03:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/32: Restore clearing of MSR[RI] at
 interrupt/syscall exit
Message-ID: <6b05eb1c-fdef-44e0-91a7-8286825e68f1@roeck-us.net>
References: <66d0ab070563ad460ed481328ab0887c27f21a2c.1757593807.git.christophe.leroy@csgroup.eu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66d0ab070563ad460ed481328ab0887c27f21a2c.1757593807.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Thu, Sep 11, 2025 at 02:30:12PM +0200, Christophe Leroy wrote:
> Commit 13799748b957 ("powerpc/64: use interrupt restart table to speed
> up return from interrupt") removed the inconditional clearing of
> MSR[RI] when returning from interrupt into kernel. But powerpc/32
> doesn't implement interrupt restart table hence still need MSR[RI]
> to be cleared.
> 
> It could be added back in interrupt_exit_kernel_prepare() but it is
> easier and better to add it back in entry_32.S for following reasons:
> - Writing to MSR must be followed by a synchronising instruction
> - The smaller the non recoverable section is the better it is
> 
> So add a macro called clr_ri and use it in the three places that play
> up with SRR0/SRR1. Use it just before another mtspr for synchronisation
> to avoid having to add an isync.
> 
> Now that's done in entry_32.S, exit_must_hard_disable() can return
> false for non book3s/64, taking into account that BOOKE doesn't have
> MSR_RI.
> 
> Also add back blacklisting syscall_exit_finish for kprobe. This was
> initially added by commit 7cdf44013885 ("powerpc/entry32: Blacklist
> syscall exit points for kprobe.") then lost with
> commit 6f76a01173cc ("powerpc/syscall: implement system call
> entry/exit logic in C for PPC32").
> 
> Fixes: 6f76a01173cc ("powerpc/syscall: implement system call entry/exit logic in C for PPC32")
> Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed up return from interrupt")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

This patch causes several of my ppc64:ppce500 boot tests with e5500 CPU
to stall.

I have not found a common denominator (the proboem seems independent
of boot media and network interface) , but the problem is repeatable.
Roughtly 50-70% of boot attempts stall.

Reverting this patch fixes the problem.

Bisect log is attached for reference.

Thanks,
Guenter

---
# bad: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
# good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
git bisect start 'HEAD' 'v6.18'
# good: [6dfafbd0299a60bfb5d5e277fdf100037c7ded07] Merge tag 'drm-next-2025-12-03' of https://gitlab.freedesktop.org/drm/kernel
git bisect good 6dfafbd0299a60bfb5d5e277fdf100037c7ded07
# bad: [09cab48db950b6fb8c114314a20c0fd5a80cf990] Merge tag 'soc-arm-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad 09cab48db950b6fb8c114314a20c0fd5a80cf990
# good: [6044a1ee9dca906a807ba786421dc4254191ffd5] Merge tag 'devicetree-for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect good 6044a1ee9dca906a807ba786421dc4254191ffd5
# good: [ac20755937e037e586b1ca18a6717d31b1cbce93] Merge tag 'sysctl-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl
git bisect good ac20755937e037e586b1ca18a6717d31b1cbce93
# good: [4b9d25b4d38035b7b2624afd6852dfe4684f0226] Merge tag 'vfs-6.19-rc1.fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
git bisect good 4b9d25b4d38035b7b2624afd6852dfe4684f0226
# good: [63a9b0bc65d5d3ea96a57e7985ea22a8582fbbe5] Merge tag 'kvm-riscv-6.19-1' of https://github.com/kvm-riscv/linux into HEAD
git bisect good 63a9b0bc65d5d3ea96a57e7985ea22a8582fbbe5
# good: [e0c26d47def7382d7dbd9cad58bc653aed75737a] Merge tag 'kvm-s390-next-6.19-1' of https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD
git bisect good e0c26d47def7382d7dbd9cad58bc653aed75737a
# bad: [07025b51c1149951d64804c73014499bb3564dca] Merge tag 'riscv-for-linus-6.19-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
git bisect bad 07025b51c1149951d64804c73014499bb3564dca
# bad: [b296fda58d1d095c95c8207b09856b2ceafa1397] powerpc/64s/hash: Update directMap page counters for Hash
git bisect bad b296fda58d1d095c95c8207b09856b2ceafa1397
# bad: [39fe29e7f2fd38b0fee9bf987d180dee976dd2c7] powerpc: 86xx: Rename wdt@ nodes to watchdog@
git bisect bad 39fe29e7f2fd38b0fee9bf987d180dee976dd2c7
# bad: [10e1c77c3636d815db802ceef588522c2d2d947c] powerpc/32: Fix unpaired stwcx. on interrupt exit
git bisect bad 10e1c77c3636d815db802ceef588522c2d2d947c
# good: [7afe2383eff05f76f4ce2cfda658b7889c89f101] powerpc/kdump: Fix size calculation for hot-removed memory ranges
git bisect good 7afe2383eff05f76f4ce2cfda658b7889c89f101
# bad: [2997876c4a1a5864baa13d7393c2b68cf5b51183] powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit
git bisect bad 2997876c4a1a5864baa13d7393c2b68cf5b51183
# good: [98fa236044ca4f8841107382fb03832101fa7328] powerpc/8xx: Remove specific code from fast_exception_return
git bisect good 98fa236044ca4f8841107382fb03832101fa7328
# first bad commit: [2997876c4a1a5864baa13d7393c2b68cf5b51183] powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit

