Return-Path: <linuxppc-dev+bounces-7682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B2A8B21D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 09:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zct1L689gz3bp0;
	Wed, 16 Apr 2025 17:28:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744788518;
	cv=none; b=TYtuteUV0U/ObLb5d0+cAWHVA0uOS8xIAD31aYEcZvXGupxj0GyfA5HB9kGHIstIvhlnZRnyxH/jCgI3tbXOghCcGlijFvk4M40gOQ9eZDCYa8WoTirTBvB7dlG6k6JSJMNhgnhUEZeB4vVkoDi8gW3U+0xcOxAujbtb6Ym5mAxOGtKINVo9er3ZvubLUjBoBi082ivdnX47+MJMx67mDvECcDMZxsI9CPNlQOLcoywZShG1xzKEyyJmHpK1k4GK2UeQJJpA03ekSQ9AizR/xkZUBiucACynG45IK/6Sx3Cmm4Sxpo1w5+IhG0+Gz0qanq/PgZqm9f+JpaamYSJMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744788518; c=relaxed/relaxed;
	bh=qvlLa3VA9efC7avAUZkCgRlCB4WN+H9bYNViBn32pLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSwK5ukBXZgOMz3pFghncLSvoBHAKieHxLfV/Koq3dPPL7Y8dEvlx7vYKl6SaDwyoOArQmcMUvr7HbiXxcI2+q1ILuhQo4Q0GJF6vj5we4KgNYrLRC5taXFxO/5dSDSJyQn5F5D773rgP1l8D+1ydtf15GfpUhpu1O9MBD+Pft8Sci3vjfG0VTwvrGxTokvX0xy17fZj5TzkARXlWneovYKrT72GW8vIdUsT4Uxc2+UJ0XufZ5610NnwpKmNDrMdraw9YKB/vmPTc4KTEdfbwlQNrdS2LmjXG7bPcT6+Q6obuGpIxSTV9cfN4fY+Nz4pG5MmaAnlPL6BqZ3+pig6QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wd/nlYwe; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wd/nlYwe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zct1K4RH3z2ym3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 17:28:36 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso6515098a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744788514; x=1745393314; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvlLa3VA9efC7avAUZkCgRlCB4WN+H9bYNViBn32pLg=;
        b=Wd/nlYwe/VdxEx52pQ5lJ7BS/SHpLHJmmdX1g12Sj8FPpYl1M22J2XcNAGolYHffeM
         rHP/eSIVh2/ygb5djDNmi/CF/YUCtPz6cSalpMBT/bz8J97BmciJPPYUQg058dMe0yOV
         GXtYfvOxYWxrMppXUwl7hcXTJv9Nvo4asiM+5nJRf/BxVVRwV0fmL/te3gMjxAYQ3quI
         odtulC6yGgbk+PRGBsF5ZBMoMlqibkxZheDVsUN2kUVZKjKIMB7KGOYrCXxMJaxrWoLw
         4WCQzvhCRsNDEKPlza2fwGPcVh10f5KwM+UhriVjv39X2X7pstkRUl5LMmIqKdTTw6YB
         3oNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788514; x=1745393314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvlLa3VA9efC7avAUZkCgRlCB4WN+H9bYNViBn32pLg=;
        b=e7+YPhDVhY12y78Hm24B+oYEBbORVl90pxva7QKHfV1en6Zsbbt+0IRIDyaqLQPx+h
         cmBdZxWp9g6UdrN0VCeeJJtOo6891ITHImmgQ+NggE7pvFXJttlWj5iE5M+3CZpaVeo6
         pBZq4r/kbPmHquP4eTqydZGbZ0sx6Gagj/fuav/6KkCnZma47J8P9OjZXPgMqylZ/0/B
         yUcg17vUK+fnT8hq0aFnIMlhWNra8nkRbLi8u1XUe/w3/vp8nrKPKecEAQ82GcxLb3KZ
         mLwNMnAgCjf8RI5dNzyCrt9j5YxRNtrh2XYeHMQ7a4emzKNzEAmw7sTBVVakqZFMY94B
         y3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAWAhj0WQWl9oiC8C5bkDvXFAKb7kEKpT/7zaFM0foN9tDDZfjAHS17wYSVOLJ3WXp2U//WLhr2pnqGl8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhRQupkdXuKfpZSq4TOO2L9I2fHQS60S2kgLhoaeZ2IL56P2BW
	Ema7yIPVJhH+HK4qoAoG9xcEIZUKDtFfhjK0mtNkhJHj/yPOi2GOn8dQYAt2Z1aKyg0jX+w1dUs
	G8xzCDoReABsjc12ipFxJjafFuxM=
X-Gm-Gg: ASbGncsE+Hctg1BCGVhZVXqXAYwEEc9V1msbK/bLnJ7ZPQ+uDjvBpJqtpBcxbQIoYwN
	CfMe18K2Ji4oGOx/Tf4buNhBpYcTAHhrfzKTQVE1CUMRbsrR5aYic0kJ+9ldhwuUwBQwEytxGz/
	Bt7XEMM7sQU1/AKjJ5pQ==
X-Google-Smtp-Source: AGHT+IGW5zcCmv3b7BVm4A40QK0n9oi/g9NFeFg+vQtedK+zMuIzEBKZNFZcJGBHY+4JsYxPwA1hTYFwiZZ7HXKb0a8=
X-Received: by 2002:a17:90b:574c:b0:2ee:edae:75e with SMTP id
 98e67ed59e1d1-30863f1c831mr1185370a91.13.1744788514329; Wed, 16 Apr 2025
 00:28:34 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250416041431.546370-1-nichen@iscas.ac.cn>
In-Reply-To: <20250416041431.546370-1-nichen@iscas.ac.cn>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 16 Apr 2025 10:30:19 +0300
X-Gm-Features: ATxdqUEL8u77ss7dHQffyWPdVCGHmFsnGmhGr0uT_PfqkPxcRAmmZB4Ahi-EWlY
Message-ID: <CAEnQRZBb=E75DPn=siqvhAqFas6Lt-++0Ka9W6gY0fbQgHBcrg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Remove useless return variable
To: Chen Ni <nichen@iscas.ac.cn>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 7:15=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> Remove unnecessary return variable and compress the return logic.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

