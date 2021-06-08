Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85939FA10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 17:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FztyP20cQz307g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 01:12:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NZLM6u04;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2d;
 helo=mail-vs1-xe2d.google.com; envelope-from=jrdr.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NZLM6u04; dkim-atps=neutral
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fztxv4sSNz2xg1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 01:12:02 +1000 (AEST)
Received: by mail-vs1-xe2d.google.com with SMTP id f21so9325488vsl.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 08:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MSjX3nK0GtynqqM9iCd6zkIVV24QDnb4NX+dYBZ1IiE=;
 b=NZLM6u04LG7nwTw6PryrH38vcL6MJPJbpbyRCidi51cIdv94dnze5cgvX/h8Li8EUo
 SZtNHDQdv53sOUQIrSNi95dlL0BmjNBfkXDZfj6sFwYulYYqwnFr9kNy3yaM7UTsB5eA
 JjSN667e9IehHycBa4rQEw98ooWGeUrZA+JxBFa52bDrH8uNhPQ4nC2prvi5hQErPR1s
 31MdlAdpxfOFJ6KnUMPfsg8C3csLwWt0vi9M6HP2EtTkb0rwlsWXUmIuiWSqFIdr17Um
 WS+if7PN0r407S08u1Q4W3j6+7d+bhX623cYMeq2mDa2/qHdiVBEA/vWdEUXqXoXilBn
 TNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MSjX3nK0GtynqqM9iCd6zkIVV24QDnb4NX+dYBZ1IiE=;
 b=jUtKlvXbJI1HUAbTQS7hlFUhKVy0PMN0vLJji2wmF7xRG5kUcAMwaztmgtYXzLnM4A
 p/l7Wd2ywR3LKGqlIgqZt/O50/hhLplcfR505vg3ZXG5H0yucYOxsB9bLie11XRAReC4
 IHBObQ5/YfmlFWTqR+jqe6yQGPQdHmmBvatKvUY1a0l4hRJmKXeHG4jy4bO26CjZzxTf
 50s12Bi0GGztcXvvZlIfYypk7+tOCbZJ6WEmRulRaCK4wa7lTK3bINKvQmtFP1mXWDIl
 iOFo/hQUvkO9P8ZMNtgB6A6h4rQlFOHb3h96z++HdDfn7UB5SPIju6+Jjgw2SgD2XGWJ
 MIpQ==
X-Gm-Message-State: AOAM531C74AtJhQ+gZnOPva/gdE8MfWnlgYKtHpbpWMPTwRb3AGdMyVT
 vxBvsog+t3GjfVowQCq6Q/rzoNNNBJqyzSAKn4o=
X-Google-Smtp-Source: ABdhPJxVExwpG2PuPqzwrJCiVhc2Ij6CRz8h+gU2c0qgiChMP52og2D5WbQzG29HrvxPuo43oT6jGStUz/wdM5QZZls=
X-Received: by 2002:a67:7cc7:: with SMTP id x190mr647069vsc.30.1623165118611; 
 Tue, 08 Jun 2021 08:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-12-wangkefeng.wang@huawei.com>
 <CAFqt6zZWanzsy=F4LVUkovQE-wqKd0CNG-n=Sx7SBddord6Gcg@mail.gmail.com>
 <215985fd-67d5-731f-743c-ea446b55bb8d@csgroup.eu>
In-Reply-To: <215985fd-67d5-731f-743c-ea446b55bb8d@csgroup.eu>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 8 Jun 2021 20:41:47 +0530
Message-ID: <CAFqt6zbk3rYPx9Qa+pZ3Q5XNLfQZ4w01CCGuq7LYhVYDwweYpw@mail.gmail.com>
Subject: Re: [PATCH v3 resend 11/15] powerpc: convert to
 setup_initial_init_mm()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Linux-MM <linux-mm@kvack.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 8, 2021 at 8:24 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 08/06/2021 =C3=A0 16:36, Souptick Joarder a =C3=A9crit :
> > On Tue, Jun 8, 2021 at 1:56 PM Kefeng Wang <wangkefeng.wang@huawei.com>=
 wrote:
> >>
> >> Use setup_initial_init_mm() helper to simplify code.
> >>
> >> Note klimit is (unsigned long) _end, with new helper,
> >> will use _end directly.
> >
> > With this change klimit left with no user in this file and can be
> > moved to some appropriate header.
> > But in a separate series.
>
> I have a patch to remove klimit, see
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/9fa9ba6807c17f93f=
35a582c199c646c4a8bfd9c.1622800638.git.christophe.leroy@csgroup.eu/

Got it. Thanks :)

>
> Christophe
>
>
> >
> >>
> >> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >> Cc: linuxppc-dev@lists.ozlabs.org
> >> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> >> ---
> >>   arch/powerpc/kernel/setup-common.c | 5 +----
> >>   1 file changed, 1 insertion(+), 4 deletions(-)
> >>
> >> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/=
setup-common.c
> >> index 74a98fff2c2f..96697c6e1e16 100644
> >> --- a/arch/powerpc/kernel/setup-common.c
> >> +++ b/arch/powerpc/kernel/setup-common.c
> >> @@ -927,10 +927,7 @@ void __init setup_arch(char **cmdline_p)
> >>
> >>          klp_init_thread_info(&init_task);
> >>
> >> -       init_mm.start_code =3D (unsigned long)_stext;
> >> -       init_mm.end_code =3D (unsigned long) _etext;
> >> -       init_mm.end_data =3D (unsigned long) _edata;
> >> -       init_mm.brk =3D klimit;
> >> +       setup_initial_init_mm(_stext, _etext, _edata, _end);
> >>
> >>          mm_iommu_init(&init_mm);
> >>          irqstack_early_init();
> >> --
> >> 2.26.2
> >>
> >>
