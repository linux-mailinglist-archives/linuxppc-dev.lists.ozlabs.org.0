Return-Path: <linuxppc-dev+bounces-1712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4598BC22
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 14:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHy5N6jDhz2yHL;
	Tue,  1 Oct 2024 22:32:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727784589;
	cv=none; b=JWP9fdsTFayl/ApgJ29k+LKli2VMvSwKC3D7zdi4//91NMSMhZF7j3m0ZcK5XqdWYibyKHI7c/sQPC41Un2lZsBtEHznxE2HpHACb1m3r3fe8fUv0hYxSopGj+sY0UGtaG8X5t2N/ww7RDUWNaGCDnDVCLl4hBMZWf0K/vWnXmrbmP3WlZ4nio6eshK5f+XgJaaJfYhaCUEfG0hMXvHGwCPKPTI4h2trf/KvL2b9yVQfhb/JTZXFgZhh6su3A+8boUE47LmBShbC1xVVHFMtPSJszr13RIVbVWOm6zLfdSSQFojWu2QqKxygQjHVLsHif7I7qAEyT9lnlxJ/IvzfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727784589; c=relaxed/relaxed;
	bh=aWCgH0ClFjv7Xbxzqvhc8wMkP2UFTXtvCY9K+uhDros=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D64fqV0ba/zyF2fN35M0inezbheh9iJ4XPeAwysFiJ4R+m705Qj3+uPh+nR85MC85C40iqI5mdpnf5gitS0eaCfg3kNqM99xoLowckr4/LpJlS47rN/9a0jXkZzYzU+x3oj6pZXVzEAnBC/p1/pWrdgpHHcmFYS9Ny5LTswGexwJwb7edbVTT5j2mk+KQmAqFJyu5gEuAM5SLpFeJvfC8MaXO5v70/xZeKFCHd9kivSokMV58qJxH/klnY7Uq2ouMXyh0J0pw4KqD1tAHMTdSP3MjxMQ6L/LlGUkjtlLBtgQO363RbRV3Mbq2YJz7PdqgZkxwNQ2FOL37XzZf/3tJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AO8t1VJn; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=wuhoipok@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AO8t1VJn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=wuhoipok@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHxZh6HHlz2xKg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 22:09:48 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so28185451fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2024 05:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727784581; x=1728389381; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWCgH0ClFjv7Xbxzqvhc8wMkP2UFTXtvCY9K+uhDros=;
        b=AO8t1VJniJaMZ41WxqS4ffTl65ZEQ8F3BLrRV9wStEjUSZGK8ROBO+InTrZhfTtZ2p
         6T15/OoK5G9qQ5Zp7CHMpKXKfXpPLR688mdu1Mt6vpBhNzEuVG/31RpQYxQ5bZ2pDJOZ
         aMt++db1aJ3cQG9mMTWW3ohjnzvuO6iN2ZDL84x8HQUecsX3ZlIlwjDpxDz0CmsqkVvM
         2CiZpUbMhN24965V3YpbJyDMxPOXrzmp8rcmxClV02wOPGLoirzzR2DEDnZ08VSWMaAU
         CPjTw1sz+XcFTXc0u00OmjU1yb6ERQGGjvy314rFcBBgOf3VEeMFr4xDInGvXAA8SYcd
         klzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727784581; x=1728389381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWCgH0ClFjv7Xbxzqvhc8wMkP2UFTXtvCY9K+uhDros=;
        b=QzzBGmkEHahzAhW+maCRn34eBVoA3Gp/YpaWfqYPUTwGTO9s3X+7zbxnAEg/9HXPSM
         n/2Lwba5D4fTlaesgCkejyg0Z56NeBwC6BSQx2+C1AnO/4hAd21BdcRZ2Bm8jvW27SF8
         QbNbUdoBW0vnRl9Jb8IZN/HxcBiKpJmtQzcvCagH7Ig9a6uwBWWoZP0t74p3ur868gEx
         8BBj6xjlAnBH2H1ajz3F99ebxGXU67+UsHjLCamuQ7wJaMZm7x3SE8vwn524NcN2w/qR
         GnqmU7o2Zy0RbQIUsKg4rgZ5fDYmBEAyUYYYzBfxDmjIY4FvVhvv3tlorcHDKakZoJFB
         5teQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyxJOnv5+WGjgNnYo9zuMLiUWUfgOfVPUNawdvoHeOOV5rn3hr3gJ2llxeixXdW/RZFPDt6q9qeu+icqM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4wEMrWjNjQ1R1C3razfaK9wGROkdOc4bLC7uHtHmaZqTv7vZ7
	VgrEmughnNSQh5OwOWhbQHVV8VeuG0NKxtiyqEtwqJ1pDOoQvyiu2D2U+h+Gxtv+K8ZxTrOO+qJ
	ISDbwyao+xubqj6E/2oG5KyAiV88=
X-Google-Smtp-Source: AGHT+IF/9YwKZ2en3kdviSKl+8cfVU8oz+B31Oy9zgfZf1fHaLcDpl9wujyAGZjjg5hCXITsx7M6SIfrMRdCNNTEH5c=
X-Received: by 2002:ac2:4c43:0:b0:52c:e10b:cb33 with SMTP id
 2adb3069b0e04-5389fca3ae2mr10981878e87.50.1727784580470; Tue, 01 Oct 2024
 05:09:40 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
 <D01B31B5-0609-4106-ABF4-B549CDBA362B@xenosoft.de>
In-Reply-To: <D01B31B5-0609-4106-ABF4-B549CDBA362B@xenosoft.de>
From: Hoi Pok Wu <wuhoipok@gmail.com>
Date: Tue, 1 Oct 2024 20:09:28 +0800
Message-ID: <CANyH0kBnWZMZCG7K9vGt2a8Svr30U=PVOwrhwn-Q-CN9PZc=Sw@mail.gmail.com>
Subject: Re: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexdeucher@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	developers DRI <dri-devel@lists.freedesktop.org>, mad skateman <madskateman@gmail.com>, 
	"R.T.Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Thomas,

Could you help on this issue?
I do not have access to the hardware now.
Thank you.

Regards,
Wu Hoi Pok


On Tue, Oct 1, 2024 at 12:26=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> On 30 September 2024 3:27pm, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> =EF=BB=BF+ Wu Hoi Pok
>
> This is likely related to the drm device rework.
>
> Alex
>
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>
> Hi All,
>
> I was able to revert the drm-next-2024-09-19 updates for the RC1 of kerne=
l 6.12.
>
> This kernel works on all machines without any problems.
>
> This means, the new Radeon DRM driver is unreliable after the DRM rework.
>
> Please fix this issue because we can=E2=80=99t deliver the kernels with t=
he new Radeon DRM driver.
>
> Error log: https://www.xenosoft.de/PuTTY_P5040_U-Boot.log
>
> Thanks,
> Christian

