Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C20787C71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 02:10:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=MrRC1d6L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX0j32P3Yz3cHT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 10:10:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=MrRC1d6L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=skinsburskii@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX0hB2w0hz3bpd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 10:10:02 +1000 (AEST)
Received: from skinsburskii. (c-67-170-100-148.hsd1.wa.comcast.net [67.170.100.148])
	by linux.microsoft.com (Postfix) with ESMTPSA id AF9CE2127C80;
	Thu, 24 Aug 2023 17:09:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AF9CE2127C80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1692922170;
	bh=sv6DcWBBSEGmhA8F4G7aY7hVhke3+bslRKfTB+4Ii7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrRC1d6L9JAZEHExoNj55zYorTOtyuAuuF6yHy3YMYISl2FaIWwzWl5k6NBjgheNg
	 64cVkfXKIBCseKIaDIMZk19ekt6kO0bW5f0ghjV0qtDJtfqIwswpGdLb1+LndPE0Gp
	 DTR7Mji6Q+4m0A5Ugqtc2thBSoCF3P/pD2ymgCGc=
Date: Tue, 22 Aug 2023 14:26:43 -0700
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/7] Expect immutable pointer in
 virt_to_phys/isa_virt_to_bus prototypes
Message-ID: <20230822212643.GA24539@skinsburskii.>
References: <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
 <52dd950a-e714-4ebe-a663-4e0ec6463d03@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52dd950a-e714-4ebe-a663-4e0ec6463d03@app.fastmail.com>
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
Cc: linux-ia64@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-hexagon@vger.kernel.org, Omar Sandoval <osandov@fb.com>, Linux-Arch <linux-arch@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Chris Down <chris@chrisdown.name>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@
 jurassic.park.msu.ru>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 28, 2023 at 08:40:51AM +0100, Arnd Bergmann wrote:
> On Sat, Apr 15, 2023, at 12:17, Stanislav Kinsburskii wrote:
> > This series is aimed to address compilation warnings when a constant pointer
> > is passed to virt_to_phys and isa_virt_to_bus functions:
> >
> >   warning: passing argument 1 of ‘virt_to_phys’ discards ‘const’ 
> > qualifier from pointer target type
> >   warning: passing argument 1 of ‘isa_virt_to_bus’ discards ‘const’ 
> > qualifier from pointer target type
> >
> > The change(s) is the same for all architectures, but it's split into a series on
> > per-arch basis to simplify applying and testing on the maintainers side.
> >
> 
> Looks all good to me. If everyone is happy with it, I'll queue it up
> after in the asm-generic tree for 6.5, once rc1 is out.
> 

Hello Arnd,
Is the plan to merge this series into 6.5 still on?

Stanislav

>  Arnd
