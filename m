Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6DB82F91C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 22:00:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pQjJ87Ew;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TF1c947C3z3cXL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 08:00:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pQjJ87Ew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chrisdown.name (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=chris@chrisdown.name; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDvxs0Rvdz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 03:45:02 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40e69b31366so37911625e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 08:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1705423497; x=1706028297; darn=lists.ozlabs.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfgzSOT5YsRlYZszh8CGN3Yrxu5fn/m7q+vPcIoOkRo=;
        b=pQjJ87EwgMqjEpRIII8i3ZL2AeyNolAREcqD1hBUEPUDbdDVGmzCtXFsGjYYwGd/I1
         g+lWAFbJclk6wPQWAdLUes6o2BsdMlpY0O78X6D7EBPvIQt8VJO+OTItFCS4zk0kreMk
         BaR/6/JOK5Kuus9G4apRlfzAFCXr/r0Egzf50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705423497; x=1706028297;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfgzSOT5YsRlYZszh8CGN3Yrxu5fn/m7q+vPcIoOkRo=;
        b=vOEs1YZGcdf6tkla5NNSfBngZibKJfDm5VjEGew7C7uEsdw5Uil55cEM5magvr9z+2
         /T51dIL+AsWQVD68IK0jMQcc3glgNZvtBRsG2Y9ok02rJf10Znmw6eXTbNlzWzgRO4hn
         KyJR+tl17+pkH3AkjWvzeXKWEkTTOmQOZ7kai1LhsfltaG/46vWs1ins8Bd35jxzmftc
         iMQ4wH3Dhhmm5U0P8tbJ1NWQS+Nei6Py5ITt3cU2j3oLzmRCyuVgbe1JpzmmMS2VLPwj
         huefbVrvb+EY+DHITC5RwQdofpCxC9NF453W7wYezwAd7BhHC3c/+jWAmDkN6H/uP4ab
         Jjvw==
X-Gm-Message-State: AOJu0YxW2BQqnNDOdbj285Vyx9+ZXtZmvLvpLzxfOBkEe4IWEB+NwJij
	TQ17EMq5EMV7FCa4CuDYw3jZ6r3RYRD/Ig==
X-Google-Smtp-Source: AGHT+IGLlTqH9WZOC/OME4zoyjXAaxL4iv39bxZRTYkDmE8GGBdCKiSNb+tybKwAFnn9zCLTCDPSJg==
X-Received: by 2002:a05:600c:4d1f:b0:40e:5b54:1f6e with SMTP id u31-20020a05600c4d1f00b0040e5b541f6emr3393949wmp.131.1705423496977;
        Tue, 16 Jan 2024 08:44:56 -0800 (PST)
Received: from localhost ([2a01:4b00:8432:8600:5ee4:2aff:fe50:f48d])
        by smtp.gmail.com with ESMTPSA id je6-20020a05600c1f8600b0040d8d11bf63sm19929191wmb.41.2024.01.16.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 08:44:56 -0800 (PST)
Date: Tue, 16 Jan 2024 16:44:55 +0000
From: Chris Down <chris@chrisdown.name>
To: Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to
 CONFIG_Z3FOLD_DEPRECATED
Message-ID: <Zaayh527V881l8tf@chrisdown.name>
References: <20240112193103.3798287-1-yosryahmed@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240112193103.3798287-1-yosryahmed@google.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Mailman-Approved-At: Wed, 17 Jan 2024 07:59:26 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yosry Ahmed writes:
>The z3fold compressed pages allocator is not widely used, most users use
>zsmalloc. The only disadvantage of zsmalloc in comparison is the
>dependency on MMU, and zbud is a more common option for !MMU as it was
>the default zswap allocator for a long time.
>
>In hopes of having a single compressed pages allocator at some point,
>and following in the footsteps of SLAB, deprecate z3fold. Rename the
>user-visible option so that users with CONFIG_Z3FOLD=y get a new prompt
>with explanation during make oldconfig. Remove CONFIG_Z3FOLD=y from
>defconfigs.
>
>Existing users, if any, should voice their objections. Otherwise, we can
>remove z3fold in a few releases.
>
>Signed-off-by: Yosry Ahmed <yosryahmed@google.com>

Acked-by: Chris Down <chris@chrisdown.name>

Thanks. We are definitely hurting users as well by keeping this around with its 
known issues when writeback is disabled, for example.

>---
>I have limited understanding of Kconfigs. I modelled this after commit
>eb07c4f39c3e ("mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED"),
>but one difference is that CONFIG_Z3FOLD is a tristate. I made
>CONFIG_Z3FOLD_DEPRECATED a boolean config, and CONFIG_Z3FOLD default y
>so that it is on by default if CONFIG_Z3FOLD_DEPRECATED is selected. I
>am not sure if that's the correct way to do this.
>
>---
> arch/loongarch/configs/loongson3_defconfig |  1 -
> arch/powerpc/configs/ppc64_defconfig       |  1 -
> mm/Kconfig                                 | 13 +++++++++++--
> 3 files changed, 11 insertions(+), 4 deletions(-)
>
>diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
>index 33795e4a5bd63..89b66b6c6a1d5 100644
>--- a/arch/loongarch/configs/loongson3_defconfig
>+++ b/arch/loongarch/configs/loongson3_defconfig
>@@ -85,7 +85,6 @@ CONFIG_ZPOOL=y
> CONFIG_ZSWAP=y
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=y
> CONFIG_ZBUD=y
>-CONFIG_Z3FOLD=y
> CONFIG_ZSMALLOC=m
> # CONFIG_COMPAT_BRK is not set
> CONFIG_MEMORY_HOTPLUG=y
>diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
>index 544a65fda77bc..d39284489aa26 100644
>--- a/arch/powerpc/configs/ppc64_defconfig
>+++ b/arch/powerpc/configs/ppc64_defconfig
>@@ -81,7 +81,6 @@ CONFIG_MODULE_SIG_SHA512=y
> CONFIG_PARTITION_ADVANCED=y
> CONFIG_BINFMT_MISC=m
> CONFIG_ZSWAP=y
>-CONFIG_Z3FOLD=y
> CONFIG_ZSMALLOC=y
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> CONFIG_SLAB_FREELIST_RANDOM=y
>diff --git a/mm/Kconfig b/mm/Kconfig
>index 1902cfe4cc4f5..bc6cc97c08349 100644
>--- a/mm/Kconfig
>+++ b/mm/Kconfig
>@@ -193,15 +193,24 @@ config ZBUD
> 	  deterministic reclaim properties that make it preferable to a higher
> 	  density approach when reclaim will be used.
>
>-config Z3FOLD
>-	tristate "3:1 compression allocator (z3fold)"
>+config Z3FOLD_DEPRECATED
>+	bool "3:1 compression allocator (z3fold) (DEPRECATED)"
> 	depends on ZSWAP
> 	help
>+	  Deprecated and scheduled for removal in a few cycles. If you have
>+	  a good reason for using Z3FOLD rather than ZSMALLOC or ZBUD, please
>+	  contact linux-mm@kvack.org and the zswap maintainers.
>+
> 	  A special purpose allocator for storing compressed pages.
> 	  It is designed to store up to three compressed pages per physical
> 	  page. It is a ZBUD derivative so the simplicity and determinism are
> 	  still there.
>
>+config Z3FOLD
>+	tristate
>+	default y
>+	depends on Z3FOLD_DEPRECATED
>+
> config ZSMALLOC
> 	tristate
> 	prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
>-- 
>2.43.0.275.g3460e3d667-goog
>
>
