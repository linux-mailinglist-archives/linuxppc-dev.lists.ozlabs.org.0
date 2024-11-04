Return-Path: <linuxppc-dev+bounces-2836-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A339BB8F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 16:27:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhwLm3j8pz2xg8;
	Tue,  5 Nov 2024 02:27:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730734032;
	cv=none; b=mA+Zcz1pbRPBeXmV50hlywVLnbuErvAFTEnTBiTY6lxd4TaPQ4sCUlMWxP9eq52NQs7m8CGiCMjVwUpjB+OLRUPm8JWPYGlo6HbnUguYOPfjWK4r8eB/W5ZGP0It3o0qxA3qktrLKECIT9OAikLjRXsb2Mc/R99MObphA2hAy69oQGrR0JsG1dPfbi8hIidqgEfDUjotMSjmmaHPEmQK2RX9PCaam799eDUcdray3lNa5bxBfPmfz6LUt879ig6TCJCFV9+PuPNdJ4jBlSWcKoToGx8HarKStalPgNRzxDkzKY0b4dry+AQyC6aDEmbCcjKfWXhSGQRXItuKDe8uAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730734032; c=relaxed/relaxed;
	bh=sDFZ6fp/QdVOoKJpDogesWlhibNJlNmtmRyi/bO+WeM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fKe/K1w7mQaxZqevP7sxOIO/530gAi40+roKk4xCAolCrit9ZJOFeqCR/b5bXE/kupyJsMvn1cyIPUtv59Ni1BPlZvA1+IocsONur9++87GLQzbGPflBtbiqbnb/IB9vklUqQmhu3MrZOR+03fJPR2CmKsux/u8hKT7nFpXUv9QjgDhkl/1NjbZsEoeY5DQeNYkbAyBqB+DphqfxsfgpYFcDMmMeHD7AGnZo8Pj02etG3rbuxrV36fygoA3evbtb0KyKqYfaUGeLRCnchdHIZQYVmHCzJTFvnHG2waWCG9EXbyqHXfgvGURDrpEG1+8R9DEaj9/rIStQZfMjKRgv+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=sarb=r7=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=sarb=r7=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhwLk0wHzz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 02:27:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8583A43048;
	Mon,  4 Nov 2024 15:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6E8C4CECE;
	Mon,  4 Nov 2024 15:27:06 +0000 (UTC)
Date: Mon, 4 Nov 2024 10:27:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, "Naveen N. Rao" <naveen@kernel.org>, lkml
 <linux-kernel@vger.kernel.org>, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] selftests/ftrace: update kprobe syntax error test for
 ppc64le
Message-ID: <20241104102704.7c20dc0b@gandalf.local.home>
In-Reply-To: <20241104103615.GZ29862@gate.crashing.org>
References: <20241101191925.1550493-1-hbathini@linux.ibm.com>
	<20241101205948.GW29862@gate.crashing.org>
	<1916cb5c-cb3d-427c-bcf0-2c1b905fd6d1@linux.ibm.com>
	<20241104094431.GY29862@gate.crashing.org>
	<245fed6f-5fb4-4925-ba0a-fb2f32e650d0@linux.ibm.com>
	<20241104103615.GZ29862@gate.crashing.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 4 Nov 2024 04:36:15 -0600
Segher Boessenkool <segher@kernel.crashing.org> wrote:

> > >>Querying for function arguments is supported on kprobes only at function
> > >>entry. This is a negative test case where the offset is intentionally
> > >>set beyond function entry while querying for function arguments.
> > >>I guess, simply setting the offset to 20 (vfs_read is anyway
> > >>going to be beyond 5 instructions) instead of 8 for powerpc would
> > >>make all platforms and ABI variants happy?  
> > >
> > >I have no idea.  What is this "offset" anyway?  
> > 
> > offset (in bytes) from function start address..  
> 
> But what is there?

Function start address is what kallsyms returns. That is:

  grep function /proc/kallsyms

> 
> > >This is just the ELFv2 ABI.  No platform can make up its own thing at
> > >all (well, none decided to be gratuitously incompatible, so far).  And
> > >there are no "ABI variants"!  
> > 
> > The test case applies for ABIv1 & ABIv2. All ppc32 & ppc64 platforms..  
> 
> Hrm.  So you allow essentially random entry points on other ABIs to
> work?
> 
> > >You're just making assumptions here that are based on nothing else but
> > >observations of what is done most of the time.  That might work for a
> > >while -- maybe a long while even! -- but it can easily break down.  
> > 
> > Hmmm.. I understand that you want the test case to read st_other field
> > but would you rather suggest an offset of 64?  
> 
> I have no idea what "offset" means here.

The offset is the number of bytes from the address that is returned by
kallsyms.


> 
> > Is a GEP of 8/16 instructions going to be true anytime soon or is it
> > true already for some cases? The reason I ask that is some kprobe/ftrace
> > code in the kernel might need a bit of re-look if that is the case.  
> 
> An entry point has no instructions at all.  Oh, you mean the code at
> the GEP.
> 
> The LEP can already be all the allowed distances after the GEP.  And
> the .localentry GAS directive already supports all those distances
> always.  Not a lot of code written in assembler does use that, and
> certainly GCC does not use a lot of the freedom it has here, but it
> could (and so could assembler programmers).  Typically people will want
> to make the code here as short as possible, and there are restrictions
> on what is *allowed* to be done here anyway (ld, the link editor, can
> change this code after all!), so it is not too likely you will ever see
> big code at the GEP often, but times change, etc.


This is all determined by the kernel. It's considered a function entry by
the function:

   arch_kprobe_on_func_entry()

Which on PowerPC has:

static bool arch_kprobe_on_func_entry(unsigned long offset)
{
#ifdef CONFIG_PPC64_ELF_ABI_V2
#ifdef CONFIG_KPROBES_ON_FTRACE
        return offset <= 16;
#else
        return offset <= 8;
#endif
#else
        return !offset;
#endif  
}

So, being greater than 16 on powerpc with config CONFIG_PPC64_ELF_ABI_V2
set, would work. If that function changes, then the test needs to change.

-- Steve

