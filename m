Return-Path: <linuxppc-dev+bounces-1140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A14970008
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2024 06:52:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X111L2z85z2yfj;
	Sat,  7 Sep 2024 14:52:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725673028;
	cv=none; b=ZLoDDe7Z8f3HbaI/vPsNLqsYB3bbdCUj+TmmWDH59zSt8Tv+aRg+xUI/xZB8DF7QTZlJLE/52RTK3+nuWta9FDc990tLskdJryIQSFqw9wtjgYzgdgew4hi0cVDv7AW7Nz/tvvthc281YjoBzkCJbkCsgB+4zx3GZAuApxqTMzYXUfHPlisIYX2RKOJtcB/wc9p13NUUbgtP+gAhXE4r9wwz4XcvH717n/Zpl6YAfFlPdx3+x5G6NOveRzg4jcUGsb1bS+pEQSgl0HidWgN+oQp9OLeYApbic7LO7t5ZIwDaOW5X+2I0kkJrsU0cvzcKJtupUBbL7UHiu2A0XMMXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725673028; c=relaxed/relaxed;
	bh=aUAh66u18yZqVcGU/SfKdY2rCCidwdXVDKvY/bEyf10=;
	h=DKIM-Signature:DKIM-Signature:MIME-Version:References:In-Reply-To:
	 From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ooCLRFLfc/dGIpTlO4HiFo/hZQrckA+mvk1NgDZj7LtCtYIex2+anpUyRgiYBURUKc9UFRr3rNdTm6MoAhpwHzB8GKVkkR5AyWJPbt1ReKCJftPiVkzZrHliAgAbNNH/bIZiag8p7fEnq5NvkZIgX1rM1RKx85DwngJSe8BD6j4MfQmRTl0lAhBE7nsHZyGMrsu6SAPYmYaRLxmGK9bAGi3qVV+nbZecEn9ECfW2ByAR8+MBmOD1gMOr7aNkjot69yfvOyGjAzANZ08l0W24XKmtZpru1uxfj5gxVGoib3bRpTn4jjkdzFzWHj5exppL5MShp2a2i2MsrAOYV8SSLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NqagYuTB; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NqagYuTB; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=minlei@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NqagYuTB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NqagYuTB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=minlei@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0wgm229Zz2y8t
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 11:37:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725673019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUAh66u18yZqVcGU/SfKdY2rCCidwdXVDKvY/bEyf10=;
	b=NqagYuTBWj2SLnEirA5jiKBRvbRuKJA6llR9JxCiKNBuh0s2YEy/yZflgFbEveixqMQPNw
	mT6cgAu9qRxAaWqlm/cYNBuAsiYD/EUuaye4K1o8qChKt1jEwsb8uylTZw2+9PJ2U+2/LF
	xu/ktch9TdXvYqnmwh5wWyODP0HMP/U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725673019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUAh66u18yZqVcGU/SfKdY2rCCidwdXVDKvY/bEyf10=;
	b=NqagYuTBWj2SLnEirA5jiKBRvbRuKJA6llR9JxCiKNBuh0s2YEy/yZflgFbEveixqMQPNw
	mT6cgAu9qRxAaWqlm/cYNBuAsiYD/EUuaye4K1o8qChKt1jEwsb8uylTZw2+9PJ2U+2/LF
	xu/ktch9TdXvYqnmwh5wWyODP0HMP/U=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-SPh7-d4qM5iGbKy3Kza3XQ-1; Fri, 06 Sep 2024 21:36:57 -0400
X-MC-Unique: SPh7-d4qM5iGbKy3Kza3XQ-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-49bdc9fa3eeso616501137.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2024 18:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725673017; x=1726277817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUAh66u18yZqVcGU/SfKdY2rCCidwdXVDKvY/bEyf10=;
        b=RdOPaNL75X58y0cQXrkepz2lNULAY0gBSdgcX4F2ZthgDsRk31k4cyx0llsPnoKmcc
         MITn8bw+XAjt1wsmuFsZA5+sdZ3b53EUKGc5Z+enHyIzxQq78TCLP05QrM85TEyQzqgS
         rQ3h6d7XPc8Ao86qAMvdkkHjtUAXWMEfIQPMu+zoPUz4AuNZl6S4ZLQtqUzRWoOOVPYt
         h6U403oI3xaQPOzyr2TPzsgjPS/+oMa0LEQoo4uXAiIbJA8QuJpkrp624n3kyadcglTj
         w7//6psA2G+WJKnjIeQl8RGst2lzFE7p6EJFJHZPWNJbgIaTt6yVJbRHYH9YN2mzJO+l
         9GOA==
X-Forwarded-Encrypted: i=1; AJvYcCW9yKtlzeu8N3HmVeIlJv9c0yjX2GenNY7lvlWbq6wuBARTdw8q0em9bMVxDoJrh7HDdhKAHT5Xn5oT6jA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJQ3AXsn8BJYMJbdIgxXsKQVmBs3mMdsvKYKxF24CnFgfQI7oH
	VhRqpRxOGMIx5la3gzPEeqMPDanmYR9306mSy5J36VipSs15s5fgHE+RClfAd+SWrQb5w/Womcx
	PAtmlNbIrFaF2+mr3zUVED6yzhVeEzeqTwv759LYeEcjW7Q8gdpf4aCl6MsQkFVrGlZFLKvhQ6H
	GqgsQ6b1mf9iHF5tQ705PkvoS3tDR/2ejYl73S7w==
X-Received: by 2002:a05:6102:3ec6:b0:493:effa:e721 with SMTP id ada2fe7eead31-49bde2eabf3mr5698691137.27.1725673017014;
        Fri, 06 Sep 2024 18:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+YqWeP+1a0zNpj9U4DtEaZ2NfnITUQpG1RUgzpmtbvOkDbAmqnJSxayXCQ5xY8mwozaogNP4TDnANrW8B4dQ=
X-Received: by 2002:a05:6102:3ec6:b0:493:effa:e721 with SMTP id
 ada2fe7eead31-49bde2eabf3mr5698669137.27.1725673016557; Fri, 06 Sep 2024
 18:36:56 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240906174941.1147197-2-costa.shul@redhat.com>
In-Reply-To: <20240906174941.1147197-2-costa.shul@redhat.com>
From: Ming Lei <ming.lei@redhat.com>
Date: Sat, 7 Sep 2024 09:36:45 +0800
Message-ID: <CAFj5m9KbZyeM+0h_d=KqGC5B9Vj2OOuHvdhzLXexLkctWtzKhA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/xive: Use cpumask_intersects()
To: Costa Shulyupin <costa.shul@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 1:50=E2=80=AFAM Costa Shulyupin <costa.shul@redhat.c=
om> wrote:
>
> Replace `cpumask_any_and(a, b) >=3D nr_cpu_ids`
> with the more readable `!cpumask_intersects(a, b)`.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  arch/powerpc/sysdev/xive/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index fa01818c1972c..a6c388bdf5d08 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -726,7 +726,7 @@ static int xive_irq_set_affinity(struct irq_data *d,
>         pr_debug("%s: irq %d/0x%x\n", __func__, d->irq, hw_irq);
>
>         /* Is this valid ? */
> -       if (cpumask_any_and(cpumask, cpu_online_mask) >=3D nr_cpu_ids)
> +       if (!cpumask_intersects(cpumask, cpu_online_mask))
>                 return -EINVAL;

Reviewed-by: Ming Lei <ming.lei@redhat.com>


