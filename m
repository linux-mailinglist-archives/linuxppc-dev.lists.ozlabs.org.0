Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EF4759CF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 19:59:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lBj8+nwC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5k9f10f1z3bxr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 03:59:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lBj8+nwC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5k8n5HN6z2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 03:59:04 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-262d096149cso1317138a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689789542; x=1690394342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wi+LNMfR/Tz//DqwsS9WjOFzP/lTw2sLHYGwQYYciDs=;
        b=lBj8+nwCuwo596pTyfKXaKrt8yhokPjU3bVcfwCcKcL3iROHxYhHCsmM/soc06CwW6
         BTq62R05+jBWHP8hDAG1coMUVVIqr2/XqxsLAubJyzhbV4q/OR80cns6jxg/J8XH0ooJ
         bxj4mMWhu7x1oBSTP3WGWRpy6Ay6pMqH4fx53iaxYP8OX5hNooeQMOudWEBSV8qlquCS
         iKK025wFAyieMuyayxhQ2AQISO16rdoeNSqewibItvGKfIYzNzEC3HyHqcAeoI8olFsy
         z3qCsZUbNgIE96F5JaY4mIe2nGMWqWX8+HgP/Yog/1TBhArv34r8hHEqk4BsokUIDlC6
         QV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689789542; x=1690394342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wi+LNMfR/Tz//DqwsS9WjOFzP/lTw2sLHYGwQYYciDs=;
        b=Qdz2FLuhxHHzW4vkqC1QoqzxlJxUFqEABhbNKPau79JLBCQUcZ2m3XQ4+JXoa44COL
         dtZvKC/5EahSaH13oXls3ueV8ZakwThvBHJVnXG0HRjgQ4AtjVwb6bLzIaqemQljrXJS
         QnbSNdN06ALFEe1m0W/DllCsFglpK1MXiSe1J82jGmw4fGAfq+T3IsuERYP1kBaSFsmI
         KIGxbG7i6S+Rc2D9LCiPOY8nziFLnhIsC0Lrt8BqFUZvyLL543D8p/tLInntJrIZPZ8b
         Ca3oTEV5CDdDlcwH25B+CbL9SuNsPB33Iin/mZF8jPK/hxjV6JcW40v7M6fgCAoEiz9u
         U9xQ==
X-Gm-Message-State: ABy/qLYYpSGJuJLYKEbQtxi+TAEXvikY2wjXLVbTeKmw+ppybokaWM6p
	SphvMAUphYwKs3LOVQEF9j/nFpHbh9Jd2HPe5QE=
X-Google-Smtp-Source: APBJJlGqJI4W82lqYn39sz6kXvq00es8CQ163Oepw2UdWjqWLwEUM7xFGagEC7laHVQIwU79fsL2lAeMrml2BlMljKY=
X-Received: by 2002:a17:90a:46cf:b0:258:9621:913f with SMTP id
 x15-20020a17090a46cf00b002589621913fmr2794428pjg.3.1689789541792; Wed, 19 Jul
 2023 10:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230719164729.19969-1-matuszpd@gmail.com>
In-Reply-To: <20230719164729.19969-1-matuszpd@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Jul 2023 14:58:50 -0300
Message-ID: <CAOMZO5DOAWWQoTRXbx5DaCx2Hr79YN4bx1DKBywKQOEp6GLARg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Silence output on stop
To: Matus Gajdos <matuszpd@gmail.com>
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
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Mark Brown <broonie@linaro.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023 at 1:48=E2=80=AFPM Matus Gajdos <matuszpd@gmail.com> w=
rote:
>
> Clear TX registers on stop to prevent the SPDIF interface from sending
> last written word over and over again.
>
> Fixes: a2388a498ad2 ("ASoC: fsl: Add S/PDIF CPU DAI driver")
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
