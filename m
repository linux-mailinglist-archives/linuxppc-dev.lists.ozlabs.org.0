Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C196611BF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 22:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqCNv3RVqz3cGH
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 08:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IK5dGKTx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IK5dGKTx;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqCN00rLMz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 08:02:53 +1100 (AEDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4a0d6cb12c5so65892357b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Jan 2023 13:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JmL5h/5f9ZKkHhV7ji7KKVGJQTUq0yPHfnhiMRhXed0=;
        b=IK5dGKTx88W2mfNkdSbqWACqkjubhVS9N14mCOb6xiNrTRTmnuplQafYC0im+wGspK
         eOYeaF0MULlk8xs1MhOKyABR+2n5mu7ywO33aNQ9VX4GMkdSdCVqflFNfkdkPvE907aV
         AbMRlhdfsnbXDXTGbNIAQfaGPRPsPMo8biAT31OQE9sPB82/31f0is5EfnCupoTz/Ke+
         5qPrTwyq0HpYK24udJ89pRlkE2Z5QaSlpexv9uCe2Y49IpPc0IVSTp5co8YZkKYLFYOl
         z+xqA+ASKB1ZQdTTr7sECFdnwcqnzJz4QBV2ycEBNoSYjk2aEYooKDaJopPZvE6w6Z6k
         Ar3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmL5h/5f9ZKkHhV7ji7KKVGJQTUq0yPHfnhiMRhXed0=;
        b=q1QQoQOAkgsoQYe0Jz4JGRw+1TpJ/6RyxUBT61C/nb9SxUN7pV2u9VXPjyfnV2VmCM
         9BP+QdEmE2BOTGZALzx0ju3bkxgUi+/9ezs5amd5eNY5ISdKrKwXrV/NRePBGbbs69X3
         pOkbHBo9LING2XF8k/6P0fvCm7UkKDavgenhO+EWriNcdn1b8/UF1+2CeOWrDdqJ1s7S
         IzvMqniWq/+LKLpj8scm2uxpJXBd4u+0wZLMXr2y5Qr1YEoC1nS8OAqb8T6VblGFV+HI
         0XDUZ2gblAbiQ66t30K7tb8fo0Hq5n/8b6HDP8NUz5/9xWQ+UfdbV5vzd7klXihN6KzZ
         0utQ==
X-Gm-Message-State: AFqh2kqo3SN5ENehW2HBywzvmHjMsK4Wp2oZWnVJgTxDf9E+96uWhDhX
	7kuQrAkqpvJqNXmO875eanS87pMFg0MsROuG2Os=
X-Google-Smtp-Source: AMrXdXvY/st+xuDrW4znKkHpZttsCvsZGZkx5Bw3ldG/KbixkSHtRzf/+VMAvkN/c9NxoWqjkDvGG4OpHXXkd75XJ3w=
X-Received: by 2002:a81:484f:0:b0:3ed:90d2:2ab8 with SMTP id
 v76-20020a81484f000000b003ed90d22ab8mr582273ywa.67.1673125369382; Sat, 07 Jan
 2023 13:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jan 2023 22:02:38 +0100
Message-ID: <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
Subject: Re: [PATCH 12/15] auxdisplay: ht16k33: Introduce backlight_get_brightness()
To: sam@ravnborg.org, Stephen Kitt <steve@sk2.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-omap@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, linux-staging@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 7, 2023 at 7:26 PM Sam Ravnborg via B4 Submission Endpoint
<devnull+sam.ravnborg.org@kernel.org> wrote:
>
> Introduce backlight_get_brightness() to simplify logic
> and avoid direct access to backlight properties.

Note: Stephen sent this one too a while ago (with some more details in
the commit message, which is always nice); and then he sent yesterday
v2 [1] (to mention the functional change with `BL_CORE_SUSPENDED`
[2]).

Anyway, if it goes via drm-misc, feel free to have my:

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

Though it would be nice to have Robin test the change.

Thanks!

[1] https://lore.kernel.org/lkml/20230106143002.1434266-1-steve@sk2.org/
[2] https://lore.kernel.org/lkml/CANiq72kRhmT37H1FAGYGny83ONYXeqJuO8ZPbym0ajQOWKY4Kw@mail.gmail.com/

Cheers,
Miguel
