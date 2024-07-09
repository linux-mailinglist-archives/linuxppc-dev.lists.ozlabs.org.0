Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC792B9FD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 14:52:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a2eLobqo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJLW71M26z3cVH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 22:52:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a2eLobqo;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJLVR3wrbz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 22:52:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720529535;
	bh=9EMrWwiwjkAmc8Lp2/P3hrtiQWOommhCyJibucD2H7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a2eLobqoSmFtoLTwgo4SDAaokj7GKB8kB6fADXGo3UFNB/amLpcva0vkvZpdRfvY/
	 Y4dRSRBeM1MleK+nc/jiB8NnYpczuwPLbVlbWbfU7oZZZAC3bJftuXjOZeXQk9Sf25
	 zm9GTqy+ILWfhJ5BnSdHAsJo+nQMmJSDT8ioFWBrEfghEiALeS2ThhjnpjyzEBQ2+s
	 wUUhVzOiYPjjJERAljkAtpYWU3GqKekZ/GmqwNikKw1mcDHGriVUJA+o6fclFDwbZt
	 NOxUK42xWbJMuGmfRMdh/M2FBCDWdX5VgFei+8qOb0isoYxSC4CIl+jS6LN/jZJmV5
	 3C1yGyaZHU1AQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJLVR26bFz4wnx;
	Tue,  9 Jul 2024 22:52:15 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naveen N Rao
 <naveen@kernel.org>
Subject: Re: WARNING&Oops in v6.6.37 on ppc64lea - Trying to vfree() bad
 address (00000000453be747)
In-Reply-To: <87sewi68q4.fsf@mail.lhotse>
References: <20240705203413.wbv2nw3747vjeibk@altlinux.org>
 <cf736c5e37489e7dc7ffd67b9de2ab47@matoro.tk>
 <2024070904-cod-bobcat-a0d0@gregkh>
 <1720516964.n61e0dnv80.naveen@kernel.org>
 <2024070958-plant-prozac-6a33@gregkh> <87sewi68q4.fsf@mail.lhotse>
Date: Tue, 09 Jul 2024 22:52:14 +1000
Message-ID: <87msmq683l.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: matoro <matoro_mailinglist_kernel@matoro.tk>, stable@vger.kernel.org, Vitaly Chikunov <vt@altlinux.org>, Hari Bathini <hbathini@linux.ibm.com>, bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, ltp@lists.linux.it
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> On Tue, Jul 09, 2024 at 03:02:13PM +0530, Naveen N Rao wrote:
>>> Greg Kroah-Hartman wrote:
>>> > On Mon, Jul 08, 2024 at 11:16:48PM -0400, matoro wrote:
>>> > > On 2024-07-05 16:34, Vitaly Chikunov wrote:
>>> > > > Hi,
>>> > > > > There is new WARNING and Oops on ppc64le in v6.6.37 when running
>>> > > LTP tests:
>>> > > > bpf_prog01, bpf_prog02, bpf_prog04, bpf_prog05, prctl04. Logs excerpt
>>> > > > below. I
>>> > > > see there is 1 commit in v6.6.36..v6.6.37 with call to
>>> > > > bpf_jit_binary_pack_finalize, backported from 5 patch mainline patchset:
>>> > > > >   f99feda5684a powerpc/bpf: use
>>> > > bpf_jit_binary_pack_[alloc|finalize|free]
>>> > > >
>>> 
>>> <snip>
>>> 
>>> > > > > And so on. Temporary build/test log is at
>>> > > > https://git.altlinux.org/tasks/352218/build/100/ppc64le/log
>>> > > > > Other stable/longterm branches or other architectures does not
>>> > > exhibit this.
>>> > > > > Thanks,
>>> > > 
>>> > > Hi all - this just took down a production server for me, on POWER9 bare
>>> > > metal.  Not running tests, just booting normally, before services even came
>>> > > up.  Had to perform manual restoration, reverting to 6.6.36 worked.  Also
>>> > > running 64k kernel, unsure if it's better on 4k kernel.
>>> > > 
>>> > > In case it's helpful, here's the log from my boot:
>>> > > https://dpaste.org/Gyxxg/raw
>>> > 
>>> > Ok, this isn't good, something went wrong with my backports here.  Let
>>> > me go revert them all and push out a new 6.6.y release right away.
>>> 
>>> I think the problem is that the series adding support for bpf prog_pack was
>>> partially backported. In particular, the below patches are missing from
>>> stable v6.6:
>>> 465cabc97b42 powerpc/code-patching: introduce patch_instructions()
>>> 033ffaf0af1f powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
>>> 6efc1675acb8 powerpc/bpf: implement bpf_arch_text_copy
>>> 
>>> It should be sufficient to revert commit f99feda5684a (powerpc/bpf: use
>>> bpf_jit_binary_pack_[alloc|finalize|free]) to allow the above to apply
>>> cleanly, followed by cherry picking commit 90d862f370b6 (powerpc/bpf: use
>>> bpf_jit_binary_pack_[alloc|finalize|free]) from upstream.
>>> 
>>> Alternately, commit f99feda5684a (powerpc/bpf: use
>>> bpf_jit_binary_pack_[alloc|finalize|free]) can be reverted.
>>
>> I'm dropping them all now, if you want to submit a working series for
>> this, I'll be glad to queue them all up.
>
> Thanks, revert is good for now.
>
> With the revert there will be a build warning/error, only in stable,
> which I think can be fixed with the diff below.

Oh I see you also reverted the commit that introduces that warning, so
the build should be OK now.

cheers
