Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B3E8BEC94
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 21:28:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FPJ9bZrk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYpGJ3sYQz3cWc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 05:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FPJ9bZrk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYpFX3fGNz3cNV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 05:27:26 +1000 (AEST)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4df4016b3c9so928425e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2024 12:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715110041; x=1715714841; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAc3byTNBsHPa+WdoCVtnwL96sJFYPacjsD1Mg7kFVQ=;
        b=FPJ9bZrkolgfS591RX6dxiY8EJos46JSCoGHOO1tmKb9In3phX6ZkDM6or6g4PM5I0
         TbY0IlYDOFhCZp0jI4ZL+5BHFWP3HE4ICmSil+0K6ddbO9eQ3/QwXUR2oAsw60tQzHYg
         Gb0v9vCNobefc7dOl+fzyA7v2D2ciYy9APlAZfTzBLKfz7LWQJqk3+0aoEO+r7dfXqS8
         21op92BnQul23i9c2ZtSEtp9w8rTXiiQX0QzUhZjPC+TfmE3JKNRpvZbp19qsY3euauT
         r2Ffb3mQLQB7Bg6+4sJX9E8xBX6NCpxwZthMHNlybJA6GosxbXeevoSCYZGFA8Nrwik7
         q++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715110041; x=1715714841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAc3byTNBsHPa+WdoCVtnwL96sJFYPacjsD1Mg7kFVQ=;
        b=O3Wi0JzL8s52a1CPtEdW0rnYEt8HHbS/y750OXkFq6x7hbRMzg1iGoP1F2uy34KPWS
         pjKW8IYUEheYxP5aWIWsahvr5BOim4YxYEwFKtCRi8DW5TdrTh1qxxuG7Tb2bxn/haiB
         pbddA+KmROhacDxzB4XSrR3CqG1/vkBl9uuHexOVVGo0sdnPmMz9PMYoaCdjqK9UblfT
         rPLzhJ0ou4Ouh/+2jpOPBijxIXAnXyOKQvBNlI997WC4vcgV/BsaZSxbDjovw0Rj9IYS
         gUmRXXtlU+DTxs1cILy2AZ2FX0yQ4SYuLh42k/a7qhIf4iJl1268/HlgUp3s2z4a9Sc/
         b10A==
X-Forwarded-Encrypted: i=1; AJvYcCVZFLj6wZ1KLdsakv/q5/O9juy2hGGqb4T4L3jeDWk81iddppGwzWtl3EMSF1ZVWMu60D/l3TFn2yS5w2V16gc+XDcqKJcDntSER3nJRA==
X-Gm-Message-State: AOJu0YwcN5k4QIi0GvbaNmqEFBlnYRPR7ZevRbjcK5ry2KWXjnGw6ThD
	6DPG0TEM3g1GrZxYU9UcNO7PQVTddFpeASLaofyf5DsfesIL9UKrzfeQBvYespSBDMAkrSRUIlR
	xuqeAx3wdITDVgC8bGD6k5UBzp9I=
X-Google-Smtp-Source: AGHT+IFNdkHpD3Gwn20I/Y7Qjqry/oQQapXeMBHaaXt7fkTgoavVUMdoy9nyAnEFQ2HO1nDpfnp2Y4SnJOqaHSWKU1A=
X-Received: by 2002:a05:6122:411b:b0:4df:2b08:f217 with SMTP id
 71dfb90a1353d-4df69181920mr566063e0c.6.1715110041132; Tue, 07 May 2024
 12:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com> <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
In-Reply-To: <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
From: Allen <allen.lkml@gmail.com>
Date: Tue, 7 May 2024 12:27:10 -0700
Message-ID: <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, edumazet@google.com, linux-acenic@sunsite.dk, louis.peens@corigine.com, angelogioacchino.delregno@collabora.com, borisp@nvidia.com, cooldavid@cooldavid.org, aneesh.kumar@kernel.org, tlfalcon@linux.ibm.com, naveen.n.rao@linux.ibm.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, nnac123@linux.ibm.com, richardcochran@gmail.com, sean.wang@mediatek.com, npiggin@gmail.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, mlindner@marvell.com, netdev@vger.kernel.org, oss-drivers@corigine.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, linux-rdma@vger.kernel.org, bryan.whitehead@microchip.com, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 7, 2024 at 12:23=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, May 07, 2024 at 07:01:11PM +0000, Allen Pais wrote:
> > The only generic interface to execute asynchronously in the BH context =
is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workque=
ue
> > behaves similarly to regular workqueues except that the queued work ite=
ms
> > are executed in the BH context.
> >
> > This patch converts drivers/ethernet/* from tasklet to BH workqueue.
>
> I doubt you're going to get many comments on this patch, being so large
> and spread across all drivers. I'm not going to bother trying to edit
> this down to something more sensible, I'll just plonk my comment here.
>
> For the mvpp2 driver, you're only updating a comment - and looking at
> it, the comment no longer reflects the code. It doesn't make use of
> tasklets at all. That makes the comment wrong whether or not it's
> updated. So I suggest rather than doing a search and replace for
> "tasklet" to "BH blahblah" (sorry, I don't remember what you replaced
> it with) just get rid of that bit of the comment.
>

 Thank you Russell.

 I will get rid of the comment. If it helps, I can create a patch for each
driver. We did that in the past, with this series, I thought it would be
easier to apply one patch.

Thanks,

       - Allen
