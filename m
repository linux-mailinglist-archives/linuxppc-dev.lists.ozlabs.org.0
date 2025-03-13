Return-Path: <linuxppc-dev+bounces-6951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF8A5EE1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 09:35:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD1645K0zz2yDD;
	Thu, 13 Mar 2025 19:35:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741854924;
	cv=none; b=UhEfURC9LXOS/5Kqebzh3N8rSvdFHbcVLNqohaPLsMpdTPBRevfaZmJEx/mDjLWKLRQvTUr49tFFbZ5E6qr+3LlqKos3CbX4mhQ5mF3JPHlE3LTeDi5VDPiXyu/OJ0sgmikDcIwkxAsE0D+FKgQVDZWFSZwvrrV1T962GUuIvfFTZ6tXzlZeJ9GJUeER5zDGi11VN2MysPNVpSuZkPH0qukkKYJAj8OEQq8OZ423FFgYJfLEdraQU3iXUgHnht6ETOvVttRos1goBRxWNmyYXiGpcqjagPtgYd0ZaChucJ+wAr38DXSkstR0WLfn7ZJ6WaTkrm1FBVlFcTnNnhW6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741854924; c=relaxed/relaxed;
	bh=8DeMDgjj+Gnb/PregoBqkjKJA7+2oVg/ZuaecreaRRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBI/ZcWSmDEDq+cPJ4onVqEBT1kutB61OYgqX9ZaYmcR58Ygzqk7WAIO0ml7chCZHD1oKRHiZRPI23tEwNdemelNSbv9CykTlXtIXqmLA9BlFY1dRQjyT2MphHSggr5ukk3uiEkGUNjLAKOOWQdmQHlzwr1IjX/C/vTBPj9TeZPbei7oXwp5BVosv3M8FvDPs2r0iCjluCgAgK7Q8DBXegBmBF/SW/PipYqEMV7McM+lGnQ1ejUtLy3MV2n//oeMWl133W2msZM2BDnTRq6kP4riAn+g4qsGyt3E8hGhBwJs4TYiC9GRM65BXdCLWOAg3VcSoppibdwyCR2W3BjsLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fZuuCOM+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fZuuCOM+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD1631z6Gz2xy7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 19:35:22 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so3411532a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741854916; x=1742459716; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DeMDgjj+Gnb/PregoBqkjKJA7+2oVg/ZuaecreaRRI=;
        b=fZuuCOM+7jaB0YkrNXQArZym0CoUrI+qedIK1ZMTwDHXg5MLLHHjORYzGhEcBUAxoj
         LBWv52KY67Gb9jJb0FA9pv2uwoWT8ESgirUa6acuzqFH8hCFN1ql5MBFgIl8lSWTRabO
         /r9r+Qrbov2fIhGCuCXNHxx1O7xWusnyPGx+NkQyyy6l6PLTjdGIS5zVTbOKyawo2E0A
         qn495wuMkFspZ15fxsmAXvoCPpSNwJ6iPeozRnz5aYpdnwNbWi8DFBaFjp5or/G9YK4a
         w/V5Nlv6ca/MbeRAR07FzokDgnab9uI4Y8lijLxun12cT1MznHqNdMxEFFHj7lcYykzq
         lU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741854916; x=1742459716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DeMDgjj+Gnb/PregoBqkjKJA7+2oVg/ZuaecreaRRI=;
        b=nthJs4o3wZpKymIn+0kemCCaAZrAsnE2hVk9uyHShGC3uoYn//MDnUJxtPC64i0DGh
         ZONhqmYA7SkyfjC7z2y9Kz6lZbu/9aDJIfaBk4InD4k+OSkn95fTOgPx1YWc9ML7bhwe
         eaTzRV16gUQDtBFhbcmmU91y5W/5mBogC6Uh+7yOjHJYWhZHHVcRt4amTg8x1iqgFQbg
         enQjZaJuYjgTzstM9LmxV5+Oi8gU+hzde9SxtV6LtTjh5T1HvxES5ubNgiiW816FyxGy
         oe5kZua3PzNTnwPFYqPBfpoPsB/7JeW0j/Gkca+oyv68wOf5AcZsXhe+7XPA4n98CzAd
         nmbA==
X-Gm-Message-State: AOJu0Yx750KA9Khnx00q/6HonItYraxVWU6R4yvkNvrEpyhlHZc9WaZ2
	RFCBx/qRXf5RchsvMc9wCcnhKbybUpiFAye5bPzO5EV2j3xp5nNHhOuQ8gqHw/CBrXKzrL/aT9P
	5iPhtJ/hOOtYRZWJS70KgbCqvNEvW3qLOXQ8=
