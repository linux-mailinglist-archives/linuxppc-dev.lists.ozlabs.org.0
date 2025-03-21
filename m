Return-Path: <linuxppc-dev+bounces-7266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DFDA6BCAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 15:13:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK4F10y8xz30MR;
	Sat, 22 Mar 2025 01:13:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742566437;
	cv=none; b=Wg7/PyuMfjyPtvLVqOkn0BZKb7iUxTvEab9cWgLYCsTmEaWETwECCLHa/97lFHrimaXPncg6HvZM+9EfAH3XmPLAOn0BizD/HBXGo7UYYzb/R3Y9frhidQwJLULit+/W1lFzpzKxKxlQsqMpzafPm3fHGu+XRa+y1/qAv4iyg2QfbjJ62N0Z1js/iam2VKaYhDdGUvlrcQQU6QP4RREY+EUi4YiNi+8oK1HV9fio2qbDYxuqzBnifE9zQ6ND78zneB+3Hvn9R8GbnXFf5K8tiYqfW/LwlO+YwW6VB6Pdy0FyZrbf7yjHUADl0E/43ekXGWYQ/JjLInlG82hPuePIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742566437; c=relaxed/relaxed;
	bh=oJaLMY9QN+tDgU4cokiF5R9hlYPzHSPoq0nCjE8IMf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4YHoMHpWy2Tpivx0BROtCen/+U+U9/tj6YFv9Upj/NCD1Ee1GhYwk3E+iu8E5WbcqC+yrQLX2C+2v2yxH8xBn+EcrYqe+1YcxkfHa+nGoPs0wRAyq4Env/egK4WO86Qkwaeonez4GmiL16ONUhmVc3qGQOXHYBQmqJPwft6Jgk0LDRa3CXHurthQWe/2awj2KrOM90VBYffMmvh9DKi/zbolSsXkGe1oWehaEw9lKxPOTAqJ0MbRNtLhCQxD/F1fow8Wh1UUPv5o2PClyCxEjACV8+2bGGEurVstyKUAMcyVmEFzqteH+VbI6p0Rad4+JJmXFPSjrJF5sQE55g4FA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TtomZVYe; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TtomZVYe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 466 seconds by postgrey-1.37 at boromir; Sat, 22 Mar 2025 01:13:55 AEDT
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK4Dz4fZcz2ySh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 01:13:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93A0543470;
	Fri, 21 Mar 2025 14:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F51FC4CEE9;
	Fri, 21 Mar 2025 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742565966;
	bh=Efp2oPA71k6HAIzm+TmV+Ye55dV032TIttlnUM1IzOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtomZVYeDy8wuAU9Z1FLMBCNPF80tqxAb9OYMid0PPJqMYM3GP6Y13h3xTFT3duda
	 EsZJtubJ4eo1f27/8eijbytMXypXK9OpAQvtR6SSvixcT5H5Vii2MhLoL5SLtzb/Lu
	 0s/caJoC/vby0Y1EP4mDAykVW2LxQXapv6BFXtpmQyPrxZgK6STqVkdLGCyTYHu8Vm
	 mCCFPWNOppzziuF3ByXKJs3Ie2dXyK1dl1rP19u8nYcVc1S745ZPh8fdb1rtan7e9q
	 Du4G1UQee+eAtGBrbvm+tFS9gYh0kewyZAIG31l16DPgHomybi/A7b0/1WpyBnZYBO
	 txFCMNNUxYjnQ==
Date: Fri, 21 Mar 2025 14:05:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
	vbabka@suse.cz, lorenzo.stoakes@oracle.com, liam.howlett@oracle.com,
	alexandru.elisei@arm.com, peterx@redhat.com, hannes@cmpxchg.org,
	mhocko@kernel.org, m.szyprowski@samsung.com, iamjoonsoo.kim@lge.com,
	mina86@mina86.com, axboe@kernel.dk, viro@zeniv.linux.org.uk,
	brauner@kernel.org, hch@infradead.org, jack@suse.cz,
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
	ritesh.list@gmail.com, aneesh.kumar@kernel.org, bhelgaas@google.com,
	sj@kernel.org, fvdl@google.com, ziy@nvidia.com, yuzhao@google.com,
	minchan@kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@google.com>
Subject: Re: [RFC 3/3] mm: integrate GCMA with CMA using dt-bindings
Message-ID: <20250321-unhelpful-doze-791895ca5b01@spud>
References: <20250320173931.1583800-1-surenb@google.com>
 <20250320173931.1583800-4-surenb@google.com>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fM541kW8FgR5YYtY"
Content-Disposition: inline
In-Reply-To: <20250320173931.1583800-4-surenb@google.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--fM541kW8FgR5YYtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 10:39:31AM -0700, Suren Baghdasaryan wrote:
> This patch introduces a new "guarantee" property for shared-dma-pool.
> With this property, admin can create specific memory pool as
> GCMA-based CMA if they care about allocation success rate and latency.
> The downside of GCMA is that it can host only clean file-backed pages
> since it's using cleancache as its secondary user.
>=20
> Signed-off-by: Minchan Kim <minchan@google.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  arch/powerpc/kernel/fadump.c |  2 +-
>  include/linux/cma.h          |  2 +-
>  kernel/dma/contiguous.c      | 11 ++++++++++-
>  mm/cma.c                     | 33 ++++++++++++++++++++++++++-------
>  mm/cma.h                     |  1 +
>  mm/cma_sysfs.c               | 10 ++++++++++
>  6 files changed, 49 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..4eb7be0cdcdb 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -111,7 +111,7 @@ void __init fadump_cma_init(void)
>  		return;
>  	}
> =20
> -	rc =3D cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma);
> +	rc =3D cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma, =
false);
>  	if (rc) {
>  		pr_err("Failed to init cma area for firmware-assisted dump,%d\n", rc);
>  		/*
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 62d9c1cf6326..3207db979e94 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -46,7 +46,7 @@ extern int __init cma_declare_contiguous_multi(phys_add=
r_t size,
>  extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>  					unsigned int order_per_bit,
>  					const char *name,
> -					struct cma **res_cma);
> +					struct cma **res_cma, bool gcma);
>  extern struct page *cma_alloc(struct cma *cma, unsigned long count, unsi=
gned int align,
>  			      bool no_warn);
>  extern bool cma_pages_valid(struct cma *cma, const struct page *pages, u=
nsigned long count);
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 055da410ac71..a68b3123438c 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -459,6 +459,7 @@ static int __init rmem_cma_setup(struct reserved_mem =
*rmem)
>  	unsigned long node =3D rmem->fdt_node;
>  	bool default_cma =3D of_get_flat_dt_prop(node, "linux,cma-default", NUL=
L);
>  	struct cma *cma;
> +	bool gcma;
>  	int err;
> =20
>  	if (size_cmdline !=3D -1 && default_cma) {
> @@ -476,7 +477,15 @@ static int __init rmem_cma_setup(struct reserved_mem=
 *rmem)
>  		return -EINVAL;
>  	}
> =20
> -	err =3D cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name, &c=
ma);
> +	gcma =3D !!of_get_flat_dt_prop(node, "guarantee", NULL);

When this (or if I guess) this goes !RFC, you will need to document this
new property that you're adding.

--fM541kW8FgR5YYtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ91yRgAKCRB4tDGHoIJi
0vghAQCIfI8+ZQNSSUJvyG5N5hCisJl/fWg9Vm7F5uQooGdzzwD/TYcjtjBBKsJv
aa6VSuGFaENELpO0FBTADe4awZ04uA0=
=vA0y
-----END PGP SIGNATURE-----

--fM541kW8FgR5YYtY--

