Return-Path: <linuxppc-dev+bounces-11883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CFBB4957C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 18:35:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLCHL1jVLz2yrg;
	Tue,  9 Sep 2025 02:35:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757349326;
	cv=none; b=WrIPddRpWRxiLij12TWuol2x8Bmw0O3tub1mIHgAC2cb0njbcsue+RaJPn7OuKxnAlaFVoYrG0jbN3YpGPXA0R4e/LlfgMesxESSZlkK97KvNTV/9tbdaiWkpcnfv+HEQnte8wgImCvTn7qCfC3UYJVI5dPeOsli00XVBA1mLjWfX0JkcwyfCLwfzmLbk01jqEHTEe+1Sm5QLdw5LyGk5G0Ti+uqTy9rAruivcEJJyB9bRNqqLjUsuxLSw5Uy5pDqpz3mazQDnCyfGxhlE68/Q0tEe/qzQYNBMygkP3E6iggzImYme8C4hoxd0vPFsZSpCTi5oLsT7DSsRRwAKmtow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757349326; c=relaxed/relaxed;
	bh=G9vgkd0DO9ld4CriXjJK1r7oGUIIiZc0S6wFO0Z8nf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZK6e+OkwCUzOQLY3sCmyZcvh1ozpB4gpBo5UMo44MZKFfWA6QSqjToh49y5cGmJsEZbEge5Pcuvu4mqXHCvIappRzn5U8e134rCQWm7PMXWh6feq8JGu0e14qC6Ft/utu+Eagg6pRPg29dYlHfsqa5DwNa64PHdlGfhwqN3ucj4FSrYZtDK2toDOYwOYX0bx0qDvIgIzVseIY+xC39/MWQrEOpL7LdsWk72PzcJ0XID+iZQO1rzg/bcTVUV7i2XHMq5UTYaTLi4QgDHhK5Hf1gPP9MCth6bYb0LfxfZt74kwXghiyqtAnEL/Ikd/5q8LlNLcNJCywlFpL9v9vjIRuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QUfi6Qg2; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=isgx=3t=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QUfi6Qg2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=isgx=3t=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLCHH6h57z2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 02:35:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8112A443AE
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B781C4CEF9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 16:35:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QUfi6Qg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1757349317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9vgkd0DO9ld4CriXjJK1r7oGUIIiZc0S6wFO0Z8nf8=;
	b=QUfi6Qg2IxLpxxdufJ8nhrwlM+UciMtybS+upuJV4RnioYi3nUU/LbBcdRHTFkl4cD/Cm5
	FI+6Sp1I1MjmV13sQv9vUvmnGfdewY58Nple6Ewof9hEZKqH/cwKU6ZZf1YaCXQ1WOit46
	gttqiuepPPNnRr0QC3AXp2XgwqsLSSA=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 546c767f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 8 Sep 2025 16:35:17 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-620b2171204so1440802eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Sep 2025 09:35:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkulfoaR8FI+FLNcjuWuUuODIa9LTC2au1nbo/sQUiclvLOOm1nzjSGBB8aiwoj6w5Afixl8po/iNYp2E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyY02rphjXevJKUPccQczkLr9f7SQ5RRJmtjWHDrjceuVVgY8f
	OlmB9JpXt9bs3e7OOQWJ+dECO5l74ZswZI/oppT0SQkBD6yCqCV67s+dTdSDYliZIZqD13E+5n0
	fCDNZBTCjNKGaqO7KVJ3oNssdKIvpUKQ=
X-Google-Smtp-Source: AGHT+IE7fQgFT2M5TfL6hfVQrredcaZ/GbV/THM8Yume1F79jQqGz4wG7cG1y5QelnlSxkfYukb++fwfMciaqG7ZTM8=
X-Received: by 2002:a05:6808:1991:b0:437:d800:3c1e with SMTP id
 5614622812f47-43b29ad403amr4222584b6e.23.1757349316183; Mon, 08 Sep 2025
 09:35:16 -0700 (PDT)
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
References: <20250906213523.84915-1-ebiggers@kernel.org> <20250906213523.84915-13-ebiggers@kernel.org>
In-Reply-To: <20250906213523.84915-13-ebiggers@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Sep 2025 18:35:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com>
X-Gm-Features: AS18NWC3VPTUIVFps2V911IsRcGv2esz89Ld1bpphWm6ntSx0SQwkxhIkBDwZbk
Message-ID: <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] wireguard: kconfig: Simplify crypto kconfig selections
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Zhiqi Song <songzhiqi1@huawei.com>, 
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Eric,

Just a small nit -- would you commit this with the subject line all
lower case, like the other wireguard commits?

By the way, I have been reading every single one of your patches. It
didn't seem like it'd be useful for me to respond endlessly with
Acked-by/Reviewed-by, so I haven't. But I have quite actively been
looking through these series. Thanks for doing these cleanups and
reorganizations. This patch here especially is quite the relief...

Jason

