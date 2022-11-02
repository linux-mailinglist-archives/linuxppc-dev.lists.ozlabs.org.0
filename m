Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD4616523
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 15:29:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Tmv4g7Yz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 01:29:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YeDR6B6k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=glider@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YeDR6B6k;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2TlX3j62z3cH5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 01:28:39 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id o30so1099703wms.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9Q0JUaa9L0FDTRBbRHtk7pORF5FI4qgSR7kELJhqR0=;
        b=YeDR6B6k0057Cx5aXSoaJU/L1oqbxiIWfIcytTEuQKn8ua9kXxpp/FBg8c7GMpufTd
         7GALet6uXxPZ7paxcBnR+iC6vKKCugT4P2jfcLM19gmosJHckL/BSvjORqaJlS1swxJw
         At0smbGcTxf0q6b64htT/WPu0/IcglEsTqXEaM9nHkaskjy6WqbBd5G6wAHVM6cVmxUt
         hPgjRCyhzqcQm6jC9EyVofwjWgK7ZrG9je7krios4rICKAYjT5+7XEYOxbanY+Ae8d2T
         TikB5IvjXbNL/1KsddzudxD5sOHytl2Ub7SfQEiIJ8AX1bicM2pZhC0MlnhxQc9bP+8w
         pzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9Q0JUaa9L0FDTRBbRHtk7pORF5FI4qgSR7kELJhqR0=;
        b=sDwF/QbnY5m4Nbxh9zt/rZCDqBOYGw4vnQtScK+SIWQ9r4f+RJYW1meTJJzmTNRakW
         wlhuMdt00hZrVmx/rmzmzl1kOD5vniFI2JepYw3Pfv7tFpenhRbtUthFTo/8CFwynrSn
         7eMicQsiAj2v2+cG+busrsdHdzCxTNzbfaGK3mFrMnBldy8UKudEm3ewQld0Y82PAXNC
         xkdRc7/bBzQjYxuWg4nm6URO2UTT7doc3wdjh2GEjAgazLcMGhr3e00o3y8KtZLhKf+e
         vyrXAU94cdyoetlxtebtcz4Kc6CVLxCi03oDaCPS0oLR1zH9wgPkWknKfd/7vmDj0OoA
         2Srg==
X-Gm-Message-State: ACrzQf3N2zIZ5Ki4IIIXRqA5CO2lgZV9IvrubL7Y3/24HcVr2WjZT6zm
	E8Ggd8hQN/y7uzbk+8wf91XcwyuQIH0GA6xh4IO5sw==
X-Google-Smtp-Source: AMsMyM7zcxHhdaic2LXhNvhEh6OciGXa23nTNLJfIg+yjYW2Qm+0NWtRXRM86sNfUrfXj+EcENc2mD58LJ9imUYppLE=
X-Received: by 2002:a05:600c:1609:b0:3cf:4dc4:5a99 with SMTP id
 m9-20020a05600c160900b003cf4dc45a99mr16005402wmn.67.1667399307208; Wed, 02
 Nov 2022 07:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221019170835.155381-1-tony.luck@intel.com> <20221021200120.175753-1-tony.luck@intel.com>
 <20221021200120.175753-2-tony.luck@intel.com> <a60484bf-2107-8bc4-acdc-5f582f9637af@huawei.com>
 <SJ1PR11MB6083F63D86CDF7810F5ACDA3FC329@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083F63D86CDF7810F5ACDA3FC329@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 2 Nov 2022 15:27:50 +0100
Message-ID: <CAG_fn=WG2-k74zKv2_-jAqU+WDraJDnFZ_hM58FPgswnXs=BrA@mail.gmail.com>
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

On Fri, Oct 28, 2022 at 6:14 PM Luck, Tony <tony.luck@intel.com> wrote:
>
> >> +    vfrom =3D kmap_local_page(from);
> >> +    vto =3D kmap_local_page(to);
> >> +    ret =3D copy_mc_to_kernel(vto, vfrom, PAGE_SIZE);
> >
> > In copy_user_highpage(), kmsan_unpoison_memory(page_address(to), PAGE_S=
IZE) is done after the copy when
> > __HAVE_ARCH_COPY_USER_HIGHPAGE isn't defined. Do we need to do somethin=
g similar here? But I'm not familiar
> > with kmsan, so I can easy be wrong.
>
> It looks like that kmsan_unpoison_memory() call was added recently, after=
 I copied
> copy_user_highpage() to create copy_mc_user_highpage(). I'm not familiar =
with
> kmsan either. Adding Alexander to this thread since they added that code.
>

Given that copy_mc_user_highpage() replaces one of the calls to
copy_user_highpage(), it sure makes sense to call
kmsan_unpoison_memory() here.

KMSAN tracks the status (initialized/uninitialized) of the kernel
memory. Newly allocated memory is marked uninitialized, copying memory
preserves its status, and writing constants to that memory makes it
initialized.
Userspace memory does not have its status tracked by KMSAN, so when
values are copied from the userspace, KMSAN does nothing with their
status.
That's why every (successful) copy_from_user event should be followed
by kmsan_unpoison_memory(), which marks the corresponding kernel
buffer initialized - otherwise the status of that buffer may get
stale.

> > Anyway, this patch looks good to me. Thanks.
> >
> > Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
>
> Thanks for the review.
>
> -Tony



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
