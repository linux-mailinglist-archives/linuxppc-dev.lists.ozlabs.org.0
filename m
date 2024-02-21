Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA385CF54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 05:33:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WbwVoObb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfk1W4hz4z3d36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 15:33:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WbwVoObb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=tfiga@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfk0p5qcbz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 15:33:14 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-563c2b2bddbso8821728a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 20:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708489989; x=1709094789; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmY04dbj/vIU0t6pHPXsLFor7e8BbOlWKLitvKLNgfs=;
        b=WbwVoObbOGATWucHrM+ls3p5SLJ9O4XRCI/CfzKm/DftMpRFmx8tQK5X4on8l1UFDw
         IGIHcpb28Nh+LDA3u29xafKpFgCeqvQz9EiPKSeRyYBnau/HIV01Zfws6jRZNj94RILu
         LCCZG3roDfF3nSAT4RK3dORSuGPtGjDflXJ7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708489989; x=1709094789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmY04dbj/vIU0t6pHPXsLFor7e8BbOlWKLitvKLNgfs=;
        b=F/hGvBBUPAb5vFbFyxrOQ3n3JFarOdkqKoZtPo5LDkjRYK7claoGTtgKKgyUTNhG8y
         F0AvwMQUeNH26ZJPEBMMe4HN33u2B5XUbG3/QUVM3izvy70DOKSFg6iTj0/ugiUmu499
         LrCeH/0P6Ut/jZnBU6eM2F2A3MOplYst+gBuJc/VJUfQ18MpsrVxwePXsiGGpmMq5qLi
         8QIa7lnLH7xr4W06jNvg47oAck4rXHRxTookUfhRHYAGKy8rb/6z3gOaMpPWZh+/oebZ
         Nvjy0uMmt/phD3WAF+/zg39YdUqxapGtKmIyDYynAnauy67DVPCLw9rPFZnmvoZ8gxz5
         Vc8g==
X-Forwarded-Encrypted: i=1; AJvYcCXwAoQDrWnnrD4W9kbZ9hPnoG92e6+F22tQeBAUCbqt+U8fu9EIl0OZ4tcMWrncxf1pHMqX+DiRibrqs+XRxZeZZ9kItBkdDHKni2K25A==
X-Gm-Message-State: AOJu0Yz93o9lIrHBv7MURt7DKcjft4dqkIQes1lXjv04ftpp+IIMTxXA
	fd251FLbqkldaWuNzUCJUm9/3G+31gKAoExrVV8wt6PpJ30WelA0DKXCKpJSBCuuYbGgCm+t7fj
	SCg==
X-Google-Smtp-Source: AGHT+IH/mI9+Tgs1gtEE6HTa1MGHSvq0XFZkTKOUotqaavOFmXUFiB+KpCVQsA68pPln3DDEBDFc4w==
X-Received: by 2002:a17:906:4088:b0:a3e:69c6:fda1 with SMTP id u8-20020a170906408800b00a3e69c6fda1mr6594538ejj.46.1708489989385;
        Tue, 20 Feb 2024 20:33:09 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id tj9-20020a170907c24900b00a3ca56e9bcfsm4577884ejc.187.2024.02.20.20.33.08
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 20:33:08 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41271096976so8200615e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 20:33:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5t/NLq0xqvYi30SPieMigPIz4g7MvL/glT06rmwZ9YKTBQQlg89TEUlJLPr4e0QrcjRS+UNuUZM4wT7/fBGfLlJmPuP4JN5pht8LXaQ==
X-Received: by 2002:a5d:47a4:0:b0:33d:6ede:1149 with SMTP id
 4-20020a5d47a4000000b0033d6ede1149mr2829350wrb.35.1708489988167; Tue, 20 Feb
 2024 20:33:08 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com> <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 21 Feb 2024 13:32:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ddip8n90Ma+d_kqgARoMRvpmk5Yyo+D_Csop6Ws8bHqw@mail.gmail.com>
Message-ID: <CAAFQd5Ddip8n90Ma+d_kqgARoMRvpmk5Yyo+D_Csop6Ws8bHqw@mail.gmail.com>
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output support
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, hverkuil@xs4all.nl, broonie@kernel.org, sakari.ailus@iki.fi, m.szyprowski@samsung.com, mchehab@kernel.org, shengjiu.wang@gmail.com, perex@perex.cz, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 18, 2024 at 10:15=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> Audio signal processing has the requirement for memory to
> memory similar as Video.
>
> This patch is to add this support in v4l2 framework, defined
> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> for audio case usage.
>
> The created audio device is named "/dev/v4l-audioX".
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/buffer.rst        |  6 ++
>  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++++
>  .../userspace-api/media/v4l/devices.rst       |  1 +
>  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
>  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
>  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
>  include/media/v4l2-dev.h                      |  2 +
>  include/media/v4l2-ioctl.h                    | 34 +++++++++
>  include/uapi/linux/videodev2.h                | 17 +++++
>  13 files changed, 222 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2m=
em.rst

For drivers/media/common/videobuf2:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
