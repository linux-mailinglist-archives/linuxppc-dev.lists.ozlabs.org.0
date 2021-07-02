Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D03B9A7D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 03:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGHLt49kjz3bWY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 11:20:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=gB9eIdn/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=jk@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=gB9eIdn/; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGHLM1B4sz2yP5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 11:19:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GGHLB622kz9sRf;
 Fri,  2 Jul 2021 11:19:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1625188773; bh=VFIGdRKCJvgeACmd5nk9f13+KDVmVzSnIzMWi3Jxn5Y=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=gB9eIdn/6nE0I+uBVLoKj33dhmVaovyTRAKENPRatU69jAGVxTVCJuswWca/qEVON
 oRUYMouHATU06xauQ2tULNKU3pVoMF6yiSpCgX8WcKo7rD73YQnUCbAEhOjcniSuhX
 YKYOwkf0KJ8i6gIxSSma2krd3Qw8FAi11oxNv8ZXdt5Q1ESro3vkTQ6XUbLboIXobi
 bGo6GEs3xHlB5jZAwOUHDBdbDIM67q5kxdxGXojPRxj9WnfNXCaiSgzbwUrETk/Icl
 vWxJaQr/Y5goDVresyV30FSPE8dddkPGQa24ZmN++tLkx2OHwg/uWdPMFbawJNZ1wj
 GmHfvvo/+oiqg==
Message-ID: <60a148d7c63510cbf31f3517dcb097c77d4ecd7c.camel@ozlabs.org>
Subject: Re: [PATCH v2] sched: Use BUG_ON
From: Jeremy Kerr <jk@ozlabs.org>
To: Jason Wang <wangborong@cdjrlc.com>
Date: Fri, 02 Jul 2021 09:19:27 +0800
In-Reply-To: <20210701141130.940-1-wangborong@cdjrlc.com>
References: <20210701141130.940-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jason,

> The BUG_ON macro simplifies the if condition followed by BUG, so that
> we can use BUG_ON instead of if condition followed by BUG.

[...]

> -       if (spu_acquire(ctx))
> -               BUG();  /* a kernel thread never has signals pending */
> +       /* a kernel thread never has signals pending */
> +       BUG_ON(spu_acquire(ctx));

I'm not convinced that this is an improvement; you've combined the
acquire and the BUG into a single statement, and now it's no longer
clear what the comment applies to.

If you really wanted to use BUG_ON, something like this would be more
clear:

	rc = spu_acquire(ctx);
	/* a kernel thread never has signals pending */
	BUG_ON(rc);

but we don't have a suitable rc variable handy, so we'd need one of
those declared too. You could avoid that with:

	if (spu_acquire(ctx))
		BUG_ON(1); /* a kernel thread never has signals pending */

but wait: no need for the constant there, so this would be better:

	if (spu_acquire(ctx))
		BUG(); /* a kernel thread never has signals pending */

wait, what are we doing again?

To me, this is a bit of shuffling code around, for no real benefit.

Regards,


Jeremy

