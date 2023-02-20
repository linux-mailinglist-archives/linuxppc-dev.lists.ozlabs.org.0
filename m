Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EA569D0F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 16:52:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PL6Nw507mz3c6V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 02:52:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IX7T7SfZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IX7T7SfZ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PL6N21ND0z3Wtp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 02:51:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 67595B80B49;
	Mon, 20 Feb 2023 15:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996B5C433D2;
	Mon, 20 Feb 2023 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676908269;
	bh=wOTNmM/rz3jrTV1ds+AgaiAA4vZjdn8ItdA+1UsLrJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IX7T7SfZfHgBLjetbffAQXt+9NN7ezi0KNeduFGeldn/T/vtz1g2Su9/Wi7bjPAbw
	 KTZo5fECYY4Mo4rGRSdrbSoG1duju0nd3Go6FA9S7nRjcoud2BHiBXH0WS1POJxfpl
	 pluLPBJD+VEWJIXp9l4yAWxQcHJftXjBMbCqjMWKmSBDqb4dxj1QKX94FgzDf63qSr
	 k8wXWwdEAlW19pBHJli0Ek46N4YFCXE9liCaosUgOyk2N1VNKbn/FA5HXXttAZAChP
	 /zWOVBCApciID7bjFxrlIjYSgOavfwtBo4Xblhv9DYDb0QS1cIV936kQ4GmDqk5TlO
	 a0SViTeqjgLgQ==
Date: Mon, 20 Feb 2023 08:51:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 0/3] Allow CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 with ld.lld
 15+
Message-ID: <Y/OW6mRi3qDpVQkc@dev-arch.thelio-3990X>
References: <20230118-ppc64-elfv2-llvm-v1-0-b9e2ec9da11d@kernel.org>
 <87wn4cyifp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn4cyifp.fsf@mpe.ellerman.id.au>
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
Cc: erhard_f@mailbox.org, trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org, patches@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 20, 2023 at 05:11:54PM +1100, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > Currently, CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not selectable with
> > ld.lld because of an explicit dependency on GNU ld, due to lack of
> > testing with LLVM.
> >
> > Erhard was kind enough to test this option on his hardware with LLVM 15,
> > which ran without any issues. This should not be too surprising, as
> > ld.lld does not have support for the ELFv1 ABI, only ELFv2, so it should
> > have decent support. With this series, big endian kernels can be built
> > with LLVM=1.
> >
> > This has seen our basic set of powerpc configurations with clang-15,
> > clang-16, and clang-17 but I will never be opposed to more testing :)
> >
> > The first two patches fix a couple of issues I noticed while build
> > testing and the final patch actually allows the option to be selected.
> 
> Thanks for this.
> 
> I thought about applying this last week but decided not to. I'll plan to
> pick it up for 6.4.

No worries, I sent this much later in the development cycle than I had
initially intended, so I figured that 6.3 was a long shot anyways. Plus
more soak time is never a bad thing :)

Thanks for taking the initial look, cheers!
Nathan
