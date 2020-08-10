Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C2240B95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 19:05:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQMm14KdWzDqS9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 03:05:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=QxLxVUNJ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQMjV27FdzDq9p
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 03:03:09 +1000 (AEST)
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97839207DE;
 Mon, 10 Aug 2020 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597078987;
 bh=elsUXe1opDxYoDghIJZEYwZvrCHsszMPQwltM3nsIeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QxLxVUNJwZ44dXSpRoIUoPC4//0FCrTOzfv/gQ+Ztwn+t6xQrr34/YvroNzHR/Clp
 hp5i/v/+awZlPt3cj8u960Gg/KGKURjHV6nLJwh7BxzAcAvaQNjTSF+xRa2158DvMP
 XfdXRi0EAFau/Wwv9Fut2Mvia5B03cVW4V/SnssE=
Date: Mon, 10 Aug 2020 10:03:05 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Subject: Re: [PATCH 19/22] crypto: inside-secure - add check for xts input
 length equal to zero
Message-ID: <20200810170305.GA3352718@gmail.com>
References: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
 <20200807162010.18979-20-andrei.botila@oss.nxp.com>
 <CY4PR0401MB36528610C3ABF802F8CBF35FC3440@CY4PR0401MB3652.namprd04.prod.outlook.com>
 <20200810134500.GA22914@gondor.apana.org.au>
 <fd3e5862-3357-7dfc-6c75-30086ab19f82@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd3e5862-3357-7dfc-6c75-30086ab19f82@nxp.com>
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
Cc: "Andrei Botila \(OSS\)" <andrei.botila@oss.nxp.com>,
 Andrei Botila <andrei.botila@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, "Van Leeuwen,
 Pascal" <pvanleeuwen@rambus.com>, Antoine Tenart <antoine.tenart@bootlin.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 10, 2020 at 05:33:39PM +0300, Horia Geantă wrote:
> On 8/10/2020 4:45 PM, Herbert Xu wrote:
> > On Mon, Aug 10, 2020 at 10:20:20AM +0000, Van Leeuwen, Pascal wrote:
> >>
> >> With all due respect, but this makes no sense.
> > 
> > I agree.  This is a lot of churn for no gain.
> > 
> I would say the gain is that all skcipher algorithms would behave the same
> when input length equals zero - i.e. treat the request as a no-op.
> 
> We can't say "no input" has any meaning to the other skcipher algorithms,
> but the convention is to accept this case and just return 0.
> I don't see why XTS has to be handled differently.
> 

CTS also rejects empty inputs.

The rule it follows is just that all input lengths >= blocksize are allowed.
Input lengths < blocksize aren't allowed.

- Eric
