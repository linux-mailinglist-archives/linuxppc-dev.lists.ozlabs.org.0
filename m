Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54D1144F2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 17:37:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TLx41z2vzDqZk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 03:37:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TLts2SMZzDqZP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 03:35:49 +1100 (AEDT)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1icu6M-0005rG-Ff; Thu, 05 Dec 2019 17:35:38 +0100
Date: Thu, 5 Dec 2019 17:35:38 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
Message-ID: <20191205163538.mzunfrpox7jbrssl@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-12-03 10:56:35 [-0600], Rob Herring wrote:
> > Another possibility would be to make the cache be dependent
> > upon not CONFIG_PPC.  It might be possible to disable the
> > cache with a minimal code change.
> 
> I'd rather not do that.
> 
> And yes, as mentioned earlier I don't like the complexity. I didn't
> from the start and I'm  I'm still of the opinion we should have a
> fixed or 1 time sized true cache (i.e. smaller than total # of
> phandles). That would solve the RT memory allocation and locking issue
> too.
> 
> For reference, the performance difference between the current
> implementation (assuming fixes haven't regressed it) was ~400ms vs. a
> ~340ms improvement with a 64 entry cache (using a mask, not a hash).
> IMO, 340ms improvement was good enough.

Okay. So the 814 phandles would result in an array with 1024 slots. That
would need 4KiB of memory.
What about we go back to the fix 64 slots array but with hash32 for the
lookup? Without the hash we would be 60ms slower during boot (compared
to now, based on ancient data) but then the hash isn't expensive so we
end up with better coverage of the memory on systems which don't have a
plain enumeration of the phandle.

> Rob

Sebastian
