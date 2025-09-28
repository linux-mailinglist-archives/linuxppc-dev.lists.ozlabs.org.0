Return-Path: <linuxppc-dev+bounces-12611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3605BA7596
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 19:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZWh83f0Yz3cYR;
	Mon, 29 Sep 2025 03:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759080968;
	cv=none; b=n1e2ULzFaTSXmve2qKWC6p6qotqcJDRtOK6xKP0kYmZMaOAARAWSOzPC3QSOs8SG9mH1Ie3frYB+d/3qtH/0XyYAj7P+AsvLKowfrfsDKL57zz/CtuJw/o86JycX5jW+kAOVWJo1P0vpF4aNNfpUFq5B6noQrOhJkMWEDCdJ9lA3mowrPh3ehh0DWab5INKKKds6gsTqy4zigM5Lxpa/hKXRDIqWdjbdGjeEDC6+o7nRY4TXgpAGN9uoT2x3TWDvbu0mc+feeuVd6WEmSloCgFVuvvp2Z6uXdl9UDaUW08Qg/h9S61LBwN2CQZOaKuZGwYQwqnnDRXKUghKPlRNJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759080968; c=relaxed/relaxed;
	bh=1hWHgpM/rb70qd87juqmeSrMZFHqG1itquQCJwHGhEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEw3GzjfyNhYojce+btEwbTCUC9MtsoT+j8tow7JRko2fedme/gJEypmbTilraAQXXhiIi3qBqtInm3fNyjqPRU4iJlxsO3ySYbTANDNNvGPusGrk9uHIgnroGMi3PAzWLj6HzB0av7eFGQ+x0p6N8X4jhwW6NSYRatRdJo5JpKfFrdvtvl8XQUjgIicCHKMmp5LJiiN9+H6BX9YaYN/op7gAyZEc47k5WOtD/ihCDc0XqUkT6+lRSxf/QG2bvpo383E9Zjgo8stgUJANstkz7riawxylL3zWl/KqG+2XDWh+EonmixeqgAFejGTd9nhTbFFmZCaQy47oZZ6m2M7Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=llFNvafX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=llFNvafX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZWh22mD1z2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 03:36:01 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso2611731a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Sep 2025 10:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759080955; x=1759685755; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hWHgpM/rb70qd87juqmeSrMZFHqG1itquQCJwHGhEk=;
        b=llFNvafX4XE0jRD5H/CgYmVDxqwymb2XzVqlRTrQus79No6AwQbCWgn4KTy6mk7trf
         5cA78Y5P7D7ugFg6I1AI+BY+FFaMd1Kq52d8yA+8z/dRDou5KzkQVag6QIeoe8R3It2r
         8nPY5AWXWVEh+yqFY8AxsUMibCMYkCGX9qNEo7q0TKapsIuHJJiDnTOTOpt2JYXozFS2
         sqBMAkBSPT4SbRVOn5+t0NV3Ojzmuq7fui0N81W7/wNnWf9/rQ9Hgy4R6OCy6NyRNAQW
         eE11VHXp8MsLH6wEs/HoVijAPQo50OEniF1GK6UoCaFU8pWe3v1tANSHXI+raK3o8OLS
         b0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759080955; x=1759685755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hWHgpM/rb70qd87juqmeSrMZFHqG1itquQCJwHGhEk=;
        b=WzJUpvfRhLa0b2SRbGjTbqLqaWWUjKz7EigLHB+drJs7fIHI8GAwB7nJrXCTZwGaFS
         OyC1BvKeCbiif+6tvDwuT6iQ0fc7q+x5xwPqK5npnF1zbncD3dyMn8hQ1kzKDYn8D9rS
         NoA6GpXhD9jhiD4VjlGeFJ1SGxqgi1BoyeVuxw8zabmEMZR20mGslPSXDb6A1NNEy/Ev
         H1gbjw2igCkFeLO5S8gCCpHSDku2kP8JgKkXqT/YJXnL1zdvH3NrdpOwPf1RFQc22HGB
         54wQdQhm1bRjCtj3qc0rV9WLkQgCRK0Bq/lCxaLTndIos2/UGh4s14jLYWUReEYRSs1k
         CkNg==
X-Forwarded-Encrypted: i=1; AJvYcCXbxer/Q59F01cV0qou0OeJiBLYp1rd7lBY4H4xDBBsgXBZIc2tULGy5n+mwYaS4SJKN95woUIzXQ3hNQI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlMdcUEofrGBJ+yvsSzbCMaPso1/jZQE/nUWcUDWDiCIXDNb87
	kdBfaTGwhPV+xcKkkAuID3wVQQZvLrh7m/9cEnXisLt1mJM+dTyvOT/PCUAyrz+0GC/i7mwaK6G
	0ewm56RbIRFwFIK+Oiq3Yn+kVLgPLFSI=
X-Gm-Gg: ASbGncvQJBEKhk/ajSaoCXt/XPuGwHnq78NLosw40Cdo0utnElLAYZ8DHbTGEl2lj0r
	SvVT23JfM0dYtYD+63fnTQ6uxdfApvtOAuav4BYm9i+354I+L+VyVcvmh7qV5oDmN+TQ8ezG0rn
	uqCSOVcvHSf9f+UXdt8xqdvnKWstfy/Y9/y25PQIDv94R905uYlc5nAWCq367Yvl4bMejIEXydr
	ujlMj0o55hzohYcpMI=
X-Google-Smtp-Source: AGHT+IF4LtUw7v9U/JYoQT0Wh7nzvSFhJ3UqproTerTY3SiJCa0Vl/rRvk3JMudUZqWnlv9RN4X9SRqdzNlv4OAcKN8=
X-Received: by 2002:a05:6402:352:b0:62f:453c:7235 with SMTP id
 4fb4d7f45d1cf-634ce845b9amr4127811a12.15.1759080955040; Sun, 28 Sep 2025
 10:35:55 -0700 (PDT)
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
References: <cover.1759071169.git.leon@kernel.org> <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
In-Reply-To: <512d4c498103fcfccd8c60ce1982cd961434d30b.1759071169.git.leon@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 19:35:43 +0200
X-Gm-Features: AS18NWBtQV3w4fhUJT0qJjc42RZ2Y4lnsCSX8_2AFcicJQutzVlCWs2uQTVZ_oE
Message-ID: <CA+=Fv5SzdR4=NXz68gRg0iXY-6Y=GRsO24UA-DF4tuyJ8r7w7Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] alpha: Convert mapping routine to rely on physical address
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

On Sun, Sep 28, 2025 at 5:02=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Alpha doesn't need struct *page and can perform mapping based on
> physical addresses. So convert it to implement new .map_phys callback.
>
> As part of this change, remove useless BUG_ON() as DMA mapping layer
> ensures that right direction is provided.

After the changes in v1 this runs fine on Alpha. I've tested this on an
ES40 Alphaserver during load (build kernel and unpack tar files).
The v1 patch fixes the errors seen in the first revision of this patch.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

