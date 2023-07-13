Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E483C752388
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 15:22:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eshePJRx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1wJX5qDJz3cTN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 23:22:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eshePJRx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1wHd0QGgz3c3M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 23:21:48 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-392116b8f31so585828b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689254505; x=1691846505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMl5dn5Xz12gXOMX3oC+kNdFlWhzCPfH45LFdGwDg+c=;
        b=eshePJRxBGfoEbxv/HATy/LbMrzsCDpyAiPdPWKP2+7M1zJL3N5KwDGRakUw3RzP4p
         q0Cnwz0fdaQ+HyxVhl+a/PdVIYgV40UvVYeo6oku2ew3IT0bTt6UYAHjOIS6Vb6t9Mla
         Zj8EL/FlPFPvHB5g71aE7gFP3zFqlG9d7Fbu8m/nhV/T9INJD8alH0sgU2iXPleyzim5
         lINS3JcD7J0TOIOFW4pf/x8/SEpIIASy3dTyyqXfKshxdSJS0TlF/u7bPTHA+oWf2AYl
         SPCY6gZL7ykEOqi+bfIKlTKf4FRPiV/L6IcHOgev/4QAZK/gwKYWQ5RBFTfBsMThGpXg
         EmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689254505; x=1691846505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMl5dn5Xz12gXOMX3oC+kNdFlWhzCPfH45LFdGwDg+c=;
        b=V2crjwW849aURCA9PLOAsCN/yrw1DHZoiw9z7m5bYgcmBXXSdQhI+9qrkYfzznEiIv
         R0d0Hns0tB7P8kIu9nIru5QvdvU1nyE+EPEEMdTq8TuxVnnrDbm3IKRg6o2J2fU72PWV
         zYUflJLqhmpCGC9fCJ4IfazTVd3fexAGM0AZPq7lADXbiVQpJODwMe27sFhl/Lm6JKOK
         EvVu3eSPpT4oZ8tc9FnZArxtaNG8qZ/11v4LFOFoxtcl1sM/AOn3vd0/kooHBezyRzyj
         wX2WG9bhdviJwv7GUilV2l3fRoJ97BRnSkKjEC/VgEaodew1RbvD9cUGMfYsxIB3gOZf
         m7wg==
X-Gm-Message-State: ABy/qLZ7euurfVz0fL0962A+zqzHjqwUzbCjaLz+IaRWQKjG32EQ6LB8
	/qebCC4Vkkc5Cslj/IXXoN2xUSQBzEviXv2QGCg=
X-Google-Smtp-Source: APBJJlG+0WtfiM+r2sXZzO6HNFK4R91MA9ooy29hXDBdzlOr5q/1lWHuWptQzwph8RqHPwzWZYnIoYS2ozC9kDF6TM8=
X-Received: by 2002:a05:6358:428e:b0:135:5934:2bba with SMTP id
 s14-20020a056358428e00b0013559342bbamr2356344rwc.8.1689254505432; Thu, 13 Jul
 2023 06:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230713130338.31086-1-tzimmermann@suse.de> <20230713130338.31086-19-tzimmermann@suse.de>
In-Reply-To: <20230713130338.31086-19-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Jul 2023 15:21:34 +0200
Message-ID: <CANiq72mbLmMKph8aiz4apNF9n3MtVO-nhM9rEWYApZbSVAO9Qw@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] fbdev: Document that framebuffer_alloc() returns
 zero'ed data
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, javierm@redhat.com, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 13, 2023 at 3:03=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Most fbdev drivers depend on framebuffer_alloc() to initialize the
> allocated memory to 0. Document this guarantee.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>

Thanks for sending this! Maybe this would be best earlier in the
series, so that later patches make more sense (since they use the
guarantee), but it is not a big deal.

> + * aligned to sizeof(long). Both, the instance of struct fb_info and
> + * the driver private data, are cleared to zero.

I think both commas may be best omitted (but I am not a native speaker).

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
