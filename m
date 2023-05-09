Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BED756FC056
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 09:21:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFqMz4hvWz3fJx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 17:21:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gywRbWdS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFqM76N5cz3ccn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 17:20:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gywRbWdS;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFqM52DdNz4x3g;
	Tue,  9 May 2023 17:20:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683616851;
	bh=2wjmKTbt/z5/1Lgzb67uZ1KsoxbcTNd7BEGnUaPkJ+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gywRbWdSmUgbLXjnspObVrUv7pOsxsVhSbXU+zEQv1KxI3iQgbMLGV1sgY9TK3HlP
	 mxau4GAW14GS7xLkEVVGt6TSUjDdnI5gQ/yqzOjt4UCnnZWSLHcIgVNj68ChxG08lD
	 vRtFnnM842n16stuYmzmQHCXsKAqPyWp2WWJvsx+jRTLU9LsG8XgXgmPcL/RXmpXPi
	 oQLUh6oCZ+H+Syx+bRcmjd7Wh6fDNKVW4OIOcI6c8JL50e0arVtLxUfpndCjg58KQP
	 Nb4QsloFLe6SCwbo8J9T15yZrdQuazh7lwYNglnE2FlJrSPA1dTdzlh4JYwTc8ZYnb
	 FZOpgLXwBHWlg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Li Yang <leoyang.li@nxp.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/6] bus: fsl-mc: Make remove function return void
In-Reply-To: <CADRPPNQ0QiLzzKhHon62haPJCanDoN=B4QsWCxunJTc4wXwMaA@mail.gmail.com>
References: <20230310224128.2638078-1-u.kleine-koenig@pengutronix.de>
 <20230412171056.xcluewbuyytm77yp@pengutronix.de>
 <AM0PR04MB6289BB9BA4BC0B398F2989108F9B9@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <20230413060004.t55sqmfxqtnejvkc@pengutronix.de>
 <20230508134300.s36d6k4e25f6ubg4@pengutronix.de>
 <CADRPPNQ0QiLzzKhHon62haPJCanDoN=B4QsWCxunJTc4wXwMaA@mail.gmail.com>
Date: Tue, 09 May 2023 17:20:48 +1000
Message-ID: <87ednqx967.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Stuart Yoder <stuyoder@gmail.com>, Gaurav Jain <gaurav.jain@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "Diana
 Madalina Craciun \(OSS\)" <diana.craciun@oss.nxp.com>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Horia Geanta <horia.geanta@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Richard Cochran <richardcochran@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, Alex Williamson <alex.williamson@redhat.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "Y.B. Lu" <yangbo.lu@nxp.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller"
  <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Li Yang <leoyang.li@nxp.com> writes:
> On Mon, May 8, 2023 at 8:44=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>>
>> Hello Leo,
>>
>> On Thu, Apr 13, 2023 at 08:00:04AM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> > On Wed, Apr 12, 2023 at 09:30:05PM +0000, Leo Li wrote:
>> > > > On Fri, Mar 10, 2023 at 11:41:22PM +0100, Uwe Kleine-K=C3=B6nig wr=
ote:
>> > > > > Hello,
>> > > > >
>> > > > > many bus remove functions return an integer which is a historic
>> > > > > misdesign that makes driver authors assume that there is some ki=
nd of
>> > > > > error handling in the upper layers. This is wrong however and
>> > > > > returning and error code only yields an error message.
>> > > > >
>> > > > > This series improves the fsl-mc bus by changing the remove callb=
ack to
>> > > > > return no value instead. As a preparation all drivers are change=
d to
>> > > > > return zero before so that they don't trigger the error message.
>> > > >
>> > > > Who is supposed to pick up this patch series (or point out a good =
reason for
>> > > > not taking it)?
>> > >
>> > > Previously Greg KH picked up MC bus patches.
>> > >
>> > > If no one is picking up them this time, I probably can take it throu=
gh
>> > > the fsl soc tree.
>> >
>> > I guess Greg won't pick up this series as he didn't get a copy of it :=
-)
>> >
>> > Browsing through the history of drivers/bus/fsl-mc there is no
>> > consistent maintainer to see. So if you can take it, that's very
>> > appreciated.
>>
>> My mail was meant encouraging, maybe it was too subtile? I'll try again:
>>
>> Yes, please apply, that would be wonderful!
>
> Sorry for missing your previous email.  I will do that.  Thanks.

Does MAINTAINERS need updating?

It says:

QORIQ DPAA2 FSL-MC BUS DRIVER
M:	Stuart Yoder <stuyoder@gmail.com>
M:	Laurentiu Tudor <laurentiu.tudor@nxp.com>
L:	linux-kernel@vger.kernel.org
S:	Maintained
...
F:	drivers/bus/fsl-mc/


cheers
