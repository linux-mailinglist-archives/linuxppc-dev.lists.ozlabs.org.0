Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91167354F30
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 10:57:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF1cm4LKRz3brl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 18:57:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WpscpUN2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WpscpUN2; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF1cK0Ystz2ysp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 18:57:03 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id c17so9931825pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uZUmKkwLM2oSaojuTn4DZClVwuluaLe6PZbLvPR8s3c=;
 b=WpscpUN2s8UcwB80GPNIwVjusSFrsDNimXL3met/I3dY8jN7f/vDKn6GC3ZCHm0gvJ
 X0eSOYRoV3NrPws6+e881tyauDFR2DHTYRV6VDqRR6VreNS5QLy+z6a529MqZm6XO64F
 lmZaxZTY8DzlbI/lOZk7FXot9YJCSbwMtxI73bs8JqKe+1fcadudbIefJQn+3yvE5QwO
 v51LL2yCRBNsZZY7W/VBJY2QK9Zy7gCpGu0LKVY+ttIhCbpKZSiKfm34rIQ6oN64mUjr
 ODCo1c/gMcffa6EZt3MRR1y4wMbMqMCvg55HnV7a22su7k7OVEgCuiZOOpr1Dun6mzcW
 ahtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uZUmKkwLM2oSaojuTn4DZClVwuluaLe6PZbLvPR8s3c=;
 b=JTxfsPSBr0GLXz9fT8GKYHQODE3lElbLcM+fuRNoH46/fAoj0Kffe4deZ3XXuvWhGn
 bUD5BBsqm9yuX2M55qjz/6Aj3DeCdxoLGgYkGDnSYXk4emRrVjyTfBGFzjEawh77DmRD
 bBsPRIDyrpHwjerp+UVzopTHXN4rgfpB1UcGqIC5AYy+YS9lHPYBfcF+bssLza8u3kBy
 OtpuLW2OP5qtvnDtsBoqWxbvVPqvmpy2Sptzr5ob4SxL8sSYClvJBPlGk49gsg+b7mjX
 YC5pBViYzhYIobtrn79K9gJNMeVx8BJ1dVYg7Eg+3Iu7LtzRRnh6+IQR0BTKLCBSsuQW
 4mhA==
X-Gm-Message-State: AOAM533+4SUPpo6O8FhVeha79unM92+lSdf5Ob/xgT0QqYU/gpcXc66w
 guO/Ckrw4DGIX6q3mVO+2no=
X-Google-Smtp-Source: ABdhPJyoX4fauwUz8/uRPC+PLrlDTqY/BbNhdRIQpb2w7mh6/qLvfq7K0aPB9a6PVbfbagmli9jcUQ==
X-Received: by 2002:a63:e903:: with SMTP id i3mr21319346pgh.374.1617699421963; 
 Tue, 06 Apr 2021 01:57:01 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 y15sm20720606pgi.31.2021.04.06.01.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:57:01 -0700 (PDT)
Date: Tue, 6 Apr 2021 17:56:59 +0900
From: Stafford Horne <shorne@gmail.com>
To: guoren@kernel.org
Subject: Re: [PATCH v6 6/9] openrisc: qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210406085659.GF3288043@lianli.shorne-pla.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-7-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617201040-83905-7-git-send-email-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Jonas Bonn <jonas@southpole.se>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31, 2021 at 02:30:37PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> We don't have native hw xchg16 instruction, so let qspinlock
> generic code to deal with it.
> 
> Using the full-word atomic xchg instructions implement xchg16 has
> the semantic risk for atomic operations.
> 
> This patch cancels the dependency of on qspinlock generic code on
> architecture's xchg16.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: openrisc@lists.librecores.org

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index 591acc5990dc..b299e409429f 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -33,6 +33,7 @@ config OPENRISC
>  	select OR1K_PIC
>  	select CPU_NO_EFFICIENT_FFS if !OPENRISC_HAVE_INST_FF1
>  	select ARCH_USE_QUEUED_SPINLOCKS
> +	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select OMPIC if SMP
>  	select ARCH_WANT_FRAME_POINTERS
> -- 
> 2.17.1
> 
