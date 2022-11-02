Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAC4616538
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 15:32:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Tqc3SlCz3ccp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 01:32:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jrxAY3Mg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=glider@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jrxAY3Mg;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Tpf6R7fz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 01:31:22 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id y16so24801128wrt.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvcd8aKkXATuRfEipojhsSmbkitfupBiLaEwnV78heo=;
        b=jrxAY3MgHeVIzcyiNPKtsXJk9dLguqghP/Fjfj+2bzpqzI8Prp73eTJhQjhB0ZFgnj
         ENkFqMekQANYww6qdtbL9fPFhaXN8sqUohuYgloCXlrnxY94ynjMY7v/GtVWYSyGfDDn
         qS2raTJYrrg6bpoLfy+Mm9I3Pe7Z+XR4H1igv3t80BCiwD8ZbSNUjfSDpImNN6LQYZW5
         LA65QwR/6sBqIRaw62mH++XBTgi2BkxGzlprT7asQsa4ZCGo77VPfN1/LUROW6AFRuu7
         koDCbwNY6WxkZbgrjHZwxSYViQQf0rwbw2gTK4aFN2KmlXQkad5K9XYDq5DY6UeMFUvb
         VBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvcd8aKkXATuRfEipojhsSmbkitfupBiLaEwnV78heo=;
        b=yzBljYbbeKBYzGHcj3rni5J/h5uWJv0wtFVWWAMDa+2LoCI70bJ9qwOBdPZovk9i3x
         AHoJzdM54q6cLd+nuT9qj2Up2D9QeSocFLhpXTt8NL1iUt73rLg7EBYwmCXTWYORPjDO
         SB2fVyBtlFD3JrupoEt7RiIBUF8eW3bO4pfNuhUzJ/xikyVstM7ciDSIFJ4Ccm7eSAbu
         1Iu2fa86T98MlwOY6JvYNr+eCZbS0ViSgRQuS7yrljAqgBOG2yUWneL0i+Gq445ROd9R
         Gfi4SqSKVmmDPJZjbOp+wwi4ewPeT8DXghSitWPYQk5/gHGiCSHieIrkZOfaz1sRoxdy
         XhrA==
X-Gm-Message-State: ACrzQf1R3FFV5ayaN0qRYKv/J8arr4zoIxPfwWEPfxZIaa/pFqTVa5lw
	Dc29W79QINGeQWz/rF/rMUp6FnjyWfmSHyepB9ElGw==
X-Google-Smtp-Source: AMsMyM6v9a6vVf5kY2HXjmezSGtsXJpE3LiX+IsFEVWUIFUbTph4Gtnxq3ntkjCtOuZTkp2cjAllhreubO89xhIpzUw=
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id
 y8-20020a5d4ac8000000b00236781a8d2dmr15833263wrs.715.1667399478686; Wed, 02
 Nov 2022 07:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221019170835.155381-1-tony.luck@intel.com> <20221021200120.175753-1-tony.luck@intel.com>
 <20221021200120.175753-2-tony.luck@intel.com> <a60484bf-2107-8bc4-acdc-5f582f9637af@huawei.com>
 <SJ1PR11MB6083F63D86CDF7810F5ACDA3FC329@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAG_fn=WG2-k74zKv2_-jAqU+WDraJDnFZ_hM58FPgswnXs=BrA@mail.gmail.com>
In-Reply-To: <CAG_fn=WG2-k74zKv2_-jAqU+WDraJDnFZ_hM58FPgswnXs=BrA@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 2 Nov 2022 15:30:42 +0100
Message-ID: <CAG_fn=UQUAQGNEGisADkgpe=MHg-8QcNZdgtJPmaLxyLdLc_NA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mm, hwpoison: Try to recover from copy-on write faults
To: "Luck, Tony" <tony.luck@intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Matthew Wilcox <willy@infradead.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Shuai Xue <xueshuai@linux.alibaba.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 2, 2022 at 3:27 PM Alexander Potapenko <glider@google.com> wrot=
e:
>
> On Fri, Oct 28, 2022 at 6:14 PM Luck, Tony <tony.luck@intel.com> wrote:
> >
> > >> +    vfrom =3D kmap_local_page(from);
> > >> +    vto =3D kmap_local_page(to);
> > >> +    ret =3D copy_mc_to_kernel(vto, vfrom, PAGE_SIZE);
> > >
> > > In copy_user_highpage(), kmsan_unpoison_memory(page_address(to), PAGE=
_SIZE) is done after the copy when
> > > __HAVE_ARCH_COPY_USER_HIGHPAGE isn't defined. Do we need to do someth=
ing similar here? But I'm not familiar
> > > with kmsan, so I can easy be wrong.
> >
> > It looks like that kmsan_unpoison_memory() call was added recently, aft=
er I copied
> > copy_user_highpage() to create copy_mc_user_highpage(). I'm not familia=
r with
> > kmsan either. Adding Alexander to this thread since they added that cod=
e.
> >
>
> Given that copy_mc_user_highpage() replaces one of the calls to
> copy_user_highpage(), it sure makes sense to call
> kmsan_unpoison_memory() here.
>
> KMSAN tracks the status (initialized/uninitialized) of the kernel
> memory. Newly allocated memory is marked uninitialized, copying memory
> preserves its status, and writing constants to that memory makes it
> initialized.
> Userspace memory does not have its status tracked by KMSAN, so when
> values are copied from the userspace, KMSAN does nothing with their
> status.
> That's why every (successful) copy_from_user event should be followed
> by kmsan_unpoison_memory(), which marks the corresponding kernel
> buffer initialized - otherwise the status of that buffer may get
> stale.
>
> > > Anyway, this patch looks good to me. Thanks.
> > >
> > > Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

> >
> > Thanks for the review.
> >
> > -Tony
>
>
>
> --
> Alexander Potapenko
> Software Engineer
>
> Google Germany GmbH
> Erika-Mann-Stra=C3=9Fe, 33
> 80636 M=C3=BCnchen
>
> Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
> Registergericht und -nummer: Hamburg, HRB 86891
> Sitz der Gesellschaft: Hamburg



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
