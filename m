Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1F41EF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 10:22:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P0GP3WFkzDr0r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 18:22:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P0Bz4DPszDqvp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 18:19:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45P0By2dYtz8svv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 18:19:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45P0By1grkz9sBr; Wed, 12 Jun 2019 18:19:06 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45P0Bx4wRRz9s6w
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 18:19:05 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5C8Iqah008654;
 Wed, 12 Jun 2019 03:18:53 -0500
Message-ID: <8fa52f5f1455b9f3d81c71517ed499b93b357044.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 8/8] habanalabs: enable 64-bit DMA mask in POWER9
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 12 Jun 2019 18:18:52 +1000
In-Reply-To: <CAFCwf11naDCqotNx2mrr18WpJ80T=9=jfsJWMSBu7KPrF5paJw@mail.gmail.com>
References: <20190611092144.11194-1-oded.gabbay@gmail.com>
 <20190611095857.GB24058@kroah.com> <20190611151753.GA11404@infradead.org>
 <20190611152655.GA3972@kroah.com>
 <CAFCwf13A73AxKzaa7Dk3tU-1NDgTFs4+xCO2os7SuSyUHZ9Z3Q@mail.gmail.com>
 <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
 <ca81ca5d56a3a12db5a92f5cf9745763a86572e8.camel@kernel.crashing.org>
 <CAFCwf11naDCqotNx2mrr18WpJ80T=9=jfsJWMSBu7KPrF5paJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Russell Currey <ruscur@au1.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Greg KH <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-12 at 09:25 +0300, Oded Gabbay wrote:
> 
> > You can't. Your device is broken. Devices that don't support DMAing to
> > the full 64-bit deserve to be added to the trash pile.
> > 
> 
> Hmm... right know they are added to customers data-centers but what do I know ;)

Well, some customers don't know they are being sold a lemon :)

> > As a result, getting it to work will require hacks. Some GPUs have
> > similar issues and require similar hacks, it's unfortunate.
> > 
> > Added a couple of guys on CC who might be able to help get those hacks
> > right.
> 
> Thanks :)
> > 
> > It's still very fishy .. the idea is to detect the case where setting a
> > 64-bit mask will give your system memory mapped at a fixed high address
> > (1 << 59 in our case) and program that in your chip in the "Fixed high
> > bits" register that you seem to have (also make sure it doesn't affect
> > MSIs or it will break them).
> 
> MSI-X are working. The set of bit 59 doesn't apply to MSI-X
> transactions (AFAICS from the PCIe controller spec we have).

Ok.

> > This will only work as long as all of the system memory can be
> > addressed at an offset from that fixed address that itself fits your
> > device addressing capabilities (50 bits in this case). It may or may
> > not be the case but there's no way to check since the DMA mask logic
> > won't really apply.
> 
> Understood. In the specific system we are integrated to, that is the
> case - we have less then 48 bits. But, as you pointed out, it is not a
> generic solution but with my H/W I can't give a generic fit-all
> solution for POWER9. I'll settle for the best that I can do.
> 
> > 
> > You might want to consider fixing your HW in the next iteration... This
> > is going to bite you when x86 increases the max physical memory for
> > example, or on other architectures.
> 
> Understood and taken care of.

Cheers,
Ben.

> > 
> > Cheers,
> > Ben.
> > 
> > 
> > 
> > 

