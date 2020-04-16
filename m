Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B91ACE6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 19:09:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4935L36hMyzDsLx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 03:09:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4934zN4c9SzDqWR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 02:53:01 +1000 (AEST)
Date: Thu, 16 Apr 2020 12:52:57 -0400
From: Rich Felker <dalias@libc.org>
To: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200416165257.GY11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <87k12gf32r.fsf@mid.deneb.enyo.de>
 <20200416153509.GT11469@brightrain.aerifal.cx>
 <87sgh3e613.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sgh3e613.fsf@mid.deneb.enyo.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: musl@lists.openwall.com, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 06:42:32PM +0200, Florian Weimer wrote:
> * Rich Felker:
> 
> > On Thu, Apr 16, 2020 at 06:48:44AM +0200, Florian Weimer wrote:
> >> * Rich Felker:
> >> 
> >> > My preference would be that it work just like the i386 AT_SYSINFO
> >> > where you just replace "int $128" with "call *%%gs:16" and the kernel
> >> > provides a stub in the vdso that performs either scv or the old
> >> > mechanism with the same calling convention.
> >> 
> >> The i386 mechanism has received some criticism because it provides an
> >> effective means to redirect execution flow to anyone who can write to
> >> the TCB.  I am not sure if it makes sense to copy it.
> >
> > Indeed that's a good point. Do you have ideas for making it equally
> > efficient without use of a function pointer in the TCB?
> 
> We could add a shared non-writable mapping at a 64K offset from the
> thread pointer and store the function pointer or the code there.  Then
> it would be safe.
> 
> However, since this is apparently tied to POWER9 and we already have a
> POWER9 multilib, and assuming that we are going to backport the kernel
> change, I would tweak the selection criterion for that multilib to
> include the new HWCAP2 flag.  If a user runs this glibc on a kernel
> which does not have support, they will get set baseline (POWER8)
> multilib, which still works.  This way, outside the dynamic loader, no
> run-time dispatch is needed at all.  I guess this is not at all the
> answer you were looking for. 8-)

How does this work with -static? :-)

> If a single binary is needed, I would perhaps follow what Arm did for
> -moutline-atomics: lay out the code so that its easy to execute for
> the non-POWER9 case, assuming that POWER9 machines will be better at
> predicting things than their predecessors.
> 
> Or you could also put the function pointer into a RELRO segment.  Then
> there's overlap with the __libc_single_threaded discussion, where
> people objected to this kind of optimization (although I did not
> propose to change the TCB ABI, that would be required for
> __libc_single_threaded because it's an external interface).

Of course you can use a normal global, but now every call point needs
to setup a TOC pointer (= two entry points and more icache lines for
otherwise trivial functions).

I think my choice would be just making the inline syscall be a single
call insn to an asm source file that out-of-lines the loading of TOC
pointer and call through it or branch based on hwcap so that it's not
repeated all over the place.

Alternatively, it would perhaps work to just put hwcap in the TCB and
branch on it rather than making an indirect call to a function pointer
in the TCB, so that the worst you could do by clobbering it is execute
the wrong syscall insn and thereby get SIGILL.

Rich
