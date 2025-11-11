Return-Path: <linuxppc-dev+bounces-14097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D7C4D91F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 13:03:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5QDL02vRz2yw7;
	Tue, 11 Nov 2025 23:03:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762862625;
	cv=none; b=YSk/tXsqONemuwu6+IEJRRjiq1L36ghShs4KmxK/WsSMJR79qAwB4iDNNY8uj9+hhYOroUvly3TozIeTvkywlFnCYFMi7SKvfTwsmZuAzzDzDTytzhqQnkDIWV3b13p3PaLxy/0kuD64IV14gzmNk6R/+RUUU+n/r7m/a4TbTemMwSFAz433cJ/PTQ8ZYfTlz5/v439fO4xpueRwQnylBOYKRYREdflNUzmGf5xu9IJQjW6v+a3yiqfozKx9rNTnqAzH3cHeH3/D+1aOM1mUQB+KU1am+b2D72NMNg1lOD6PGSgS9z5V9p4HRVpBuddKp3qovcnW22QqTBUWLjdPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762862625; c=relaxed/relaxed;
	bh=KljB7KA8H9UEbKdOlknFY9ShE3Ul6YXvW8YhMZmV7dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNZR06ZzMUaBzNmlXJca9mRdXzJyeWfFvYmzVFf3jeDbbLOhIY82DSGmuh8mgLRP2COVMum5NAPxnmZ9lnOlUTWgwpIlnJHeDdm2Blb4i/27ibDWsxjE5QnKapbsZfQfDLYI2U8SxqxkWOmvSLkvW0sdYNIqp5IDl6mOl6chD1grK9oW9vHzaqHlIgIG/3LB1dm9Ok8OCbThob/fTWr3izxGc99VNf4y3/wVcGHvbJtEzXIA1nEXGLuO96F6/VzmLk/Tg8SFexbpWM7ABwXJ/cFEpzHMSa04MpvKvPAMahQIaRF9VO6x+3iNXhfGfEPx60nTNOUoqAMseIkJHah9iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VyHyhOoW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VyHyhOoW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5QDH6Cm1z2yvT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 23:03:42 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-37a875e3418so16728821fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 04:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762862617; x=1763467417; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KljB7KA8H9UEbKdOlknFY9ShE3Ul6YXvW8YhMZmV7dU=;
        b=VyHyhOoW5YI5ZMgYDgdyGg4dSbAIRFTijPRCxhY30oxXXGdIaeRbWJhatlQyWqBgdN
         BZUntRf7m26Sng8M19fb3psrWLnmLRiPE2G6rHB3y1TsCnnybo9GsMMfvZ+bADqpxMZl
         Bi/3VSi1/O8l0Tvc6/tz4nvhGIdM0Ds+LeqXUAR9L6C/Xf/z+UXwe589yeg7jQV5G6fU
         vvsQMyv6drole3rb1hYOFHQqq6Y03KZCYQky5qJ9D6IBY7+aJfd0LL5xxbI4Q+CW+g91
         FpC43O0TrwQDkD5qZyd9p7cwNOmYn6R0EvL4blXQK3pFaqlSyYhfNj3sciLKAKmjsFtK
         1S/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862617; x=1763467417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KljB7KA8H9UEbKdOlknFY9ShE3Ul6YXvW8YhMZmV7dU=;
        b=NaIJOEoI3x1++3j8CA+Tv7oFiqcvmv9yWxpgM/H78ICleGQRzXS/TDfEjflDP4iwbT
         eE0VhQpjvHtKRz0AmTfE/EaZulOEImw8Zn71cjTiUcrKkerhtpUmRfbAz45VpCIdh+ap
         ZebDlvDOPuKrO6KAE1Gkiz9tyMin3aDE8RG+q3Kp1PdCsXRcPTNbYOrorVY1B7NJlA5P
         ZmDH9Z7crnwVSXsHYR0C6/qczK2EEGZf1ANLmpwQHouU1Ukv1W+oZ9cucJ6LilsdrnUK
         LtfvpLC/D1zlUcksdm29BhSaz3bg9Pd9+ECw/7PBXa2E6tdlXB5JFBk+KOVXcYXd6QJ6
         +OKw==
X-Forwarded-Encrypted: i=1; AJvYcCVnJLgf+Yl5ozN4PuVUeYz8VrwUEBOeQ3okv5E6E8Selcx6Si3GjinxBNGwUfR4JpUEMZlSwIR2rzgfBYM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFKXdzbuNVUeCgt/AtTM/CAqiklS1AyEvIZl/op4ttyBOCfsWr
	POuOxocjJwmdcdwWLk7OmPaZTAskwKmP+J/FmoDIkXGwUBEzMfy3UMo0L/1pct7bhu8biUUy6Xi
	RyHeUK1iVBYIs+nLRr42S6gOyOAQetLBRJhVcIkQy8A==
X-Gm-Gg: ASbGncvFhLiuV8n+MMIFPGst3FO3JLenLqc0Q1Oz1MQou9g45gOpPMyWOQtIeUBWIF0
	nhqzMBw+Sz87psV3vP+ykjdCaxQIjIhpPEuugzemrjbPRjXXpQHTPV/TIJgP4QqMho/7yEYg7xi
	33N89JT6JNgpT8Lifh7NvVhFiPKNZ6XHhAyiK5J2z6oSNTGLhDSYGNV4oZ4jvttD+kXPsTVfYF0
	8htmifgPStbVFPbP4M9kDK+FxpKGlD2zxZx6nCYmyPJu1q7hEESNyzQQSxrIMTMqQflTagPdHsK
	PaiEBjK5VfoiEpJw0hiuwZ3VI3oQ
X-Google-Smtp-Source: AGHT+IE79G5EhyzCGFO5KShwUVwQMKTk9DLfvtXgvYUrm3xN6l8t83Xw7QhBO96Fv1jh8YdyD7Y7DE1SL12Jvgo2IgU=
X-Received: by 2002:a05:6512:e98:b0:594:2d64:bce7 with SMTP id
 2adb3069b0e04-5945f14610cmr3166689e87.11.1762862617351; Tue, 11 Nov 2025
 04:03:37 -0800 (PST)
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
References: <20251107152950.293899-1-marco.crivellari@suse.com> <176286176938.477075.17121782345964029950.b4-ty@csgroup.eu>
In-Reply-To: <176286176938.477075.17121782345964029950.b4-ty@csgroup.eu>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 11 Nov 2025 13:03:26 +0100
X-Gm-Features: AWmQ_bnOYD56Kc4jcqB1Td1b1Q7AnUCQFEmxY7td5AXiEMwVkgsUHWrdJFOKphU
Message-ID: <CAAofZF6OnMGid8T=gSezk4YWJkZsET4VmFcbCVTzQU3HWHsUgg@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qbman: add WQ_PERCPU to alloc_workqueue users
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 12:51=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>[...]
>
> Applied, thanks!
>
> [1/1] soc: fsl: qbman: add WQ_PERCPU to alloc_workqueue users
>       commit: bdedc7414642e9c3793933d43b72c67f3b7db326
>

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

