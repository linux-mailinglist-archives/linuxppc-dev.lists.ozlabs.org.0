Return-Path: <linuxppc-dev+bounces-4423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CED9FA87A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 23:40:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGbhT4Nntz2xsW;
	Mon, 23 Dec 2024 09:40:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734907225;
	cv=none; b=YSOC8R0iyEnUHE6W6E5GPnsPGWVOVnYGVhFDDsMcB4i2KQoiGmeHasWxAbhC7M3xYoSBpqP7x08u3ikUvGANDpCpU09yxxNqu3L+orDUukXesPyAZiqQWow20MfkYwR5ZjJVCO+2cGmlQAylWmMg3w4xIm24ofzlTjM1+Xim8POj7N2A9swhlxHm21RCYR9ppdy+ajVydHeJKtnkCxC1RU73bPMtWBV8gyB7S2sjA1li+DPmXfltSomWfzdLq73tZAl6phOF1aWnjT6tRyyEyaXXGvyBewpARiKshmIty91iaHvKmGv1nrYiKtEtggEgLoxeSxhdbwDUtRebzFbnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734907225; c=relaxed/relaxed;
	bh=xK9m2sLfVxq1j+Bg0ePP7JfY+7MvkmtJQ0Tio7jP4T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLyeKiy203L2c62Z0u1Jru9GeGVXZHDvh/1JxjgDzPdLhvmjoblHp8JRfWY57vt2KgKQZwIybh22rxTloQY//uH3HU3BmlF/9O0XGvmadHidPu4FsIv+LzOrk4UqUuyG2tQuWXaGbk12K5ieC+7o6HrndRKHn1mCbdXp1f/7q0Vq8I/s2Q+fwBCtdgMdrrzofFURZXBm/BIBFoqLD3mt+ytuljqjyGoZLqxbOnqjPhTg2dI3Myyxs62ptqBCKukBAGVMqMgG+TKaNDHFjZcO58h1xinwniy8ZrVpAV9+xTmkxsPdeiyexOCF07JsGsJ39nKglnGR63Bz9nDx9erFfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGbhR34SBz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 09:40:21 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4BMMNW3F022029;
	Sun, 22 Dec 2024 16:23:32 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4BMMNR4S022013;
	Sun, 22 Dec 2024 16:23:27 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 22 Dec 2024 16:23:26 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "A. Wilcox" <AWilcox@wilcox-tech.com>, Arnd Bergmann <arnd@kernel.org>,
        kvm@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/5] powerpc: kvm: drop 32-bit book3s
Message-ID: <20241222222325.GD20626@gate.crashing.org>
References: <20241221214223.3046298-1-arnd@kernel.org> <20241221214223.3046298-5-arnd@kernel.org> <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com> <6253307c-d3d6-485f-9d01-12787b457a99@app.fastmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6253307c-d3d6-485f-9d01-12787b457a99@app.fastmail.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Dec 22, 2024 at 10:09:14PM +0100, Arnd Bergmann wrote:
> On Sun, Dec 22, 2024, at 03:13, A. Wilcox wrote:
> > On Dec 21, 2024, at 3:42 PM, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> >     R0 .. R7           R8 .. R15         R16 .. R23         R24 .. R31
> > 00000000014a1124   0000000000000000   000000000135b4ac   0000000000000000   
> > 000000000dc70f30   ffffffffc0000000   000000000dc70fa4   000000000173600c   
> > 0000000000000000   000000000e477010   0000000000000000   0000000000400000   
> > ffffffff0141be4c   000000000149ab74   00000000ffffffff   0000000000000008   
> > 00000000c0014b6c   0000000020000402   0000000040400000   00000000016f2000   
> > ffffffff40400000   0000000000000000   0000000000000000   000000000dc70f60   
> > 0000000000000000   0000000000000000   000000000e73d490   000000000149f000   
> > 0000000000000000   000000000e756118   000000000dc70fa0   ffffffff40400000   
> >
> >     CR / XER           LR / CTR          SRR0 / SRR1        DAR / DSISR
> >         80000402   00000000014a1124   00000000014a1128   ffffffff0141be4c   
> > 0000000020040000   0000000000000000   8000000000003000           00000000   
> >
> >
> > 2 > 
> >
> > Which is the same thing that happens if you boot a 32-bit Linux kernel
> > on a physical 64-bit Power machine.  This is probably because KVM is
> > so much more accurate than TCG for Power emulation :)
> 
> Did you ask kvm to emulate a 32-bit platform though? Since the
> register dump shows 64-bit registers, my guess is that this is the
> result of trying to load a 32-bit kernel on "-machine pseries
> -cpu native", which is not supported by the guest kernel. I would
> expect that you need at least a 32-bit machine type (mac99,
> pegasos2) and likely also a 32-bit CPU (7447a, e600).

SLOF always shows 64-bit registers; SLOF only ever runs as 64-bit
program.  The *client* program can be 32-bit of course, but the dump
of SRR1 here shows SF=1 (the top bit there).  No idea what was running
at the time, but something in the kernel I guess?

(To show the last set client state, use
  ciregs .regs
the thing exceptions print is via
  eregs .regs
so you'll probably figure out the format ;-) )

If the client program is a 32-bit ELF file, SLOF starts the client
program with SF=0.


Segher

