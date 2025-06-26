Return-Path: <linuxppc-dev+bounces-9802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB76CAE9940
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 10:56:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSXbw6gbSz2xRw;
	Thu, 26 Jun 2025 18:56:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750928188;
	cv=none; b=JQF8xHjq11ugFdYMboMh+U/vuwI7nxml+Q11I2/IBsN7KbXEn5cLVI/jm5yUQlNYRq0Vig0+sPirO0GoAod1hcZJGPOx4kOkOWrF8j3IP30Yh3qfr33x/9PnMS8/4LbeLYpG8ICL6VpqBNV1mxzkJfNBIF+M8RV9VPKlHDnIb43YUffaptgKeYRh/xvgL1Qx2ijFXixwWacOv4vaah/ofDl0GrMpHNx98RRODdz8oVd0EZXN6iXBepFlJ+d9mDMWDvssdc+Z+U5fQSFRU/8thtjcg6q6GKhLzC4sNyx5RTXRugsonHCh0f2WzaxQFkMZiE0Jg8+10oeg9VtnGdOHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750928188; c=relaxed/relaxed;
	bh=kKq2tmEw8Z+I4+DkPTVtyuGbD/NPo/vSE2bc1oGU0v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7B/DYA/q+svc4ic0O2oZfJRCrRWER3Bvbf7dGRs+GdrDSdiRQI8OD7uTUC3265YX+nxKhYUP8Bwv7LghdxI2jkgE14m54BpSgL1CxsXZ8duVwTgUR90WrGPyUtuYAGBI8M/Pt5zzumXlQQeW1jdPvOTxZHD1vweCQYNkTuBYFlHgA/7OKUGzpiP37R3NhtQlvHN7RSUy9VgzJWSsYKbuZ7Af2ltJrHhsB0TgLro59xtaQGVVgdCsQuLmcZRNCEX8nhBUQo6lnIs2LZJ9aTOQWikB0itMkXj69idb4wXl/AZo9uJhOf3CmaagGV0sbJjND7aSBtDHyVbATO43GGDyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dMn+7J0x; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dMn+7J0x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSXbv6Frqz2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 18:56:27 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234d366e5f2so10659955ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750928185; x=1751532985; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKq2tmEw8Z+I4+DkPTVtyuGbD/NPo/vSE2bc1oGU0v4=;
        b=dMn+7J0xLDDXeyayaq8+ZRo+Jo0h/zAG/WZOS3IiPtWupiFP4BKM2E25+mgT3NE/1i
         tSAhlIYYEFhU1E48D67euWptx0Qgo/6NlqwmAGqFHo2/HpEqzD0KNAQFyKXqsnVXkYfv
         kkXh5Q45fcRuylVhPJF/N5LKMtjTpHFuI+o64EUH8WZ4RMWTj1f+URO61xMx/y7HYNd7
         yvocjvdETf3z8shA6KlvGOiAT6CmRXthYxO7RXdPcE6oich3JZ3ToihclkJOYo+Sy8Ft
         vFudi21vyTCUPe5+t2v5Sh9oz8y0sj15ypKw2+XbKcCIfDFqOCOHCoqI3zVdBpIxIzdo
         odyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750928185; x=1751532985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKq2tmEw8Z+I4+DkPTVtyuGbD/NPo/vSE2bc1oGU0v4=;
        b=kZ7iK8t7Pbx/QDoGQkJ9hIh38BnNJGaclGMf8rS65vdp/WQSQMop7uaE9AUaUC6ivp
         unwf3PL072H+TkEwyf6b5mN331gi8Vra/Hk/f81gFsgsvBsCI1yaS3xHxc6lgOq7bjfc
         NSdZxMJVlnbjYkJ0QRXkE6xf7QQjukWxI9nisKDkvZJQHtyD7ruHjC7COE5IfRzTjXzO
         N5imweCDppXGzGwjphAqseVVVfJw2XdgK1GYe8a+JySzj2Z/akZPplCLnyTTxGCTpG/7
         jG8s9aY3FSP1goEWw7gNCL7nAWy32ChgeTuJDTPkxQqxLglsSgQyMwLXCV6OU1wysvAd
         f3dA==
X-Forwarded-Encrypted: i=1; AJvYcCUou03FakPhIb0Lzftl42z24tu3UEjIooBjO1aXT+Odw2PH1DbcWfCD/Ddwj+19V2eJ3wecu69SKM50Fa4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwKLF2PJ6tKa96ljF/cwy1pblGMvv/Pkeiq6u7WKlOg759s3LJA
	KE0XaYqWp89QM4fCUCvt9zitfECp2et5vEb1Ata5Y7oXkDrMvnvCn5BJUOWpx1vjvYPPp7q84nf
	fRYTuRT8IEbngyfqQpmTT2j1PHF0eEso=
X-Gm-Gg: ASbGncvP8dEQ1XQwyhsWal82XswrR45sPUD3GTRZxHQgH3tljypXs38Zc+fHOn/wCXc
	BqrJO7+ZC0t//qSKfVHg7unu9ikROTrWSn72V6uNkOauzoeyp4s2Hz1vQywf45LeNXtkXyKcG2J
	bUgq+McWn5NfBByUbEWyebe6Ppj02kC+puS6skvpTPGIWZHDyQ5D/E4NIxRomSFf2AkbNTGt1Ev
	QxZeA==
X-Google-Smtp-Source: AGHT+IE2DrC5grwumkOHXtYkpMUb7BU6kwWjuzYjVuHSy0tZ0sO1LU9jFpnSRoX5x0S/VZtcmZJfjTLwHaopoc46CX8=
X-Received: by 2002:a17:903:2407:b0:234:f580:a15 with SMTP id
 d9443c01a7336-23823fd0962mr97131565ad.14.1750928185135; Thu, 26 Jun 2025
 01:56:25 -0700 (PDT)
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
References: <20250625020504.2728161-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250625020504.2728161-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 26 Jun 2025 11:56:10 +0300
X-Gm-Features: Ac12FXzvq83DcpP5mt4TK7XmROn_z1FuFMfxOK7fO0D14eB9FvX3yh2CJWin8Vo
Message-ID: <CAEnQRZDDrt+zP=+Echs_Df_7dcugHrJ4DW7SF_aDGiDSnMtVbg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: use internal measured ratio for non-ideal
 ratio mode
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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

On Wed, Jun 25, 2025 at 5:07=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> When USRC=3D0, there is underrun issue for the non-ideal ratio mode;
> according to the reference mannual, the internal measured ratio can be
> used with USRC=3D1 and IDRC=3D0.
>
> Fixes: d0250cf4f2ab ("ASoC: fsl_asrc: Add an option to select internal ra=
tio mode")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

