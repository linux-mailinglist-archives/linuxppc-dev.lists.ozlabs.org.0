Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4638AF4BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 18:58:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=Tw8FQkWz;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=MCt7cKSc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VP7cB6Yt2z3vjD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 02:58:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=Tw8FQkWz;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=MCt7cKSc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ravnborg.org (client-ip=46.30.211.180; helo=mailrelay5-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VP7bL2Wb7z3dLB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 02:57:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=ce+ZqFlarA8IAt5zfwbr2hxRLFQAtI7f0O/GFL7QRfQ=;
	b=Tw8FQkWzueJByde49pf2Etw1JNd+9Cs/a8VSdP4sAjZamDT998lpGJ8OUSXZPgdnq9YK80Ld79By0
	 E1ZePxzkIVPPM3w68Ti2ki86ZQSTo/Qengh+ox/5EsZdMfGxT/LtyRbZzNkl+eBPCbtoD00qByBVfh
	 QlogVQorbOUCuNhfuDWjsPIOEK757mimusKghDsKCrDlzJS1s6Psw/PaVE8r407gkh53FMLrF7D1dO
	 uDYiPtxot3rmREDV43Zw4JTzOwK/+pqOJcBE6+tKyTzcGurjSzSuf0Roh28MmUDSp64HXkjpWwAEu0
	 fCub6cvUfUdVz3Rx5TFyQR6t2+r0Tlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=ce+ZqFlarA8IAt5zfwbr2hxRLFQAtI7f0O/GFL7QRfQ=;
	b=MCt7cKScu1j54dhTCuf6RoKzDR6Pxv4AhcExl3aouinnY7Cygl2lgVcGjoVORGMB/icOvVzGnLV0S
	 zdG43KuBQ==
X-HalOne-ID: 4e317c2c-0190-11ef-8c96-edf132814434
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 4e317c2c-0190-11ef-8c96-edf132814434;
	Tue, 23 Apr 2024 16:41:22 +0000 (UTC)
Date: Tue, 23 Apr 2024 18:41:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v5 04/15] sparc: simplify module_alloc()
Message-ID: <20240423164117.GA897977@ravnborg.org>
References: <20240422094436.3625171-1-rppt@kernel.org>
 <20240422094436.3625171-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422094436.3625171-5-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev
 >, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,
On Mon, Apr 22, 2024 at 12:44:25PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Define MODULES_VADDR and MODULES_END as VMALLOC_START and VMALLOC_END
> for 32-bit and reduce module_alloc() to
> 
> 	__vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, ...)
> 
> as with the new defines the allocations becames identical for both 32
> and 64 bits.
> 
> While on it, drop unsed include of <linux/jump_label.h>
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Looks good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
