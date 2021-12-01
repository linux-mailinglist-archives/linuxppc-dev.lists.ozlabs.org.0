Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3634646DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 06:51:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3p9S1ZKVz3cHS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 16:51:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WM7Cf9O2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WM7Cf9O2; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3p8p2zqdz2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 16:50:32 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id g18so23235422pfk.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 21:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=vavIU7v4nh3h8E8EeKh3yjxEGQz2m3BEESyFJDC6e4M=;
 b=WM7Cf9O2FTrq6VF6fbFaVcE8S1MaCyfjJTqDeK5n+8XWTBGqd5bY1CKnCZNzZ1Chn7
 5hJbADlAsmqVxSxqP4p4QqTCT4ZwAPbgdJhod8sWJsuldb8KlHJr1FQv2FkDgUvOnvwe
 6s3Lwu6/2WNHBLZdPfCtbLXn2Cx1rmba2irWJI29NnXNlUBnrYytyjTUwZYzGzM/zQKu
 Yc2Ks667KsxHwuzqOcM+Vur8lECYMqkoPS56+pk1Hd8W9QCGnyiy3SyJXSlt5K24hjZT
 /32/oFQhRij0a9WBTmHR9zfoG/Ydw7Lc4T/xAoVDrW/JdsLBxYw6szVN6coMfw/Uce2a
 2/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vavIU7v4nh3h8E8EeKh3yjxEGQz2m3BEESyFJDC6e4M=;
 b=XPaF1uZ9CvYTiXotn7/xPRfzaSG9qnD/p83qGUXftQm4LJKSpjIJwewyRo4kiErZdd
 wUJ5nv3gcu66+FXatdpVPPqFq7AdqwzRuZeaLFnhEQCPdcmkQiiD3pTG2DVsgVW35VG6
 tGkdlGjF51Gy19In3oHOvRqrid0hx1IX64estyYkKgYtNWy7Lj5WAIID5xyoSJEt1amM
 6snmwh5lkmt3w3SN1WpxDZOxi6bshckANh7Cft8T2OcFxbOdGzDXnxT1Y72qUbZ79Aay
 Fn2nLBv74mFYhq9O5msLJIzK+o4OmFMuP+ZQPuGg9Gamk/likN3oXkmdfRA3vvgh96SS
 qqLw==
X-Gm-Message-State: AOAM532wq168FTfVIRX3YQg0Fvm1zOntEqperzQT6ItMfYwWXtWdpm8z
 12NRJwdzHSjPOsyRL7Ig1XQ=
X-Google-Smtp-Source: ABdhPJzpDuCyHsdum2WW1Qj7ykGJ5ES/Nu7CuVlGwuXPWDj9NgCTBq4mjlzjjlE8+bkdqGNXs7kgXQ==
X-Received: by 2002:a63:7c03:: with SMTP id x3mr3163305pgc.394.1638337829479; 
 Tue, 30 Nov 2021 21:50:29 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id p43sm21757902pfw.4.2021.11.30.21.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 21:50:29 -0800 (PST)
Date: Wed, 01 Dec 2021 15:50:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 rebased 3/9] powerpc/mm: Remove CONFIG_PPC_MM_SLICES
To: alex@ghiti.fr, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1637862579.git.christophe.leroy@csgroup.eu>
 <103550e29fc95a6f93ec8848f9ebf9054ca024a3.1637862579.git.christophe.leroy@csgroup.eu>
In-Reply-To: <103550e29fc95a6f93ec8848f9ebf9054ca024a3.1637862579.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1638337392.ccyk5edcqo.astroid@bobo.none>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 26, 2021 3:52 am:
> CONFIG_PPC_MM_SLICES is always selected by hash book3s/64.
> CONFIG_PPC_MM_SLICES is never selected by other platforms.
>=20
> Remove it.

I guess there is some remnants of code/data to build 64s hash without=20
slices. Maybe without any huge page support? I guess it's probably
broken if it never =3Dn, and not worth maintaining anyway?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/64/hash.h |  4 ++--
>  arch/powerpc/include/asm/hugetlb.h        |  2 +-
>  arch/powerpc/include/asm/paca.h           |  7 -------
>  arch/powerpc/include/asm/slice.h          | 13 ++-----------
>  arch/powerpc/kernel/paca.c                |  5 -----
>  arch/powerpc/mm/book3s64/Makefile         |  3 +--
>  arch/powerpc/mm/book3s64/hash_utils.c     | 14 --------------
>  arch/powerpc/platforms/Kconfig.cputype    |  4 ----
>  8 files changed, 6 insertions(+), 46 deletions(-)
