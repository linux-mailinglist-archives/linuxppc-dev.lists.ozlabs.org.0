Return-Path: <linuxppc-dev+bounces-1571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DDE984CA4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 23:18:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCt4t0bnbz2y8p;
	Wed, 25 Sep 2024 07:18:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727190370;
	cv=none; b=ZiSPjCspzwLL1zd/7cEXIZ582ObkvKCZZX3KNQQtjJSX7Lh+akG/MGs9GUom4okKIjlYoyaTKxVn1t1Fy6Ds0Xjx52xGKOWb4h0Tas8FQEuNHtn5POUu3Y8SZ5KVTob6mTatrWiZuOhs+sE6CNg+HcsMnEh7NHrZEzQcSqIAWqRj8XO0yr0itqO+w9c4Eo+pOiO7dbzXH++W3Nb6lDVHk4yXz3SCpJYqlGZz7z+iiHm/bonBOMn7KqqdojQ8EJPLRNMNb6Vkihm4JI+yeJSyadVgzVz5g9nNbWVmhJFCAiEos3Egune5L/vf1hkxCcTdKoqkdt4c4B4eTRAlkfFP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727190370; c=relaxed/relaxed;
	bh=WEt4t4OKLC44wD9fFRRRREDLnvhSGokn0SJPbLcxpss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvPr05rxHOkbN3u3Gg3Qkr40G8zJG5IHw8ay2riuk10x+eRDvzzAK0sxyrvHRE5bPz9TGKNaOGNcAb1DeZjvC/fqxjJO51j0MInc97jEzjOAtKIq9VpyhytlPUFv25B0MebhAOMyjhzcaQIPSo8S55Po+oxZYoRogfwreaAROZN3siLQ/e9FtVOu9E2f+72TFCTiXaIgZRVzQMruuljLfCdKZDLXnewmIw0bLa8zhQiC7lpp9nRxoGcbe1CrAe6YcaEPY84MSDQF+7ra9eW5ck2F9tiPPo5miNqxQFwmMvMd1A42BwoO6vQAtvOnyYwPPeAz/tvVpjtcC4u+ZHYzzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qcv1zqam; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qcv1zqam;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCjqP5LHkz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 01:06:09 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2f759688444so47406211fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727190363; x=1727795163; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEt4t4OKLC44wD9fFRRRREDLnvhSGokn0SJPbLcxpss=;
        b=Qcv1zqamEcRntYMdUin+eejAG55sL7DLwab95jNFOU1kjK0G88CNh3Au0gaoYNIgU0
         AOtlqwXf77o69ZZ9O/Fk3HAGTP35TQ4PNhhdvSlgOkFqCBMWPsZcFpmTl7RRBv+vbLxv
         66JLWkUu7juo5fnuJi0mCRxA8nrHLk+ZcpQp0ScoBNAb6IKHsFmLCphT70Hl72yD5SpX
         qMfOBhutLXA2jHxsGwLrdDQXwymhYghmxJzk+fNoLQ7yQyKGC1RJJLbchoZEGuI3zsVo
         EVgHSuarhoWxRJ9jbqqnMNBBeqGxH1xthNQ7IuA1dEZ6aYFEFcKQaEp2sdPo0P//KCF7
         m3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190363; x=1727795163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEt4t4OKLC44wD9fFRRRREDLnvhSGokn0SJPbLcxpss=;
        b=QW+EZdKjPzOKSxQt8wwbclJNnnpJXMxUgWVtz8pLPAvleffDEmRbEnLIm+gjBseL9N
         GhyJbULrvxWd2G3uDu2NGGya/ICvFG1AeKniM4pW56lradZJHlEJkHKcuCA3QK35ZAmM
         nImvyweAjW10RxXlPrvJID/9ujVfVpC6tdirAJ0DstZrb+0F75GY4tde5JdLIpcJJWNI
         OZItMtBHPv181kBB5ysC7Qky+cCObCqhbojqwL5lMGLr558OcBA6qva7x6oOgJdib0en
         BOUncj+C+VQANGbINlfXOzDX5i2uz+khSw5Rthlp31ya7tBz7aJoJcJCC1h5FDZGAHUQ
         /VWg==
X-Forwarded-Encrypted: i=1; AJvYcCVgnv9cepAhk1D8NlGSPymoHPSxNKHBQmdNxT2Kr5inR3ObGHsEy8kTM1/41LqrzR9ZCpLfPwyWIaIdQPk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yya2NQtGw3OlvVrbdprcU6+KTPIO+ayKppvo6pB3OC64y8MSjar
	40bSiaHv8nfBZw5SapkwLqfTJP1e8VL0bsHvDl25ss52mUqJNuEH9kbCmq3yvdugRhxtNyqMhO5
	Eu4XJseiKH/r6Q/Uv9bqao0aWsD8=
X-Google-Smtp-Source: AGHT+IHJXnBttmZSW+jlVDB4ya7Xha0cvgTxb8sPbFzzC+SpJMt6q1ghM6s3jvwsHh6rzM4yTYmh4kBk3zW7n3O2GmY=
X-Received: by 2002:a2e:4a12:0:b0:2ef:2d3a:e70a with SMTP id
 38308e7fff4ca-2f7cb2f6912mr64838401fa.18.1727190362321; Tue, 24 Sep 2024
 08:06:02 -0700 (PDT)
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
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Sep 2024 12:05:50 -0300
Message-ID: <CAOMZO5DYNK_T4xFBToMK25PuCfns57Cn+z0PoZ-y7pGr=2J=tA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Use maple tree register cache
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 10:58=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Several of the NXP drivers use regmaps with a rbtree register cache. Sinc=
e
> the maple tree cache is uisng a generally more modern data structure whic=
h

Typo: using.

Reviewed-by: Fabio Estevam <festevam@gmail.com>

