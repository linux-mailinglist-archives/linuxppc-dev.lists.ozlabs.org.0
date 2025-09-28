Return-Path: <linuxppc-dev+bounces-12594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE1BA6EFD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 12:24:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZL5j1cB6z3cYx;
	Sun, 28 Sep 2025 20:24:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759055049;
	cv=none; b=kKzSKo/lT/K96eOtiLK5QYhTc5jsfWfrsp+gQijdrkWKJANEqxlrxwXeUseHrt13+ccdmd5fFOJRnAntNoqx71op8A0l4kYdKRqsGKTN2qXMjyMeClE56rBBBkZwR7H+Qm5uNGfarE7rn7rhNHVb8vH7JOgjCZLk++ezNJYjB+gyH3cx/G5owGvrklLFeL9NoOBqaeLX5MSRioXYjoG1Vvpe82HO/4PTo6cMfc+M4FO39vv0DXH9FFSbKlDJDQoNea72BUBVajVhhr/nexHrqtF/r+eRfqc+w0UGV51pL8ZzA+y6lYnRFUcP34fv54OT/9nUNKhIllYiP/5AEAcyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759055049; c=relaxed/relaxed;
	bh=LcChJkbyyCyxxnYoZ0h2dgScTYQu8ypUACGdGHRDEY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVI/DT14/fcaz0rFshTCpzYAEqW5HzIN6ws9J3MUINDqhJk5huNgBskOzKcMpKbqoVSoegq5KpoIJghIL6LTZdVmDOmD0BAveahFpEGl3MVpSTuXBY3rBGuW8RNbbELTO8tujilPk+EwPrwrVW39KNxQPOAHF44fX4hFyRPzRqhkQhTZpN1xPLu29L4W9Ei9s3PiEbGnvpwMwDN/sW0+lzI38dmvuiqSjUW+fks1/iZoCByXlMCnj+ouD2QSQmwOkO1WRHztVGo7F5Psefj6ntOA9aorrK+Ddj1YEKefAFR0pkiOtYONd8dgbi01LlT1aAnnMduZyKUw0JifBQZ0Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dYd4bWwX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dYd4bWwX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZL5g4mNLz302l
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Sep 2025 20:24:06 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so6998129a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Sep 2025 03:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759055040; x=1759659840; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LcChJkbyyCyxxnYoZ0h2dgScTYQu8ypUACGdGHRDEY8=;
        b=dYd4bWwXO7xqFixPkuTsqlZCqc2p1iSPQtAYF7SatizuqsXaBAFqTONQsDF5wEotob
         hb2pQh7YwiPWDhJLnnMq0FaO6FkEZACciyzGX8qhY6SYNpUtrmluUw6FlD/RADp301nw
         zna8ea4Kz1Y+/bEKtphfXqeZ9P4jWyfjCMEHSwwYiYvQUBnASEtkcUQCasIxla0nY/sY
         rWGQlHrctGwNipOWz8KgyeVspu3V/zRWDAs0xBfM0fpTKxB82yeubHq8iTMHC0JxTuq7
         riCt9w+2hxoOMhX4wNR1ExQFloENk87rMzCaQ6Kj8eszz9rILqG1qfndGp/bKylunWAw
         hTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759055040; x=1759659840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcChJkbyyCyxxnYoZ0h2dgScTYQu8ypUACGdGHRDEY8=;
        b=Uwsw16AtHf+kP40+pOLO7aYU7fdrMyvz5ZN5PYPPTp1jeNcV2XfYrFot50DOOgiyyc
         HqViu6TAjYeEm0QydIj91rIWFbZRi6diyj5kpk34SwOdzNnCrtTe826S4iDO6sK38GXP
         eao1vg94QvSlcKxpWb1KdgDMGBHd6MRbZ+Q7mUmWYUnpbddEpCwWIzxoPqHZVl9iufM3
         2WhkhYQGb9VrHUk5d6uJdBWXeruMHjaz5LoBC2NS0SFe0qU2ryU9nLXdHQdOSX/A2N5d
         csSxcDcr6vzFoAc+c647l0G/ysqCfCWsVmodovW/uXgUtsNnCTiNJbMss1hNOghVGKYa
         LEMg==
X-Forwarded-Encrypted: i=1; AJvYcCWKebO2fXiquAfgkssk7tyc8NBgArLnl/IZPDWVQbHc7Tz4DsFMDAj26JEpNaHmkniJL4jw9JLaC5OSh5g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyuLYUBeYSR7sWgmY1fqGJgllc7+Bz/GXOngMAFXmiCSJx9m0wp
	Wz/6C6tyjTjdP3UY3E1KM3x45FYWLRT48Fi+swIp69DjgrTnT3k5AvLyAL6CKlDxSD8RPZoGzby
	gzAFnPvWTC/Yf7tlb44ETPlpbCe0gTnI=
X-Gm-Gg: ASbGncv6HSzIbO1ZTOy0gdQDv27nqCUurdSIOfYnznd3LQG79AKXg4d5IbHqAffJEjG
	EqOe7Qtko6nSDS8V2cdrCSSCuSc5DgUsyfJJkhozGYBgo4Z+BLBn2XgIYbFHWzWmESPqh4Wx7k6
	GP3In8wlKizouuDIN0Cxw0FQoL2z0soKg4tAEbXUxjNsHNX1cEsewpjZpfUczeuLsfzNjQZM3o3
	OazwIDO
X-Google-Smtp-Source: AGHT+IGAq0LbOWTh24q9bLB+mXJC5ix6EL+ilnN7HstffL1oa4ImYTxpRTBcFvmhE8oxPjiGws6tJF6LzW8U7U3nO24=
X-Received: by 2002:a05:6402:606:b0:633:8337:da95 with SMTP id
 4fb4d7f45d1cf-6349fa9f661mr8379897a12.38.1759055040002; Sun, 28 Sep 2025
 03:24:00 -0700 (PDT)
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
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 12:23:48 +0200
X-Gm-Features: AS18NWC4Nb9W4XCpYP_OV5Q9pNZrLenXw3hzv9kO6uALa6_OupoUAOrEskTs214
Message-ID: <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
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

> After reverting the above commits, I'm able to build a working kernel,
> that is, no filesystem corruption occurs. I'll take a closer look at this
> after the weekend.
>

Short update,  It is enough to revert the following commits, in order to
have a working kernel on alpha:

e78a9d72517a88faa6f16dab4d1c6f966ed378ae
(dma-mapping: remove unused map_page callback)

d459e3b80ad1c81bf596d63d2e3347cf8c7bb0d9
(alpha: Convert mapping routine to rely on physical address)


/Magnus

