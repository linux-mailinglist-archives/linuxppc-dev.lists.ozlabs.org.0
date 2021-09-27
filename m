Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7841905D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 10:04:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHwCC06r8z2yZ2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 18:04:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W7rpJofg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 helo=gandalf.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=W7rpJofg; 
 dkim-atps=neutral
X-Greylist: delayed 314 seconds by postgrey-1.36 at boromir;
 Mon, 27 Sep 2021 18:03:49 AEST
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHwBY0l6Nz2yMV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 18:03:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HHw4L48sPz4xbQ;
 Mon, 27 Sep 2021 17:58:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632729514;
 bh=E4BdjuVETK7euJtsU6o5OD1pMsd5uiT5C7A+uie8WFk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=W7rpJofgDBEYaP+1zJGCdVI3wAm69ZkvJEk2KKHvxhD9+4oUEKLMFttM7ARh+kukC
 59GMnNOKcnBYNDMwNPPNu6svOTrd5BZYIQHNwO/WF5vsjt8YhcJDi5XTw6BlQuOuoK
 Xt+faEsSD/PcD6855I1e64lfION8fCvEIC/64XGRgWE++SIMSl2ccsnjEZf/17lUkq
 XbPUkkAgEWthTz/dW+9HlcXvAPV90tmLhxYvDPDcBOXEpgVOVkyT4fAwKpJlR+tAZ3
 IdIWUpuLeiX9U0dsGB6EPhJBtuFcEjLU11jQhpafaQVGZCP+8iOJhvMZsZiXjJIQdK
 T/OuEOSFokLWw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wolfram Sang <wsa@kernel.org>, Sven Peter <sven@svenpeter.dev>
Subject: Re: Add Apple M1 support to PASemi i2c driver
In-Reply-To: <YVFtrpxfUbzv4XxT@shikoro>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
 <YVFtrpxfUbzv4XxT@shikoro>
Date: Mon, 27 Sep 2021 17:58:25 +1000
Message-ID: <87mtnylaam.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Darren Stevens <darren@stevens-zone.net>, Arnd Bergmann <arnd@arndb.de>,
 Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Olof Johansson <olof@lixom.net>,
 mohamed.mediouni@caramail.com, Matthew Leaman <matthew@a-eon.biz>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wolfram Sang <wsa@kernel.org> writes:
>> Sure, will do that later as well!
>
> But please do it privately. For upstreaming, the patch series you sent
> is way better than a single patch.

Christian, the whole series is downloadable as a single mbox here:

https://patchwork.ozlabs.org/series/264134/mbox/

Save that to a file and apply with `git am`.

eg:

 $ wget -O mbox https://patchwork.ozlabs.org/series/264134/mbox/
 $ git am mbox

It applies cleanly on v5.15-rc3.

cheers
