Return-Path: <linuxppc-dev+bounces-2347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342B9A23BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 15:24:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTpTT2MXQz2yMD;
	Fri, 18 Oct 2024 00:24:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729171469;
	cv=none; b=ht7vlv+W9QnzG1FIpebFSHKMBNPuxtUeRsUv1iixOIz+x/r8pt9z1wdfRFu9y+d+68qxBuR9KCHSxlqJxPG4fNreh01H9ByoyISiklgirIcKYw9K/fQJ4BWOltl5YVvCu0G4v3BDTcC1p2gqczKu1QrryWnfUPbrvHVkw5Z76auPefj7LUa/pqM5IgewLivETwZu296JenbBIj+hAfm6t3Kbr+SB1p6tVQFTjEy9bTd1Onqvy1CGr9d4XUguRhmqWgRPu9gwcEWOfHCKKk6+hud0VLvCO7AqqoCFTgR0fD5zwrxRxU0O8vEfjKgEaW01ov7xduDQ0QSB1PfdypFN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729171469; c=relaxed/relaxed;
	bh=Gz6h/cWpfDus+Fv6R8OuQ6KhEA0lGGLgJfyu+vZc1Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSeX+4HJwlALoMZNbgXpemxB2cNkg1NpnCtKbZcyRD+ZsKPXGa2PMfJ8mzjlTJsnCfyVGKssPKPApX0qAgtHizLNA3/3qoPDdzUvd5UbDHumKo1/qeMkY10oUDzUF1sVD3YEZ1U2MZtNJByc4IV47aoQSJwPb9vnCeSXZQBiESp8ziqb8pm2IixJb/uIOY8YLGv/Hd2dkvagEf0AWwzeHUoeYU8ZXMeLekM6HNbvMpGLADw53qPrTSh/AzBl20cqI/H5u3LRmvSsslqn3EFtMWHKh86CGY21fqH8KXJRbr4fKwxbEPmu7ya04IceKc3dzcKrq0gOJ9AUwuGLEc7qRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KnEBEb3f; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KnEBEb3f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTpTR1qZXz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 00:24:26 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so14865951fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729171461; x=1729776261; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gz6h/cWpfDus+Fv6R8OuQ6KhEA0lGGLgJfyu+vZc1Ng=;
        b=KnEBEb3fHl5qlxKDkiIKQ3iBPK4/OkQRFlYa/M/De0nHj47EFVLKXJFWR38rAFkssN
         hf+EX4c23PZCZqwuYNks2iv1FeBcLHNnnkHa+OHLTgAcOs2bJY4a3nQv6lrPKCXGSrqL
         zbnEWeFcFjSwDMSFqWtKMq9KWzKzytx+d0z16AoOUeXVe+rrrRJVUFpn6rJ4f+x7I1tv
         ATibFGDQ+iivb3jtd5ZW9cY0NuNcqWYMdCxnetHORr+gtsN0H7zZ9v4rfwZpQuUp+iAA
         HfURfCpz8XJ22Wb7Gy6tPGpdbMAt2oVRF2XtBPKxmzWc/HubTgLq1cgMNwZ9I5/3k/dK
         lBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171461; x=1729776261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gz6h/cWpfDus+Fv6R8OuQ6KhEA0lGGLgJfyu+vZc1Ng=;
        b=FefB3K20nHZ5FKGJdTIRxnjq5VtxOXH+WFV0WGgkXqm9WHxK0rYHsIVAM5YMZoRanO
         Y6w2dYFfjaaHp6CVeWK0lRhR1B1aavNQB4c7KyQitIBhRc2SFvRS9AI52Lvg0vV2CsB+
         x8Pfa7VmLhS5qyTET+rZFDF5GHjiKy81/h2hZbjRAKq9nzXSHyF9zmqWrwzxDJWrTKvS
         9NXUIBrbXQ5ucQFfVgQN0BLxKHcGqtJTXMJZj+mIqTf7tMinuXsxV0SzHZSVaJp+ws0r
         MitZyCgqwP/cpm1oFOv2JIdIoBTJnVRLkv61RyCHEQ4+03DJWcCZs04AYKSKEB/rNQ4p
         mM1w==
X-Forwarded-Encrypted: i=1; AJvYcCUWw3d7O66ndvRZRLlpZoWxJijZtnrFcjPIvLBcYt7tl1OIKiuxYz3yeXqMQQNJofIU/q8E010kA40Ftqk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySoHOn2mEpm7KnxDShZNC58ke9mKNuo5OkD77qFq2tehnzXigi
	RP8ln0c7EipFSIgAUWwHR8ZP3SUl9aD+OBySihCJsY+RxQ+vbXffXuhGTMn2ow17V4fI5xEugSZ
	FGs015IbNCn2CBtf+G157sTJLYtY=
X-Google-Smtp-Source: AGHT+IFD5qDdg80DA9mBb/Ba6kch83UqlhH3993pbPsJRFaEwYd7KQ9tdLLC5IVGXX1NzhH891rsRl8NvWZZ4Ml9Hqk=
X-Received: by 2002:a05:651c:1987:b0:2fb:4f8e:efd with SMTP id
 38308e7fff4ca-2fb4f8e10ebmr126203261fa.32.1729171460504; Thu, 17 Oct 2024
 06:24:20 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241017071507.2577786-1-chancel.liu@nxp.com>
In-Reply-To: <20241017071507.2577786-1-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 17 Oct 2024 16:25:18 +0300
Message-ID: <CAEnQRZABGsL7rL+qrwNhyaYDX22D6M2fg=4RKRRRcOAXS9yKxg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add a flag to distinguish with
 different volume control types
To: Chancel Liu <chancel.liu@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 17, 2024 at 10:15=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> On i.MX8MM the register of volume control has positive and negative
> values. It is different from other platforms like i.MX8MP and i.MX93
> which only have positive values. Add a volume_sx flag to use SX_TLV
> volume control for this kind of platform. Use common TLV volume control
> for other platforms.
>
> Fixes: cdfa92eb90f5 ("ASoC: fsl_micfil: Correct the number of steps on SX=
 controls")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

