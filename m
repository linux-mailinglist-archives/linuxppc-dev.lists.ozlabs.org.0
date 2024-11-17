Return-Path: <linuxppc-dev+bounces-3371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D209D0396
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:26:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqj63C2cz3bfB;
	Sun, 17 Nov 2024 23:25:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846330;
	cv=none; b=XCvWrRa/XFFYv0i0TlYmmnUUuE9LYs+doxKqwCzH+sOl0ysWddZXOJxKhQ7wxXn6wcgULy1sSTT5Wdlexa/DjkpbhDxwSz0DEHHFJbXrdBx1+avJVFkfGMqELvM0W3qnSsA1AqtyYGkv8wujhSvACjnGGoI8xAMJq9i9DPFVagZS0A13yNHjBJXtnj/SgI2brYSsvmtjUh6JXa6MBIz5tR2rWTbFyrUdthTC5jJMPBg5bLYMHr/1y7/1VvX733RhRIk8k3Hne6/cWGeSPASukGm4JgHsqps2c8z5Nm76RwgTMFQYMyl+olfdE/qMtoSE8ymDTmDX5wApGGAhqVHySg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846330; c=relaxed/relaxed;
	bh=KaVcfOJB5yHFkrI9gBoi6KkKyub0hH9jAka1jgkP7js=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D8DlXkv8S+B2qlMDKqqyaKOzDa3/zVlIHKk39hDxJRQxKNAGuyDNCWrydRpSQYusQsyLBwAGd5aCiW/w/TmEOQHuBQTFoaS4vE3lrR6ykpA+43vLzGNwR/cK7Q9ZNS6FWuAzh1/UKzSu6mHaeedaKXgiSwKxxsE6tz2e46J9t0bm9rXli1TM+jEHK7KWlMlZTuoJo41HZ0b4qBcDtyLIEa1tlKsYXJIS25I9DUMwR00MA8D3OReR/4EUAGWIsd9wDsTHqtX11DYoNp78b3YI/9uyWmwa1/CSg2erYyCAWAOZgXYbgnhHYWrhhx4GvC7u2uZO3WXTuk+AVZ5hFFqtow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BfA+hDrB; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BfA+hDrB;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj60KLjz2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846327;
	bh=KaVcfOJB5yHFkrI9gBoi6KkKyub0hH9jAka1jgkP7js=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BfA+hDrBx4pasiTqOPTLolLQ/OuZVtnl+jlr0QV+dYbn3p8dExFxdsdsSXOaTOTTW
	 8vGsEDqQhCzQJtY5P7jpcNoKtkQ0Z4dEWZBdH3EVCBp3XuHAJ1R8sebUu+l7byZ6u6
	 NjN5q5GifvWctHaEdF36bgoW4ndeR4r1vP8fZEHrOM+C27scsTMZZhqhOA0ermMKkW
	 IrCUU5MvIlnoTJiNc6TUyLR2FqVMCm9Gq43MmYL/Lw/q0onSb5CliEjn8ts1RlTtFl
	 baKUnobbQNi7+CtMrM7o/+544GmOvKcOy1qizi1wF4BY3RrghWhUfRQw2As3v450K/
	 +Pc/bVc6rx6fA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj04H09z4xdS;
	Sun, 17 Nov 2024 23:25:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Jani Nikula <jani.nikula@intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Zimmermann <tzimmermann@suse.de>, Paul Mackerras <paulus@ozlabs.org>, Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ede25e03-7a14-4787-ae1b-4fc9290add5a@web.de>
References: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de> <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu> <ede25e03-7a14-4787-ae1b-4fc9290add5a@web.de>
Subject: Re: [PATCH] powermac: Use of_property_match_string() in pmac_has_backlight_type()
Message-Id: <173184539766.890800.18087603028273437362.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 11 Oct 2024 18:18:42 +0200, Markus Elfring wrote:
> Replace an of_get_property() call by of_property_match_string()
> so that this function implementation can be simplified.
> 
> 

Applied to powerpc/next.

[1/1] powermac: Use of_property_match_string() in pmac_has_backlight_type()
      https://git.kernel.org/powerpc/c/2e716f5cdebed2fb98cafffaf626645c2e922dbb

cheers

