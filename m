Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EECAC82D1E5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jan 2024 19:50:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JGpyo2xo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TCkqq5wTnz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 05:50:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JGpyo2xo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TCkpw6lypz2ytl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 05:49:59 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2cd1232a2c7so97157531fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jan 2024 10:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705258192; x=1705862992; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhMTxPmt0/flYm2bklU2LyKEn+DRcXTdo6lmYP/96pY=;
        b=JGpyo2xoAnltCFuO0LRarCxY+HHBIpZvrWUiMzBLRFnVEpsxR/NUyDUdDDBpzSPnFR
         PZibmWskj8KUxojrDOU6DT1CsS2CICok2Y+B28oNZnGo2wodx/fED8P4N+9KPxJqAtNj
         3NP+QH6kTGIcHodpOivbdISs/HIswQzcS0xZdhsTTjzfRAOxjMRTlei4GVW3MfGdBplQ
         Lrj8DNhIHHwxXmypeQigvCBBmMorJ2HtPZQuaMuvXED/Jw2xPHB7pyfN07qQ9Dh22KMI
         781NxK2gkbz8rUCd9YxAbgQoBbeSClEJ7RfAcFZsqWPSoie4VDgn4M1/eOSH0VGReIVU
         JatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705258192; x=1705862992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhMTxPmt0/flYm2bklU2LyKEn+DRcXTdo6lmYP/96pY=;
        b=oxMq41TNj1wBNW87MjIgJG/QeXdMrf9SxoAITgh179gDsEh6cwrgSd6B5wK2zNuXfw
         zM25iLJhsNIpL7pp6U3v5BARRmZ40Xxab09RIjvQHOCkYhGcJtabIcyXSgtqmpuSucq7
         WQX5wvGziEKzRETZIIq+BHJMLzIyEx+FgfxEQa6Xtcn1EYbJ61dN6IQ6K1hP4WOTutZF
         AGbFVBFCSCZr5E1752+LMfDXWW5lyzzcALJqa1N0NJqrV8NEF2NbeIHm3j9lsliiANPT
         tLfCSfZ15lkphxGDTYEz/dkitYulBVpQbnRx0NS0ZOxo54tSH1zKBbRXAz4U1QqpzOP3
         zvlg==
X-Gm-Message-State: AOJu0YwPSu0GVZyMg3TA4QGQD5q5dLJZHWVCTsgQaQhjKdfR4OxDyDWW
	8V7xIbs6QzbYPIqT0UE7j/ISqeNJt0LmPFXGE6CPB+tIAm8x
X-Google-Smtp-Source: AGHT+IE/ZJhQ+UJe7SuwAe0k40YNaGinhlOrjQPNpsEA5fIP8FVoDZruH+nhmxgiR0kdZREz4OcNJrLV9g6Q4YXwnlg=
X-Received: by 2002:a05:6512:1186:b0:50e:cc3e:2f30 with SMTP id
 g6-20020a056512118600b0050ecc3e2f30mr1496009lfr.109.1705258192392; Sun, 14
 Jan 2024 10:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com> <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
In-Reply-To: <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Sun, 14 Jan 2024 10:49:15 -0800
Message-ID: <CAJD7tkaW9TuMjrVn1OivyKE-E0-WVs7u_iAkAQVXxOnnzaJF1A@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Nhat Pham <nphamcs@gmail.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 12, 2024 at 4:38=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Fri, Jan 12, 2024 at 3:37=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> =
wrote:
> > >
> > > On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@goog=
le.com> wrote:
> > > >
> > > > The z3fold compressed pages allocator is not widely used, most user=
s use
> > > > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > > > dependency on MMU, and zbud is a more common option for !MMU as it =
was
> > > > the default zswap allocator for a long time.
> > >
> > > Johannes and I were chatting about this the other day. We might be
> > > able to disable certain zsmalloc behavior in the case of !MMU, making
> > > it available there too. Once that's happened, we can outright remove
> > > z3fold and zbud, and have one allocator to rule them all? :)
> >
> > (Adding Sergey and Minchan for visibility)
> >
> > I didn't want to bring up the zsmalloc MMU dependency in this thread
> > to reduce noise, but that's also what I had in mind. Sergey and I were
> > also chatting about this the other day :)
> >
> > I thought deprecating z3fold is the low hanging fruit. Then, once we
> > can sort out the MMU dependency in zsmalloc, we can go after zbud as
> > well.
>
> Makes sense to me. Should we do the same thing to zbud? We probably
> have even less of a case for it, no?

Do you mean declare it as deprecated now? I initially thought that
would only be appropriate to do after zsmalloc has no dependency on
MMU, so that we can confidently say zbud has no practical use case.