X-Gm-Gg: ASbGncsSQIiI/1IiTnmcx/5SceaL23u1mFxmowINV2oQPbjbA1gGAlalddXayT5W6BR
	Yh3Kddmq6MBKX0GEgvkQoEiH5ob/a9EAjNxRpFoc9+1YFMVWsPeCvxRvH6ZefXPNhE6y/4QQD1e
	9Ym9Eo/z7crVLFcVJYjBz2VkCrmGo=
X-Google-Smtp-Source: AGHT+IHI1lBLY1V2zrX9u9PwzVjaKwzRUJJA3/DiUpe0k1rUdn0OwySpTA7Ubnv81M27JvLB+XzGBgTUIT085e5LO2M=
X-Received: by 2002:a17:907:7b87:b0:ac1:17fe:c74f with SMTP id
 a640c23a62f3a-ac3123c608fmr128941766b.21.1741854915817; Thu, 13 Mar 2025
 01:35:15 -0700 (PDT)
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
References: <20250125094651.70708-1-kirjanov@gmail.com>
In-Reply-To: <20250125094651.70708-1-kirjanov@gmail.com>
From: Denis Kirjanov <kirjanov@gmail.com>
Date: Thu, 13 Mar 2025 11:35:03 +0300
X-Gm-Features: AQ5f1JoimrMZJCc6Qet55wFhCdodIT_3_gaxFF7kmT8XLglgeZpVgesjqTIy3Ek
Message-ID: <CAHj3AVmZjwNVs+h8roV92Uj6rj81C18Waqfq65JROvi2y5UrvA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powermac: Drop the unused debug macro
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Jan 25, 2025 at 12:47=E2=80=AFPM Denis Kirjanov <kirjanov@gmail.com=
> wrote:
>
> Drop the unused DBG macro
>
> Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
> ---
Hello, ping?

>  arch/powerpc/platforms/powermac/feature.c | 8 --------
>  arch/powerpc/platforms/powermac/smp.c     | 8 --------
>  arch/powerpc/platforms/powermac/time.c    | 8 --------
>  3 files changed, 24 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/pla=
tforms/powermac/feature.c
> index 2cc257f75c50..6365cea27abc 100644
> --- a/arch/powerpc/platforms/powermac/feature.c
> +++ b/arch/powerpc/platforms/powermac/feature.c
> @@ -39,14 +39,6 @@
>
>  #include "pmac.h"
>
> -#undef DEBUG_FEATURE
> -
> -#ifdef DEBUG_FEATURE
> -#define DBG(fmt...) printk(KERN_DEBUG fmt)
> -#else
> -#define DBG(fmt...)
> -#endif
> -
>  #ifdef CONFIG_PPC_BOOK3S_32
>  extern int powersave_lowspeed;
>  #endif
> diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platfor=
ms/powermac/smp.c
> index 09e7fe24fac1..ffd5bc96b92c 100644
> --- a/arch/powerpc/platforms/powermac/smp.c
> +++ b/arch/powerpc/platforms/powermac/smp.c
> @@ -53,14 +53,6 @@
>
>  #include "pmac.h"
>
> -#undef DEBUG
> -
> -#ifdef DEBUG
> -#define DBG(fmt...) udbg_printf(fmt)
> -#else
> -#define DBG(fmt...)
> -#endif
> -
>  extern void __secondary_start_pmac_0(void);
>
>  static void (*pmac_tb_freeze)(int freeze);
> diff --git a/arch/powerpc/platforms/powermac/time.c b/arch/powerpc/platfo=
rms/powermac/time.c
> index 8633891b7aa5..6dc16286691a 100644
> --- a/arch/powerpc/platforms/powermac/time.c
> +++ b/arch/powerpc/platforms/powermac/time.c
> @@ -35,14 +35,6 @@
>
>  #include "pmac.h"
>
> -#undef DEBUG
> -
> -#ifdef DEBUG
> -#define DBG(x...) printk(x)
> -#else
> -#define DBG(x...)
> -#endif
> -
>  /*
>   * Calibrate the decrementer frequency with the VIA timer 1.
>   */
> --
> 2.47.2
>


--=20
Regards / Mit besten Gr=C3=BC=C3=9Fen,
Denis

