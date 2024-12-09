Return-Path: <linuxppc-dev+bounces-3878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F294E9E9E11
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 19:33:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6Vq123qWz2xk7;
	Tue, 10 Dec 2024 05:33:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.18.0.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733769181;
	cv=none; b=oGxGqoeJKsSLaRDdpW4Cz8nONWpC8kWuKBNrzt+0Z3OQihhMnhawoBL9ehsk8JXVzFvmIXPiFAi+iC9Lq8sj1uFp0yA4hrHM03Clvidc3IiOXYLQ6gQL3g2aKA3jnWKkwtYFhcqdo5QbZR8u0z5hnCbkghbla1JcisEZkwo4UiMicLz57cHEnVWZ8HKNurEE0qf/jMGQUUhkcAuPYfWFdsFZE8kJp7xej/qIuDzTjm/uAy3bDt4gqOvU+dDtwisSkMh1oDD0VK0AFUKKaS81m+0JnAFieIxfXlXXA0a+9i1jnPgH+AluB4Zx278Mi8f/E46jsWmp1eMwIZ9JQwGBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733769181; c=relaxed/relaxed;
	bh=zI0S9FX4wWQ5CchwvAhUOaE0XEJqhsTojZMvmMrrS/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k9whY8xcxdeTTOhEGv30B9n3xPK2yeKJ6WXR9Sd7nac/xR4jW4Hvp7OIK4t6N4bY+Srx8xruxvEOWf7BBE//P3AhWekcuLI48NADb/iHctYPYB52CGFb+ng2WT6UD/X94ZH63pic6OloeKf/MbcugDZDObo3T76/rOeJHcLc0UVd9Z0Bz5O2lY/Oo3d/jD3B4KkEAlSJXuJgr5fIqP3U+tEdxEOtN+dvxy7PKYsWZVUmWBYWvrzSeu0kChQUFhi6N41WmfQhjtwrgtErQca/qCd9Mrg9nUo+7nF+PtePQLdB4oJ1lp++BFz5J1PJlvTbHvRELfsn8l1Hkq9Smzj7DA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=212.18.0.9; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=lists.ozlabs.org) smtp.mailfrom=nefkom.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 70677 seconds by postgrey-1.37 at boromir; Tue, 10 Dec 2024 05:32:59 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6Vpz2cCBz2xWt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 05:32:57 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Y6Vpr5wGwz1qsPx;
	Mon,  9 Dec 2024 19:32:52 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4Y6Vpr58zWz1qqlS;
	Mon,  9 Dec 2024 19:32:52 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id DAGK58Tns2FM; Mon,  9 Dec 2024 19:32:52 +0100 (CET)
X-Auth-Info: oBX17wFr/StoNeFHnknxTLQepuuwk97VrTe1nqtIBhIrx1Gs+J9KHbF0bmaMNbYG
Received: from igel.home (aftr-82-135-83-150.dynamic.mnet-online.de [82.135.83.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  9 Dec 2024 19:32:51 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id A8E7F2C1B0F; Mon,  9 Dec 2024 19:32:51 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,  LKML
 <linux-kernel@vger.kernel.org>,  x86@kernel.org,
  linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] futex: improve user space accesses
In-Reply-To: <CAHk-=wjnvFU3sMjjKyqtgvPe6EMu3M4f1qyZncJR5=QDQsV=ng@mail.gmail.com>
	(Linus Torvalds's message of "Sun, 8 Dec 2024 16:32:33 -0800")
References: <20241122193305.7316-1-torvalds@linux-foundation.org>
	<87bjxl6b0i.fsf@igel.home>
	<CAHk-=wjnvFU3sMjjKyqtgvPe6EMu3M4f1qyZncJR5=QDQsV=ng@mail.gmail.com>
X-Yow: Is this an out-take from the ``BRADY BUNCH''?
Date: Mon, 09 Dec 2024 19:32:51 +0100
Message-ID: <87bjxkzoz0.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Dez 08 2024, Linus Torvalds wrote:

> IOW, does this one-liner fix it for you?
>
>   --- a/kernel/futex/futex.h
>   +++ b/kernel/futex/futex.h
>   @@ -265,7 +265,7 @@
>         else if (!user_read_access_begin(from, sizeof(*from)))
>                 return -EFAULT;
>         unsafe_get_user(val, from, Efault);
>   -     user_access_end();
>   +     user_read_access_end();
>         *dest = val;
>         return 0;
>    Efault:

Thanks, I can confirm that this fixed the crash (changing both arms as
pointed out by Christophe).

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

