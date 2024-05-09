Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03268C188F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 23:39:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V1/4nc4q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb54x2DMzz3dfy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 07:39:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V1/4nc4q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb5486pMzz3dDJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 07:38:48 +1000 (AEST)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7f82c932858so441907241.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 14:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715290725; x=1715895525; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcXomuFTNs6kAOjv+oYFgSUhkraR2OB9WxwHOqU2kw0=;
        b=V1/4nc4qTqJJUc3iRrLf1fHDGApLbU3+G0AvnfG2wgH5V11ujdLIPCyS9ZUBTgjNCR
         p2GX6ZvGeMKDoBpXRbFbrHsXcOxZVx1qS5mGkyO1zeOPmCzV1qCtIf7w7a5zK6y1Qoa1
         xgML2AUwhx90X5QOz3qivME+EA2PbrCtz/67/X6F0bt7Os0Mo63If/75RvJlBZyNoRL+
         YaEH7PjPRo6No+4gTWiGCe7QCudqEVmfMcbNRVGvQMTqDT2U8cgP54dLA1AC8n/PfWaI
         9PbNcQ76PbSyjwZmDag7Si0LfBa38bMfxZiCg+gsBA774dmXcv/4dNWIvmZB8Y/X9Z8b
         +blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715290725; x=1715895525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcXomuFTNs6kAOjv+oYFgSUhkraR2OB9WxwHOqU2kw0=;
        b=gRzm9PdYjy9bVIZfZlSt51EVgC9h3Nhp0yGT9Yw7gj6F1DMMkw7GwtIl7Qg9m2LKjV
         Ohoy5V2RzmVEMV3KdzWWC5eEd3CoVcnYe09PGAbbcLyrJGHybzCodanhcMyY/HFOKzJU
         QkiLA43WC69BZnbaNGXm5mCgMDtzFuCB6hYjdHpU7Ouo1ZEpVMjS1PRAONFraldhosse
         eDew79E6Sr1Ss07cDsYXUhu7/gghYPE97PSTra/rEgizDsv6VQxoA0y4sKgUNEx+ORZJ
         EHIa2QjL8bjNx4gw4Jij/jZfbPHZ09tPPsppBqnra1HTWMaHrzkdWkUYFk/an0EJ6WBJ
         JefQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFByrkj7twSX1K5K6JLLOKsMDvSA9sdfA/QXL6KctnAWitYX6wCpWUwtvTEpQORgf2hg8B6WgHgJuENnoAOryzRR4ej9OWg+yIKoSUNA==
X-Gm-Message-State: AOJu0YzeNjti0CWmDLBetrWF/eMAQM7SwLqBVh+WOVrhCEAc0g1ga5wS
	fblsr5idRfxt2ufCvg0rQvk6HR2RuByt7kaJsJTz1mVYG4peY+oGaQjXb1D55lW5TXUjD8p+o3t
	pYsxXFqWkCngYNNfqrMEyyx6nab0=
X-Google-Smtp-Source: AGHT+IGDPdAnAHFbOGEVVQfuthPYBDUFn04X97C8h8u5g41EhAQrrR+vQZTM+R921KKRTb5redHLdvkWlrvB0RI6wnw=
X-Received: by 2002:a05:6122:2a51:b0:4d8:75ca:8cbe with SMTP id
 71dfb90a1353d-4df8839a7cemr976657e0c.16.1715290725239; Thu, 09 May 2024
 14:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com> <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
 <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
 <20240508201654.GA2248333@kernel.org> <e9633d41d0d004db3ec6e2b6d9dcb95d029dbb94.camel@redhat.com>
In-Reply-To: <e9633d41d0d004db3ec6e2b6d9dcb95d029dbb94.camel@redhat.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 9 May 2024 14:38:34 -0700
Message-ID: <CAOMdWS+WRC7KOqPUXJ88ikCDPS-6oZ0i6OFTUk95DFTfYtNZcA@mail.gmail.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
To: Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, edumazet@google.com, linux-acenic@sunsite.dk, louis.peens@corigine.com, borisp@nvidia.com, cooldavid@cooldavid.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, aneesh.kumar@kernel.org, tlfalcon@linux.ibm.com, naveen.n.rao@linux.ibm.com, kuba@kernel.org, angelogioacchino.delregno@collabora.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, nnac123@linux.ibm.com, richardcochran@gmail.com, sean.wang@mediatek.com, npiggin@gmail.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, mlindner@marvell.com, netdev@vger.kernel.org, oss-drivers@corigine.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, linux-rdma@vger.kernel.org, Simon Horman <horms@kernel.org>, bryan.whitehead@microchip.com, linux-mediatek@lists.infradead.org, linuxppc-dev@lis
 ts.ozlabs.org, davem@davemloft.net, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paolo,

> On Wed, 2024-05-08 at 21:16 +0100, Simon Horman wrote:
> > * As this patch seems to involve many non-trivial changes
> >   it seems to me that it would be best to break it up somehow.
> >   To allow proper review.
>
> I would like to stress this latest point: it looks like the changes to
> all the drivers are completely independent. If so, you have to break
> the series on a per driver basis. Since the total number of patch will
> be higher then 15 (maximum size allowed on netdev) you will have to
> split this in several smaller series.
>

 Right, it's a valid point. Per-driver might not work. Depending on the
driver and changes, I will try and make it an independent series.

> Beyond making the change reviewable, it will allow eventually reverting
> the changes individually, should that cause any regressions.
>

Thank you, I understand the concern here. Will work on it in v2.

Thank you very much for your time and suggestions.

 - Allen
