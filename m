Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 638248CA887
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 09:11:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zxTcwa2k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vk56V6Zmxz3gBG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 17:05:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zxTcwa2k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vk55n3gnCz3dPs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 17:04:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84F9361DFA;
	Tue, 21 May 2024 07:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4214C2BD11;
	Tue, 21 May 2024 07:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716275063;
	bh=jTFoWep9CrjPm1XdT0Ss5Vaisoeq5vLKtBQmSKNyKao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zxTcwa2k5RLnNo+p6Ae7dMqqW/o/VXwgPrQ0pHPTb3Yz1qNn3vC2feW8/x0Q9so3+
	 MdxDPBsuKTJXE8RgRs3zsFf2orypvFvyaGqWmUKqYKPIpEIfnZdsoEWa0PcRP2938d
	 pI3lkNbE2zrUm2O6Yrpt9DG1tEc1FRNLGReRX8G8=
Date: Tue, 21 May 2024 09:04:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: CVE-2023-52665: powerpc/ps3_defconfig: Disable
 PPC64_BIG_ENDIAN_ELF_ABI_V2
Message-ID: <2024052108-observing-veteran-a175@gregkh>
References: <2024051725-CVE-2023-52665-1d6f@gregkh>
 <87zfslufoo.fsf@mail.lhotse>
 <d8c56e37-38c6-454e-81be-a574b42c83be@infradead.org>
 <2024052016-footnote-smelting-842e@gregkh>
 <8734qc3v1m.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734qc3v1m.fsf@mail.lhotse>
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
Cc: Geoff Levand <geoff@infradead.org>, cve@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-cve-announce@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2024 at 09:47:33AM +1000, Michael Ellerman wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > On Mon, May 20, 2024 at 05:35:32PM +0900, Geoff Levand wrote:
> >> On 5/20/24 16:04, Michael Ellerman wrote:
> >> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> >> >> Description
> >> >> ===========
> >> >>
> >> >> In the Linux kernel, the following vulnerability has been resolved:
> >> >>
> >> >> powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2
> >> >>
> >> >> Commit 8c5fa3b5c4df ("powerpc/64: Make ELFv2 the default for big-endian
> >> >> builds"), merged in Linux-6.5-rc1 changes the calling ABI in a way
> >> >> that is incompatible with the current code for the PS3's LV1 hypervisor
> >> >> calls.
> >> >>
> >> >> This change just adds the line '# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set'
> >> >> to the ps3_defconfig file so that the PPC64_ELF_ABI_V1 is used.
> >> >>
> >> >> Fixes run time errors like these:
> >> >>
> >> >>   BUG: Kernel NULL pointer dereference at 0x00000000
> >> >>   Faulting instruction address: 0xc000000000047cf0
> >> >>   Oops: Kernel access of bad area, sig: 11 [#1]
> >> >>   Call Trace:
> >> >>   [c0000000023039e0] [c00000000100ebfc] ps3_create_spu+0xc4/0x2b0 (unreliable)
> >> >>   [c000000002303ab0] [c00000000100d4c4] create_spu+0xcc/0x3c4
> >> >>   [c000000002303b40] [c00000000100eae4] ps3_enumerate_spus+0xa4/0xf8
> >> >>
> >> >> The Linux kernel CVE team has assigned CVE-2023-52665 to this issue.
> >> > 
> >> > IMHO this doesn't warrant a CVE. The crash mentioned above happens at
> >> > boot, so the system is not vulnerable it's just broken :)
> >> 
> >> As Greg says, with PPC64_BIG_ENDIAN_ELF_ABI_V2 enabled the system won't
> >> boot, so there is no chance of a vulnerability.
> >
> > The definition of "vulnerability" from CVE.org is:
> > 	An instance of one or more weaknesses in a Product that can be
> > 	exploited, causing a negative impact to confidentiality, integrity, or
> > 	availability; a set of conditions or behaviors that allows the
> > 	violation of an explicit or implicit security policy.
> >
> > Having a system that does not boot is a "negative impact to
> > availability", which is why this was selected for a CVE.  I.e. if a new
> > kernel update has this problem in it, it would not allow the system to
> > boot correctly.
> 
> I think the key word above is "exploited", implying some sort of
> unauthorised action.
> 
> This bug can cause the system to not boot, but only by someone who
> builds a new kernel and installs it - and if they have permission to do
> that they can just replace the kernel with anything, they don't need a
> bug.
> 
> > But, if the maintainer of the subsystem thinks this should not be
> > assigned a CVE because of this fix, we'll be glad to revoke it.
> >
> > Michael, still want this revoked?
> 
> Yes please.

Now rejected, thanks all for the review!

greg k-h
