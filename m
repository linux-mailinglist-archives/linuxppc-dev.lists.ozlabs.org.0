Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEBE464649
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 06:14:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3nLZ0M6fz3cC2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 16:13:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JQxYsiF2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JQxYsiF2; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3nKq0gnKz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 16:13:17 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id y8so16761132plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 21:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=vagRKhVlayGNGpvzipvwwiXW4ekkDwImubFgDN/6ACg=;
 b=JQxYsiF2H7BtU8Yx0ym0rEu9ZDq8BfqBVJ7sBGoIJAubnn1QDb1D/8jLnk1ZyaXzPT
 j58IpZHDmWl97/XBGVyaP1l0k/C0rcCB2CRgy4/rQG6eBsGChRuMCTc0YMcDFK7FlCDj
 AE7EvclT141INyf5OoSM0q+fghEarV5+L0hWVEgM26qdfirhBV4brzQtiw8OzWhwdJjw
 0qkkmhCa74hscxNrKPaABABpiTaXHDuGTtRSttP8Q3O86oxxk5PsudVVan4cfZyKyvB0
 wJz+8m6KSRhSjY1pjM4EvHpVSso7q8LmjAQuby6TbTbmsPQt3ILVrSKEKD25Hv30vbZG
 QD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vagRKhVlayGNGpvzipvwwiXW4ekkDwImubFgDN/6ACg=;
 b=sh/B2FydcleVC875FOHURwahxwImy6IR5AQ/88NEV5Zv9zzPlbp+U8Z4zioqL81mA2
 6ExEZNKrtYoAdPqXVH00GaIlhofgpGr+6WjKki354vZuPE3ocG+9Vg/z70wppM3W5VMX
 68LvvvzqEeyH1t/LZOs4xh4TA3KTG42QxJd3KtX28u3tgHdyEejw+jyXmE5G9L7xKTsQ
 Krtx9vBGx75+vgCm+hrQTC1xMp8ztyCrrHNgDZG82TY6e4Yw7EyfWSajMtk+QdXwbjiH
 X0ZPSZ3Gf04pJiofGWBWWWuB+ntgsmP9fZcmFH4sqHBt6AoybjI1N3DpUMfQtJOu89R/
 UK9g==
X-Gm-Message-State: AOAM531vjcYIpnUBdJWiTZLRCD6UACM/YJ8lxeFn+QH2apYWK8sIasAm
 ewmmNGO/7qvhahmdZ5an64+OgIqDv3M=
X-Google-Smtp-Source: ABdhPJwg4xAayZtE6TCUGHloRPZoNvc36H7nJax+piZi/fV34hcVvfi/Ywkt16t6jZBfa0mWh99iqA==
X-Received: by 2002:a17:90b:1bc3:: with SMTP id
 oa3mr4639515pjb.52.1638335594232; 
 Tue, 30 Nov 2021 21:13:14 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id s19sm19484790pfu.137.2021.11.30.21.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 21:13:13 -0800 (PST)
Date: Wed, 01 Dec 2021 15:13:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 15/17] powerpc/64s: Make hash MMU support configurable
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211129030803.1888161-1-npiggin@gmail.com>
 <20211129030803.1888161-16-npiggin@gmail.com> <877dcrqdkw.fsf@linux.ibm.com>
In-Reply-To: <877dcrqdkw.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1638335395.u0enl7fqho.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of November 29, 2021 11:46 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> This adds Kconfig selection which allows 64s hash MMU support to be
>> disabled. It can be disabled if radix support is enabled, the minimum
>> supported CPU type is POWER9 (or higher), and KVM is not selected.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/Kconfig                     |  3 ++-
>>  arch/powerpc/include/asm/mmu.h           | 16 +++++++++++++---
>>  arch/powerpc/kernel/dt_cpu_ftrs.c        | 14 ++++++++++----
>>  arch/powerpc/kvm/Kconfig                 |  1 +
>>  arch/powerpc/mm/init_64.c                | 13 +++++++++++--
>>  arch/powerpc/platforms/Kconfig.cputype   | 23 +++++++++++++++++++++--
>>  arch/powerpc/platforms/cell/Kconfig      |  1 +
>>  arch/powerpc/platforms/maple/Kconfig     |  1 +
>>  arch/powerpc/platforms/microwatt/Kconfig |  2 +-
>>  arch/powerpc/platforms/pasemi/Kconfig    |  1 +
>>  arch/powerpc/platforms/powermac/Kconfig  |  1 +
>>  arch/powerpc/platforms/powernv/Kconfig   |  2 +-
>=20
> powernv_defconfig brings CONFIG_CXL=3Dm
>=20
> ../drivers/misc/cxl/main.c: In function =E2=80=98cxl_alloc_sst=E2=80=99: =
                                                =20
> ../drivers/misc/cxl/main.c:127:45: error: =E2=80=98mmu_linear_psize=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98mmu_virt=
ual_psize=E2=80=99?                                                        =
                     =20
>   127 |  sstp0 |=3D (SLB_VSID_KERNEL | mmu_psize_defs[mmu_linear_psize].s=
llp) << 50;                       =20
>       |                                             ^~~~~~~~~~~~~~~~     =
                                =20
>       |                                             mmu_virtual_psize    =
                                =20
> ../drivers/misc/cxl/main.c:127:45: note: each undeclared identifier is re=
ported only once for each function it appears in                           =
                                                                =20
> make[4]: *** [../scripts/Makefile.build:287: drivers/misc/cxl/main.o] Err=
or 1=20

Gah. I'll have to just make that depend on hash MMU for now.

I won't repost the full series yet it's should just be a one liner.

Thanks,
Nick
