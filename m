Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C626A41EDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 10:19:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P0Cn2LmqzDr24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 18:19:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P09p3Ft5zDqvp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 18:18:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45P09n55Ltz8svv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 18:18:05 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45P09n4n6hz9s6w; Wed, 12 Jun 2019 18:18:05 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45P09m26yhz9s3l
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 18:18:03 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5C8HkA7008611;
 Wed, 12 Jun 2019 03:17:47 -0500
Message-ID: <ff34090039ba2ce880a74b0a3714c8ed38f64ed7.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 8/8] habanalabs: enable 64-bit DMA mask in POWER9
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 12 Jun 2019 18:17:46 +1000
In-Reply-To: <CAOSf1CFcYnhKf0EJkm+E5uHg4e=QYGe+vAUz_TjX-v6UsmNtFA@mail.gmail.com>
References: <20190611092144.11194-1-oded.gabbay@gmail.com>
 <20190611095857.GB24058@kroah.com> <20190611151753.GA11404@infradead.org>
 <20190611152655.GA3972@kroah.com>
 <CAFCwf13A73AxKzaa7Dk3tU-1NDgTFs4+xCO2os7SuSyUHZ9Z3Q@mail.gmail.com>
 <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
 <ca81ca5d56a3a12db5a92f5cf9745763a86572e8.camel@kernel.crashing.org>
 <CAOSf1CFcYnhKf0EJkm+E5uHg4e=QYGe+vAUz_TjX-v6UsmNtFA@mail.gmail.com>
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
Cc: Oded Gabbay <oded.gabbay@gmail.com>, Russell Currey <ruscur@au1.ibm.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-12 at 15:45 +1000, Oliver O'Halloran wrote:
> 
> Also, are you sure about the MSI thing? The IODA3 spec says the only
> important bits for a 64bit MSI are bits 61:60 (to hit the window) and
> the lower bits that determine what IVE to use. Everything in between
> is ignored so ORing in bit 59 shouldn't break anything.

On IODA3... could be different on another system. My point is you can't
just have a fixed setting for all top bits for DMA & MSIs.

> > This will only work as long as all of the system memory can be
> > addressed at an offset from that fixed address that itself fits your
> > device addressing capabilities (50 bits in this case). It may or may
> > not be the case but there's no way to check since the DMA mask logic
> > won't really apply.
> > 
> > You might want to consider fixing your HW in the next iteration... This
> > is going to bite you when x86 increases the max physical memory for
> > example, or on other architectures.
> 
> Yes, do this. The easiest way to avoid this sort of wierd hack is to
> just design the PCIe interface to the spec in the first place.

Ben.

