Return-Path: <linuxppc-dev+bounces-4323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73C9F686B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:28:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCwyP2mdkz30Vb;
	Thu, 19 Dec 2024 01:28:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532093;
	cv=none; b=RALMAPQysXC4dlXVyJCaYLgi/AF1XI7j/RbYC018GO19Q7oRvIg6fWfObzQQuNhzR2vu0JLl/TFxjMbh4mYvMLWwszQwodNcpQpt0d5ve6eGB8zOfJ8ijCPHS/v//ZAKVdqdok/1nKYC8VdZ3aZMpLrZMlzasr9Fxh8nayJ8lEV0o67yg5HFXEnQpDEVidozbH13L4vZycNLANGbIJsLstv5q8eO7Bi4HvAaXVi2E2ZU358VKBQUduKETdzfU+utXgjpqA/gltybuVWFQcCC3AbE1Fid/z7OCQP0SjRT0fYwqTw7KaboY48+kxL3ZhcA5CGf6XRdtHtblSWhyLfKww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532093; c=relaxed/relaxed;
	bh=U8jtJujB1TTw1eVv4jn2BLcoiUTyaKBpavnO2MJUXJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JisHPWMM4a1zzaVRo6hZey6I6p/KXKc4iFUCAcPHog6DDLIQD5nGEXYVGagiiF6SNw/CXF+lAV7Eu/UyojQ2hJyel+xhu1l0Ul4hGm5xmnUJVfen2duc2aDV/iFOCj8VgQBrX6l2aN2MgnhkXJojOx+98v1YrS1OYBPmUpkMk/dmb6JLvnmMycxVYK1fMU/7VH7XwFSclenLmFf6vdx+s7bVLZVI6PQHz9M6iuQTf5KXM3T9OtlPAW6cUmCihJtfTRSxD0iVsN+HJ0FVHgjHE8qgajLVqWyNXMN9s1mdyGzW2aOdrenSnYdxGwBOclOoMy+p+IMQlhYMVZl9+uDk7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ijBzZKls; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ijBzZKls;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCwyN43xHz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:28:12 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7feb6871730so4447787a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734532090; x=1735136890; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8jtJujB1TTw1eVv4jn2BLcoiUTyaKBpavnO2MJUXJY=;
        b=ijBzZKlsAdACmNS8g/G28D4exVYdjQWwYMUI5PJN3b1urUUhPFJpW2H4H999hFL7lf
         YpfFJWsByGhStr5JqGeNk7UXf0yrbBXyxD5l2iYh/EbgtBLArXIUKa/1J7qmYpLqJIjj
         75eqbcUgj+WZaruUHJ4HZF6cF9yowB+uvPkqY3AnNeCumxqU8cj55OCjijwRYsOd1TKx
         b4na2mYzbdTGTWfvT4gNo1QAdzYRZv/rQjF/0tdYdIrLU697ZbTZh2UNAL6RuaW6GaRD
         S9o3N51FhmmNAA/Ui58sj18cYAHNtxjxmiqB1bDGmcOEccWwWD/wc2KQQuEoEC5Oumce
         tEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532090; x=1735136890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8jtJujB1TTw1eVv4jn2BLcoiUTyaKBpavnO2MJUXJY=;
        b=kgpjYnSO3vX6qPHhCHZ1E5Ux/M2K8p+obSb/Oy3Cnq22B8Og8NR46Y63ILmeHnUqpv
         9ci8eDIlNP9n7/3/hprTA+ePpfuDNy/vUrJxvwfkfzPxK1f3vIXzCldLaNeVYbAQPBv6
         560yR10UgZJ5yjMUQrx7/Cn4PG7/9buMXSPVHKOGmwTnX3vlII7LTLJeyj6GsvsO5NS6
         Nck9r51iIDdvkxx2Qz8PpOCWvWoyoJgMQK5E9/Vu5baWRqwef3VGx/sNczXcob4x5LXF
         0rOHuxuez1kgU2offSYu4RfN7YOKqziZ93lipVtUyRmAMfZk73sR8zE4Bmm4Fu2IKetJ
         F5VA==
X-Forwarded-Encrypted: i=1; AJvYcCUoMOy7uIEY70CI8bH+wBJhUPXlaOuHV+g5QewG4uGpfoJPuE+imTqqASWd6187qooQIkCjENQfRJDNE8E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZs6FXu8lgFbXfyvU1WspFRQINpoVTx/8MeEAqGsEiyH5ZpG0F
	dMyMJs+ud3wHDmLgNVerlv+pMAFds7bQusUMRiJ1D3TyP3eHWxxXOhocJdkR6OYQELSdj/nxDdf
	QXfr82b906WcV8+T8Q5KKwHwuRrE=
X-Gm-Gg: ASbGncvpT4WSNW5AhawJ/jiOxFV1HvWyrpu45KnRCOGXnQN/P9PvRMJgBkYdecz3KiH
	u9EpjPsfB415H70/NzdKwdgev0UW2g4amcw==
X-Google-Smtp-Source: AGHT+IGLICEXof9Lk9Mu0+8v93sLWV1+QqNEVr04r0jLUUI28fU+qASD7M4o6Aa5GsX612QHPLBszL0iDSMJ0gEToXs=
X-Received: by 2002:a17:90a:c884:b0:2ee:5111:a54b with SMTP id
 98e67ed59e1d1-2f2e93910bdmr3927977a91.31.1734532089984; Wed, 18 Dec 2024
 06:28:09 -0800 (PST)
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
References: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
In-Reply-To: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Dec 2024 16:29:26 +0200
Message-ID: <CAEnQRZCd-t1wX3-tHt2VFOSE-6JCzzp+nWCa2zQBSZjjoNqUFQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t type
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 4:46=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Fix sparse warnings:
>
> fsl_asrc_m2m.c:360:45: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
> fsl_asrc_m2m.c:360:45: sparse:    expected restricted snd_pcm_format_t [u=
sertype] pcm_forma
> fsl_asrc_m2m.c:360:45: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:361:41: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:361:41: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:361:41: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:365:45: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
> fsl_asrc_m2m.c:365:45: sparse:    expected restricted snd_pcm_format_t [u=
sertype] pcm_forma
> fsl_asrc_m2m.c:365:45: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:366:42: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:366:42: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:366:42: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:595:54: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:595:54: sparse:    expected unsigned int [usertype] format=
s
> fsl_asrc_m2m.c:595:54: sparse:    got restricted snd_pcm_format_t [assign=
ed] [usertype] k
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412180043.PAA4t4sQ-lkp@i=
ntel.com/
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

