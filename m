Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A86964C0F53
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 10:39:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3WG707m5z3c7S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 20:39:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MxmbMS3h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MxmbMS3h; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3WFR3dlJz3Wtt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 20:38:49 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 132so19409932pga.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=QWmVk+uQwhsnCRAImyHq4I8gKf9caQOuFW2XLD9d4Lg=;
 b=MxmbMS3hEJkirCFe9LZFxRKnzKjn1d0Vx93rQwgGu6NSWj5NY1NzSZZYDqXszDo12K
 ft50VcN96dFJlqOtrh+jV6dWlODK4ve5Fog96FHHIOUtysrivdHHNmty/mMDuvZU2rMl
 ZwBaK7niaEtfkYrVXbozack+eC/Zh4AYbk5t3QQEc7xMl+gLJxoJBEV7TKk1iN/LWKLG
 JmpYZcwbinyzF6f03WC9S9opESAgcE4JGii5TSRU+2iaz/2zXple9CfYqYL29zQjq3Oj
 jV0wgYWu91LzPq4IIERKVUUZWateIVzREj9H2QwpqKh2FD+FXZKOzSVDhxJ2TjcFkb2P
 HU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QWmVk+uQwhsnCRAImyHq4I8gKf9caQOuFW2XLD9d4Lg=;
 b=6yj3AeC72df/pDJtZhMe+y45+F3ApCpfMEBTDuDzohsCtPyDc8nNCAslK3TXIGPeUi
 iLJsyRmiWMwai2uWEA9gR0/N0tLIMBXwLfJU1mSkOocJaGx6Q/tCV/sMk6WrSkQIQchs
 DQHgbxSsCtWvStmx35XR32/co9NAP5xj1HHqH5t7xmixwf/P9u73x0inOOVy3QsuYwvA
 TkVkvpX0YBLgoXVt7bMrhrhq3jo6dWAG9CdqQbw2pz6ETAcYC4dr8eyc6oxusgg2wP36
 QnPLso48J9nJgBQKkIRSKi0fxlU5Yc/DuNdsDG8XhC4H6qTiJILKGZsLggTczZg75fp6
 Da7Q==
X-Gm-Message-State: AOAM531pjObwqimNJFhO6aeR3aUWDOR+OyvysyslEQTS8drQ46SArLvB
 x50yGxy/cLVpHJ7V7hUS2W9FWK+eqOU=
X-Google-Smtp-Source: ABdhPJxKHmFqaPC4jZXmgW5p5dgwR1m/PoLBMjtNZaGP84fG3S3Xq9IdsLYlLDVs2TY1xaqumMOrvQ==
X-Received: by 2002:a63:4f42:0:b0:373:cc0b:5b67 with SMTP id
 p2-20020a634f42000000b00373cc0b5b67mr20358872pgl.605.1645609127930; 
 Wed, 23 Feb 2022 01:38:47 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id 84sm19123161pfx.181.2022.02.23.01.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:38:47 -0800 (PST)
Date: Wed, 23 Feb 2022 19:38:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/4] powerpc/pseries/vas: VAS/NXGZIP support with LPM
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
In-Reply-To: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645608873.sgy6idnhcp.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 6:04 am:
>=20
> Virtual Accelerator Switchboard (VAS) is an engine stays on the
> chip. So all windows opened on a specific engine belongs to VAS
> the chip.

The problem is more that PAPR does not virtualise the VAS windows,
right? That's a whole other gripe but nothing you can do about it
here.

Thanks,
Nick

> The hypervisor expects the partition to close all
> active windows on the sources system and reopen them after
> migration on the destination machine.
>=20
> This patch series adds VAS support with the partition migration.
> When the migration initiates, the VAS migration handler will be
> invoked before pseries_suspend() to close all active windows and
> mark them in-active with VAS_WIN_MIGRATE_CLOSE status. Whereas
> this migration handler is called after migration to reopen all
> windows which has VAS_WIN_MIGRATE_CLOSE status and make them
> active again. The user space gets paste instruction failure
> when it sends requests on these in-active windows.
>=20
> These patches depend on VAS/DLPAR support patch series
>=20
> Changes in v2:
> - Added new patch "Define global hv_cop_caps struct" to eliminate
>   memory allocation failure during migration (suggestion by
>   Nathan Lynch)
>=20
> Changes in v3:
> - Rebase on 5.17-rc4
> - Naming changes for VAS capability struct elemets based on the V4 DLPAR
>   support patch series.
>=20
> Haren Myneni (4):
>   powerpc/pseries/vas: Define global hv_cop_caps struct
>   powerpc/pseries/vas: Modify reconfig open/close functions for
>     migration
>   powerpc/pseries/vas: Add VAS migration handler
>   powerpc/pseries/vas: Disable window open during migration
>=20
>  arch/powerpc/include/asm/vas.h            |   2 +
>  arch/powerpc/platforms/pseries/mobility.c |   5 +
>  arch/powerpc/platforms/pseries/vas.c      | 234 +++++++++++++++++-----
>  arch/powerpc/platforms/pseries/vas.h      |   6 +
>  4 files changed, 201 insertions(+), 46 deletions(-)
>=20
> --=20
> 2.27.0
>=20
>=20
>=20
