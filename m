Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C604D7B9AE9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 07:28:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BbpCpY2Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1Kpc5klgz3cJW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 16:28:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BbpCpY2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1Knl6LNyz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 16:27:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF087617EE;
	Thu,  5 Oct 2023 05:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2146C43391;
	Thu,  5 Oct 2023 05:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696483656;
	bh=hXymtCmkQgS1mz4WN4LARQgIXsgfg8oCoZqTgfgSt/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbpCpY2Q0zEwY41GucwBsBZTdMge6AGCY7bXU/clMyyCXKJTV0EDLKXZQhP6Gmvyb
	 i7tzzZViGYUX1/BLXHrp9MgUNcssHkKZ+E07sMIo2XQd9Xhgj8wBFQLGyOjD2kEs17
	 PxOhx0u+oKdQ8lrzOhlumXDQrrVIpZHitXF+j0a79GixClpVIz2eZl61qc1UDcG73I
	 FDMmfOiG2H8IzEuKKw/M7PogaSgM8X2WZc5kjl+Dp1+hjjwCugO78vBqHSBJRgrtI8
	 iiiR0aNTydrnms7VNPMV5M6X+tEx0k+2XJsejW9H5dww52kR9ESsW7JTvRKWQR81qv
	 y9fkPnEwbon1w==
Date: Thu, 5 Oct 2023 08:26:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Message-ID: <20231005052622.GD3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-4-rppt@kernel.org>
 <607927885bb8ca12d4cd5787f01207c256cc8798.camel@intel.com>
 <00277a3acb36d2309156264c7e8484071bc91614.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00277a3acb36d2309156264c7e8484071bc91614.camel@intel.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "song@kernel.org" <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "deller@gmx.de" <deller@gmx.de>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "puranjay12@gmail.com" <puranjay12@gmail.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "bjorn@kernel.org" <bjorn@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 04, 2023 at 03:39:26PM +0000, Edgecombe, Rick P wrote:
> On Tue, 2023-10-03 at 17:29 -0700, Rick Edgecombe wrote:
> > It seems a bit weird to copy all of this. Is it trying to be faster
> > or
> > something?
> > 
> > Couldn't it just check r->start in execmem_text/data_alloc() path and
> > switch to EXECMEM_DEFAULT if needed then? The execmem_range_is_data()
> > part that comes later could be added to the logic there too. So this
> > seems like unnecessary complexity to me or I don't see the reason.
> 
> I guess this is a bad idea because if you have the full size array
> sitting around anyway you might as well use it and reduce the
> exec_mem_alloc() logic.

That's was the idea, indeed. :)

> Just looking at it from the x86 side (and
> similar) though, where there is actually only one execmem_range and it
> building this whole array with identical data and it seems weird.

Right, most architectures have only one range, but to support all variants
that we have, execmem has to maintain the whole array.

-- 
Sincerely yours,
Mike.
