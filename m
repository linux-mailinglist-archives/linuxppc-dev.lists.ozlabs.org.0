Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B2B7D7EB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 10:41:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oRC27PQC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGK681n1vz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 19:41:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oRC27PQC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGK5D5qBzz2ydN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 19:41:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95C0260959;
	Thu, 26 Oct 2023 08:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6AFC433C8;
	Thu, 26 Oct 2023 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698309661;
	bh=CKweGyf2oPo/e/UZLG1WYH3zEQnVvPRR68BdbBl/TGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRC27PQC2plQ2QFtxeYNcapuTdKaVmbmEUR0m69y9zSqXieqEvU2U8HaibfItzWZF
	 yERD96v5VwCZUJZD6El6ZorfVxYGGBw2vENxYrzOh3JNxfzIcWV8Hyo/98RmvjYp1O
	 Ink1QwB6gOI9hZMPLodFMqMmfk4UUgDFD2PT2vR0MIfYSLtLLeyvF4ch6/DBDJ+K3Z
	 0bfW6e3KP7yJWPzCmJpvtwgF2RV+VsKMprb/vimV6IovW84by85aPvP9y1WYUJyow3
	 BUjvGbMWEhiJ9hRAr+vd5AhVyyu5+qGt0miVwVbaUWHgtUSofxp310DRt0OzuziAvf
	 CCAilLzZ675cA==
Date: Thu, 26 Oct 2023 11:40:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Message-ID: <20231026084039.GJ2824@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-4-rppt@kernel.org>
 <607927885bb8ca12d4cd5787f01207c256cc8798.camel@intel.com>
 <00277a3acb36d2309156264c7e8484071bc91614.camel@intel.com>
 <20231005052622.GD3303@kernel.org>
 <b26d0a201bf631831a956450ebbccc3c16521133.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b26d0a201bf631831a956450ebbccc3c16521133.camel@intel.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "song@kernel.org" <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "bjorn@kernel.org" <bjorn@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
 , "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "puranjay12@gmail.com" <puranjay12@gmail.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rick,

Sorry for the delay, I was a bit preoccupied with $stuff.

On Thu, Oct 05, 2023 at 06:09:07PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2023-10-05 at 08:26 +0300, Mike Rapoport wrote:
> > On Wed, Oct 04, 2023 at 03:39:26PM +0000, Edgecombe, Rick P wrote:
> > > On Tue, 2023-10-03 at 17:29 -0700, Rick Edgecombe wrote:
> > > > It seems a bit weird to copy all of this. Is it trying to be
> > > > faster
> > > > or
> > > > something?
> > > > 
> > > > Couldn't it just check r->start in execmem_text/data_alloc() path
> > > > and
> > > > switch to EXECMEM_DEFAULT if needed then? The
> > > > execmem_range_is_data()
> > > > part that comes later could be added to the logic there too. So
> > > > this
> > > > seems like unnecessary complexity to me or I don't see the
> > > > reason.
> > > 
> > > I guess this is a bad idea because if you have the full size array
> > > sitting around anyway you might as well use it and reduce the
> > > exec_mem_alloc() logic.
> > 
> > That's was the idea, indeed. :)
> > 
> > > Just looking at it from the x86 side (and
> > > similar) though, where there is actually only one execmem_range and
> > > it
> > > building this whole array with identical data and it seems weird.
> > 
> > Right, most architectures have only one range, but to support all
> > variants
> > that we have, execmem has to maintain the whole array.
> 
> What about just having an index into a smaller set of ranges. The
> module area and the extra JIT area. So ->ranges can be size 3
> (statically allocated in the arch code) for three areas and then the
> index array can be size EXECMEM_TYPE_MAX. The default 0 value of the
> indexing array will point to the default area and any special areas can
> be set in the index point to the desired range.
> 
> Looking at how it would do for x86 and arm64, it looks maybe a bit
> better to me. A little bit less code and memory usage, and a bit easier
> to trace the configuration through to the final state (IMO). What do
> you think? Very rough, on top of this series, below.

I like your suggestion to only have definitions of actual ranges in arch
code and index array to redirect allocation requests to the right range.
I'll make the next version along the lines of your patch.

> As I was playing around with this, I was also wondering why it needs
> two copies of struct execmem_params: one returned from the arch code
> and one in exec mem. 

No actual reason, one copy is enough, thanks for catching this.

> And why the temporary arch copy is ro_after_init,
> but the final execmem.c copy is not ro_after_init?

I just missed it, thanks for pointing out.
 
-- 
Sincerely yours,
Mike.
