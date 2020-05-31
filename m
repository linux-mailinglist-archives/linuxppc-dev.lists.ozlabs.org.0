Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B672E1E9A5D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 22:43:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Zqyp1h4hzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 06:43:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 49ZqxG1pYYzDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 06:42:25 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 04VKg7G6016005;
 Sun, 31 May 2020 15:42:07 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 04VKg5KW016002;
 Sun, 31 May 2020 15:42:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 31 May 2020 15:42:05 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Will Springer <skirmisher@protonmail.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200531204205.GI31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <20200530192212.GG31009@gate.crashing.org> <2956705.fEcJ0Lxnt5@sheen>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2956705.fEcJ0Lxnt5@sheen>
User-Agent: Mutt/1.4.2.3i
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, daniel@octaforge.org,
 musl@lists.openwall.com, binutils@sourceware.org, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 31, 2020 at 12:57:12AM +0000, Will Springer wrote:
> On Saturday, May 30, 2020 12:22:12 PM PDT Segher Boessenkool wrote:
> > The original sysv PowerPC supplement
> > http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf
> > supports LE as well, and most powerpcle ports use that.  But, the
> > big-endian Linux ABI differs in quite a few places, and it of course
> > makes a lot better sense if powerpcle-linux follows that.
> 
> Right, I should have clarified I was talking about Linux ABIs 
> specifically.

That was the link you deleted.

> > What patches did you need?  I regularly build >30 cross compilers (on
> > both BE and LE hosts; I haven't used 32-bit hosts for a long time, but
> > in the past those worked fine as well).  I also cross-built
> > powerpcle-linux-gcc quite a few times (from powerpc64le, from powerpc64,
> > from various x86).
> 
> There was just an assumption that LE == powerpc64le in libgo, spotted by 
> q66 (daniel@ on the CC). I just pushed the patch to [1].

Please send GCC patches to gcc-patches@ ?

> > Almost no project that used 32-bit PowerPC in LE mode has sent patches
> > to the upstreams.
> 
> Right, but I have heard concerns from at least one person familiar with 
> the ppc kernel about breaking existing users of this arch-endianness 
> combo, if any. It seems likely that none of those use upstream, though ^^;

So we don't care, because we *cannot* care.

> > A huge factor in having good GCC support for powerpcle-linux (or
> > anything else) is someone needs to regularly test it, and share test
> > results with us (via gcc-testresults@).  Hint hint hint :-)
> > 
> > That way we know it is in good shape, know when we are regressing it,
> > know there is interest in it.
> 
> Once I have more of a bootstrapped userland than a barely-functional 
> cross chroot, I'll get back to you on that :)

Cool!  Looking forward to it.

Thanks,


Segher
