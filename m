Return-Path: <linuxppc-dev+bounces-2198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62E99C541
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 11:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRs96710Dz2yMF;
	Mon, 14 Oct 2024 20:18:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728897514;
	cv=none; b=JU03cOvrOE8QLMKB7XtXqt+4aETavh9DsctbSkTHjBjmISL0iM1AIeP+kALHxx21SUR2RkG6OQhUghOxc4MfjyGzqHTskmlG5FL9wWvt1SNGvS5BrPJ1qmxUTZc5FyPJemntlzKvGkWetR6oj3XvgTNNr2nV9PMRzlMjAqZPaGibufo1+eb/IbZeYLIheFWHZlwjqmDqfc0tYn43620ohafSTnin2sfrVdRzb0yTQPZlVpufWA57aAA8vk+cYbRkAHSptDCJuhO2JT1FKkiutdnCZzXe3z6LFR9J04sV0mJ+5RiJhCw+9SWYwQiYfQ0vsB8mL8f/T1ayJBBkySQ15A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728897514; c=relaxed/relaxed;
	bh=XM7Hx7BDiEIgSKXCd36v4PFuRuWUiWCSpOVzrnoLBC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FqlmuURaoU7k1CbVtkMbVN0t/EhcvgsxD9ixq9Jtsrme5e4XFnhI4wuWzaTI9HhhO1hZoPzcThyQ8FYuSWXki7mq+hW70hxvTYd7O9+k/+2b5aMFI2DLFVbDlXa30NLSTUUf0Is92YtXABq7AlDtgmoh+T8zi4mJQoyq8xe7hTOnE3uqlpeT4ezyqIZ5OFinv7UcsevcZ7Mru57RTYBIueScDhqbTXvbiJakdB/w5Fh3g4lXACt1ve9iZnPLQ4BDcS0q/dh8zBuAASL9Kyu+jDEi8R4ztuIzJ5SpCFWw01XrSZ4OtlYEKgifCazi8r6chXl62MEtFIezKYHbc4DgkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.173; helo=mail-yb1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.173; helo=mail-yb1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRs954FBfz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 20:18:32 +1100 (AEDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso2531393276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 02:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728897508; x=1729502308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM7Hx7BDiEIgSKXCd36v4PFuRuWUiWCSpOVzrnoLBC0=;
        b=oLHCsyg33GTJNiY7AVQOc2+C+27j00qJRDxmut+9dP67QvlwYGZdFGLMvAcTfqjesl
         0bCPdRgfWg2OXd2DHqiy8pgBk6Zy74oVT35QtkZg5hDRTtw+XXQmb7bAwz2Vc2H3Y+VO
         GwlDb6vSHU91fCUyJB5FRWjUcmTVlbYaJJMnF/IPJmlNZXDjV6+fkIj/7ukFcMTkFRj+
         55AEup3AwwIB45KtxnOwETKosBSCn0BVwQ69RJoD42t/mjTXkAB5xeC06/zdr1wlzqJb
         wwr+UuoZuCtac7bUbf1RFkhopmy+aSoyg9ARoFyZC2X3lmNg4sHe5R7xy8sQeygx/Bre
         vJQw==
X-Forwarded-Encrypted: i=1; AJvYcCVNRbHnNVTn8XFEL7H2QMkWaW7l5bMMPbCG9ru1X7HjUXlDfSeV3+SUWkPzeCUmgl9gALKFhvS+LX2Atl0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxSuCIg2BcvIQaFxl3mlCyeVGBRk1/gDgRGKhqjtK8rqwrbYorC
	1q3H0Kb9+pZcp/SE2sKOqdXS5KNEOzQKRgr4M8ECwrW2M1SBcDxPzKpnmK+J
X-Google-Smtp-Source: AGHT+IEuV8d1BsD+9S+pbr+qawTskP1YTThph95d67qGy7tqmIralMEWwCZhGnd5GrEP5/1N8uaiJg==
X-Received: by 2002:a05:6902:2b92:b0:e25:fc6f:9cbf with SMTP id 3f1490d57ef6-e2919ffb24amr8259884276.52.1728897507662;
        Mon, 14 Oct 2024 02:18:27 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ee007d9sm2221880276.23.2024.10.14.02.18.27
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 02:18:27 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e390d9ad1dso6275257b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 02:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJcwgTjud+nMZL8VGxq0W0OuBg9LFaji1bG6HKqBtJqKZezlBriEkK7+mcV4VRmPVpoMmW/SOq+DFN3vA=@lists.ozlabs.org
X-Received: by 2002:a05:690c:38b:b0:6e2:b263:104a with SMTP id
 00721157ae682-6e3479ca932mr84287817b3.23.1728897507018; Mon, 14 Oct 2024
 02:18:27 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <CAHk-=wg061j_0+a0wen8E-wxSzKx_TGCkKw-r1tvsp5fLeT0pA@mail.gmail.com>
 <20241014072731.3807160-1-geert@linux-m68k.org> <711d7f6d-b785-7560-f4dc-c6aad2cce99@linux-m68k.org>
 <20241014085819.GO77519@kernel.org>
In-Reply-To: <20241014085819.GO77519@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Oct 2024 11:18:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWedOgc4S12FwQR8_80aqgRJ2pwrKWsNb5Svt6776ti3Q@mail.gmail.com>
Message-ID: <CAMuHMdWedOgc4S12FwQR8_80aqgRJ2pwrKWsNb5Svt6776ti3Q@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.12-rc3
To: Simon Horman <horms@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Simon,

On Mon, Oct 14, 2024 at 10:58=E2=80=AFAM Simon Horman <horms@kernel.org> wr=
ote:
> On Mon, Oct 14, 2024 at 10:38:20AM +0200, Geert Uytterhoeven wrote:
> >   + /kisskb/src/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c: e=
rror: format '%x' expects argument of type 'unsigned int', but argument 4 h=
as type 'resource_size_t {aka long long unsigned int}' [-Werror=3Dformat=3D=
]:  =3D> 126:37
> >   + /kisskb/src/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c: e=
rror: format '%x' expects argument of type 'unsigned int', but argument 4 h=
as type 'resource_size_t' {aka 'long long unsigned int'} [-Werror=3Dformat=
=3D]:  =3D> 126:46
>
> I wonder what the correct string format is in these cases?
> I didn't have a good idea the last time I looked.

"%pa" + taking the address of the resource_size_t object.

https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/core-api/prin=
tk-formats.rst#L229

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

