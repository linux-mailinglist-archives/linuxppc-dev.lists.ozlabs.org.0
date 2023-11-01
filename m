Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E54867DE567
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 18:35:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gkQcweyp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLDfx697yz3cbd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 04:35:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gkQcweyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLDf623KCz3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 04:34:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DC3461009;
	Wed,  1 Nov 2023 17:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCAFC433C7;
	Wed,  1 Nov 2023 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698860074;
	bh=AZ7FlxIgY3mFat3YE3LfxcZV9vaFbjtvd2CiHdrDoCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkQcweypPovpUSspGMtCjAHctsSyLjgOpC3UlBBPdNulRFiCGEvPp5PnVau8FH/oa
	 GnBCD2dRnJoWG8XokCaU59fPYvF2ikbIAgQlF7sYqMjojw3OVOZZK5myToHFRpRH9O
	 nCrQVqID2A1K1nWT8RS20fHPbBSiqG55455VuPC5t857ciRMQXPce/3D6q8rhic0gE
	 ojplor16FOwW9x06v5frTYo3Wx+Z4iBBD7I8xeln2PUltuMH1EJMORWeBo1NsWz5eS
	 8/tpj5FaCqpkzsh2amzhnFFSCcZ016bwjazkjb6MoEcssJZfhS7C4G1u73eNx5urGZ
	 N4Pz+BJbHhZfg==
Date: Wed, 1 Nov 2023 10:34:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [pci:controller/xilinx-xdma] BUILD REGRESSION
 8d786149d78c7784144c7179e25134b6530b714b
Message-ID: <20231101173432.GC1368360@dev-arch.thelio-3990X>
References: <20231031171401.GA17989@bhelgaas>
 <da1413c0-d81a-47b6-8283-0fb3da7975e6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da1413c0-d81a-47b6-8283-0fb3da7975e6@app.fastmail.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-pci@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 01, 2023 at 10:25:25AM +0100, Arnd Bergmann wrote:
> On Tue, Oct 31, 2023, at 18:14, Bjorn Helgaas wrote:
> > On Tue, Oct 31, 2023 at 09:59:29AM -0700, Nick Desaulniers wrote:
> >> On Tue, Oct 31, 2023 at 7:56 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> >> >   arch/powerpc/xmon/xmon.c:             release_output_lock();
> >> >
> >> > That said, the unused functions do look legit:
> >> >
> >> > grackle_set_stg() is a static function and the only call is under
> >> > "#if 0".
> >> 
> >> Time to remove it then? Or is it a bug that it's not called?
> >> Otherwise the definition should be behind the same preprocessor guards
> >> as the caller.  Same for the below.
> 
> It would be nice to get rid of all warnings about unused
> "static inline" functions and "static const" variables in .c
> files. I think both these warnings got added at the W=1 level
> for compilers that support them at some point, but are ignored
> for normal builds without W=1 because they are too noisy.
> 
> Obviously, all compilers ignore unused inline functions and
> const variables in header files regardless of the warning level.

Right, this was an intentional change done by Masahiro to try and take
advantage of the fact that clang warns about unused static inline
functions in .c files (whereas GCC has no warning in .c or .h files) to
clean up dead code. See commit 6863f5643dd7 ("kbuild: allow Clang to
find unused static inline functions for W=1 build") for more
information.

Cheers,
Nathan
