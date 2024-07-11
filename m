Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AD692E5E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 13:17:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKXJ00W27z3cVt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 21:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.42; helo=mail-ej1-f42.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKXHZ46S9z2y70
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 21:16:57 +1000 (AEST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a77cc73d35fso337054366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 04:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696614; x=1721301414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r51nS+g7lQoWT0HNbExECB6/rA+diGsBSoUeSas/gM=;
        b=RldSN4vrKmYCayXNkFhN1oI2AfhU2eAzJbw4ivXrTYZ+ihmzSMeijNtdhSwOdWK6cG
         h7zuWgY33Qf3Q8atZzgtIIjbd4fxbndSZUGdze1OdI/265QwIUOV/V4gI+aAnF+Povxb
         zHjKIFsOznRLq4HrivUhQM/yVGHFH+jzqK6iPmXRxB+s02yAALlT9lMJWZYxYouHVkwq
         j/lab9I6yB0Mv0LO51w6PI8Pqrp+2/qnrgv4zJcibGNR6arQbtAEyKyCDCJuPKEgpEVo
         54Hc0UpVajgiGIT6tc+fsV+GphafAPpSXV72oJFE08rkU697uXyH/37ViQ7DO6lWgaGw
         nBSw==
X-Forwarded-Encrypted: i=1; AJvYcCWaU5eIMNwbCur65mc/Z++kKrL+/MFjPYtjZe5NRVR18/CRxG6MquV3PJ0cu0KDlfJOd/2K9UYvZXVETryVkZ+cfm6p95JaMUDSHiGl3w==
X-Gm-Message-State: AOJu0YwGqw6wZrLueKiDsVypZR3vhDKwVjhUJZBz/m8Uks6g5taqe2U9
	/UzHPaG6YM4SVgn8mVewcdeMsO+A49q+qSzhy3w2zBzUgj1ta3fs
X-Google-Smtp-Source: AGHT+IE6LZHdbstxR+votJm7nuupUZbWEEQffPECqBfV2tlXDzop1gI1NS4S6fcacoV6R+qMyM4bdw==
X-Received: by 2002:a17:906:5806:b0:a6f:e699:a9f8 with SMTP id a640c23a62f3a-a798a2cc14amr156904966b.18.1720696614118;
        Thu, 11 Jul 2024 04:16:54 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-115.fbsv.net. [2a03:2880:30ff:73::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a797ddb28ccsm132052466b.147.2024.07.11.04.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:16:53 -0700 (PDT)
Date: Thu, 11 Jul 2024 04:16:51 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next 1/5] net: dpaa: avoid on-stack arrays of NR_CPUS
 elements
Message-ID: <Zo+/I5Rw0hp5wGeQ@gmail.com>
References: <20240710230025.46487-1-vladimir.oltean@nxp.com>
 <20240710230025.46487-2-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710230025.46487-2-vladimir.oltean@nxp.com>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Vladimir,

On Thu, Jul 11, 2024 at 02:00:21AM +0300, Vladimir Oltean wrote:
> The dpaa-eth driver is written for PowerPC and Arm SoCs which have 1-24
> CPUs. It depends on CONFIG_NR_CPUS having a reasonably small value in
> Kconfig. Otherwise, there are 2 functions which allocate on-stack arrays
> of NR_CPUS elements, and these can quickly explode in size, leading to
> warnings such as:
> 
>   drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning:
>   stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]
> 
> The problem is twofold:
> - Reducing the array size to the boot-time num_possible_cpus() (rather
>   than the compile-time NR_CPUS) creates a variable-length array,
>   which should be avoided in the Linux kernel.
> - Using NR_CPUS as an array size makes the driver blow up in stack
>   consumption with generic, as opposed to hand-crafted, .config files.
> 
> A simple solution is to use dynamic allocation for num_possible_cpus()
> elements (aka a small number determined at runtime).
> 
> Link: https://lore.kernel.org/all/202406261920.l5pzM1rj-lkp@intel.com/
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Breno Leitao <leitao@debian.org>

Thanks for working on it.

--breno
