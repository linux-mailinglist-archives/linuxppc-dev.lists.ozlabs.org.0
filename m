Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9DB733ED1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 08:45:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A0C/04zw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qjmkq1W0pz3c3b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 16:45:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A0C/04zw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qjmjy0Xxrz30fx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 16:45:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26EC260204;
	Sat, 17 Jun 2023 06:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC914C433C8;
	Sat, 17 Jun 2023 06:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686984307;
	bh=Uw5cw1TPn0rntsQJRbeXZU+V2i3I8bpFiME/qcflP08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0C/04zwp8Svpx/hprFTuDwIwHJCnHpNRmn2tDdvfcmYt4wp3n7OAxHp5Py33C+kd
	 4kMHu8FACuUr1jN3jGFObWQ4Pw9NFQKQAIyO/G6pFYoVPUe76lGyVXZO3TQemSokHm
	 VXxdoS02gSAauNcMun3iVu1Zubv2t9PebDcIDYD6cqQx8/HkOPh4X4/5bVg3dgu6dB
	 sBHr55LVzNEboL0DRdq7gLRwtJOv/T3RNn91O3Tsgsn70wRNMkVoUNRgpMFOdo78UU
	 n4UYOHCQfFtBs9Glr8+Avi1tBIrn2kszVYZ167A35xKrcwfLNkZs7DpMC2d48GQpfN
	 ByDutHlpcGnYg==
Date: Sat, 17 Jun 2023 09:44:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230617064421.GQ52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
 <90a64b6f040491da16af0694172a6cbdaba33669.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90a64b6f040491da16af0694172a6cbdaba33669.camel@intel.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "song@kernel.org" <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "deller@gmx.de" <deller@gmx.de>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "puranjay12@gmail.com" <puranjay12@gmail.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 04:55:53PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2023-06-16 at 11:50 +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > Data related to code allocations, such as module data section, need
> > to
> > comply with architecture constraints for its placement and its
> > allocation right now was done using execmem_text_alloc().
> > 
> > Create a dedicated API for allocating data related to code
> > allocations
> > and allow architectures to define address ranges for data
> > allocations.
> 
> Right now the cross-arch way to specify kernel memory permissions is
> encoded in the function names of all the set_memory_foo()'s. You can't
> just have unified prot names because some arch's have NX and some have
> X bits, etc. CPA wouldn't know if it needs to set or unset a bit if you
> pass in a PROT.

The idea is that allocator never uses CPA. It allocates with the
permissions defined by architecture at the first place and then the callers
might use CPA to change them. Ideally, that shouldn't be needed for
anything but ro_after_init, but we are far from there.

> But then you end up with a new function for *each* combination (i.e.
> set_memory_rox()). I wish CPA has flags like mmap() does, and I wonder
> if it makes sense here instead of execmem_data_alloc().

I don't think execmem should handle all the combinations. The code is
always allocated as ROX for architectures that support text poking and as
RWX for those that don't.

Maybe execmem_data_alloc() will need to able to handle RW and RO data
differently at some point, but that's the only variant I can think of, but
even then I don't expect CPA will be used by execmem. 

We also might move resetting the permissions to default from vmalloc to
execmem, but again, we are far from there.
 
> Maybe that is an overhaul for another day though...

CPA surely needs some love :)

-- 
Sincerely yours,
Mike.
