Return-Path: <linuxppc-dev+bounces-6811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B89A56DB5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 17:31:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8WyG16vDz3cV6;
	Sat,  8 Mar 2025 03:31:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741365094;
	cv=none; b=G3raiDU/k/cM7uzJq6HN10+E4gcgSraziK4U0PTc7a+I6pUIStsZdU3JWhnF/gUkUdQxA2Z64Dd8XCIHc9Y3oBaAPpait/2+zvufLhGX3i//zOimxBdbCg7LDGlrjAmzWbAV4W1Mb9shzZp+GqNojzgS57XvJdLM7wGHt6yumohYHIqnSGkgLP6VTFI+PdO0cFp44ImFkzjGqM1fs6dWtosBes58jh+K7M2TzhiehR0DDgjI7RdyxZJJqoREAPBpTkFVn8LDdjLekbZ3aiWgh2uw4ApS8Nd8ySDo6ncLvYkVk1mc0AcA6qMSkRAztN45G5okr1LFtqRfpR6RAoRB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741365094; c=relaxed/relaxed;
	bh=lAJPfgwy80djfUD6Dp0fH1s3yX48TIE7w1QicCUh1KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7cHPnUIgBcAYV94vHabV7gHtXGNhP30a3tP/UMXoU2e2SYG3YHpkgOsVMSF5cYfzsvVdBWkoo0qC6zsdiv44dUMXwJBk/594OvbSfNS8zgpxK6xPt0UymkssRgPAx4rzXWmFh3C8PMH5rTlAVC5zECC3zk/CQN5kwzKQieP0+R8Af/mwnqD/5KHgwWDKpT62TOOhWz6/8C8bN8UsSQs5z8xNID9mArUGC3onz5TlenfgzHPEt2rmQR4Ax8XBoBziqnbu1IqlMpY4RIiheM3vyXmzbpGKNe7RnYIM0U+3MqayBniavvX5QbulNWuUwGq7lFxHdbw+gD461dY4Y+N3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nfD0bNun; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nfD0bNun;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8WyF0D5Fz3c9W
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 03:31:32 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-307325f2436so20160811fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 08:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741365089; x=1741969889; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAJPfgwy80djfUD6Dp0fH1s3yX48TIE7w1QicCUh1KI=;
        b=nfD0bNunL1MugHf8OVX68F0fTgVcVZfKtaOgnwf8vsQ/7xQuaf/+OoOB6PDgIwP2jW
         OlJDc6N2sAD9UDSWL/3Yr3TBulD4psDNPZ0vorILPM+rijxraP4tI7e0DBB5iAf+Q8G8
         H6fCOFnh7oUI5F6hV3mBfU6oNsXPzsm8Xr/sFDGDIOyaVVsnFmp0BFdfIe780KVRPbMu
         RhCnM9THgF5vlZ+yk6jCLiwf1Dd0MtKb9ZlXrbNBdTpOluGROCpVaTJBtwHlOGvqpiHR
         91hsKeI5kHKopQdE5QglF/unZmV2SuZF1HaOMH/env9GBiKq0gqr9wKNd4kq/q0l4YcE
         2oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741365089; x=1741969889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAJPfgwy80djfUD6Dp0fH1s3yX48TIE7w1QicCUh1KI=;
        b=V+vtKHJ5UeJtUaKV6JIkM0HKsv0wOlha1UARioC9fjvNgLPaMebfYTNMTuLJJi0xio
         TgY6dtqcxsWX634DJmElqxXfzO+m96l3RRafMPd5MskvRrevR+XWm+/iGMQo9apQmZUB
         9aVjc/Wfdd8MRAtZz1jRefoS0i3eakv05ue1wzLjaiqK1Gpq0xBSdEdRvQWTwKgRR6ii
         FDM3ZgmZmyH+36Zu4xk5U6zIXwNsmhp+Kw1alo5dNVW/MhPj6Kt5NomvfSBomMDfBM9m
         6gGH65e9oHxVv8cPzdwSLN1YI0+lNS2+EJjIGB6N8zFryohZJgLDu5j/BaHZnf0SyL0d
         Ucpg==
X-Forwarded-Encrypted: i=1; AJvYcCUWWGlVJAUYqnYWg9OCe4yJu5hLetwO6zq2H3dnz0y5JGVj4xEd7vttJ3jy8FEKRqzSewWHMOU5d3Th0z8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2nb515YLAakg1C1oF6xfRtEM0zsn1sgOVaM9TXUZGWBJ918um
	c+xste6ctm2rCbb+tZv7AVJ/Cai2yTo2W056bOAu51fbuTdFphBSRNFyzXz8stRx44kJ7Xk0jaM
	KOQa+Rrc12LpHytyWmIYDvBZIDd8=
X-Gm-Gg: ASbGncvaXYtyCDjtEYNuJKayozravMCK5zlkx3Dpbu3+ScUl9CIme2S/pAodf8mQ9Rc
	y46C8E+H0Sb5Isy/Uea07t40D/GWi1bPJqbhNSJUvUgj3L1rnIdJ2kD0Cct8/mxk1QCv5uJFW1z
	+ZSNhE/zdFgOKu8nCetMT4LjQknuAxDRTsz5r83BNvDJswhaTPFV8OxmeZ/Jbw
X-Google-Smtp-Source: AGHT+IEgEmihwEMplxNvvkQvj5VuR9SKkH2j1mgoi1vrJUJlhmNG3YpZPhWz5+QONvVJZUVJ5MwX6UXtoR+OGwuCJVI=
X-Received: by 2002:a05:651c:1689:b0:308:fbd5:9d2d with SMTP id
 38308e7fff4ca-30bf463a73dmr11788591fa.37.1741365089031; Fri, 07 Mar 2025
 08:31:29 -0800 (PST)
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
MIME-Version: 1.0
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz> <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
 <CAJ-ks9nDLGvzZ+NDAJsk2Hy1=hsCzayg4-65gk60T_WJZzOUzA@mail.gmail.com> <Z8sW1QBgPVUmEzUd@pathway.suse.cz>
In-Reply-To: <Z8sW1QBgPVUmEzUd@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Mar 2025 11:30:52 -0500
X-Gm-Features: AQ5f1Jqj8z8Xnln11dqVW0XOSqH1XoW79G51FNEA7K4iaFdlgfDG9Z_Ubvj7D_E
Message-ID: <CAJ-ks9=YWas3fUeUOYLhivb+icMczafmfBopvS77-CCWQyKQBQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
To: Petr Mladek <pmladek@suse.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 7, 2025 at 10:55=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> Honestly, I am not able to find how the KUNIT_FAIL() actually prints
> the message. I can't find how assert_format() is defined.

KUNIT_FAIL -> KUNIT_FAIL_ASSERTION -> _KUNIT_FAILED ->
__kunit_do_failed_assertion -> kunit_fail -> kunit_print_string_stream
-> kunit_err(test, "%s", buf);

So I agree that the trailing newline is just as necessary here as in
any other printk.

