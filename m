Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C10686CC28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 15:54:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=twGBlCRo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlvPh6TnPz3vbs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 01:54:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=twGBlCRo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlvNz29Yfz3dX1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 01:53:38 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-566b160f6eeso4324a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709218415; x=1709823215; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjXfEXjWPxF9nrfNVxhijA+unmpBjjqeq7wHcW/wKmI=;
        b=twGBlCRoIeeX9QKLrfUu661nv08dYp9vjKfLUxegd0R++G5wCR6K8FrmnsPKdPNvgj
         ZQE8edWpidzJf7Pfbzwvvuoen4I9h94TNigmTk3/Lonvs8n7Z/FtLmTBeyvhIIvmA/ZQ
         KB9vFXYpSEMc8kuMzQpqW0hfB//FXTGb0bsmlImPx1sXz71/lP1dB8tppBYthzsRQCA3
         WI4wxlCeMM+56kGJYU2iRWjTYSQpF6Vxjpdi3boceG44vfMF3LS8L+MQ6nQHWhYXP2f8
         ssd50PW7N210JXfq6XW+Z/T+rSup9B9OR4CPpOGQi6Q1pRpVPF3BvYGohurlmG+Si7XX
         iIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709218415; x=1709823215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjXfEXjWPxF9nrfNVxhijA+unmpBjjqeq7wHcW/wKmI=;
        b=F37g8fm5ShG0Rv/Pf8XSKN/hkzpsLHzj2VJOQQ3i7NetqdcnWcoEVPrTbgz/N1keFz
         z9Cr0EOxklaV7Yzr8EPwvDFnrFZolPGPXLYbE5JjTmfSIeEwLGYhecnyneuldNhIZHaM
         Seu8GA5UMk4C/ZgHncVe4IxK/kYbAjS0ETng/GCW4Y1dP0AKdba89ksnQ4tyejqtYE/L
         PLsAjBp2c9JE3NZDHsh8FGgJ3KIgVYtQuYbuXuyABQhVPhBxEUw0+EHpDmIPQ3v29RA+
         WQhgofn6OV+1Iu7qSI70lZV042P/yLm/2ux8NO8Y+FzGkwG0bhiHBWnuIsrselqVD9pn
         ZjUw==
X-Forwarded-Encrypted: i=1; AJvYcCXkJbVWJCEU7A/Ri87q6el7Y8Y8xP88T3QnPZ8G7jy7e2yaksHRlgDJCRDpYObPjrksqHETzNlA0ggYOFLOsXhVvmqUr5y7RNaauTIlEQ==
X-Gm-Message-State: AOJu0Yx7AHpfqidpsF6Te+UQp4H+5oDdAAaua/36rbX3ULiJ3PF2GFln
	43oQoOqQyQOiURCEgipM8Yfw7OqZkScWd6+AgTj8lprryQsnV8lbERt4wEh40JFKNqcDEu79ZoQ
	1MioRtI1hCmlVT7QSdXhzYtmE1DAZGtfE5wCr
X-Google-Smtp-Source: AGHT+IEZV/CwnlUEXnUq8RH7UeUwmSHrvKIi+bsCc+9wFC9WW10SxtgPDjqNPOwfhuvZ2/EUb+ZEwFWmhqvhYTDHURU=
X-Received: by 2002:a05:6402:5206:b0:565:733d:2b30 with SMTP id
 s6-20020a056402520600b00565733d2b30mr154850edd.4.1709218414670; Thu, 29 Feb
 2024 06:53:34 -0800 (PST)
MIME-Version: 1.0
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
 <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev> <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
 <a1fdd2c2-4443-458e-86db-280e7cbd4a36@linux.vnet.ibm.com> <CANn89iKdaMFCKnGRL4ffnbyrr2PUaKn1hoiu4VZ=sRyX=Vy0Wg@mail.gmail.com>
 <20240229064742.36c2f476@kernel.org>
In-Reply-To: <20240229064742.36c2f476@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 29 Feb 2024 15:53:20 +0100
Message-ID: <CANn89i+4Q2L7Gd5zGrSwT_v2wjL-ZKEFcM=oQ9w090+xc57HTQ@mail.gmail.com>
Subject: Re: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
To: Jakub Kicinski <kuba@kernel.org>
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
Cc: venkat88@linux.vnet.ibm.com, Vadim Fedorenko <vadim.fedorenko@linux.dev>, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arkadiusz.kubalewski@intel.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, jiri@nvidia.com, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 3:47=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 29 Feb 2024 09:55:22 +0100 Eric Dumazet wrote:
> > I do not see other solution than this, otherwise we have to add more
> > pollution to include/linux/netdevice.h
>
> Right :(
>
> > diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> > index a9c973b92294bb110cf3cd336485972127b01b58..40797ea80bc6273cae6b777=
3d0a3e47459a72150
> > 100644
> > --- a/include/linux/netdevice.h
> > +++ b/include/linux/netdevice.h
> > @@ -2469,7 +2469,7 @@ struct net_device {
> >         struct devlink_port     *devlink_port;
> >
> >  #if IS_ENABLED(CONFIG_DPLL)
> > -       struct dpll_pin __rcu   *dpll_pin;
> > +       void __rcu *dpll_pin;
> >  #endif
>
> If DPLL wants to hide its type definitions the helpers must live
> in dpll? IOW move netdev_dpll_pin() to drivers/dpll/dpll_core.c

Oh for some reason I thought this stuff was a module.

Otherwise, why having dpll 'core' helpers in net/core/dev.c
