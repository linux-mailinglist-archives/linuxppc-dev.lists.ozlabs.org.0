Return-Path: <linuxppc-dev+bounces-2423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1EA9A514B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2024 00:19:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWGFy5bMXz2yM6;
	Sun, 20 Oct 2024 09:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729376374;
	cv=none; b=jiTDirasAWUNN0NQ0j06j4LnTDa9nfbUgbL9czQFo0oWUK+65GqxWwbrwwmj6jovf355j7vqjhPWIeQrAZD2K5B24ABm9Hz885jMhPQmL/3UdTCD6kL8rABiJ+GFBuyYXy539+aFNbHvvzDSPuyvXZB0MgBx551UISeQfj53A6/jmOxgFSnyVY+gpRXo6MuvSFPLkaFem12/gPh4M41BKaJLD3uDdMwzwW3picXGHKXMOXSQbJRa2c/+VYYw+4XuB3cYJi4djHeHYcuOpl5Uw8y2pWuzcxk3EWJ2D0cKQQ4LAeB+GDgDgLMaaZzw+XCloBzavqj3ti8uAiMlRgR+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729376374; c=relaxed/relaxed;
	bh=RJpTD/Xv5f2pqBFSuqkTCCHmm0Mp3BKcMjnZ1BWJcfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEl+JrZtjDtF9Hf5psdcqEV5bUZDxw32cvq9XQqYzo5DkfIRLAAwfYFzaK2aCRHIEdRynHgLOIrtRzNcE6b+6dO1xA0LXkDUNFOK9p8ii75uOvtJgi2KvOOK8gL1ZocURyJfBBU+SX8wZLjFEEegn0QzbGKXI1CikoByBuEew+WZL3UQsoWnDCfQ7Sw7V0rXGDxxFZDQvthhcTYzkFIoN2qoZWNXTY5Uvz75bhrvoYMrks25rY6hRkeFfHycfhywbZRhf/FBt5XQbu4p1l4NfoJQg5KUQDtBUPv8zwnt7dm5ei0YgR6xyRL9hzSFD4WA8/gG/EBMvGpIcr3kJVdOIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vNM1wyZQ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vNM1wyZQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWGFx4q8sz2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 09:19:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B22E35C5419;
	Sat, 19 Oct 2024 22:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B925C4CEC5;
	Sat, 19 Oct 2024 22:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729376368;
	bh=daUc5xecu7xI5c+UkC320lN7WO6Pv9zdDCfjUjy8L1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNM1wyZQW4Fo3UYmtYtZPgjiHgu/H4XI/+27SeHDRGuyHhrsjIEj389botXDz7xzU
	 oRoliDromsIEdrwgMdf3d6+NrBy7bXYMTE2T/8I1/d4kB9gjHsLS/MIoIKs8EASeaT
	 aBxIiobIWyjFiwv9/poZDmy2HqvjFhixH+91U8zwdcdRhqXgTkEFbn2iL08Ol1J7ou
	 HP420DfIrrmCeqEBftQC/r/u9iEdCqnooHwASpRmuOZ6oVBWARW5PE0Gis4BiiIMsJ
	 95hjSW/bv4/gU/7p/7MsytMe7tkh0nWplVzjhpV678uD6QoJdFyqaGyiUG8CRghoje
	 30qArBjHZQnlg==
Date: Sat, 19 Oct 2024 15:19:25 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 2/8] mm: vmalloc: don't account for number of nodes
 for HUGE_VMAP allocations
Message-ID: <ZxQwbXh5v7eJmuyh@bombadil.infradead.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-3-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016122424.1655560-3-rppt@kernel.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:24:18PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> vmalloc allocations with VM_ALLOW_HUGE_VMAP that do not explicitly
> specify node ID will use huge pages only if size_per_node is larger than
> a huge page.
> Still the actual allocated memory is not distributed between nodes and
> there is no advantage in such approach.
> On the contrary, BPF allocates SZ_2M * num_possible_nodes() for each
> new bpf_prog_pack, while it could do with a single huge page per pack.
> 
> Don't account for number of nodes for VM_ALLOW_HUGE_VMAP with
> NUMA_NO_NODE and use huge pages whenever the requested allocation size
> is larger than a huge page.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

