Return-Path: <linuxppc-dev+bounces-1823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 183BE99450A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 12:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNBSX5LDMz2xps;
	Tue,  8 Oct 2024 21:04:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728381852;
	cv=none; b=HYmYVlIEoGQG1l47SSdwK+h4v5BjLnQRD4jZu1iLo9Agkuthe0o+/VvDyJdhCCP7dAejcoHJ0t0DKey7lMEX/m5mYlJPbGWbtEAeBu6qgK7eGyBOXKnEB6Sbn4W/oS2Eg0oyR+1CUVluHxnjvw1mGR2vmsUYbxyJYgymjZDr+1xjCmTRmxRS+g3z1TgDZ9aLh0H0kU9MCO2slWYFodmcpTzewgG///dLhsadWDMAbKwr8h7OaqlQxLgGgUVnHl+gHI8Gluj9dW/RpiCEJw6xKj++yIXwTKvEGKCeoZkDSrnUpGOFQk0jwdjXWjtQf4XnQJngDBDQTFU6ylbpG+5lWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728381852; c=relaxed/relaxed;
	bh=i41cTgDGxYCF03sFAzCQfC4E35upvi9UYKHS+jZiY9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cl/wpQqPHMbuOWa2EEDmcHIyHIaX8ztaTT78MWW7ynmfJzh78Duh0tfrBl4TD1dHd/U4egaOg3hFO1eQJ2Z5egTpOgm2OAj+LjklB51kmjSsCea9ybdkAze5QBFVvO08RFzNGZOdFlieKPW7DbTCBM1EzsAJj7055x8/aRDRzP4uWY4ZwUszPvycAraYtxKV57ogBGwzpHw1c2yPZOrltNEqkOZrfjJf3LIZa24e9I64JcHuAJbQFlPgdbfMvcv0Ksu9er/gIylZ2hPuJGifuJ5GtCqYuGCh++2zhXOAkuzfn+XmbJhENy06S8T7ot/td3GK19LEdABHOzL+HNt7fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNBSV73k3z2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 21:04:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43C2FA42600;
	Tue,  8 Oct 2024 10:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49794C4CEC7;
	Tue,  8 Oct 2024 10:04:00 +0000 (UTC)
Date: Tue, 8 Oct 2024 11:03:57 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <ZwUDjbrYZNC7HLZS@arm.com>
References: <20241007204743.41314f1d@gandalf.local.home>
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
In-Reply-To: <20241007204743.41314f1d@gandalf.local.home>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 07, 2024 at 08:47:43PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> ftrace_regs was created to hold registers that store information to save
> function parameters, return value and stack. Since it is a subset of
> pt_regs, it should only be used by its accessor functions. But because
> pt_regs can easily be taken from ftrace_regs (on most archs), it is
> tempting to use it directly. But when running on other architectures, it
> may fail to build or worse, build but crash the kernel!
> 
> Instead, make struct ftrace_regs an empty structure and have the
> architectures define __arch_ftrace_regs and all the accessor functions
> will typecast to it to get to the actual fields. This will help avoid
> usage of ftrace_regs directly.
> 
> Link: https://lore.kernel.org/all/20241007171027.629bdafd@gandalf.local.home/
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> Note, I tried to cros-compile the affected architectures,
> but my builds failed for 32 bit powerpc and s390 (without this patch).
> It mostly compiled, and the affected files seemed to build.
> 
>  arch/arm64/include/asm/ftrace.h          | 20 +++++++++--------
>  arch/arm64/kernel/asm-offsets.c          | 22 +++++++++----------
>  arch/arm64/kernel/ftrace.c               | 10 ++++-----

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

