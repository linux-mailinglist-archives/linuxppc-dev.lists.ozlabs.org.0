Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD474EB6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 12:04:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NyI0NAaM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0c113hc7z3c2S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 20:04:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NyI0NAaM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0c053C36z30JF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 20:03:47 +1000 (AEST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1b05d63080cso5117761fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689069818; x=1691661818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+EdWg+i/tz1eYpH9ck9/qmxGmzdGcH8THqJbinUddk=;
        b=NyI0NAaMqg06KA6hwBSQgBEB85LCB8gClAXi9s9KdtyJxX2aBORKelElCulIdppHS6
         B2KpbjTxVS2+wUc9g/u+o+ZwR99AGXRU021BosfNDYuk/lbxfTcwf4poeCIl1pjSfmvJ
         5jkEpuK/djrhv1A7k5tWeHiTtBppXhqwoEPSSNpCFuvfRbFDru0owVW8nZGMH4e28CJA
         37otT/of6vfb688RtJjgE4uuPquRo2iO+FPZYJPBc0xkoWD8nJuSeik7gJXt88UxhuU5
         ynGI8Mdwz40F9nADl3/OzgmP0F+m9xzz5dHEj+Nekn9xjmNXbRk7FYYufVHEanQb1xEP
         DNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689069818; x=1691661818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+EdWg+i/tz1eYpH9ck9/qmxGmzdGcH8THqJbinUddk=;
        b=Via5P0HFKZaoiQDseOonx3B12tE6dR69fQbUVFcHk+KHn5veRQQae/zLb2JfR9WC7h
         3wJpLB1AmOEGoQJP+xcXD5STjQMAbcJEidLF9n/z4BxAytd2qATuYQ9Xndrhl/P6dfEO
         TWttqeNLb8a5y1AZZXR4PGEZmwGGtqj8c4qAsabrV74KS1InyTg4RiHOgWz8yvSSreCu
         HezkkNZQAvwRdc5ZBI+O6xfC6ElY45OUUL3rOrooj8mBP9G8KuN/0UUpfXPlne0nKK87
         dRUc8TklrBW6V7ocD5M1moFRQ8bll2HyR6kGn2qd3PzmZo5PG99vNUtKitAxLbSIZLM+
         rwyQ==
X-Gm-Message-State: ABy/qLYL4vhzO9vOFZElfGqsMWMKOKR6NnLCcfOEaRSEMV9NHWn3PJR6
	zlUYWkfV/T5acUuHrwiacbxHOytCVEx0ivTZk/E=
X-Google-Smtp-Source: APBJJlGGsUuf+V3qoT11Pogf+mqcTAutGtQX8L+sFbR9xMxcqCOg1dWiYkpNfhV8TDJxJAkM3OI/WYW3QCrNv2zauGo=
X-Received: by 2002:a05:6870:420f:b0:1a5:4e57:e5d1 with SMTP id
 u15-20020a056870420f00b001a54e57e5d1mr19457972oac.49.1689069818163; Tue, 11
 Jul 2023 03:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710130113.14563-10-tzimmermann@suse.de>
 <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
 <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de> <CANiq72kPh2KE=ADUxhPyyr7noWhC0fkzmDu8EBn_20focnZqtw@mail.gmail.com>
 <745347ca-a369-eb01-eac4-75c09cf9e67f@suse.de>
In-Reply-To: <745347ca-a369-eb01-eac4-75c09cf9e67f@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Jul 2023 12:03:27 +0200
Message-ID: <CANiq72kg_2PxmSnyj_X7Rak0-fmPP+W-+2EKFjyXCetw7w+mGA@mail.gmail.com>
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>, deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, javierm@redhat.com, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 8:10=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> I'd like to take the patchset into drm-misc. It's part of a larger
> cleanup of the fbdev modules and its interfaces.

Sounds good, thanks!

Cheers,
Miguel
