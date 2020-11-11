Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0202AFA23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 22:04:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWcgV4gJJzDqtj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 08:04:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWcdl2YtzzDqt0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 08:03:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=Uiq98Uf3; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4CWcdl0Nv8z9sPB;
 Thu, 12 Nov 2020 08:03:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1605128603;
 bh=M9vA9EXEhJrY9rl2Zw4DRLDmBk0CrN5MqARztLO9iJA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Uiq98Uf3AgbBDEI6mcw+DXkSzGJkrTimRcQYoHeJMGhK9ycWAj0BzWQFXzkN+4xrT
 chQ5M8e0PQkv1hVjikLGKEeSrKg3kD+Z5adna/ju0orH4k9Ovha0Psl6hIfhubjowf
 qbs2jDi3PFb6HvBUul9j2A2+7WGTdiMf7zKqQ8YkfAJBdHWYA+bHE+0B5wTMptYEO7
 t6cfGxgVV5iItQI6U/gjNJQW94Nr495jfoe+UEwaVU9El6UTj7BMXtftfUMfFPZeu8
 OQ5jQ6Kqxk5UtxTqSx9MkLaQeI7MQdd1keIMixiwUetknAoVbnyvFaZkkt6a4rD2Mi
 JQ6NxAD94zKWw==
Received: by neuling.org (Postfix, from userid 1000)
 id E9CE32C06D8; Thu, 12 Nov 2020 08:03:22 +1100 (AEDT)
Message-ID: <8f3bdf7d0829e8ee1eedd442de43c411a5f1ed7e.camel@neuling.org>
Subject: Re: [PATCH] powerpc/powernv/memtrace: Fake non-memblock aligned
 sized traces
From: Michael Neuling <mikey@neuling.org>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 12 Nov 2020 08:03:22 +1100
In-Reply-To: <20201111055524.2458-1-jniethe5@gmail.com>
References: <20201111055524.2458-1-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
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
Cc: Rashmica Gupta <rashmicy@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CC Rashmica Gupta <rashmicy@gmail.com>

On Wed, 2020-11-11 at 16:55 +1100, Jordan Niethe wrote:
> The hardware trace macros which use the memory provided by memtrace are
> able to use trace sizes as small as 16MB. Only memblock aligned values
> can be removed from each NUMA node by writing that value to
> memtrace/enable in debugfs.  This means setting up, say, a 16MB trace is
> not possible.  To allow such a trace size, instead align whatever value
> is written to memtrace/enable to the memblock size for the purpose of
> removing it from each NUMA node but report the written value from
> memtrace/enable and memtrace/x/size in debugfs.
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/memtrace.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/memtrace.c
> b/arch/powerpc/platforms/powernv/memtrace.c
> index 6828108486f8..1188bc8fd090 100644
> --- a/arch/powerpc/platforms/powernv/memtrace.c
> +++ b/arch/powerpc/platforms/powernv/memtrace.c
> @@ -191,7 +191,7 @@ static int memtrace_init_debugfs(void)
>  		ent->dir =3D dir;
>  		debugfs_create_file("trace", 0400, dir, ent, &memtrace_fops);
>  		debugfs_create_x64("start", 0400, dir, &ent->start);
> -		debugfs_create_x64("size", 0400, dir, &ent->size);
> +		debugfs_create_x64("size", 0400, dir, &memtrace_size);
>  	}
> =20
>  	return ret;
> @@ -259,33 +259,25 @@ static int memtrace_enable_set(void *data, u64 val)
>  {
>  	u64 bytes;
> =20
> -	/*
> -	 * Don't attempt to do anything if size isn't aligned to a memory
> -	 * block or equal to zero.
> -	 */
> -	bytes =3D memory_block_size_bytes();
> -	if (val & (bytes - 1)) {
> -		pr_err("Value must be aligned with 0x%llx\n", bytes);
> -		return -EINVAL;
> -	}
> -
>  	/* Re-add/online previously removed/offlined memory */
>  	if (memtrace_size) {
>  		if (memtrace_online())
>  			return -EAGAIN;
>  	}
> =20
> +	memtrace_size =3D val;
> +
>  	if (!val)
>  		return 0;
> =20
> -	/* Offline and remove memory */
> -	if (memtrace_init_regions_runtime(val))
> +	/* Offline and remove memory aligned to memory blocks */
> +	bytes =3D memory_block_size_bytes();
> +	if (memtrace_init_regions_runtime(ALIGN(val, bytes)))
>  		return -EINVAL;
> =20
>  	if (memtrace_init_debugfs())
>  		return -EINVAL;
> =20
> -	memtrace_size =3D val;
> =20
>  	return 0;
>  }
