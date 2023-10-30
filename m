Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28467DB912
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 12:37:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SHBTl5e9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJrpP1BqDz3cHR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 22:37:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SHBTl5e9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJrnY5Kszz30Nr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 22:36:15 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso180299266b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698665770; x=1699270570; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csnOKH0S/yzTOhLnRQCy767OQRSbbASGrw4KMOOKM64=;
        b=SHBTl5e9Tbp4Sxj4g8W/1MlUC7ws4cxSeexaGFvDL43FA3l6SKiTr/M+/4xXjByIip
         gZKKlWIAQweX5GT+cZtdvf4KQG08wmnw+AMK2G07+dbDfMmrAkMx1Rd5BIBiGEajqb6b
         iNKDKDoqKMH3u9eXUMdopRbhYiTssfXli4ZnAqjAnzYsZlIdocY91MovNC2JcQqY2Wuw
         ERQWNaedWolyV/N+0RNiyLeorrq6R2yUrW6kVa1vmHd7ZiMI2hgbt+T8D2JibThVX0L2
         PJ0VVVSJX0A6JprolVay4ZY2RTDLzkKI0co72SJSSl76IZWbnMlKAPTYd8df7x7BdUST
         ppUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698665770; x=1699270570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csnOKH0S/yzTOhLnRQCy767OQRSbbASGrw4KMOOKM64=;
        b=ELcPGLnFRSZMFoSw3l2MXClR0awww+rshxXGFIOoE/8RucwyVH20fGYiHNWm9pkaaf
         dx5EqA/Y/eb9ZlSV9ukv2tIFWGRj+3HzBigCOyflsJT7xhcJUNHrgIXVoOKou7hFw4C4
         M/CYhXRa3sXlUjWZJzJTuC2RIpc+cuBKioSYZLfZ55iQ0GPII2Ly8OlQf3OZwLzHTlyQ
         vOuAlzsGAifxaXTYEYYJgO1b97SDH+teRqFwOSWDp/79vWROqcAq8UXKg2GuP9esaT+x
         uIM9DV1mVGbSET9PhgGpvmBqzGOYj7qI+8R/KJLb0FB3q3zaGaBFCOI8JePgNQ7fxDnH
         yVQw==
X-Gm-Message-State: AOJu0Yx1ifcAWSSFsU2JRny6socLbxuod9aVvU7V9FXDG9OuVawcYyoL
	2zsncBaCOXSbigI9Zi0AdGFq31OROzeWsM5YRqs=
X-Google-Smtp-Source: AGHT+IHL/kCqmaB88Pd1lPonhz6Vn742Gqxb3ymqWLk7yKiz6eLcTFUoPUHkQCusca9qSLjjOQRPJZIMXFrM3pWF4XY=
X-Received: by 2002:a17:907:608a:b0:9ae:74d1:4b45 with SMTP id
 ht10-20020a170907608a00b009ae74d14b45mr8197615ejc.65.1698665769789; Mon, 30
 Oct 2023 04:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <1698402948-10618-1-git-send-email-shengjiu.wang@nxp.com>
 <c1cfa3e0-6e5d-4e1d-b6e0-4d1045196a11@xs4all.nl> <CAA+D8AOCujL-eD2-chqHAW7UN7UmLrO6CWRd7d6wTCPP8=VyfA@mail.gmail.com>
In-Reply-To: <CAA+D8AOCujL-eD2-chqHAW7UN7UmLrO6CWRd7d6wTCPP8=VyfA@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 30 Oct 2023 13:35:56 +0200
Message-ID: <CAEnQRZAGOTm=5j_9CStnKuZVPBK_Oxr50L8XLaFd7Czr7SLnWQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 00/13] Add audio support in v4l2 framework
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023 at 3:56=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Oct 27, 2023 at 7:18=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl>=
 wrote:
> >
> > Hi Shengjiu,
> >
> > Is there a reason why this series is still marked RFC?
> >
> > Just wondering about that.
>
> In the very beginning I started this series with RFC, So
> I still use RFC now...

I think we are way past the RFC stage so if there will be another
version, it is better to remove the RFC tag.

RFC means that this patch series is not ready to be merged but is
merely in the incipient stages of development.

thanks,
Daniel.
