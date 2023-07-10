Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9EB74D8F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 16:25:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QzKFYEuE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R05rD61k8z3c2c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 00:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QzKFYEuE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R05qM2lHLz3bVG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 00:24:29 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-bd77424c886so5798659276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688999063; x=1691591063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfaw5NXpBN+ToDeNW38gue7dW1/lsMjnYJ8JVvMgX/M=;
        b=QzKFYEuEyJBmyVNrCTuM3xu2kiOzdJ733dpATnK2KIsTftxaxQrkFSHDoRvXkS62Q1
         ZzwxUIDQFUGUncjgMsGBUdc5tMOXaMH7dl8GnPzoL/6n9pZw09b0ZmaNjHrbLutDuZJh
         a/IGw3N3kW+LesbGXy/lgYCtStCtLi8WbADaDxdcgg/i72vh0e80Elo65bRMQQIf0Aii
         gN8CYJcj/oLYPQitrqhEbeCC8Dqly+59rFrVMMzcHkBCY8kPruGJfjOthtbaTFipQd0Y
         imjIM+aDF60N/+bSFzJQShrBYNXK2Y2WrWcLMYmFYY7kegF/rtNVJpKE8Vnnw/jKXqh9
         IERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688999063; x=1691591063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfaw5NXpBN+ToDeNW38gue7dW1/lsMjnYJ8JVvMgX/M=;
        b=S4cG1sIOCFI3YRGIV26iSUC8T+jy+5JLzuKi+lGT2AJaNepDV//tUcqCYpTsuF9xQG
         ROYKhcEKIiE9GQLh3ijLxZ+AEqtRenwi5iGS6qv4O1jrcssahBSta3kv7xEPYDIiW+Rv
         u/d8GvK3lee088ZOuZUu3poYLGuxCn+esFAwRnLR68ptEfm4IXxmsZ7JF8Fg/7dJxr5w
         ygqtEWhnSM55zjT73ynzAGX6y/TZFqTG/1mgOFUtMhm691L8bsKyf+y9ziY81Ouwi/5v
         lV4V6LXCVBF7rpi/6OKCfUb39vIeioczRg440rAI1Yi+e3UsFXI1H49GGkYIiLIXmHnw
         mP5w==
X-Gm-Message-State: ABy/qLaNyy7zXkMqFMprXOnTF7jDQgRMxMRIDnP3QF5m42NzQJ5KhgEl
	6gqUIoCd4S73fgATt3HMo3nWUVLPnSwo4GMDn1o=
X-Google-Smtp-Source: APBJJlFF/ZPZBeFTUlJJsVw6gvqSC+NnftxoKLaqOH3sDOKdvIyhB4DTRi4Sp3yg5NFbGfCt55R+jTwkG5L/EeefwtY=
X-Received: by 2002:a25:842:0:b0:bd7:6810:6646 with SMTP id
 63-20020a250842000000b00bd768106646mr12374371ybi.44.1688999063346; Mon, 10
 Jul 2023 07:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710130113.14563-10-tzimmermann@suse.de>
In-Reply-To: <20230710130113.14563-10-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Jul 2023 16:24:12 +0200
Message-ID: <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
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

On Mon, Jul 10, 2023 at 3:01=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
> fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
> not set it.

`framebuffer_alloc()` does indeed use `kzalloc()`, but the docs do not
mention the zeroing. Should that guarantee be documented?

> Flags should signal differences from the default values. After cleaning
> up all occurences of FBINFO_FLAG_DEFAULT, the token can be removed.

occurences -> occurrences

can -> will maybe? Since the intention of the patch series is to
remove it (them) altogether).

Thanks!

Cheers,
Miguel
