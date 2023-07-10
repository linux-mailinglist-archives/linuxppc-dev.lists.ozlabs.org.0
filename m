Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCBF74C9E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:36:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WRw0UaQi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qzp6q2sCbz3c1q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 12:36:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WRw0UaQi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=azeemshaikh38@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qzp5x1RwFz30N3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 12:36:03 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-57045429f76so48256787b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jul 2023 19:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688956557; x=1691548557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mF3L96LoTnWx2MEvXwnNhJXYkCF7/EN50oM+cK6gkY=;
        b=WRw0UaQiekWxZPXDwkitHOIuxH2s6UHIsbZEgRkEdA6rCSYl96U7eWiGWscQ6qsUTC
         gJV2rzrpDX6nxHsonY90dPDsKVFY+CGn81JqgnP1xB2JvjH98+rQhh/3KhaeMD4UnUc/
         6XsxiSp+iq410adY0PfarKUskq7/45cLJ2Ffz9OG1f0QyMsMOJlndzVlkXdBlGQyEGA8
         bCRwlJKBCClIni+Npc60hI+yK4L9n3KePYeOXwOogMKevsQpC5o83OTL59p5vU8Cg6Rc
         EbBAxkKQ/VshaA8wHUl9D0GGLqRZ4Yg6bUjtLiBUcD/kGytJmiN8v6FF1lCV4ru4vqH1
         JlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688956557; x=1691548557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mF3L96LoTnWx2MEvXwnNhJXYkCF7/EN50oM+cK6gkY=;
        b=f2QZm2aufFULZbUQmXdQli2OL/zZBeVoCLJgE9GmTrYMQ8NdtqZlDImzpmp3PiwFP9
         TIHW2gA9M/2ouQNJ5BT5usDUyLi3VCExMH/nkgpXm+pwIbf1ue1lkFHdODkGysYl1w68
         b2peFBLXKgaPUyJTHd3x0j4sPi+sE6KBl/bPi7wqHy/bBVe3THUT9KKQMcKRsu6j1XOZ
         anWu+qvK+D8eF77xOkrT0PjfExpYxkuQ0JRsD9/6A2aFa0z0ds09+DKdWw9Ynh/aGxA0
         NfHkNewwdR47kMAqu7XZCEDLpkBV1DaElFRUlpw6CBC0Hiah5vKXe+8g8gaPgkSXLsX4
         AN0g==
X-Gm-Message-State: ABy/qLZrZFo426NNr7tyC38Ru0dzQoiNl4ctkz0VEaSDnxpkY9NIo3G2
	2Dma6vWD2uerb+uHPX5OS+M6QdZWApQQYoF2cc8=
X-Google-Smtp-Source: APBJJlEePzrOeSKu/dCCO6swAe8NIexDP/nO5MptZzFfpfK5UueWI0VFmUhtLkKez2jxesbv31XOrlbcqTt17g/+qZk=
X-Received: by 2002:a81:a001:0:b0:577:f47:3d92 with SMTP id
 x1-20020a81a001000000b005770f473d92mr10556370ywg.23.1688956557447; Sun, 09
 Jul 2023 19:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230523021425.2406309-1-azeemshaikh38@gmail.com> <202305231020.37C95FD@keescook>
In-Reply-To: <202305231020.37C95FD@keescook>
From: Azeem Shaikh <azeemshaikh38@gmail.com>
Date: Sun, 9 Jul 2023 22:35:46 -0400
Message-ID: <CADmuW3UAHODqC5YAmjK1sOuo3C56noOa6hsHA+2Es2R9MT36_g@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace all non-returning strlcpy with strscpy
To: Kees Cook <keescook@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 23, 2023 at 1:20=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Tue, May 23, 2023 at 02:14:25AM +0000, Azeem Shaikh wrote:
> > strlcpy() reads the entire source buffer first.
> > This read may exceed the destination size limit.
> > This is both inefficient and can lead to linear read
> > overflows if a source string is not NUL-terminated [1].
> > In an effort to remove strlcpy() completely [2], replace
> > strlcpy() here with strscpy().
> > No return values were used, so direct replacement is safe.
> >
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strl=
cpy
> > [2] https://github.com/KSPP/linux/issues/89
> >
> > Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>

Friendly ping on this.
