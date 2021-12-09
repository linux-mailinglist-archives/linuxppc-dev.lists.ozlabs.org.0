Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B00AA46E5B6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 10:41:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8pv34Z5cz3bmx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 20:41:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RvQazjWc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RvQazjWc; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8ptP2Zn4z308h
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 20:40:29 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso4407189pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 01:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=EAgzyfuzJrF4vc8wP6iAI5ht/czof/vV71b1T0UUKYM=;
 b=RvQazjWcfA1CTLQXBKyS6zhLE6thZvJI6iEsOMs0oL+88is+AkWnRLRnks9kAvpct1
 RcUnXFWjRa73QTiIvzBhxuCaBV3apHjXFNXNBSQ6Pi4SSfJRRT0VtPUtpxBISGpkTk4k
 j4kEi7GUwmu9E+hBsWMiYCPPC60v47yHAr0IC1pOcTFmQgrVpAcq55VBGhouNMTOzCbU
 Q0XCIqkeaBWEyC0+H8giMLSISSeBrBjan0wpuxFufC2RzCgRi+pm26/gpPG4rE9AEPhy
 S3ZYHBjvX6P0yjhv+V/Y7My8aWlT5jwgDQlgGOGSw0WXU+aKE4cyinVxxkgMv0bh3c4M
 sk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=EAgzyfuzJrF4vc8wP6iAI5ht/czof/vV71b1T0UUKYM=;
 b=hEAdOqoo1DC3ErgvALIZwJ3DGfGhO6/fByoTdg16xZ7RKvOmhpFPTXwODV6uYXzVVW
 1NrISAF/YrlWJSJIj83MI7nR/eGSvPt0JB7EpF9J+SSJQyXnYG51eoOA4Z1FdcpMj/Gu
 aCJOC8330biSdRToSSsliaDmg3vTjJv2XIYsASHUKlUKnK2mXUyQfO6j7XEBZKPXKgWW
 E1nC58HZF9FhoAsk5/sm4Lh8baq+lt5yePg3TlrIuL4bAokgOEnUjxGljhyXRACpTbFx
 w/jeNHS7u44ePbdybNRnQE4Ir8RvBVanqpkfsLtjsajBxJYUZ1R8OXVbLzgV42A2NHnQ
 T+jQ==
X-Gm-Message-State: AOAM532TvgyInrHEHoVCm5J6N0czeGsOwTX7DF+ZQsuRTOwpbyrJMXkm
 tOmXUGbef7vaHZcXJ99S5Q4=
X-Google-Smtp-Source: ABdhPJylsOgw7VCYRk99dEOJAsH+db9WnMPyzpHrN0JonjFuRepRjCcVVEudR1y+gG6e4nK/u4EbKQ==
X-Received: by 2002:a17:902:e804:b0:142:1c0b:c2a6 with SMTP id
 u4-20020a170902e80400b001421c0bc2a6mr64878506plg.23.1639042826217; 
 Thu, 09 Dec 2021 01:40:26 -0800 (PST)
Received: from localhost (203-219-139-206.static.tpgi.com.au.
 [203.219.139.206])
 by smtp.gmail.com with ESMTPSA id ne7sm9080112pjb.36.2021.12.09.01.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:40:25 -0800 (PST)
Date: Thu, 09 Dec 2021 19:40:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 02/10] mm, hugetlbfs: Allow an arch to always use
 generic versions of get_unmapped_area functions
To: "alex@ghiti.fr" <alex@ghiti.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <52eb6d66c41f1165c88a0b0da08ae190c0b95a59.1638976229.git.christophe.leroy@csgroup.eu>
In-Reply-To: <52eb6d66c41f1165c88a0b0da08ae190c0b95a59.1638976229.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1639042788.z08wljpdx8.astroid@bobo.none>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of December 9, 2021 3:18 am:
> Unlike most architectures, powerpc can only define at runtime
> if it is going to use the generic arch_get_unmapped_area() or not.
>=20
> Today, powerpc has a copy of the generic arch_get_unmapped_area()
> because when selection HAVE_ARCH_UNMAPPED_AREA the generic
> arch_get_unmapped_area() is not available.
>=20
> Rename it generic_get_unmapped_area() and make it independent of
> HAVE_ARCH_UNMAPPED_AREA.
>=20
> Do the same for arch_get_unmapped_area_topdown() versus
> HAVE_ARCH_UNMAPPED_AREA_TOPDOWN.
>=20
> Do the same for hugetlb_get_unmapped_area() versus
> HAVE_ARCH_HUGETLB_UNMAPPED_AREA.
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  fs/hugetlbfs/inode.c     | 17 +++++++++++++----
>  include/linux/hugetlb.h  |  5 +++++
>  include/linux/sched/mm.h |  9 +++++++++
>  mm/mmap.c                | 31 ++++++++++++++++++++++++-------
>  4 files changed, 51 insertions(+), 11 deletions(-)
>=20
