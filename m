Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79345124541
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 12:04:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dBwP0vdrzDqCq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 22:04:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dBtS0RHjzDqgH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 22:02:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="YfMz2eXY"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47dBtQ3mHmz9sRv;
 Wed, 18 Dec 2019 22:02:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576666959;
 bh=FWlAjNM6cmTI+9Vit59LLCQZ6i+spyEjv7d/aZR81VA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YfMz2eXYxZdO8Wm8veuFf9IU7mF9LyzoX4KVXYDjvPFDtpb8Ogrf3H2FiPowFSIDR
 ad5k7V9s+DndepXK9fOd/Ln4IuytMJ/1GWUaXHRLf02gCeZlO8FWv2a9cvEZBj9jv/
 iGmTiTQ4e9KOdspMX1dzYDrdT7QNc5P0/GhXtYYQoY7h0Mu183rMtWvHx7Kb9zUUPZ
 tGVedghPFNXaDxiDgIhnDYQlqhqvPHgVp8B2EqTzct11UEe76IuwRhgrybe/Q2l9ST
 Qo+x79Fqyi/6Smi/zsqiCMAgrfhD3AZDBjzqCFFGBJMUuS3nsugek6U1Juu2rBru/6
 97/GJw+nsU7eQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chen Zhou <chenzhou10@huawei.com>, benh@kernel.crashing.org,
 paulus@samba.org
Subject: Re: [PATCH] powerpc/setup_64: use DEFINE_DEBUGFS_ATTRIBUTE to define
 fops_rfi_flush
In-Reply-To: <20191218020842.186446-1-chenzhou10@huawei.com>
References: <20191218020842.186446-1-chenzhou10@huawei.com>
Date: Wed, 18 Dec 2019 22:02:36 +1100
Message-ID: <8736dhoq0j.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: chenzhou10@huawei.com, Julia Lawall <Julia.Lawall@lip6.fr>,
 Nicolai Stange <nicstange@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chen Zhou <chenzhou10@huawei.com> writes:
> Use DEFINE_DEBUGFS_ATTRIBUTE rather than DEFINE_SIMPLE_ATTRIBUTE for
> debugfs files.
>
> Semantic patch information:
> Rationale: DEFINE_SIMPLE_ATTRIBUTE + debugfs_create_file()
> imposes some significant overhead as compared to
> DEFINE_DEBUGFS_ATTRIBUTE + debugfs_create_file_unsafe().

I know you didn't write this text, but these change logs are not great.
It doesn't really explain why you're doing it. And it is alarming that
you're converting *to* a function with "unsafe" in the name.

The commit that added the script:

  5103068eaca2 ("debugfs, coccinelle: check for obsolete DEFINE_SIMPLE_ATTRIBUTE() usage")

Has a bit more explanation.

Maybe something like this:

  In order to protect against file removal races, debugfs files created via
  debugfs_create_file() are wrapped by a struct file_operations at their
  opening.
  
  If the original struct file_operations is known to be safe against removal
  races already, the proxy creation may be bypassed by creating the files
  using DEFINE_DEBUGFS_ATTRIBUTE() and debugfs_create_file_unsafe().


The part that's not explained is why this file is "known to be safe
against removal races already"?

It also seems this conversion will make the file no longer seekable,
because DEFINE_SIMPLE_ATTRIBUTE() uses generic_file_llseek() whereas
DEFINE_DEBUGFS_ATTRIBUTE() uses no_llseek.

That is probably fine, but should be mentioned.

cheers

> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  arch/powerpc/kernel/setup_64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 6104917..4b9fbb2 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -956,11 +956,11 @@ static int rfi_flush_get(void *data, u64 *val)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
>  
>  static __init int rfi_flush_debugfs_init(void)
>  {
> -	debugfs_create_file("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
> +	debugfs_create_file_unsafe("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
>  	return 0;
>  }
>  device_initcall(rfi_flush_debugfs_init);
> -- 
> 2.7.4
