Return-Path: <linuxppc-dev+bounces-1583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B584098592B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 13:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDFRH3wXSz2xy2;
	Wed, 25 Sep 2024 21:50:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727246983;
	cv=none; b=BhOPKeg7DvwqeJBiPIyvmEG0CMYDGNl4oOqeHsD3HZH84kWsBfuHyP8sEkIRjBL5wwr0O1jVD63OazsmhT/7+HtBM+kuwSdQOn0uaDbhBzB7AFWrlCk+4oIitJ4ZHWe0/bigS1LXGcGMLj1yvptk2krCpCZPZGqpoOCcfiuX4t74Mws8YdYu99k/8wRaC14AqCaqTdhFK20OdPP5oKCB8nuZIylUan2IKUoV84ty0XX3SaWcrTbOobSYy6oDUQgiyVLGGFxSHk8nd+eNrRAFb9hw9y60r+gsNMv7qN1rhimLnKbVhb5PxFnimFVKOF/rA26FAGiBpntdt1FMk3+3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727246983; c=relaxed/relaxed;
	bh=kk0Mt/+Hyj4BQOBJfxHEcKPbnwRr+BiwB73GhiBhJzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9cX5HW8VZhSeOV0H9u1a5hMWWr/NdjBeNLk6+cVUcwE9hKbiTMUMiBCh5Flmf/MzJZqARWTfaE/VXXfercKZFc2P8QU8HnjAiXLXLcsLM56SFx8DhT+XkbOV4vKVOcT7mUaarZ11/7TuEDW4SoMdgzml53AoaiBHV1B91EGe5S5r8qJD1gGuqjDpIJY1k9DovneTbpeuRGaqMQZe0P3Hv3zSrr58Y8nIUdcbI7U8jXma3DReGBcswPwi13lS6jwU6K0gMXUztEGid7ocjLDKLPPQ5ZrobsG96TgOBNKIiu7lfmzbCdkyJatjK8GFdkGl0uLoQ+uDFyekjmUw5Ko0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lSDre6Ni; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lSDre6Ni;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XD6m64sjVz2xtc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 16:49:41 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so880955566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 23:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727246977; x=1727851777; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kk0Mt/+Hyj4BQOBJfxHEcKPbnwRr+BiwB73GhiBhJzc=;
        b=lSDre6NiCjuzqsoc+i1Ngdha9VpV6dlqut3aNe0ge8M+MtP4IuU3zQMHA0PFT/CyRn
         dpc7snkrHsGDv3meyqyJ5YiBbH1dQ2DHp2P2QedSvfwfsfPXXvLdKZhrGO7Qvulje0NU
         t0rIE5ibE6KgS4YTzdHbAa3eC2HRSVakhPlCKnyiT3F61vFUIgEqx6vfwh36Zk9uZ0pZ
         lIgiBLyX8KAFc0LLNjdemFYAnR918+WIxC5AyDP9wX7Budp7RZmqQIKcDDAfJEblCY2Y
         zQjgpAVl95Z+44sI9oDavaWLU50MSmTbzv89kgflMieiakkPB9yfEuaT3JJruJwtCX3+
         i24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727246977; x=1727851777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kk0Mt/+Hyj4BQOBJfxHEcKPbnwRr+BiwB73GhiBhJzc=;
        b=vG6Tei051Wu4cJ1SHsXId6N5fveDHYS3KZbOxgc+jVhQrXEyYhW9yOqX3ojhb2JOwG
         KKTQIbev43bJK8OsDISJ7e4b929LLGRcrVnIn+xfAR71+05iUcVDbB2zjHu/mRboV10m
         GgprKpApt3Sel6zrMNHdGZPdA0KKb5u95YDzC6BWjg1VXoi4r0nXgfgrJMhp5muevZpt
         /fVVOF+gC3Z/V1AGxwqCvbuog2aDgcox2W+KmeIy1VEkv0hwasdiFrTwro7+U+LtuKgU
         op+ELyFh+Ym1BOvCIG0yCqg3IjITJXcNDe8bzCB8ZQ6AYGtW0TTgxKa2gVvcCk8nOfGN
         I6tw==
X-Forwarded-Encrypted: i=1; AJvYcCUyd6uJsLi+lZNUusdD7gw9QUNb5NF1i5yAbB8w2IbeJhH/N/xQveXPlLWZCPs1kJMiVxVvzplu2p59hW4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxT0Wk8pvyezWbiH1Z1qux62PgjzX3FhvENch+JchVd93aaow8X
	fAX8gtZj9YLTtXvSsWv7awTq2JpMVPDo56XUH8/tUxQXZ/+gbaX6b1XmRXIcMCvihdbDnNJMbC+
	tbrYFE5eabIpfWx2OwfpVGiGgNQQ=
X-Google-Smtp-Source: AGHT+IG4EhVNx4ZXTlcmLKwxSpAi+1Cc6wEcJlS0M5tzYd1bPulq0A8B/RQMJgdldFEu+s5xV1faX8OGR4qz9F9spEc=
X-Received: by 2002:a17:907:c7d5:b0:a86:86d7:2890 with SMTP id
 a640c23a62f3a-a93a05d6507mr137992666b.50.1727246976510; Tue, 24 Sep 2024
 23:49:36 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
In-Reply-To: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 25 Sep 2024 09:50:35 +0300
Message-ID: <CAEnQRZBde3AV7Dvu-jtXCTbZnBg60COdp7eheSdyfE_6mP9GQw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Use maple tree register cache
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 4:59=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Several of the NXP drivers use regmaps with a rbtree register cache. Sinc=
e
> the maple tree cache is uisng a generally more modern data structure whic=
h
> makes implementation choices more suitable for modern systems let's conve=
rt
> these drivers to it. This should have no practical impact.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

