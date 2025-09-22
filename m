Return-Path: <linuxppc-dev+bounces-12527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0DB93510
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 23:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVwbG2rZyz2yxN;
	Tue, 23 Sep 2025 07:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758575066;
	cv=none; b=PO4Mgdxcqt81/mnv1U6HWQAzZ8pW3BptfmF4j226qMoya127MJ8S4QYrVcrhI4jgXb5HdRnC0WsN309U9nygtKnGMXwmXzYEx3UjPO6EqSuVXevCXuZIHoXc31zVVcJAqki8Af8htIvfyiBWs882zp7CqHMlRz6jfo1rPWhaV4bOg9H2EyqeTjJvSDaiFwhmL8xzJmUl9UJp/FxwOxh6/MPFS6sRiT5hx6p8kXDlvDz0kYT4/SxACMb7Gl6J4z6tPsYDIdqPoOz3qv/y3XHKkpK7aZXWgNFTIiB9wC6v7CVt3zRfukm8TeWrRTIF8OCpz9vNld/glxItN6ZKN3dUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758575066; c=relaxed/relaxed;
	bh=uh7Hyul+h5lwAcNtxj/DI9qojjFccIciQ/b88SlaL0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etP838pMvW6stP5IxJhCxwwedvhyHIvbLCp8LKcWC2Mg9dhZVRPzLXqvFEfkTCa5jBcXjaeW26N+o998KxpC/p1V4g9ufVnnOVnTUHp9FJlEKCHfXGVdz8gL4J4XDbKf9MXD7bNNh8SwO2wlffAJGp6w/fUJ6TiC+uVaUL9Djiow36tCWcpaCT6WnFmHGEV18V0vqkpVk7M+i9y0JMmEukcIrFAEPckGae4VBzH+/jt/w8v3w06wIVeA5mXO7OrbqSY/7oI8UxzPjEnUpXoJSpc9HofaWeuhHT2/VyWat55IAbctK/gAvQntvyDx0HpRNFCd1F6V8LX5i1zhlG3AEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NhyvcXCL; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NhyvcXCL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVwbD4g8Lz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 07:04:23 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b07883a5feeso972314666b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 14:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758575058; x=1759179858; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uh7Hyul+h5lwAcNtxj/DI9qojjFccIciQ/b88SlaL0g=;
        b=NhyvcXCLtpF7u3CFtlLl0b3xEEZtFTXNSRDWcjP5DvNTmsTyGjhh1RZpe+GYt9ZmT4
         gI/QTNnedtaBa91xMaofiupgwZgwSTlkG1FMAJhp4H1HzESneHRTEIwC5TZfLAiqYC0L
         48jz+ovhodm0S+zey8RoaKKzGKcqabcXbqhK7MwzerdTGMlbBbkWbx8CiMRXRf5u2+tC
         Rn9ey/a2x3BzwoT/UEYfbzCQytOG9jPASsKgsT9AK5Vj1sFT2O5m5tnppGMQukNbUiqt
         x7jJ0t35ZFXbJlF9Gn+12A9GwiYxcGr6LMtKLv09lG8TJwtuDIc+P/h/DVR7rVa1PqyZ
         UA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758575058; x=1759179858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uh7Hyul+h5lwAcNtxj/DI9qojjFccIciQ/b88SlaL0g=;
        b=WvTE9rsRWkfhkeHAqkwgFI99UsCNxtORncpY8vCUq05C6MJLryW+UOEAEBsfqjUDei
         AdAKiYGQuPpyp1t2LjjoaiJ4/D+4qEc5WqO1r/zN1pS4kCHBlTivs2P/GYSZgoG/ae4w
         VTvLaGaiJX1pWXqUPPBS4jroRjULjjq6Ys/NLa6+k7eodbWI9K+8RYpufJrUtrJfYFqC
         X+E128hLg72lYxyQ5tCNgna9VZxgNlkLJRxwJBZsc0QIF663kSz1V+6yZQYoAC90qAOK
         +KJ+KsQiiqYfVFnpt8psJm3SIrm39fKh0AbempMG3661EJLc0Sxy7OKeoKF5vbbeByLW
         SkBg==
X-Forwarded-Encrypted: i=1; AJvYcCXw8zfzwTcA8R5ssWIofoROpan6C9amLcjO9KFnXqfbnHPEZ9f1+UPs8tq3XbB1gmPshTcyg+UB2/Z8zRw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzgcrHAcRvC8ETKKfqEyCavqouQh8hN9/Ez2ohGjYpV+B+wC5St
	immAzIKPKyy4TFiOvobdwLvmAHHmhSH/PimBsDWW7cr0RLWzbRySBAJO3NXwq/kRcOjc5ro5KDK
	sHy8p0e0sVMh//7iwqT6tV2ugqSm1VMI=
X-Gm-Gg: ASbGnct1orS6VUr+JmMF4BLzRO+c+OwBRSWwqCjlBtedJilNdGamklBXNPXPvKJrsPg
	h9ZENdKp/SsaHfB9AnkPjVwp4oSCdEdj+bdy4uvibnqlxCi1GiLUJZzyG8Zh6shxt0TFJwNVjpK
	JxyV8q+AphA46bK6c2HQYWzISkH4OrI9wsN8O58QZOXHVpvcbz/+HiCVPZgvc7fNu3Ea3CtQYiz
	s/Ir1BdDdZqGIvRkZU=
X-Google-Smtp-Source: AGHT+IFr06URzpJ6aUp4DpRFc3gqIF/QKzvPatkXOguRNAK+5vyBht27Wi77YYUi7cw/QJFO8eHWzN6Nc8/pR3lh7aU=
X-Received: by 2002:a17:907:72cb:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-b3026c84e0cmr5356866b.20.1758575058272; Mon, 22 Sep 2025
 14:04:18 -0700 (PDT)
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
In-Reply-To: <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 22 Sep 2025 23:04:06 +0200
X-Gm-Features: AS18NWDVFMZZnWEreuo7vPXyYUB8RQkWA0R_TESbZnVi7LcEMvax5dEHcVzVJVI
Message-ID: <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 18, 2025 at 8:45=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Alpha doesn't need struct *page and can perform mapping based on
> physical addresses. So convert it to implement new .map_phys callback.


Hi,

SInce this patch affects the Alpha platform I got curious and decided to
try it out. The patch series requires some preparatory patches. Leon
provided me with links to his dmabuf-vfio branch, which had the
patches (and some prerequisite stuff) applied already.

Based on the dmabuf-vfio branch,  I've built a kernel and tested it on
my ES40 Alphaserver, the kernel booted fine but after a while of
moderate filesystem load I started seeing some ext3/4 related error
messages in the system logs. Rebooting with my old kernel into
single user mode, I was able to recover the filesystem using fsck.
Clearly this set of patches breaks things (at least on Alpha).

I haven't yet dug any deeper into the root causes of the file system
corruptions and I've only tested this on Alpha, maybe there has been
more testing done on other platforms targeted by this set
of patches?

Regards

Magnus Lindholm

