Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB917700C5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:05:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gUYMlOrf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHQtx1VWjz3cTr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 23:05:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gUYMlOrf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHQsw1qx3z2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 23:04:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2752861FD1;
	Fri,  4 Aug 2023 13:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C97C433C8;
	Fri,  4 Aug 2023 13:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691154288;
	bh=89r/cdPXUA3crJLOF3jvKSSR2U3OJaNBikJcnHTJn8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUYMlOrfhs6V2ihRFqHUGhHMMYmMbicrmDYusJpbidqVz7/W3N9yODCXo+KSy/7IE
	 Q7WKyfeiHvaKdEwjZ0XfcHRzwBp8IEKN8SMFMsyKgq2TBTZ/tkpJhxSOsjaAV8tO7+
	 cdoSzqVVANT7dDsGKYnheeTz2lnX4eTOoHAkYAX39McHpg8KzdqvxvSiUrHMkNB8F7
	 z1yWxTheru1Xu87cnT4nOT33rnMmmgqhfhFz7tE8KgvwkzyBvrvMIWjwF6z+8M6hIV
	 eEflx7YZSm5zsv4tLE77TXac5S1gfpNvHdxi9ZKWEOw74M2ZGGTKFl8NuBTSqopvAk
	 kMU68qIP13ohg==
Date: Fri, 4 Aug 2023 14:04:43 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] word-at-a-time: use the same return type for has_zero
 regardless of endianness
Message-ID: <20230804130431.GA29929@willie-the-truck>
References: <20230801-bitwise-v1-1-799bec468dc4@google.com>
 <CAHk-=wgkC80Ey0Wyi3zHYexUmteeDL3hvZrp=EpMrDccRGmMwA@mail.gmail.com>
 <20230802161553.GA2108867@dev-arch.thelio-3990X>
 <CAHk-=wjmWjd+xe88cf14hFGkSK7fYJBSixK8Ym0DLYCa+dTxtg@mail.gmail.com>
 <dd48b4ff-1009-41fe-baf5-be89432c5d28@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd48b4ff-1009-41fe-baf5-be89432c5d28@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 02, 2023 at 08:17:32PM +0200, Arnd Bergmann wrote:
> On Wed, Aug 2, 2023, at 19:37, Linus Torvalds wrote:
> > On Wed, 2 Aug 2023 at 09:16, Nathan Chancellor <nathan@kernel.org> wrote:
> >>
> >> We see this warning with ARCH=arm64 defconfig + CONFIG_CPU_BIG_ENDIAN=y.
> >
> > Oh Christ. I didn't even realize that arm64 allowed a BE config.
> >
> > The config option goes back to 2013 - are there actually BE user space
> > implementations around?
> 
> At least NXP's Layerscape and Huawei's SoCs ended up in big-endian
> appliances, running legacy software ported from mips or powerpc.
> I agree this was a mistake, but that wasn't nearly as obvious ten
> years ago when there were still new BE-only sparc, mips and powerpc
> put on the market -- that really only ended in 2017.
> 
> > People, why do we do that? That's positively crazy. BE is dead and
> > should be relegated to legacy platforms. There are no advantages to
> > being different just for the sake of being different - any "security
> > by obscurity" argument would be far outweighed by the inconvenience to
> > actual users.
> >
> > Yes, yes, I know the aarch64 architecture technically allows BE
> > implementations - and apparently you can even do it by exception
> > level, which I had to look up. But do any actually exist?
> >
> > Does the kernel even work right in BE mode? It's really easy to miss
> > some endianness check when all the actual hardware and use is LE, and
> > when (for example) instruction encoding and IO is then always LE
> > anyway.
> 
> This was always only done for compatibility with non-portable
> software when companies with large custom network stacks argued
> that it was cheaper to build the entire open source software to
> big-endian than port their own product to little-endian. ;-)
> 
> We (Linaro) used to test all toolchain and kernel releases in
> big-endian mode as member companies had customers that asked
> for it, but that stopped a while ago as those legacy software
> stacks either got more portable or got replaced over time.
> 
> Many Arm systems won't boot BE kernels any more because UEFI
> firmware only supports LE, or because of driver bugs.
> Virtual machines are still likely to work fine though.
> I'm fairly sure that all Arm Cortex and Neoverse cores still\
> support BE mode in all exception levels, OTOH at least Apple's
> custom CPUs do not implement it at all.

Yes, that's right. The CPUs we have *do* tend to support BE, but
practically there isn't any software to run on them. I asked about
removing it a few years ago:

https://lore.kernel.org/linux-arm-kernel/20191011102747.lpbaur2e4nqyf7sw@willie-the-truck/

but Hanjun said that Huawei are using it, so it stayed.

Will
