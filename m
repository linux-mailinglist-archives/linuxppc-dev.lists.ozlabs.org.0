Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC993723FF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 02:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ1X056W4z30Cw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 10:52:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=j+CbEzdp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=j+CbEzdp; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ1WS4tg5z2xZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 10:51:46 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id z1so3644078qvo.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 17:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BD6oI9QMSEl3O7sK0NnHHh4nWeEXZNHTKIBlo6AseEQ=;
 b=j+CbEzdpjS/N3FzdpyeI37Ps/sQxoOhpsk2tly6APhXyA87kUDYEKdF0gLC8Sqn5vy
 Qz09Um4CG7B64pvM8TYZvCkV3nba1AuCot9hvmrp7HR5cKl0N3r0+Ud5SPzifWiydwxe
 LT2WhduJVokTkDehFrErwllUo+nz2QNxigggU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BD6oI9QMSEl3O7sK0NnHHh4nWeEXZNHTKIBlo6AseEQ=;
 b=PZk573mJwZD2MFdit8IKRIfXyrXiU5yBmJF5VMdUY97Jdm6rew58M9qJIF5MTj+Y6E
 xodbrz3XhbBeQehLfUnZGt8wCKe6o29M8pjBbx3ZimZKqgQxztHNKlrU9JurlEYbfqJI
 5jImK4ScHw4x5lMAfNztlnUP1psRua2f/N0B3gPtTyFdy0t1QrQkmoJKDIcBhpDhnWg4
 HYwV51otRcKZ7nfh+oshuEr+hmX2W7+uG+yPfeyDE1YdhepCnP6xzO3VEIotIXEkFzfg
 eifz92L6N111jso38qDnFKAGYnLklhe/xrBmpoA8uCqkjCXjNsf52X7HmP8gw+vTrAeH
 meXQ==
X-Gm-Message-State: AOAM532P5oYX+M4+QkN34aYGg7KGJHJCn/4oHX4wGR/j4cLoDyPqp7VY
 fYkdAuBgiVSJYEeqC1sAnHoanbr2eLD3+iMMdCM=
X-Google-Smtp-Source: ABdhPJwZUwnkdB53UppxwCbl6+6eeA0mRBr1P7V4sPJfRw9uW6r+SMzJtpgs4EQ77rv+djDotW7j+Z4WZjCnLvLsMz0=
X-Received: by 2002:ad4:4ee4:: with SMTP id dv4mr18576224qvb.10.1620089499359; 
 Mon, 03 May 2021 17:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210503130243.891868-1-npiggin@gmail.com>
 <20210503130243.891868-5-npiggin@gmail.com>
In-Reply-To: <20210503130243.891868-5-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 May 2021 00:51:26 +0000
Message-ID: <CACPK8XekEXgqA1bML6A+NbsshzsLe+pLTzGJzRLdC+QKrV5T9Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] powerpc/powernv: Remove POWER9 PVR version check for
 entry and uaccess flushes
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 3 May 2021 at 13:04, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> These aren't necessarily POWER9 only, and it's not to say some new
> vulnerability may not get discovered on other processors for which
> we would like the flexibility of having the workaround enabled by
> firmware.
>
> Remove the restriction that they only apply to POWER9.

I was wondering how these worked which led me to reviewing your patch.
From what I could see, these are enabled by default (SEC_FTR_DEFAULT
in arch/powerpc/include/asm/security_features.h), so unless all
non-POWER9 machines have set the "please don't" bit in their firmware
this patch will enable the feature for those machines. Is that what
you wanted?

>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/setup.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
> index a8db3f153063..6ec67223f8c7 100644
> --- a/arch/powerpc/platforms/powernv/setup.c
> +++ b/arch/powerpc/platforms/powernv/setup.c
> @@ -122,15 +122,6 @@ static void pnv_setup_security_mitigations(void)
>                         type = L1D_FLUSH_ORI;
>         }
>
> -       /*
> -        * If we are non-Power9 bare metal, we don't need to flush on kernel
> -        * entry or after user access: they fix a P9 specific vulnerability.
> -        */
> -       if (!pvr_version_is(PVR_POWER9)) {
> -               security_ftr_clear(SEC_FTR_L1D_FLUSH_ENTRY);
> -               security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
> -       }
> -
>         enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) && \
>                  (security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR)   || \
>                   security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV));
> --
> 2.23.0
>
