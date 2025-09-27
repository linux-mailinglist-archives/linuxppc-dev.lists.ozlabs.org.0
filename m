Return-Path: <linuxppc-dev+bounces-12593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12388BA62D1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Sep 2025 21:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cYy3748Vrz2yZ6;
	Sun, 28 Sep 2025 05:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759000835;
	cv=none; b=gwrPnQM8/eg65CNHQ8kXDLP4Q7Oez9BLiFEeO4BaxAX6qkB7fyUzKREj40WXU03krb+Hulv7gz7D7GZOzhVFrBJNvwbQDhCLPD8YAyZu9eHJ5b8Q86mHkDWowRkcmkQOmZAETkR9LOMO1UVA58fWmXnJybE1J55cPpUmpFqfExs9fQ6tOzKLMfFMsHZKOLWhJ1ZAXFL1OGQnxDaQelLcKnsW9bAQASXgnZU0l4lzdiBKjDLo/TJE5L6NjkDiMl7OUmG7BEjl5tJFbwRzjcZxXWpyWxj5lZcYWTgrpbunPeU2u8IcqrbGndFaatrGXADdsTF5TTbPYvFvVz3H/0l/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759000835; c=relaxed/relaxed;
	bh=BpNpqT8E7PV/s4bEDWlZ98/qvJvoxkZccIvsTmWeJBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKRmQlLs7cz6o9TH+U2A6v7iJXybC7WklyymKK9K5t7ImuJzoAHtra1twIB+J5dKcV9ntNYoBQeHGLH3heEM/VJCeacFT9QP+tMCiuY8IvgVcf+PBlU6+Lp7u6+SHFcvlxryeC9s15GJVuq4NpStPnx96u6HmIPn+wsl1GtYcn+oWKcFVE9EKQ5txjL5prhfpP9Op8uaZMJ+dZhGiq53zz27nLg2YVCU6lqKr9Ah21empJeLZMbKYVHKrPV1YeKcctZrhjZZlcBV83HpwujkUiSbd+fiqNPl6THfqnRsI6hWyqcl4MMPcper1iTpvpwS9/MO6Lr2LwCKoUn1hDTTpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V1ZhJ6s+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V1ZhJ6s+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cYy354XLhz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Sep 2025 05:20:32 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso1579663a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Sep 2025 12:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759000827; x=1759605627; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpNpqT8E7PV/s4bEDWlZ98/qvJvoxkZccIvsTmWeJBY=;
        b=V1ZhJ6s+9iaDExq3AvlsA/fdd9UI61Q4Lbuc3xNCaXI//0jE81Ov3P5iXhGjbtCkIm
         HvVuw9rmKzAVw8o26XZJlZMfIJ+EZ3LPSvlqifvaNs49duX3cAnt5nT40+Br7OGZyeGk
         gVxf9PFQLcyf3ekDSfPjjDzpvimBs9Aw4MvhiW7yEY+y0tLL7j6pSnpj0o/R4PobkcHR
         wfSHiqirm3/JUwsdEjj8PNXKopb/YIEhW16/qsU+zV5yqr6pK10JVZ6xWVd1f/1yNaiE
         lkhGzyNS1xqiNr92mw975wZ3xrlctxWeVQI6AWveIaQ4cXhG++xKI21G0D3kgbFCLoDL
         rjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759000827; x=1759605627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpNpqT8E7PV/s4bEDWlZ98/qvJvoxkZccIvsTmWeJBY=;
        b=HTFKVGgGDAoYxZplnlVqfRJdcAMNSOk7oYddCuHCeiUGJe9VYjtN8XxMXnrFI2+KvA
         J4Yd4sZNuS/ZNdDhs6fCajyoXc9ojtP1YXZNRvpfth4367GuUJLRb8dbBvAb0vWPk5Ez
         1yUJHEp1mXDZcqpfMyn3LjTz5Da0EAXWR1LxFIXPL9OmOawMOMN9N6NkLA70d7Dtyt+Q
         HYquaIbUUK5vfiIq23QPEezfrQnTFua92tUM50D/shBd0k9y2VY7UridBYbe1G9JHYVp
         8Ej7O9dandigw2QE3jLHVZt/+qV5zJsbvuWC0A0q67JL1YdFNFl/4nCkwNwhh/b1qW6u
         qQew==
