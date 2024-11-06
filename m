Return-Path: <linuxppc-dev+bounces-2910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D179D9BEB02
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 13:55:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk4tL3B8Fz304C;
	Wed,  6 Nov 2024 23:55:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730897706;
	cv=none; b=Xp2k2Iq6RZ/jtZ4aydK0MBXESGTpTG9xjaCN/9E2tS4rx57ej821xL6I9tltHbD66aYs/PmMteBUHkzfAmcDt9Ku3ZxGc0ejkXXUoFZ1dWtYCm+lk283r4hGXRe2JDqLnR7hbxSfWEoi5cMW8lG9BynrUDQtqv0hUyV45QxG7P8H0DSRQBbP+8s0GE+C1ptQbbzj/ea2VTAYRhiCa7qjOHDCY9lBIApKRjzP6lrITCjqQzqrbqyGHfY9NysjSW65XB1CrGGLNBgX1uGBPijd2QCAf3u6lcm4ai5typTCV371lJ9nkx62b8oxDfGVH+d03SWni1j00A0DfNSDAk9BPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730897706; c=relaxed/relaxed;
	bh=iRLJUrrpvdggs7VLYItdrnY/LsBZ/gUpUlld7wSgZg8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=II8JI5ouxyd9FwT7cMu/Xb5hoctrDrFy6b1DLy0Ti11ys6VLvJm/2EatuGnQ0XzDP7ccIWSq5T8+bUCS8t0XJOXODyt7N9v/tbLyATKZylSepCv8AkLtvzq8eaZrVbQ/qS/NY581eYsM2CeyCaheGkVDc2bHBW3oAvKluQUs+VhkdOBzSXMD3kxomHDTd2btMmNgW31s4fyvG7iTBb2ZnoXR/2YfAwheDWaqrc+q0kjAe9JiJsg3xYuRxkv2fDJ8zDIvIWUabOHPGSTSTup4EFjGo+xDSHakkECpi72c7jFjTPlGt628SL9VWfUGDpEXcFjzw7RcdriBAA/S9LwK+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r3i4JO0l; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r3i4JO0l;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk4tK0jG1z3005
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 23:55:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730897696;
	bh=iRLJUrrpvdggs7VLYItdrnY/LsBZ/gUpUlld7wSgZg8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r3i4JO0l9iQ/cxv6XhZ8DpOqJ1j7acgckLxkKMl4bVwXA5RGLe7UDkjwHhojgmrwP
	 DyZG+tZetPViar+nig97Y1e3NAu0EwOv/NjD9YIC4KKcMvbLrMVIXzuPzcjqLgDovE
	 XiM9FezvsiY0J/Ty+HMvlufgk1ad3WTlsGYrCIU1Yk/BKEnYjRiJrAmKlkNvcY8j5l
	 H/+YXKVDwa2XdpIquKUVEghyDfsQ/Y8j7LN3e7GemCZO/Zyj9gas7PIGXGgqu5XD8P
	 bdqWjxJ8RU72jLFr1PjZPKGKDaQlHM90aHVh9ukfSU1Vu1MCf0lC3u8psiNAsEg0yW
	 Wh9EveL3Kt/Fw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xk4t25VRLz4wyh;
	Wed,  6 Nov 2024 23:54:50 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Olivia Mackall
 <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas
 Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] hwrng: amd - remove reference to removed PPC_MAPLE config
In-Reply-To: <20241106081343.66479-1-lukas.bulwahn@redhat.com>
References: <20241106081343.66479-1-lukas.bulwahn@redhat.com>
Date: Wed, 06 Nov 2024 23:54:52 +1100
Message-ID: <871pzoldyb.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Lukas Bulwahn <lbulwahn@redhat.com> writes:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 62f8f307c80e ("powerpc/64: Remove maple platform") removes the
> PPC_MAPLE config as a consequence of the platform=E2=80=99s removal.
>
> The config definition of HW_RANDOM_AMD refers to this removed config opti=
on
> in its dependencies.
>
> Remove the reference to the removed config option.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  drivers/char/hw_random/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks for cleaning it up.

There's also an EDAC and cpufreq driver that need to be removed. I
posted the patches before [1] but need to resend them to the relevant
maintainers and with updated change logs.

[1]: https://lore.kernel.org/linuxppc-dev/20240823112134.1314561-2-mpe@elle=
rman.id.au/

cheers

