Return-Path: <linuxppc-dev+bounces-13814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE2C37834
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 20:39:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1wdC5nSXz3bt1;
	Thu,  6 Nov 2025 06:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762371583;
	cv=none; b=ouwH2eiVjMvAETu72cIBMuMqq8W23Ks9cYHmbiItSHEev71OwLWWC3f41FXtI0+93/quK+QYeMEluReRyGekBEtaEsv6TIGz99aSsMjT8I38aSdZv/kVMoZ/LObCbvhiSoNiNwrKCDmoCUBV/AUjPGmy2cqMv8mNi00S1lHFLYhZJD2mSrXMTNu5ux+q9wDgSil+B3uvgKMCFOWLy2D7F1LJPOR/Fb0h4Dm8UOJhtIoGJ8+D8nylfsU1x7HPuDwBvYyfPsSmlgCQqmTh6bvCa1kHb5LqTg48ItluVtAHDVN9/StaHhZtk6STdnbyawxoflapx22G6UYcJGZ4N6CyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762371583; c=relaxed/relaxed;
	bh=nJism+WZg14S3mIzqT7BU2MJ+ZsJmgGFJ/ELDKYvUzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHZo9SmqE+Q4egL8knHMw+/5ikuraK5JeDaW4Pfh+pTBZQBrAW90PYumucVFf/8BgctqUHlRJANYlhWSW+PqiaWHN9EATpAr+QZXVQAjG9sLia3OgEITpmQx6MdbpIb1sBx13V8UjsXMP2WTbEfy3RezalpAB94XT7Qk/fOVgRwGhNx+Obxrn0Ow/SgcZRyTlyQcnYmUtjNpt/2V1vdl5jxxSpRVERfCSGBW2AEHgD6xdbWRYIfwRZQaIu7gWqzfGjKSEmwe1+YxRGlvS5hGGPOxPEdRXpmz5t5AkESRd5d9pybo9AJPJwHXW1tuzacT4c9HXZoQSMnRxyfAUP5gXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DCo8aa7t; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DCo8aa7t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1wdB5QH4z2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 06:39:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73D01402C4;
	Wed,  5 Nov 2025 19:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F408C4CEF5;
	Wed,  5 Nov 2025 19:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762371580;
	bh=msHJOFVV1OB3Fpzsq8IVbuj9UIdZOpLQ1nNFvVBvM9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCo8aa7tr6qCXCAwbmbfBQHe6+J1XQ92v/dEdS0D1RmsTXvTBe2y4QWq3i4ntmkp4
	 hCwptFye8pcPGdiXeKcVMxkeZBrhHluCYl/vU6sn2vu9+WiYI0AQa71hlYpPJp+uwk
	 nLmGphbfV4NSrG1Ku28gkrTDNfaJG1ZzoKebd314vXufpylTRn3P6E0nSQVUMFx+/G
	 nEygicNERiduVcddaetu2bZdLTIFFi4RDC/xSKeOjPk8imNyFUelcn9MA6scQFhpbq
	 naUiHjcZXZDebrmf1ZMmCKbSsI1gDu42pHY/3/s/yeqOxXjPKqA78jz/c32pbgcTEw
	 rVKRvBK26YgJQ==
Date: Wed, 5 Nov 2025 12:39:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Add '-fms-extensions' to areas with dedicated
 CFLAGS
Message-ID: <20251105193931.GA2480016@ax162>
References: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
 <20251105-amnesie-eisig-277559b69bae@brauner>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-amnesie-eisig-277559b69bae@brauner>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025 at 01:56:02PM +0100, Christian Brauner wrote:
> On Sat, Nov 01, 2025 at 12:35:47PM -0400, Nathan Chancellor wrote:
> > This is a follow up to commit c4781dc3d1cf ("Kbuild: enable
> > -fms-extensions") but in a separate change due to being substantially
> > different from the initial submission.
> > 
> > There are many places within the kernel that use their own CFLAGS
> > instead of the main KBUILD_CFLAGS, meaning code written with the main
> > kernel's use of '-fms-extensions' in mind that may be tangentially
> > included in these areas will result in "error: declaration does not
> > declare anything" messages from the compiler.
> > 
> > Add '-fms-extensions' to all these areas to ensure consistency, along
> > with -Wno-microsoft-anon-tag to silence clang's warning about use of the
> > extension that the kernel cares about using. parisc does not build with
> > clang so it does not need this warning flag. LoongArch does not need it
> > either because -W flags from KBUILD_FLAGS are pulled into cflags-vdso.
> > 
> > Reported-by: Christian Brauner <brauner@kernel.org>
> > Closes: https://lore.kernel.org/20251030-meerjungfrau-getrocknet-7b46eacc215d@brauner/
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > I am taking the original '-fms-extensions' change [1] via a shared
> > branch in kbuild [2] so I would appreciate acks. I plan to finalize that
> > branch so that other maintainers can safely pull it on Thursday.
> > 
> > [1]: https://git.kernel.org/kbuild/c/c4781dc3d1cf0e017e1f290607ddc56cfe187afc
> > [2]: https://git.kernel.org/kbuild/l/kbuild-ms-extensions
> > ---
> 
> I'll give my ack:
> 
> Reviewed-by: Christian Brauner <brauner@kernel.org>
> 
> but don't invalidate the branch just to add my RvB if you've already had
> it stable.

I was planning to make it stable tomorrow to give folks time to chime in
at the beginning of the week. I have your tag and Ard's to add. After
that, we will just have to rely on the link to this submission for
follow ups.

Cheers,
Nathan

