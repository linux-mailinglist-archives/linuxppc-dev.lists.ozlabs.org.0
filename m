Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9ED92B421
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 11:41:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=B7Jhoz0b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJGFp6M8Zz3dC1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 19:41:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=B7Jhoz0b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJGF64d9qz2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 19:40:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C712C60F3E;
	Tue,  9 Jul 2024 09:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3933C32786;
	Tue,  9 Jul 2024 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720518022;
	bh=zDQMeE37biW7ERmyjD/Ec9NvHO+hvzgb1NmDdJv4Pic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7Jhoz0bHAUt5hHwJtGldKeFjGjaOfySM/ZjXWWGO1FoZ0/IbAlAxbAptHEMDoBqM
	 7DNHn//Nl7rJjGue9y/sRNTFc8f+jXuOjuCNBz5KewiY0JO0GTyCgjiNsk3OAb3Z0f
	 tXGu1Bfjy3rKly/jK5SbR7Q1/g8ea9Vi/6dh1ffU=
Date: Tue, 9 Jul 2024 11:40:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: WARNING&Oops in v6.6.37 on ppc64lea - Trying to vfree() bad
 address (00000000453be747)
Message-ID: <2024070958-plant-prozac-6a33@gregkh>
References: <20240705203413.wbv2nw3747vjeibk@altlinux.org>
 <cf736c5e37489e7dc7ffd67b9de2ab47@matoro.tk>
 <2024070904-cod-bobcat-a0d0@gregkh>
 <1720516964.n61e0dnv80.naveen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1720516964.n61e0dnv80.naveen@kernel.org>
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

On Tue, Jul 09, 2024 at 03:02:13PM +0530, Naveen N Rao wrote:
> Greg Kroah-Hartman wrote:
> > On Mon, Jul 08, 2024 at 11:16:48PM -0400, matoro wrote:
> > > On 2024-07-05 16:34, Vitaly Chikunov wrote:
> > > > Hi,
> > > > > There is new WARNING and Oops on ppc64le in v6.6.37 when running
> > > LTP tests:
> > > > bpf_prog01, bpf_prog02, bpf_prog04, bpf_prog05, prctl04. Logs excerpt
> > > > below. I
> > > > see there is 1 commit in v6.6.36..v6.6.37 with call to
> > > > bpf_jit_binary_pack_finalize, backported from 5 patch mainline patchset:
> > > > >   f99feda5684a powerpc/bpf: use
> > > bpf_jit_binary_pack_[alloc|finalize|free]
> > > >
> 
> <snip>
> 
> > > > > And so on. Temporary build/test log is at
> > > > https://git.altlinux.org/tasks/352218/build/100/ppc64le/log
> > > > > Other stable/longterm branches or other architectures does not
> > > exhibit this.
> > > > > Thanks,
> > > 
> > > Hi all - this just took down a production server for me, on POWER9 bare
> > > metal.  Not running tests, just booting normally, before services even came
> > > up.  Had to perform manual restoration, reverting to 6.6.36 worked.  Also
> > > running 64k kernel, unsure if it's better on 4k kernel.
> > > 
> > > In case it's helpful, here's the log from my boot:
> > > https://dpaste.org/Gyxxg/raw
> > 
> > Ok, this isn't good, something went wrong with my backports here.  Let
> > me go revert them all and push out a new 6.6.y release right away.
> 
> I think the problem is that the series adding support for bpf prog_pack was
> partially backported. In particular, the below patches are missing from
> stable v6.6:
> 465cabc97b42 powerpc/code-patching: introduce patch_instructions()
> 033ffaf0af1f powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
> 6efc1675acb8 powerpc/bpf: implement bpf_arch_text_copy
> 
> It should be sufficient to revert commit f99feda5684a (powerpc/bpf: use
> bpf_jit_binary_pack_[alloc|finalize|free]) to allow the above to apply
> cleanly, followed by cherry picking commit 90d862f370b6 (powerpc/bpf: use
> bpf_jit_binary_pack_[alloc|finalize|free]) from upstream.
> 
> Alternately, commit f99feda5684a (powerpc/bpf: use
> bpf_jit_binary_pack_[alloc|finalize|free]) can be reverted.

I'm dropping them all now, if you want to submit a working series for
this, I'll be glad to queue them all up.

thanks,

greg k-h
