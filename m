Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9BC7A9502
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 16:01:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DqGfr+w+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrxs11nqhz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 00:01:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DqGfr+w+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrxr36xJnz3c40
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 00:00:34 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-51f64817809so98473a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695304831; x=1695909631; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tc23TH0KdG9d7oJL/fNpMbI3CeGhcYjMRjPeLFllkb4=;
        b=DqGfr+w+X5bH2wAZv/oKVp7qt+s8PKgkMoYee1xkajd8fBdOppsSDbVLzz/7NVULce
         Z0CVALUzbflLPhf85gEujhK1SbS6/0uYchDjYt+IzIP75Y11hEkmrBremiYent84ie6t
         NkJtK2gkzwgMHDxtRDQ67RNTvVkUa/f/DbkN1w8qwBewwRO3QFtCls3lH6zdAIjR96tE
         A/MHnq8PFQacqiOx66Qz8FnIJpITHotXeaPmxtAsZszpck+nUorYii7ClDrnNmm2qGvo
         R2hXPtgckFpt0bBopEWjvzeg3uP8mRHnSb2D6C5MImkSsXnUa0hb2gB8xYSeQzXbTLnf
         /KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695304831; x=1695909631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tc23TH0KdG9d7oJL/fNpMbI3CeGhcYjMRjPeLFllkb4=;
        b=Tm27AeKbpXJaYvgdvePkdmFmSXVRg7yuitGuc7yNXO7aH4+G2keDNZN4yDxOsuRCRD
         0n0nEyWvINlFMXVwuLNSYteWQAODRzNxQrSEHTvbTkpq8AGdMsXx1/n4g6BQxlmSUyZr
         G/ZGNJDIgsqsCUmbBlgGx5R5fvdtudleo1BwnZFk8n0pMpT6Ie9s+NBaISsl2qEoFJ+P
         K0VRGS4ylMx4j/OLlcf4m52cP8sZOLqNNNOja8o413Zjx8aeanRzint5VRG2Eny98nTl
         crE5535iMJf7+aLOP/afxJyNHhAFyioRCJ/keN3Yjer2UH6HwTf7VcjC1mKzXXZ1Poe5
         aUzA==
X-Gm-Message-State: AOJu0YzjV3JWtXzlw7PCwHGU6luuFP5dq0i8bPbvUmYv8uYkxIiUHn2D
	SOef/Rlkc1KhFBDZyfQaNrfRGvWYfcDbj48yecc=
X-Google-Smtp-Source: AGHT+IFhRwDvm/yyhVcWlHi6I3H4gEl8VRUEkcWr8N8SNVEqUHsIKOIva4COX9kmaaCRUgrPCfUAVQ4pAN/e6dsvzV4=
X-Received: by 2002:a05:6a21:339e:b0:145:3bd9:1377 with SMTP id
 yy30-20020a056a21339e00b001453bd91377mr6044154pzb.5.1695304831383; Thu, 21
 Sep 2023 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230921084808.840381-1-emas@bang-olufsen.dk>
In-Reply-To: <20230921084808.840381-1-emas@bang-olufsen.dk>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 21 Sep 2023 11:00:20 -0300
Message-ID: <CAOMZO5B2L4OxtDTcUhn_w3K5zimDMOFB--DVL_d6TjeBjD5VUQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: sw reset consumer on pause/stop
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Matus Gajdos <matuszpd@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 5:48=E2=80=AFAM Emil Abildgaard Svendsen
<EMAS@bang-olufsen.dk> wrote:
>
> When in consumer mode with BCLK disabled (FSL_SAI_CSR_BCE =3D 0) the
> FIFO's can still contain data when resumed. It might also be possible
> with BCLK enabled but just less likely.
>
> When the FIFO's still contain data on resume it can cause channel
> shifting on e.g. XRUNS. A Software Reset will reset the FIFO's and make
> sure channels are aligned.
>
> Fixes: 269f399dc19f ("ASoC: fsl_sai: Disable bit clock with transmitter")
> Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
