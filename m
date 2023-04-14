Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A0C6E1A11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 04:14:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyKlS3fTRz3fSc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 12:14:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hQSZJO3U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PyKkf07dRz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 12:14:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hQSZJO3U;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PyKkc638pz4xDr;
	Fri, 14 Apr 2023 12:14:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681438441;
	bh=K/a4KAZsSt3zs9UkrVWa7AJf0yfJnV4tv3ScoCGpOMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hQSZJO3UBZ/quReL6OrU8CGObjBh3cehwDtPtL+u4f/wOct63fotO4UH6YzbCIvwO
	 a9Efwpz24HqyhOOaWPYf+62+C4NDwU/YTLW868b9Bgp0oyXSKj19q/yTyPj64YXEyi
	 xGnA3I5m7HV8plXa4aqW4p5nG5OoWkyQ3bFBx+zTNMBm3Y2IipQrUmyJADDz7hNzbE
	 7aBNHRajwFrBxlA4qtkFcch3Q80bwQSa/hkcim1uPswQhWbpMt7+dxTbGYdwtTPQz2
	 zbIhUvCgKugBqtvxaqx6G29GObTx7b2pav0nRb7OkQPOK1EDFEX2u8qJIJL4dt02Jb
	 qcBFCu0skqhxA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Li Yang <leoyang.li@nxp.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms
In-Reply-To: <CADRPPNTyGPZOLwb5e20_FxwkpJ4ayt7VrgAEDgg7XqYSha3vMg@mail.gmail.com>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
 <CADRPPNTyGPZOLwb5e20_FxwkpJ4ayt7VrgAEDgg7XqYSha3vMg@mail.gmail.com>
Date: Fri, 14 Apr 2023 12:13:55 +1000
Message-ID: <87o7nr9png.fsf@mpe.ellerman.id.au>
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Li Yang <leoyang.li@nxp.com> writes:
> On Tue, Feb 21, 2023 at 1:52=E2=80=AFPM Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>>
>> [This RFC is proposed for v6.4 and hence is based off linux-next.]
>>
>> In a similar theme to the e300/MPC83xx evaluation platform removal[1],
>> this targets removal of some 13 --> 21 year old e500/MPC85xx evaluation
>> boards that were produced in limited numbers and primarily made available
>> to hardware/software developers to shape their own boards and BSPs.
>
> These e500 platforms are similar to the e300 platforms that they are
> still being shipped, the targeting market probably caused it to have a
> longer life cycle.
>
...
>
> The difference here from the e300 platforms is that MPC8540ADS,
> MPC8560ADS, MPC8548CDS, MPC8568-MDS are the only reference platforms
> supplied by us for these SoCs.  We don't have a separation of
> evaluation platforms vs product-like platforms like we did later.
> That probably means even if they don't look like "hobbyist" friendly
> they are more likely to be still in use.

OK. But what is the chance anyone is booting upstream kernels on them?

I assume no one at NXP is testing upstream on those boards?

cheers
