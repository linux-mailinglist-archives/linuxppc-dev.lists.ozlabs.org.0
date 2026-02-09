Return-Path: <linuxppc-dev+bounces-16738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKRXFPXViWnRCAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 13:41:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691210EDA0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 13:41:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8jxS6SN6z2ydq;
	Mon, 09 Feb 2026 23:02:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1331" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770638556;
	cv=pass; b=niCStEP0lMq8wcFfW/NfECydbYLFuoUeKKpreeOvlu/vQLTxMANvCoccu0BeJBY/0kSVNohvH7CLv8O24moPWJ1N2DdOg6KLTwvGPKkmGXcopgiGLYI1GfPz0ZExVm4pB4bgIFU9Jjtvq/zIDlVz0DQDGbS4Td736lvDISXWZu3Zw582EXudtmUeCobfOiHqkEWBsBT/IftbIuqnv/PCVUNGeBGSDG7ertN5Z1sv2Eb2YUSkF1ZO+aCGIRAKcnsT30aqKi9+UZwz2CQb+TAnUxsbg0tCU4o6I2RWXFdPGTZDGjio3xRfg0z8wX6NaEji4vBVG2IVjAGkpsxN1Q6s0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770638556; c=relaxed/relaxed;
	bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSAiDV7GNbx2Os3ZPck2T+ZbBa1jZsw7tXaYcZRet1QgPh1nl8/AqkO3zmhIWacFy6wq2d0HOseI1ftpqLafX6g2yiAwT7wrWSLe+L3/B9PTiG7qWSfM70xKW03kmnRicJ6Xb/ip2/iRu8/SidNycTRB93SpU4a8FNyXAAxmjPqCXj1L5BCLwwhzGyKxXaoXXNIXKTykIDIA112Kq14FOb6dwW26CBAcVvq8i5e8qZZMM2dPwtQteWJY1ngleQ5FNP0MRKEkLxrrNq/UTDg+5t8LUVmNWVUz99EKGmNRxuh+OzRdqn40+08Ol4BIlH7LilWVWqQn1wBsayhVxdbZWA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aHNR3tgC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1331; helo=mail-dy1-x1331.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aHNR3tgC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1331; helo=mail-dy1-x1331.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1331.google.com (mail-dy1-x1331.google.com [IPv6:2607:f8b0:4864:20::1331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8jxR55Csz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 23:02:34 +1100 (AEDT)
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b836208f23so139857eec.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 04:02:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770638553; cv=none;
        d=google.com; s=arc-20240605;
        b=ZGxzbayMTXMpt7v+ih4sdi9Y7N/SNze6SCf844Ej4numUgp6ZuAvLtkgzBOLsWHfxL
         d+oBOGA2cIauHfX+wcJv3Ul2omS4TDbcntKwp0OYDYQ5Z2FzFZ/FkolcuSVDAIYdRhNy
         SCuXDQj8Kqv5ZHJ41FDXvPePsPyJ49lwsEL6eP0k1ufIcABE/NhInEro/3xkiqLb0V48
         MLz1MmSIXlMNyR7rSSgYLB7anRj9Fgwd5FiQVk1oOQefx01wUdv/hPt3DuORlzKVu8xd
         xmu400LiFCG9zu8xIGijv1Oc8CQOfp6LpOADxI/76PYUGfZXT7MRWOyek+vM+GYoOwaE
         EepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
        fh=NHUdF5wWEEjXWiCXryWaBwebfvbeK39/OmR7VcS8FFA=;
        b=WAD3aVmNW8DSTyNJDzwAbFCcNjq8sgKa0YOIVYJR7oFfptiI1S/IEE0b3P0jhCczMQ
         4CkMBKAYP7dgXxfzeeDZSfv5HANVXpxwjlxYmXX5JtWYdxQ1O+5o15ogypnwwcnIoYPg
         v/6SJa1MzG+6E6DbQ9gGqTgsr8MFsr4l1UFCgGpr7rsfGKr73uWt9rS6+XW3rgukYbux
         QMpLYRBBzM2MizhLUxUBalMz2XBtl8m4wCs2RGG5pk2o+rgfI4XeZJnZvHsFIPwTP+2H
         U7XC427m+qpew1KPtn+w/HX28z3HX64Am9xntvtGRc5aX7dgsr4IErj2bPKInucoWdDz
         dsEA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770638553; x=1771243353; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
        b=aHNR3tgCLvZFSmM4kafFBT/3nXSTIRd30t5SBj0SuONLPz6JQJJ5uzmahdSpeNWHyj
         06SqNu56tFACYUQ4tcljtiyrKImxLOywqx+pRWgGfXc1VqWRemoRaIyDBIzctxOqPVEO
         zFcgEga5/8fwqDan1Xw5d1ppye5BiXmQ4bmkFQWA60/lzAPFdOQgpeJZZOt9MLb2cmRO
         AqAkQqRndppQXCxlGfqxCf0PAWzMJ1Woz208UEnpVi+RbOB6qgS9or/I1o61X9K7nf7h
         z71/BzinbTj3b2C5xNs3EdOdUjXverXsnwSVC+jGgR7cmNlXdqmlpW6mR5XV/NeEDtH8
         tkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770638553; x=1771243353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
        b=JPgqg5trh+dR3vGw9TiLbiniYge1sx4oLC1ucuA5BuXftRRMXdUGSrOms737SE3lQA
         ZRQKD3mDHWffl920JR+l8Xf1hVJACkJYKu4HjqlSgO3VfBmZ+V50icnrnJSDRei1HUv7
         dQ+u++j5dHTP8VFzn+adxAjOgvSZ5SCfGZ7+2tcxyQ9lXGTKOnKnZwEECURkQ1KRtAfY
         aRsXmMR4NvXW2qCGjuHJChd4ZHl4I2QJrw7f6/gECRzxUvaUkRReMiNAvSA/W4DJN47A
         /GQMMf4w/xqubagOtvm5ofrjXdKEhLPtXdtK0k/2BQRAYeREaJCxyXApKX6Tt2x84fxL
         EtQw==
X-Forwarded-Encrypted: i=1; AJvYcCVK3+YzuMhy2Ctvx0fRjxBkkCrNjPaT/gslC3RD3/EzNBReDCMWzuzbSDXo7ueNgZFnqxy+TCAtkWBxVAY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsMtQUodR1e1AwCIZRUKKgDBsJj6J+SB/lvIyDtIecbwDdH0z4
	1LORh+8j9O1ueZwwSfctVFZOX+alojpIw2UrjnOJ9tFb9Q+rbjZn6QrPTa6l+9OjOfsG+9fD+BK
	KU7S7OePmjRC5x1QDZ2ixMhXyASFv7NY=
X-Gm-Gg: AZuq6aJNkrHI4qhbVgPyzx98Cz0diED5uKN3MlO2Q3Lof4IC1EoKOwmRfHx1kyyruUV
	iA/Je+DYoUNbgULJ1Qlf7BzfoXSNkaHZNzW69B/UHKaQSNqxq6XAcIq7TRNYK4gD7IkbN0gHiQV
	qol2VcBzcahbXstV2w3ftr0WxAj4ywoi3lRpUJR81vTAd+F32LJwAdxAptAkdYiY6TpOBKGe8D4
	qs1/P/0K515qR09p6pOd4CdG4AEJKOIvqGA6fiKjzCn17vgcd5p8HdgL6KJtiju8KQcmUTZX2mW
	IWfrZu8AME9yDDGpDPwIL5QNtWy2oE0CgF4OKufRq0HDYBOLHko+w7ZYyG1ssDkhjJy9IyREN0c
	r63Eiy/mC7L6l
X-Received: by 2002:a05:693c:6085:b0:2b9:ddef:2c13 with SMTP id
 5a478bee46e88-2b9ddef3bcdmr780273eec.5.1770638552639; Mon, 09 Feb 2026
 04:02:32 -0800 (PST)
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
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
In-Reply-To: <20260209105456.1551677-3-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 13:02:20 +0100
X-Gm-Features: AZwV_Qj0qLrj8jckFchFsbULIvtu6ZjFQsKyUw2LAuw6MCkfc5efrXbsku0JQ84
Message-ID: <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16738-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5691210EDA0
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 11:55=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> These changes aren=E2=80=99t the only ones required to get the kernel to =
compile
> and link on PowerPC

Is this patch not complete, then? It is up to the PowerPC maintainers
what they want to merge, of course, but I don't think we should add
the line in `Documentation/` if it does not work yet.

By the way, regarding that:

> +``powerpc``    Experimental      32-bit Big Endian only.

These levels are mapped to `MAINTAINERS` ones:

    Below is a general summary of architectures that currently work. Level =
of
    support corresponds to ``S`` values in the ``MAINTAINERS`` file.

But there is no "Experimental" level there. The idea is to know if
there is someone being paid to work on this, or not, etc.

This should also be changed in the other patch that adds ppc64le --
e.g. Mukesh, is IBM supporting this?

I guess it may be simpler to not add this line here until it works
properly, and only add the ppc64le one in the next patch, with a fixed
level to one of the `MAINTAINERS` ones.

Thanks!

Cheers,
Miguel

