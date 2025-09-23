Return-Path: <linuxppc-dev+bounces-12547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EBBB975B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 21:34:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWVYR5ZTrz2yqv;
	Wed, 24 Sep 2025 05:34:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758656091;
	cv=none; b=euWvikRkl6X+rIvO8H5ppR9G+vQwJi6zvoQelc07gJin+BZOzxyBEC5liIxtuGxIvqH7BEqwY3eSSgVKB8/lo7eBRX8dAEexAojrsK776OZWjBv2z4VahTqJoJDOaK2lOjFPCilj1qQdtKwmIjt/XVTxyJzxLGtnLa8eY+vUFjRM9XGl0qfyeUE4pdsaIBFXVOV2wJrqRNEWjMgBqkQN7YKIMH06JkDLK34oWMemhc9LQhIwNOHXjvbVtw4jnFPQD3XsucAi0pLcwNAvn6flhAOgAL/tX7C+kk+dBzkSE07MMdh+5ZlEYC44UdM+wwItcahbyTSN9HE+fn+Dhy6swQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758656091; c=relaxed/relaxed;
	bh=++d3dqdiBWxrOtz0QgpiS/0g7+oJyTqlQjLbyxgEnJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=of631EvDunOAdGAYU5VVY5ZuanYQ60VJorvoQn0SDyJo3NMsUoMmEOO0LWf3qDNySOf6FDVf0uERne0TKdrcZhA1fsEZFuwv9Iw6wAkWQY2T5ZPgM++vrrTnQyJ6mHal+/ThGD0x8yALSGyOi0v1egG+KAUN7cdZIzEFRZguWJyYnzp2IVfhF4ziEZ6ErULVX4u9drQ0oPMXEFurR5p6Ru6ilfJzo+uvoXQowiBLHcWPOvbN/J1KRoBF5BmDGsungl72tUFzhXf7kkThGaQTW3fcTiia1M5g6Ltbw5mLhmNiAUXo/VfBOiFYUzmvWeo7zXdmd9Bjn+G5YuM7bJA+gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=At3wHNHs; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=At3wHNHs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWVYQ2YPdz2xcG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 05:34:49 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-62fbc90e6f6so8101345a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758656084; x=1759260884; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=++d3dqdiBWxrOtz0QgpiS/0g7+oJyTqlQjLbyxgEnJo=;
        b=At3wHNHsj4fNvsICeJDGBDnMjT93jeV5Lgrs97WoXQgyOj1aZoOEFJc+0wAjbBZaRQ
         +gh7lwNbfIruJo0l7AhVyPbZ/0aW7CnIBPrUWTuJqiDFmCu3W+D+Eeb0SA5lyVeir3Zu
         +E7CXt3WM2eCftdGOZC3uesTaWBcVR+BR4wDNcp3RN0awa85ZedHuS3bn6NT0JoxukjW
         L+M43MQGkBwrlXbiiMdGy/fSS5/GhuioObGio2kcP73ozTUg/NUFBooJm2jh3yAEcP44
         CJh2N9NgCMBitiPj0O9a64SdTKR8zVyNDapPbhW1E5tMUBr6OR7LutDq2FYD6JHEYOmi
         DPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656084; x=1759260884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++d3dqdiBWxrOtz0QgpiS/0g7+oJyTqlQjLbyxgEnJo=;
        b=RDoHJ488YllNlah7cffh+IyvWFWG3MHDrCpHfCci1o22DnR977jpiv8OD3vVVNy1jh
         DHhJb6wjGKjcQgTjy5AL3A35b4jfxj9d4f/uKIaa7U2ee8qP33rdw/2uYSnuObyMI8xW
         9/mnQMMaYa04s4JhMUkDyQsqT1jvdEo2NDG/bF7aLqqWvjRjtYmqXeRQdr9PwNQbrxmH
         Rak1tUXChF+YHSfrXC1/hcGyf1uJ3edOlzSuWm/UgCF1aueqbt4ECqHwfATr811H5vkR
         CGkNLvN9JmldlYjT5KGHz9ZpUPOWCywIH0Jbh80sCOx2oLM40GQi/h0a+smoU/YQI4QA
         Ku6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5UlyDF499f8FKuE82PCbXLI6zwDogf43O0pDE7KeGWT2cFU15KduxMriqf/CZqEMgQxlDossGkKp+DTA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwlXP72zQAatskE1dp+MEc7cxG628ISADPQvKZWCSBDI13hu5Q8
	WopMoaLcq4GKr+HLswFi1w2Y4tJwk8oySgjIb5HCAJO+Lj9iGDo6cQPmQbBjSo9n0Q/uSA7AZL9
	sxoD9iLZE5yV8+5bb9V6j5eRHnJBigvE=
X-Gm-Gg: ASbGncvn2gB72kqAbz07QUOwX4ywN58fRMszMWol+6SNxkDYC1sG+L0TDdgguFnp0TF
	pyZ68oREYw0/qyHQqAI4dOfBxz43R509hv/X1kCcVBBsuG5cRPjTiU201VOuA9ksbMXa2L+UnMd
	xO9qyf36kjC3O3Ybe8kEFW14Wvefgrg+2rwLCbxJtNWleC4Yn59eH2QieZ1ONK6AvIiTbpA0YwF
	53xGsXm
X-Google-Smtp-Source: AGHT+IG+y6U2HPtJWiJ06zINgKFsCV3h5cNmzOdYimKubd6x0uYI1nvJ7cf5K8syyZNEK08ri4tKiPSTOpp4XlvA7nY=
X-Received: by 2002:a05:6402:520a:b0:633:8c43:eff8 with SMTP id
 4fb4d7f45d1cf-63467a15e4cmr3129540a12.36.1758656083579; Tue, 23 Sep 2025
 12:34:43 -0700 (PDT)
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
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com> <20250923171819.GM10800@unreal>
In-Reply-To: <20250923171819.GM10800@unreal>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 23 Sep 2025 21:34:31 +0200
X-Gm-Features: AS18NWB41C3D5JsYFHuNFW-M81tws8xiK0mHlB-cBnQqvONalyjABahoz4jqIPg
Message-ID: <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Jason Gunthorpe <jgg@nvidia.com>, 
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

>
> I will try to setup Alpha architecture in QEMU in following days, but
> would like to ask first. Did you test alpha on clean v6.17-rc5 (without
> my patches) as a reference?
>
I'm running now on a fresh git pull from today so it's more like a
6.17-rc7. So no problems running the latest git at least.  I can
dig deeper into this to see if we can figure this one out. First
of all, is this alpha specific?

Regards

Magnus

