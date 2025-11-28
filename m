Return-Path: <linuxppc-dev+bounces-14535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F046C910F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 08:42:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHldS5lLxz2yvW;
	Fri, 28 Nov 2025 18:42:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764315772;
	cv=none; b=S+tqWidDfzs4ToAHYnTIDP+UHR8xxyd4GgF2C/LUiGAFZB15sMusJKsUXE6g2SyMN44noxdhLc4d13oq2gUaDJF4pyNic/eR7QxNuYkRk6tw8y3r5MoU9rTV3wWETQtOY2GzsgcdKrmSmmrwkgg0PSf9rT2yx/e2dhXOYgB3WJkW0qN4l7K6Ar44uh9fuCNbDFu0jHHl7cs3Pkltit3tcVvQhTp4ZHPyn3REHeKZ/Wo/SRgS2577TVKWp/Q96gWO+aIxaXxrTZod4Mj1UuQ1dvTD7XlrGl3/EsyMMEQeYtm1DTxiQWuF/kbRDmfBx56i56mwUkz3bUl626TKkozmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764315772; c=relaxed/relaxed;
	bh=wwgegw9oYh4R/9dxi/Bwe4qVjMTpsZE/Aa2l5az11j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAyfEHGTjRn9ustEyXmL7lh2HSPL6WQcYnJsfRCkrAtAkHtRWyMawzA+NzIoln88e21xAmgTriVgbdzZOUJCJR+R8G9TmreGZeAtNcfKQNCvieQEin2u9rgPVjl2P9SCOpaSI+iCv/xYMrFOJJTnlXwB/RHQA3H5cK3Ci0j1SRC2VDEmZyNzjuuuiE3X6XWkLKul2+xgqKjX/6nKXrGnR8SeproR/znQUqp7WYPQv0xajGUT1Hdwm8QEIHkey8ogav6qNPRFuoCTLsenvvd1qljkaTKFuu/hPlJVkrTR0+w2EIWnsPqIam6g8JFFtiAEHYIUx8XlQrdEC1KewCAudA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LxqUhqPF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LxqUhqPF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHldR4jqnz2yG5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 18:42:50 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-343f52d15efso1442106a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 23:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764315768; x=1764920568; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwgegw9oYh4R/9dxi/Bwe4qVjMTpsZE/Aa2l5az11j8=;
        b=LxqUhqPFl7dRtprOcezIVpFSN+WD4hL7pNulYLrgrDE80QmyNeAqSpbMSo1a1xLB46
         wssqTuxTcN0xXCVj7KJnHq+xsYeQO02/libBVbSUOflxbMcN7DeRuXb71nTYtg/mEY6t
         9vQS9n/TYCLhbJR+XBddP9cfq2y1iEEkCYdxD8qkNrbWZAmXZCbGSJovx/RojB1pWtNT
         SrM80sfR0DbehhVd1K5ub7aha1VdKZfdT6Yx2ySD0StjyzDkR9lqT5TNZtLVByz6s/E5
         xAz7bH2P1ioPSXw8PEqFyH84jkw7AMEQKjW3mTqnKwhRxd1j9N9yxirG1HdtussR+ub2
         2wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764315768; x=1764920568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wwgegw9oYh4R/9dxi/Bwe4qVjMTpsZE/Aa2l5az11j8=;
        b=UdJs/7LY1ue/ogNivLmHqj6VM5TL9Tor0cZ+L4V37R7cYlnZvQYR0C6dbsQwoZ9XwQ
         ave87TAFeOAj3WHRwQt7O5SNhwYxziqzKrzOSztF9Ly5nTufJrD9QZGos9a7dqopf3p4
         OZ0FvpIbDTI4E1qiqxsmqAtTaGYDz1hfmN3VKexfa2haBYubCUPWg2t0BQ0jVS7KzeVZ
         EgKCHzErTcabVRBp4Ir5T6609Yrzi91FeiD4tykRMQ2YuCyURaSEsdLAOVxchYnrycVC
         AtDth4RiTrnPtfkrXdaPL+d1MRV7r1CYCgMm506LscfFfebkrn+zswIBuNrbCPAuEo1l
         639g==
