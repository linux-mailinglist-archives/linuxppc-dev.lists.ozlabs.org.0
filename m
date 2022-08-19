Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2299559A842
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 00:19:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8bld3WGgz3dwm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 08:19:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ei67oZ0P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ei67oZ0P;
	dkim-atps=neutral
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8bl36RQLz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 08:19:10 +1000 (AEST)
Received: by mail-oo1-xc2c.google.com with SMTP id q6-20020a4aa886000000b0044b06d0c453so428949oom.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=ElEwhFKGd2FC/9X2FVtgbgG3kjrjD6bdwf8mmYydFDQ=;
        b=ei67oZ0P6p8YavAJDaTjRKO5rKLHeUQRVFLbCmNEvBQeWqtwEn+tWq+Nx0jpTknXaC
         AvJFSxHNKV7ad/HzmVXiqB0kpkAEicrfpo4oZ+WQJP8/06vsqWPaVx2bnY/+64p6Q/s2
         4at/0nIxIVqxdyY5Sdp0qhkabU5uJU/OUW/FYAfcojWG+VKOWC/QF4PCn1p2jsnfFVYT
         dvgW7scRxdk+Nu5aj0SMR3o1CDl+BHuWm9m9E0jQ5iC2dSWeAf/uy7vfwDnw0NL1T/Eh
         Y3ozMaePyh8/dBtDXJjK3RiwOlftBgLNXQTnQzLE0+utnxiSOUfckRZK8lxBB5fdG0Td
         Zn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=ElEwhFKGd2FC/9X2FVtgbgG3kjrjD6bdwf8mmYydFDQ=;
        b=jEgCICa8PtDktVDeHNBqPWJXvC8SGRxOoBDJ+VAY34dsPIR8aakmnIGlIYRjWXEQjL
         NryGHJG3Tu0wXMneL2YmXVDNbIywx80XM0fyWtlZH0C4YoDJUN/GO/fr7NJCVcsAwDLe
         6NpCCMpbuMOAIs3m3oRwAlFtxC+hPbufpKDyBpipE3R4uFFv7EbZMESfixliKWXAMzbm
         hbqUSfl9Rkh+Ff6LPFVhCw0yRNhughAAbr85ME6jzw14AAWmEdrmMm08JAWQ1DAOCzJr
         BaOuL5AH9eXms0m1FRjyAD41BlI6M2Fr0NZUIJ2Mz7b0nBxm/QXhvOX6EHvzISUQJHIp
         TyWA==
X-Gm-Message-State: ACgBeo38cMxiS8OpDVGPvqv4pcoW2vq1UDrAA5gaxIib2B/dQv/eQnJN
	HO2lNvUKo/jlqbiBgIyt6mHQIWeo3aoIYujIu6w=
X-Google-Smtp-Source: AA6agR42zS3VCTYuNVOWVg7wg9gxGvN0NIfERQyV6z575IK8vwHqfaqShMPhyK6yRmjYqCOaf8OpdILmvmOAyXIUaYk=
X-Received: by 2002:a4a:4541:0:b0:435:cf9f:1a45 with SMTP id
 y62-20020a4a4541000000b00435cf9f1a45mr3226037ooa.17.1660947547579; Fri, 19
 Aug 2022 15:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220819210112.7924-1-rdunlap@infradead.org>
In-Reply-To: <20220819210112.7924-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Aug 2022 18:18:56 -0400
Message-ID: <CADnq5_MesHnxboGboMy+DUYtBb-EAeApHVsqwaHOVdL7rxYwWg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: export cpu_smallcore_map for modules
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 19, 2022 at 6:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix build error when CONFIG_DRM_AMDGPU=3Dm:
>
> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko=
] undefined!
>
> by exporting 'cpu_smallcore_map' just as other per_cpu
> symbols are exported.
>
> drivers/gpu/drm/amd/amdkfd/kfd_device.c calls cpu_smt_mask().
> This is an inline function on powerpc which references
> cpu_smallcore_map.
>
> Fixes: 425752c63b6f ("powerpc: Detect the presence of big-cores via "ibm,=
 thread-groups"")
> Fixes: 7bc913085765 ("drm/amdkfd: Try to schedule bottom half on same cor=
e")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  arch/powerpc/kernel/smp.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -86,6 +86,7 @@ DEFINE_PER_CPU(cpumask_var_t, cpu_core_m
>  static DEFINE_PER_CPU(cpumask_var_t, cpu_coregroup_map);
>
>  EXPORT_PER_CPU_SYMBOL(cpu_sibling_map);
> +EXPORT_PER_CPU_SYMBOL(cpu_smallcore_map);
>  EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
>  EXPORT_PER_CPU_SYMBOL(cpu_core_map);
>  EXPORT_SYMBOL_GPL(has_big_cores);
