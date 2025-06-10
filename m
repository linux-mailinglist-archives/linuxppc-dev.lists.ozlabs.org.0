Return-Path: <linuxppc-dev+bounces-9265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08ACAD45C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 00:15:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH34x1dQHz2xHY;
	Wed, 11 Jun 2025 08:15:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749585248;
	cv=none; b=C9zU3n/aKGKa//g5c84Y9e6K2sr4y+Qk5MZWwpu69vSRTXxigFiBwjxOY4OvIEM5IffhnR/ZBDQLnhx0uiqsJFa64PSvU0E2o9g+xw6CeWR3Ljz0tEZwtCVK43y60e4PMXuxNx4/ARs9d53AFDf/YIiXJ/mI6qjONQ73nf2xuzUU3pHNL1a/qMbH8pzp0PiQ5ljC45HI2zEHyLnbsa4hxGM0XMMyHiuVBsAbaQ9vPBkpA6X1o4VqK/EiNjiAATQPDVciOWw2Z2HeJvqEAFbXoqrCoouAudM8AnnSEuUHdGqkS61ZVbjxDyqXccTtKdDCK3HdFZT4J+DHXo69h+Ubug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749585248; c=relaxed/relaxed;
	bh=ph1K9nhA2Vt5tUTE9IBkwCPvhYlBWrTrf42zGu8uhLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hIMgwSMcDlfQ0Ky+Ktodsdl5x99xkWjndCrU1nlDPEONksIY4KfSS7Nw3lY158geyseGUdq6GJh4XskoYzB5ueT8Rosw7kcZJC4F4VS3UVupf/ZT2C29aSyxE5opbBhUzhZlSJZ1liHTOxySHXyUQZlTtmnIVTJynOXhrgT35EjpoQLpsM51AbX0uyDIhpPAtYnn6fpejpSLug2E2uh+kvuC5CVar46JZAxtqVip92RVQl6r906VWiZZd/FWZHOvUG/QYOFs6PWF1tLBYrwkfF2XnOCudcXkRHFkDmM4XulL54Vq02MpNzi0tPhlVUEr1qmvN/5A9zYT7IvkpEIDeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xq16FC8q; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xq16FC8q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGzy64myJz308b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 05:54:05 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3556085f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 12:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749585240; x=1750190040; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph1K9nhA2Vt5tUTE9IBkwCPvhYlBWrTrf42zGu8uhLY=;
        b=Xq16FC8q4SY5f+vH2Z27AcjZovfJu7nZe0MBiV0xYczI4CDX1mQhudBjEFBnVUUAk2
         W3QfVq2SBxQCgin++6mYUJgLNPi6Lc+7xRt4RelQGiu+THEZ866kO8+jPDkAezFpuWQP
         06M63MA5nSu8xx5JaTWaGm+3E6s9DEaNv9gR4ThoylQTmCbf6WhRN+Y3asppI4cCkW23
         982AwxC5gKW5DaJo5b/VRverilkVCkEFmTwKjgsxax9uuMtn8FOH2WgSiB0pvJKDjKGZ
         +UO28LYRVANowxKgi88a/IDti7HMZ1Mnoj2Fz2zypoYKoTY9hnx1CB9meJDjWH8Skb53
         tRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749585240; x=1750190040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph1K9nhA2Vt5tUTE9IBkwCPvhYlBWrTrf42zGu8uhLY=;
        b=FiQ/z183H/VCNyIqrhOdDmvao4HE6rmyRW43GR2e8zPpMC5I4JZAemnk1CzfOt8erH
         kW0sdygpuUm+HhKIAtCEGzu4ncquSg6RNYH8tz7tANgBdgZ1elhSsUSEU2YnFd0VqKII
         YKHjVeOiYNisfs3CVPH9DAZbHjgv9t1yw57Wi3dlD44Z00/XVZNX8kDwGwvxraK5P9v8
         ZMqB0PzU9IF295N3AtjF2M1/OcIkoSLSayA32GA5yLbpywYv9n+Gj8Ej80yKxhM9OjGh
         kRi5+AmjFbGnDBSL9k9pU0xfHDuy3/dhEZ97VS67kPyItBnRZtdL6k/3GfIqIEApAEl1
         hyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoa29TiS/0UgStgOUlliaKDWxC8Oz+tK0D7wCxRB+eurVibgHpme9WXIkKLn8bp6dtNXQJc73xcHwr074=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPdqY6WxNZdSFYqu6yH2TsFhis+ChkY70T3N2cjhuItj73sKsm
	bY6cwQ2uixa18aT1W39ZIsW/6dIS+aOiWcgi8qYh+JWvATGFygIrO0QH
X-Gm-Gg: ASbGncvYurtb1yeVvX1zR+/wOSfSWqtkm1jlQ2yEImhMPIZ8T1lYGJXWCJhERINWvD/
	6Vpp4NaOYiFGgvJnDQPw4t/CeZXNc0jv3Qmg6mi2dxkia418rZBIiEzAH5YZQ4DqHrwu3Nnosso
	yBfWjmTY4LU9NYEOyt3otNunUs0wlewQlxQ8Fy5M9xq2l8A99DTDA6nlBRFS0grd8QXjNx0HcT2
	+x7oATnz7zoxcZLs559zpM+3xIduF4DuO4QRzV/r/VTsrey58EaFRWkyrupvgX5tSJ9eWlr2ZEs
	xYB3+RH+9JZpctzx5aXUHvMnWzHKVVNJ1dh3uOFEyWaq34YoXu50mMQmJ3PCgvQS16ryazr2Hm7
	zPvWE0rfdYAx8jsAxEl3A0Fgn+ulmrIIm2Sc=
X-Google-Smtp-Source: AGHT+IEHk/baWTOcAxkY5Kvy7mQ8aJbUM3aIlVEB2Tx5t++pwNgXhWtp4KEGX6pa2mjBcJRZidlhzg==
X-Received: by 2002:a05:6000:250e:b0:3a4:f6b7:8b07 with SMTP id ffacd0b85a97d-3a558aff7a7mr175941f8f.48.1749585240370;
        Tue, 10 Jun 2025 12:54:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e014sm13068138f8f.3.2025.06.10.12.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:54:00 -0700 (PDT)
Date: Tue, 10 Jun 2025 20:53:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Mark
 Brown <broonie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: Convert multiple {get/put}_user to
 user_access_begin/user_access_end()
Message-ID: <20250610205358.07b1cc05@pumpkin>
In-Reply-To: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>
References: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat,  7 Jun 2025 13:37:42 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> With user access protection (Called SMAP on x86 or KUAP on powerpc)
> each and every call to get_user() or put_user() performs heavy
> operations to unlock and lock kernel access to userspace.
> 
> To avoid that, perform user accesses by blocks using
> user_access_begin/user_access_end() and unsafe_get_user()/
> unsafe_put_user() and alike.

Did you consider using masked_user_access_begin() ?
It removes a conditional branch and lfence as well.

	David

