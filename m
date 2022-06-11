Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E55754737C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 11:59:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKtZs7519z3cd8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 19:59:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=gXWVNKP7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=gXWVNKP7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKtZG4ZlWz307C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 19:58:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81CA460B93;
	Sat, 11 Jun 2022 09:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688B0C34116;
	Sat, 11 Jun 2022 09:58:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gXWVNKP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654941506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XE9MBbqS+h3xN0ixzva9wwx1qzz8nH5/3DdGftVBwA0=;
	b=gXWVNKP7/GU1uwVANTXcllYD86W5e7LZGlPyme5gqPcU8RQyzpIuWIZ9ErbuBeQ+rsh0y8
	2kje/2e5ZhuBpdf1uRu5mBibtpYHwr3LN2szLrYtHYy7hfwu6EyaC4np34HmchIRsFzHR+
	NjaC79VPbA3GnAFUaTlTiL/cf5iUb3g=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b60a435e (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Sat, 11 Jun 2022 09:58:25 +0000 (UTC)
Date: Sat, 11 Jun 2022 11:58:23 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/rng: wire up during setup_arch
Message-ID: <YqRnPzVxK9HKROYi@zx2c4.com>
References: <20220611081114.449165-1-Jason@zx2c4.com>
 <956d2faa-4dae-fc75-2c03-387c77806f2b@csgroup.eu>
 <f6e5a9c4-f39d-749f-d124-884f11a8edfb@csgroup.eu>
 <YqRe3wHSuM6dcsCU@zx2c4.com>
 <c0198572-5aa2-7d65-ade2-766d6733431d@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0198572-5aa2-7d65-ade2-766d6733431d@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Sat, Jun 11, 2022 at 09:27:43AM +0000, Christophe Leroy wrote:
> Le 11/06/2022 à 11:22, Jason A. Donenfeld a écrit :
> > Hi Christophe,
> > 
> > On Sat, Jun 11, 2022 at 11:17:23AM +0200, Christophe Leroy wrote:
> >> Also, you copied stable. Should you add a Fixes: tag so that we know
> >> what it fixes ?
> > 
> > I suppose the fixes tag would be whatever introduced those files in the
> > first place, so not all together useful. But if you want something, feel
> > free to append these when applying the commit:
> > 
> > Fixes: a4da0d50b2a0 ("powerpc: Implement arch_get_random_long/int() for powernv")
> > Fixes: a489043f4626 ("powerpc/pseries: Implement arch_get_random_long() based on H_RANDOM")
> > Fixes: c25769fddaec ("powerpc/microwatt: Add support for hardware random number generator")
> > 
> 
> Well it helps knowing on which stable version it applies.
> 
> Maybe it would be cleaner to send three patches ? After all they look 

Sounds like irritating paperwork to me.

> like 3 independant changes with nothing in common at all.

"Nothing in common"? I don't know about that.

Anyway, sure, I'll do that and send a v2 series.

Jason
