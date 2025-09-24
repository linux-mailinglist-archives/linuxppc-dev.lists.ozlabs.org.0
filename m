Return-Path: <linuxppc-dev+bounces-12555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 860DFB988D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 09:32:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWpTQ3Xcdz304f;
	Wed, 24 Sep 2025 17:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758699146;
	cv=none; b=DLi5zmTxvdU0jirx+/l0rWmiQuI8NEjug0Dw2BjCIMUhhD1VJEo1lTLJEcyJiMRDlqRKKyijLvTrWy4UM9+aPSsUR27x/oNiYFtf9KAH/pDHiDUUIaJAF0LL2oHOaDhHKTa8ZJ0DzD4hBnl6jewNyUePFY28SaELSXkYtx0D3g0WsKYDiWPf6gVMkeZNPs+fqb0M3LDaSMenifIyIVmi5LM9y+LF52h3bSucl9IXY3D+FgHWRiZwzxf0w9Mjjqn7cb9v8Ym/oFG0hbABNzXY9A6njiA/pFqR7yxyIOBZpsjz2+E8zqB/LjXsffsjz7t3tygPiCrg6M6fyrvyhXut0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758699146; c=relaxed/relaxed;
	bh=v9ogATJZj1jG8raAY2zUuQe4EmJHk/4W4xvGLcmqNCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I59uTp8M5GyQd2HjlR/jh1aIxZHMUdUSFEw4lJrAHKYNktq9N9INt5lh4E084b88HGEzOAjUqlgD0PtaD0R+ug+RybzFTzKLg3533pYCKntVeqTq0FpuzJuorxoqIGB+9NexyhqH3JZ0b0ysPEf946yL9umR/iOpYQB62pP0ldWzbLexhE9i1jBbf7h3Wb/s3PEU7s18mKHZQ/jX39d82MSUXSKK6Ks3PZ3dMl///zIhUamvYE2Vt+F7FU1KG3fH/BnqdzOlH3pIv4O2Jf6Zms+TG+p0giITxwAYefb2ie05TLsMFO5CLN4ObvPp8JCR4q8xqWSH7YmCIP0QlydYmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dSLhZ+0P; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dSLhZ+0P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWpTP1Pfcz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 17:32:24 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso11000557a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 00:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758699138; x=1759303938; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v9ogATJZj1jG8raAY2zUuQe4EmJHk/4W4xvGLcmqNCI=;
        b=dSLhZ+0PmUfgWnUpKALlFxkufUTbNTf1eSVjEJVVrkeGEVm4iwosrgUE4e/9tYXbie
         xx1fpvpn1QIaz29MMkuQffO3Z+FMQpsLGyd59s8td31q8xYZB+xF1SCvRP+sxhT+ebpO
         hrq9uOycqs4XTh7LjY0EWEiT16lS2lm94M48RSqNBuc+cIDpHev3ggutbhcgjzVy5WTv
         ZbVyk72tBVfiKt7/gDJYOXTKhu8N27zozvOCifj3Kp4IlUbSdDci+KgabByVTeUZIy6D
         ZvrD8+RghSTEOcAECPZi71WKLrNekqgkvYmxf0eJshmIbLisdIY4gZt2Ob/eimxXpgA7
         FSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758699138; x=1759303938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9ogATJZj1jG8raAY2zUuQe4EmJHk/4W4xvGLcmqNCI=;
        b=F0icFDN3eiiikAMLnd8xtGekYkj2ejWgXStJ6b0pHOLnB3Sfc/uZXSDqagHwEmaGd7
         QGhsDXwZ75bz2A+dIq4KVpfPoWFMfI63O+VdEm3YWPTGf+jTPAv5kfNYnl79RjFfPHH0
         7LezwsXRn6ncZyQgw2QvC4XjmRxiB8XxQKq5SV3VeIZrelJmxNAziFuj6ya+4qPASIS4
         BoqHBHvse43rsxliuNSKx6tmPi1i5rINhBv/hfPHp5WkcGcrnVYeU6/hOBLHo2Sqyo1d
         MylgFHMG5sAtx+K/MnTmArzMSSXV3TdvjdcjwHMNWm6VtSXTf/VAbxcGmMudRvdaYi3+
         3fmw==
X-Forwarded-Encrypted: i=1; AJvYcCWG/Q89CjlZ7HydMR9mdBOEZ56er9/VVvuG/6bFAuRwZYelKBm0PownYSZRmMFuHj9C2uU9/RxX5wR3ZGw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywmgbcorp4xjd+HCxHKkYVBerYbiQZwoz7wf8kXC2Iz7QZ98a3L
	W+OAszOypCUYXa13xGJxffTAaJE2Aj5RvF46s1KgLr3DJ7IupsTpoFkwkZYebfVXQP+lKSqFv3E
	pOpr+X8uIksjYZoO3gONM9GAoy43xD0c=
X-Gm-Gg: ASbGncv+nfHDJsx761u9nGkr9G/sUH+BLehkGaiOw4WfSa1RLsRrAGq8ocK+lqcyd/+
	dxSlqpAPUNHBkeZtjvc69zKXeY3J8bN5rZcIZcjz1y9ywjqXWwWmDymkvpU6vD9+ang4llTL+bT
	70tMHwH7UU86evLAOj9A8clTPxJqL6wFZf3OeZPKzNjA8tMzMAhgb0NBMGf+rMlnexWXjan1GHD
	yDTo/2C
X-Google-Smtp-Source: AGHT+IEsD22J4a5V9bbdMWtQv1Ep8AmuRuA2KpP+ndq9VMyD7XFtjS94kSm5rlJirOSxMvazqqoNAsq4GX/ON5RyqyA=
X-Received: by 2002:a05:6402:44dc:b0:633:4726:a077 with SMTP id
 4fb4d7f45d1cf-63467796df4mr4258422a12.15.1758699137992; Wed, 24 Sep 2025
 00:32:17 -0700 (PDT)
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
 <20250923235318.GD2617119@nvidia.com>
In-Reply-To: <20250923235318.GD2617119@nvidia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 24 Sep 2025 09:32:06 +0200
X-Gm-Features: AS18NWBrVH-9-wBlZ7ZFV3RxYYp-7iSL9DfIPq4jDzU8rxFLx7xmKKzveUA49as
Message-ID: <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
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

> Suggest testing the same branch with the alpha patch reverted just to
> rule out any issue in the core code. If it reproduces suggest to
> bisect Leon's branch.
>
I can try to revert just the patch containing the alpha-specific stuff and
see what happens and then, as  you say, maybe do a bisect from there.
First I'll just try the same kernel again a few times more just to make sure
that this is really reproducible.

/Magnus

