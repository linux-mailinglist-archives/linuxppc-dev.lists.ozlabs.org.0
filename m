Return-Path: <linuxppc-dev+bounces-7101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C2FA6335F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Mar 2025 03:45:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFjBK0QSqz2ydj;
	Sun, 16 Mar 2025 13:44:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742050547;
	cv=none; b=iepaEERzMav8u0Y/mRbCnSITu5zjFoI0C6mgWtFe9SEMBnNUWhwy/V6HvMOHR9SAIAnNYFxzjifZ/JVTmBsS4c8K1Fa2rm/3+EAIi7x2P88FTcqIr02s8YAw1VHt/gA7QK/Lepv1YtABoyXMppUpwkbMxt+ETb3vN+wb6UC55K9Eg8bnt9QoSmgP5RSI6Q1rO5MbW5aQJAzKWzUtr8MCv+WuU6ryLpwO6RG4eLp8LczMJxrPRF1OooPXSzjNwkaEWKN57X80yIZPqYnjmcE6YfAJhBOJR4262I3SdHsNVKxnqm+P/glKPnGfjwWhE1Yu8tcyCSbijrVggThbdeSGog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742050547; c=relaxed/relaxed;
	bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=jYPPzj2M96APQqnUisQeDN5I74cOlCJ7wXpJWWqDD9WoxBxFCbC6xqEM4urJQGSHRJuBY3A08oFOtoKyZ6PboWR/5TR+QZONfGfhutkDOiIztVVxjGzpX2uGFJEpSUh1yUsCThJTwwOzQ5ePROj0CCZKpgKZkN6+WRiVuKTnKWi+ig2UbKK9PY7d8I0hLmnmJA01SPxE1uiC3YDvmj8YkX6YJw+IJcwfM3YYB+NNMkLSjzausHvWixEOHx3J9dcaaWoN+ZBu7KnxZMWG+FsFqY1gZFYdAV3Qk9usvSQz7BEIIHNV9eQV8wuw3AaQA5srLhTDT18DaZm7AfVqaxA0gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E01YhmRh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=downinthebunnyhole@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E01YhmRh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=downinthebunnyhole@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFPS21KS4z304x
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Mar 2025 01:55:45 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-223594b3c6dso60296965ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742050543; x=1742655343; darn=lists.ozlabs.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=E01YhmRh15InJyh7/jc7nVGRzTjRk6Mj6apwcepeoH25I7li+13WySGGmu9tMo8HaG
         d6YAn6j2W+Rk/bfTkYRCjVxqXVSM8fxhMkY0VYAKHSQGasBYN/t0q7yPPFuThx+UqBG1
         CHD08PVrWn+Ubm7oEWyFZeT3PezoXFce2rLPHk8EL/gjgRaVKE17yKcKUu5aD9ah03XD
         DYtO9TTScv7jQBAROirxqJD3XFUybYyRXwTiV6nclith1E1UTEGnZk7nc1vmiffvOxxb
         lABs1iLox0+5wmiZuATBqdeBIQ3C/3DHCDicAT87qwc9JUVZ2GlJfOixNGMQg+N1umEc
         zbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742050543; x=1742655343;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=UU5sNPyAm0ZS8cTtXdgistT/BQ8rJK1lxcXnAJWwXEwCxe8O4M+pL9u5Uu18ibsLdn
         0BaYQXaWPTB2c+knSwM/3LjP+n/30LAnncOnPIx2fxQPw4b2OVu26ufXGpMDjLDmLKkw
         w1s673TkWeZ6JX4OYRv8xnT5yy2UV+Qq9th4ZAFQIBWZBaR33rsN42yXHBkE2H3Bnvsz
         1LW4lyelhpBRb0WMKBTjLxyUiNS0qymqq/aPjgN8OOdcNbQUM8lDHoejn8OHK3LUGa9R
         IM7edAGaqM29IdBsNusipMwM/f7ivliIUxhXX5tG6vvQVfs2Q2uzAD+4hV/z7LmGZekx
         aIPA==
X-Forwarded-Encrypted: i=1; AJvYcCUm80JVhed5jIsURXMCaAexxgTvgYgdQwauuFjBROFhXt5162TiGs7TGlHueaqnPuxk5s4bUryND990Owc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxI3IKebYJQ7L0G64rQmGQSA1JnuWSQ7HK2ACIt/wmu7IbXkHaG
	cyFe8YLHDBef3l6KC359qzy3cdEUIwyD2cbIMiD98OotkDGFhdRIF5YoRGnWlHGapPlGV5lVowv
	UKro06xghtl4NAG8ZQgne5JUY92E=
X-Gm-Gg: ASbGncuoXcR8XA+rifo6f4P+KlzxSEBRMiFTsvJ7BkBjGDnBB1h9T1NQBeqZ1iCfF6v
	bj1kfNfsj14bA+oVzp9SWEc4ayFSj9PLSxSSJsTzThM2ZrNdonzuBLjEiw4Qb5Qpa0N3/Vo/BzS
	aBa4H1movV4M8qknln0ocqJXk=
X-Received: by 2002:a17:90b:2e44:b0:2f9:d9fe:e72e with SMTP id
 98e67ed59e1d1-30151cc2490mt7920216a91.16.1742050543260; Sat, 15 Mar 2025
 07:55:43 -0700 (PDT)
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
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk> <Z9CyRHewqfZlmgIo@shell.armlinux.org.uk>
 <Z9ErEBuMMvd6i2n9@kernel.org>
In-Reply-To: <Z9ErEBuMMvd6i2n9@kernel.org>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Sat, 15 Mar 2025 15:55:33 +0100
X-Gm-Features: AQ5f1Jrmv7KQRCuWBIo_vXTI9aIDRsZr_EQ5uQHAURWeudjXpiSlHPWiANvw4jg
Message-ID: <CAAZ8i80e6CsD1Y36-sVrVs4QPB-82J1gPOeDvHa_+sQtfUpMtQ@mail.gmail.com>
Subject: Soekris crypto 1411, where to find ?
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	MISSING_HEADERS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

hi
this is probably not the right place to ask, but I've been searching
eBay and similar places for 2 years and haven't found one yet.
I support older MIPS hardware and need to find a Soekris crypto 1411
miniPCI module or two, to add VPN acceleration.

Anyone have an idea where to buy it?

Soekris company went out of business years ago.

Let me know.
D.

