Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778135475BE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 16:46:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL0yz20k8z3cj0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 00:46:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GKm4MZzH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GKm4MZzH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL0yC5jhYz3cK6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 00:46:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF41A60FDA;
	Sat, 11 Jun 2022 14:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B215C34116;
	Sat, 11 Jun 2022 14:46:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GKm4MZzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654958766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L7Ir9n6o9S7q2H/XyT2arCftkq5gQdq8QjehweP60pg=;
	b=GKm4MZzH1XgmfZFV6ZKOcHwpRZm1Q8uuZDKEepOc0vTe6mVjKaRnpabeQ8mpKTVpFuBYga
	hbJ+LSOIxcIvz6BwOwJbLodhZyXuSLZL1uHrY9Z2W3TiB/GBGRGp2/yr5Bbgzxl8KWETD+
	1dW1XNluYH1P+2OlAeDu0AM2bHerE0Y=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 980785c3 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Sat, 11 Jun 2022 14:46:06 +0000 (UTC)
Date: Sat, 11 Jun 2022 16:46:02 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/3] powerpc/microwatt: wire up rng during setup_arch
Message-ID: <YqSqqq0zC7yDOQib@zx2c4.com>
References: <20220611100447.5066-1-Jason@zx2c4.com>
 <20220611100447.5066-2-Jason@zx2c4.com>
 <6432586f-9eb9-ac71-7934-c48da09a928e@csgroup.eu>
 <CAHmME9rBWcdZtJCQ1WZAPOJtnA6u4w0ub4s4M+UW60gMSNgWrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9rBWcdZtJCQ1WZAPOJtnA6u4w0ub4s4M+UW60gMSNgWrQ@mail.gmail.com>
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

Hi again,

On Sat, Jun 11, 2022 at 04:41:58PM +0200, Jason A. Donenfeld wrote:
> Hi Christophe,
> 
> On Sat, Jun 11, 2022 at 4:40 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> > >
> > > +__init void microwatt_rng_init(void);
> >
> > This prototype should be declared in a header file, for instance asm/setup.h
> 
> Alright.

Actually, on second thought, I don't think this part is worth doing.
These are per-platform functions, not powerpc-wide.

Jason