X-Forwarded-Encrypted: i=1; AJvYcCVN9uHfGtkd2PyQfB6Hte4mwO1QFr4EKs0iCRu+EB0ZNq2aw/vGd840N94gPtBKsqxg22TtI19L7t1Pxgw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3/fThVPGv5ggsEEEDVSvo+/DKNGtj4D0Wq/ZkRAZKszzvmDVm
	eoVXZ3txh0Lo6e1zVedVr06X28S8TsBq77goaisEQqfvuilu0Ds3gFWzmZg3Z9+c5Iga7oxJPVM
	PpAZs3HF8shTuSGJZCzJxfdw7dWLysPM=
X-Gm-Gg: ASbGncuCwcEqkP2+T0q3aoJQYRNr6gOU95YxNlZEymgj//2pCSb9PHzEgKo6UFCs/of
	y/Fov7q25XOHVk4cqXkhTYhRDhE9YLhRFR+5nALhiKw1iEOnEeQXdiSWrZeoEUZxci04rno4zku
	8HVGEP1EgMBp8mByRxv+i7rZrDDVPyFvmgyB5cWXyTv4P/IfFGEBgi5+WNZWq1RiCXkJhOarGgW
	++Np367qpNgifKnrldhUMAFNZ9uFC01WGdciuB679NtTuRyrZEx+eWYEG7QXByVhMOGcJY=
X-Google-Smtp-Source: AGHT+IEJHXWBr49KAxGxDC76/hSjkgPpxJkZWLQuZkWnCi2QL33UGO6wPksN6i7KBZN5v50Gsq6b0+DnAizX1B0BKmY=
X-Received: by 2002:a17:90b:3511:b0:340:7b2e:64cc with SMTP id
 98e67ed59e1d1-3475ebfa6f7mr14891033a91.15.1764315767663; Thu, 27 Nov 2025
 23:42:47 -0800 (PST)
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
Precedence: list
MIME-Version: 1.0
References: <20251127022652.674574-1-chancel.liu@nxp.com> <20251127022652.674574-2-chancel.liu@nxp.com>
In-Reply-To: <20251127022652.674574-2-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Nov 2025 15:42:35 +0800
X-Gm-Features: AWmQ_bl4gbf4CFZu3bcV7RGzT54t6XuebMgeEFtiCF_T5XNJ8oNCRIVgEXuIWC4
Message-ID: <CAA+D8APuodgnrmwjd=OFYFuN-jV6ppxGHK0nmocij2fQ0EatzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_micfil: Add default quality for
 different platforms
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 10:27=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> Add a default quality flag in soc data. For i.MX8MP/93/943 platforms on
> which range control is constrained, set medium quality by default to
> achieve better audio performance and wider adjustable range control.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu wang
> ---
>  sound/soc/fsl/fsl_micfil.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 1ea543863101..86678fee7a57 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -92,6 +92,7 @@ struct fsl_micfil_soc_data {
>         bool volume_sx;
>         u64  formats;
>         int  fifo_offset;
> +       enum quality default_quality;
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx8mm =3D {
> @@ -102,6 +103,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mm =
=3D {
>         .formats =3D SNDRV_PCM_FMTBIT_S16_LE,
>         .volume_sx =3D true,
>         .fifo_offset =3D 0,
> +       .default_quality =3D QUALITY_VLOW0,
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx8mp =3D {
> @@ -112,6 +114,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp =
=3D {
>         .formats =3D SNDRV_PCM_FMTBIT_S32_LE,
>         .volume_sx =3D false,
>         .fifo_offset =3D 0,
> +       .default_quality =3D QUALITY_MEDIUM,
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx93 =3D {
> @@ -124,6 +127,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 =
=3D {
>         .use_verid =3D true,
>         .volume_sx =3D false,
>         .fifo_offset =3D 0,
> +       .default_quality =3D QUALITY_MEDIUM,
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx943 =3D {
> @@ -136,6 +140,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 =
=3D {
>         .use_verid =3D true,
>         .volume_sx =3D false,
>         .fifo_offset =3D -4,
> +       .default_quality =3D QUALITY_MEDIUM,
>  };
>
>  static const struct of_device_id fsl_micfil_dt_ids[] =3D {
> @@ -892,7 +897,7 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *c=
pu_dai)
>         unsigned int val =3D 0;
>         int ret, i;
>
> -       micfil->quality =3D QUALITY_VLOW0;
> +       micfil->quality =3D micfil->soc->default_quality;
>         micfil->card =3D cpu_dai->component->card;
>
>         /* set default gain to 2 */
> --
> 2.50.1
>