X-Forwarded-Encrypted: i=1; AJvYcCUI6LJYw3RlPNBrO+w7osRyL8IFFQemMIZIgMkF9ysYvMr/uCVFLWOCPlKzlfspe1T4SbRFvGO8e4AVJCc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzfn2P2WTP1+bPCRwRQebgAurAtwYNlPDZi2dYiVEEAOZmnrt3e
	g11UECf0nlQHxBIFa+PccL/ZK+g+gs56lUTbJ3CO+P/Ai8AdDh8DMCM46lZP2NKruncOD7zEPaJ
	zIydLdUiPd+zUSC5Xu+LBc6ub/6T9m38=
X-Gm-Gg: ASbGncsBgUhSt1XjHRzKfcfAA0CAZLsvrZ/oZwhj6oWhgzztN97Ho2cPZv9aDvX2E9d
	1AwYzBmlwFpgruocgDBYivpsFULe74vQ2ztEHB+1hrkO12GJZwwXZ/MhSski6Y++nXSNjlLcLLF
	o+eigdbIrEXT08du1CPx4uD1P84V25+yplQj7B70Dq9ytCctrEDRa2cF17ipKYNmTHJkGM22o2Z
	omnNZR5kSeoZGd3nAE=
X-Google-Smtp-Source: AGHT+IE6MMpG/TRiFXxnrxz1Vvo3fuH5ytNgtdVEgpXL0NxXawEVfUDFtb+tMcdRPN344hi95Su67MTI32H6Ub9xTJM=
X-Received: by 2002:a17:907:7b8b:b0:b3c:5f99:dac7 with SMTP id
 a640c23a62f3a-b3c5fa9674amr74488566b.21.1759000826450; Sat, 27 Sep 2025
 12:20:26 -0700 (PDT)
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
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com> <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
In-Reply-To: <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 27 Sep 2025 21:20:15 +0200
X-Gm-Features: AS18NWCUkmopfgQP7FxvlAuimXjc1tmQlQb-89CTajXeb-5Nlye2dR2BnBQqzEg
Message-ID: <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	iommu@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Wang <jasowang@redhat.com>, 
	Juergen Gross <jgross@suse.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	virtualization@lists.linux.dev, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> > Suggest testing the same branch with the alpha patch reverted just to
> > rule out any issue in the core code. If it reproduces suggest to
> > bisect Leon's branch.

Hi again, I've booted up the ES40 again with the kernel build from Leons
branch, it boots up but message log is full off messages like
"EXT4-fs error (device sda4): ext4_find_extent:939: inode
#16257327: comm init: pblk 65114257 bad header/extent:
invalid magic"

The filesystem is broken after just booting with the kernel.
This time fsck did not fix it, I needed to re-install gentoo stage3.
So it's for sure reproducible as well as destructive.  It's not possible to
revert all the commits individually, since this will leave the source tree
in a state where the kernel doesn't build. I've started off by reverting
the following commits:

e78a9d72517a88faa6f16dab4d1c6f966ed378ae
(dma-mapping: remove unused map_page callback)

d459e3b80ad1c81bf596d63d2e3347cf8c7bb0d9
(alpha: Convert mapping routine to rely on physical address)

3cd47242d513050d7a81ac6e7020fd3ef5462ad4
(block-dma: properly take MMIO path)

7950995bef32aa7e5f74699c7d0fdac41d2dad14
 (block-dma: migrate to dma_map_phys instead of map_page)


After reverting the above commits, I'm able to build a working kernel,
that is, no filesystem corruption occurs. I'll take a closer look at this
after the weekend.

Regards

Magnus

