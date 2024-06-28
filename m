Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7378C91BBDD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 11:49:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=O1zUE4ka;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Vy3078Kz3cYf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 19:48:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=O1zUE4ka;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9VxK6JnVz30Wb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 19:48:20 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6b590e36a8dso1945746d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719568096; x=1720172896; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9ul7sciE4TWD5ZCzRMXkQo/BW8Bk2N6jU2ho5gBxDc=;
        b=O1zUE4kaZAfposcSZ6WTpvBoueDGAMd3Wm8C4Wo5aBKUc5xkMQtntoj1NxfXCVO3bg
         vBqZIgawMOTGG9RYxaHHcFGYO/X30ZLjFW9TtC45KGp43/aF8LTnODU8ut2fPX+rcC+z
         jwJMhx8azhfpRgTNoLbMGK7dna/eEtyKTAssI3GqS5zc3DI4oKcMyQE5MtmHHsb5CMmk
         pcx+sWNVJ839yAcswJV/brEVh50m7F21JLDmHapAmOWaHlryukWjj8Eb+5u8kwGCnx+K
         SdIHxst1/zZ5posJ/TvqjqlV8I1Dow9VQk9oF0A2uay/WJgQRtXiYFacjSILBPuh6AZ9
         JFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719568096; x=1720172896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9ul7sciE4TWD5ZCzRMXkQo/BW8Bk2N6jU2ho5gBxDc=;
        b=Bs/GPDHgiwhCQSvnoZvKX90JZYBGqXLxsR+zKR/MdkQCJXd5sjXab9B51veiAQQjCF
         QNC5AVDCNlMJy5ZY1Mae5VgYisGt+0rAyGqSjcJLRStO/49X8lBcdY7BVuDRUi6zbnKY
         TBGKFvkRsPWH2Irw15YZGEXAnkVz8r4FfG1OnlSMdr1woy745l7yoSL0Xhq7cXp0RLj7
         2LgbIQOd9dEyJw4OwvKEyni3xYXeKak1i3NP767ojd/J9UPS+/3yN8NKKcVOIXu8x1og
         +zyJ51hYxo8rgw6mlply54oeHv03iGlVBt2jox7kqzjj3ALlfqLPVDdipZqEVoQP9Jqe
         b1qA==
X-Forwarded-Encrypted: i=1; AJvYcCU6qWDVbLXpugBRot8LqniMFX1cyCmRgdtlHJV3ivScvVtv/tqUfmDJybUkQmBoD5RRDSndIFFbzPEkArO+CJbm9fwQPmYtSciRDVoWSQ==
X-Gm-Message-State: AOJu0YwFaImXr2C3i+stIR61vsWUabb247mIC1xo02rHHU22saWc/c8y
	2YxF/oqQ6+7wMn2xIQFUGvrFD9h6e/U/g8qLiGHdwg21pJ7VCwW9zSJn8JwMgk5iA0j69wWSZ4d
	kfIKm2+RZ1nvfXtYsXqptwgJptKbQVGcbanKlsQ==
X-Google-Smtp-Source: AGHT+IGKbXGa8tFRoUBtX9jPFSaA/HXwNQUkn5EBHWhOJnFoUnmXEc3piUEvQv5r8Xh65vaIT9hG5Yzp9EElL8Q42qY=
X-Received: by 2002:a05:6214:230d:b0:6b5:468e:d413 with SMTP id
 6a1803df08f44-6b5468ed608mr190751986d6.40.1719568096583; Fri, 28 Jun 2024
 02:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-9-piotr.wojtaszczyk@timesys.com> <20240621103019.783271f4@xps-13>
 <CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com> <20240624083900.14e38d82@xps-13>
In-Reply-To: <20240624083900.14e38d82@xps-13>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 28 Jun 2024 11:48:05 +0200
Message-ID: <CAG+cZ06j4XACKtgwkTyjK0jhFTt+-EYTN+qFKO20ow3sjK84BA@mail.gmail.com>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
To: Miquel Raynal <miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 24, 2024 at 8:39=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
> > > I don't see any change regarding the NAND controller node in the devi=
ce
> > > tree, is there any dependency with other patches from the same patchs=
et
> > > or may I apply this directly to nand/next?
> > >
> > > Thanks,
> > > Miqu=C3=A8l
> >
> > Yes, this patch depends on "[v4,04/10] ARM: dts: lpc32xx: Add missing
> > dma and i2s properties"
> > which will be splitted into two or more separate patches per request
> > in the comments.
> > I'd like to keep driver changes and corresponding changes in DTS in
> > the same patch
> > but I've made a separate patch for DTS per request from v2 of the patch=
 set.
>
> These changes won't be applied to the same tries so they must be split.
>
> So I will not take this patch for the next merge window and instead
> will take it for the one after, if the DT patches have been applied.
> Please ping me at -rc1 again if the DT patches have gone through.
>
> Thanks,
> Miqu=C3=A8l

Hi Miqu=C3=A8l, please check v5 of the patch, I've added fallback if a DMA =
can't be
requested using DT, this is backward compatible with platform data and no
longer depends on the DT changes.
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20240627150046.2587=
95-11-piotr.wojtaszczyk@timesys.com/

--
Piotr Wojtaszczyk
Timesys
