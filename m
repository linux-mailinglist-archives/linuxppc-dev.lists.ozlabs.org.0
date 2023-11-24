Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF0E7F77DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 16:31:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LnGa35cd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScJqR3JPcz3vdG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 02:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LnGa35cd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScJpX5SXDz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 02:30:44 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d64c1155a8so1265628a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 07:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700839838; x=1701444638; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p615f7LAIDV1MfWlNjaOHn4LpR2INIwWiYXMET+eRR0=;
        b=LnGa35cduycvXemW59fUYpBZOnuw+RZdhDdYbFVoD1QxGKiR2wuqEY33WEdnf/VFGP
         VHwodutZ1gK4iFdw8IsjajQdBmDKpr/GLwq0TQbW0BMAqQB6f0BH5wNl8DMo+W9gS6AD
         LF/zWUEDlViWnzlSeZd1j3/XZKGjLNVbmV284iNQVFbbSq7aTBHY4IpuDBCE8xEEcrkp
         hyW2qUKdoOTwpFS+0U0ur8GTwfHQYOSb7jgH0yxYj3UqWjqMs2JZkHqDDQS5AKoUPiaw
         Z2NtcMK7NhmIgHlSaLYtWyr0vQDSUUZeFDYOu1T4Gf/10Teuqcw6+E45iYvr7ORuRazk
         vBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700839838; x=1701444638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p615f7LAIDV1MfWlNjaOHn4LpR2INIwWiYXMET+eRR0=;
        b=uY71o2t2o5/G+IOySXu28QZRc+5q4V1TjCG/5YztsMCDAlATfTIvwGCQ2sABxG3VKP
         spvGN2nYrTcTCbuuTq5suRk6Qa6uakVipgUcn8he2MP6EeiRwgmAm4oLsA1lOwjaoFYu
         EJzfkL7uRmzZZqRicuLK1meyXLe5oHw/kAG2Zz4B/6siK/h/Zvuqcomwe4Zp1oIH5Eff
         artZR7wl1Jmt5yWnnWQXvrBsDCMVLIg5e1JcAUOE+IZiem6xA+5TbK6R1jrUt6j2G5pC
         q9xK63gDU/vKijduuQY7TrDjP4bBCEdrMxupeEBf0wSaoJ0i0Nyrou9h/kJs/vTrrNoQ
         ge7w==
X-Gm-Message-State: AOJu0YxGcQ8eqMJmf2ku96RKlQXVnYRWF+RAJznj49vXpBduywCAvgjm
	+mLQDZppYslk/qTOVnQoV7/RU2zPKDDhlLTIIxw=
X-Google-Smtp-Source: AGHT+IFpl1LhfXbivJZHjzdRTqOJQ24OGD0LYHzdPZE88GRJFvGGbVZxiUVjs6DZh16KaOvIRQpWMJvuXmwQO/NLcOI=
X-Received: by 2002:a05:6830:45:b0:6c4:cdce:5de8 with SMTP id
 d5-20020a056830004500b006c4cdce5de8mr3506711otp.26.1700839837786; Fri, 24 Nov
 2023 07:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20231025130737.2015468-1-gnstark@salutedevices.com> <8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com>
In-Reply-To: <8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 24 Nov 2023 17:30:01 +0200
Message-ID: <CAHp75VcF3Y1MwJPY7jk274b3UWe7KWGFTYCppjC5fu7Ppf5XDQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] devm_led_classdev_register() usage problem
To: George Stark <gnstark@salutedevices.com>
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
Cc: vadimp@nvidia.com, lee@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, pavel@ucw.cz, kernel@sberdevices.ru, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 4, 2023 at 9:17=E2=80=AFAM George Stark <gnstark@salutedevices.=
com> wrote:
>
> Hello Andy
>
> Could you please take a look at this patch series?
>
> I've just found your post on habr about devres API misusing and I think
> this is just another case.

Just had a look, sorry for the delay.
By quickly reading it seems to be a wrong approach (or wrong end to
start solving the issue from).

--=20
With Best Regards,
Andy Shevchenko
