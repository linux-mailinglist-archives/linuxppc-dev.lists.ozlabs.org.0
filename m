Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08240721C2D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 04:53:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZJ8253vTz3f11
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 12:53:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=ychb=bz=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZJ7W6MgYz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 12:52:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 234C661C4A;
	Mon,  5 Jun 2023 02:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC71FC433EF;
	Mon,  5 Jun 2023 02:52:46 +0000 (UTC)
Date: Sun, 4 Jun 2023 22:52:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
Message-ID: <20230604225244.65be9103@rorschach.local.home>
In-Reply-To: <50D768D7-15BF-43B8-A5FD-220B25595336@gmail.com>
References: <20230601101257.530867-1-rppt@kernel.org>
	<20230601101257.530867-13-rppt@kernel.org>
	<0f50ac52a5280d924beeb131e6e4717b6ad9fdf7.camel@intel.com>
	<ZHjcr26YskTm+0EF@moria.home.lan>
	<a51c041b61e2916d2b91c990349aabc6cb9836aa.camel@intel.com>
	<ZHjljJfQjhVV/jNS@moria.home.lan>
	<68b8160454518387c53508717ba5ed5545ff0283.camel@intel.com>
	<50D768D7-15BF-43B8-A5FD-220B25595336@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "song@kernel.org" <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "linux-p
 arisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 1 Jun 2023 16:54:36 -0700
Nadav Amit <nadav.amit@gmail.com> wrote:

> > The way text_poke() is used here, it is creating a new writable alias
> > and flushing it for *each* write to the module (like for each write of
> > an individual relocation, etc). I was just thinking it might warrant
> > some batching or something.  

Batching does exist, which is what the text_poke_queue() thing does.

-- Steve

