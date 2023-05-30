Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7127160A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 14:56:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVsp85GKPz3f6R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 22:56:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JtxDIm0l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JtxDIm0l;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVsnH0fTxz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 22:55:13 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-55db055b412so76330757b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 05:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685451309; x=1688043309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EExUiqYGPAGs+gsix048NKVSDGe99d7YwmeqIwl9rU=;
        b=JtxDIm0lWrfYqXp1uWdsfFKWSgbbZ22HNue1yFm4trGTkGFo6xIWrEoI8KhdELLQIq
         DmECGu2waVpow6RkIqk3AX5YTN81bUQ38ACduEbGqRhLkcS4+aytN0jtUfSloYRWKQ+q
         vJ0J2K3/U3iSTAnBLpcaJBTIDJ4PsFSVRybdG1dxrRnsgqT6D7gFv8MPH9l+nYqEATRm
         /oGzvXMzw4aKlZlJX/qsd02+8TlbqEw/84uUqvj61DTDFGSAJGYrjrf8E1nbueJLbm4u
         AlOHw1376rAI3yUYgvk4ZhWGkPLuPeKI/Fb1pBA5e3XSOjJHmY7DC3vI1uRZ8RBpw1hF
         J/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451309; x=1688043309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EExUiqYGPAGs+gsix048NKVSDGe99d7YwmeqIwl9rU=;
        b=TjucI+nM0Mv+oUfQjXQuwhfSiFsTAuxzAvNz8EOrCZyiFQNRO0v/TAQaSARK8Ifjpr
         rwP58EKGQQUr7qY1vYLJXw4z/1+rks9MJ+nj7aJs9sneJx+fg/L+71vfsflRNyHQA8YM
         Xj+Pf1fxSaLuuK3hwl1V3ZpleO4T41H574RASY4LchrNyKjXafFY763aF8985nJ9MxtP
         gTRxOocQKAsSOxLpNwdlenqTaCRe/g8p7hMHCu1hwmcOOvMBNc86udyjFleqR5URvHbi
         tYFSRI/vLiho20+TyG0G8iMCf8tgz1IpJDt43pA5DHW/Lcox/sdGufmNPA9tz+enLZhb
         ui9g==
X-Gm-Message-State: AC+VfDylNOnXpKYup4+mXzoDxs8gxV08DG+ZFzL9anfaPSM5z90RCJ2Z
	ga9LGETEO8OKYf6wt3bO37Q8inRRSurTi+BUoG0=
X-Google-Smtp-Source: ACHHUZ5KwWXhi07Kjh30oJSe+TRGajfeEVAA8IVgPaXfIBGRdDs8/GBEy83t2qFovXm8Rq72lkhdxxhAmnVRxlXnyNw=
X-Received: by 2002:a81:4fc2:0:b0:560:d022:53ac with SMTP id
 d185-20020a814fc2000000b00560d02253acmr12444958ywb.5.1685451309402; Tue, 30
 May 2023 05:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230529111404epcas5p2d540d726dcf3e21aae2a6a0958e2eea5@epcas5p2.samsung.com>
 <20230529111337.352990-1-maninder1.s@samsung.com> <20230529111337.352990-2-maninder1.s@samsung.com>
In-Reply-To: <20230529111337.352990-2-maninder1.s@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 May 2023 14:54:57 +0200
Message-ID: <CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/xmon: use KSYM_NAME_LEN in array size
To: Maninder Singh <maninder1.s@samsung.com>
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
Cc: nathanl@linux.ibm.com, bcain@quicinc.com, keescook@chromium.org, gary@garyguo.net, pmladek@suse.com, ustavoars@kernel.org, linux-kernel@vger.kernel.org, Onkarnath <onkarnath.1@samsung.com>, wedsonaf@google.com, npiggin@gmail.com, alex.gaynor@gmail.com, linux-hexagon@vger.kernel.org, ojeda@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 29, 2023 at 1:14=E2=80=AFPM Maninder Singh <maninder1.s@samsung=
.com> wrote:
>
> +static char tmpstr[KSYM_NAME_LEN];

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Side-note: in `get_function_bounds()`, I see `kallsyms_lookup()` being
used, but the name seems discarded? Can
`kallsyms_lookup_size_offset()` be used instead, thus avoiding the
usage of the buffer there to begin with?

Side-note 2: in `scanhex()`, I see a loop `i<63` using `tmpstr` which
then is used to do a `kallsyms_lookup_name()`, so I guess symbols
larger than 64 couldn't be found. I have no idea about what are the
external constraints here, but perhaps it is possible to increase the
`line` buffer etc. to then allow for bigger symbols to be found.

Cheers,
Miguel
