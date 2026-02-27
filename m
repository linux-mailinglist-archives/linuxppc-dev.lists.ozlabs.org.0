Return-Path: <linuxppc-dev+bounces-17401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHKILSzIoWkVwQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 17:37:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 335281BADE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 17:36:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMv9g0kVqz30Sv;
	Sat, 28 Feb 2026 03:36:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772210214;
	cv=none; b=Rua/w3dTXuIdjF5PydNEKjuqCuXt5YYQr48GdNbllz8xHO+VrjGJXcIowbsLbOiFTGfoUzXNdw8RjitLE6F4yIfZiILV/qIdHR+5IiKCTE5oql5lzh0QRXdJUXcIJXrr7wjmSkJJugGF589Z1Bqe+FvtvhLlmLe99NkyNsl+S97gkbO2vQ+gbZUdxEMu0FVOie8JFc9s9i5nT/cbVtx6jCeozbSPjmoLIKRg5KZ3c7nodOHTjfBHBneFwQ4UJ6KQOPXw1jBNhJ+uw2cDZ+mjPNfoXQfpoy34m0pVRLSwIJXeRi3uQXVYY6oFsJgG4WuFYbeP1ohgcAFD7iQFK43M2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772210214; c=relaxed/relaxed;
	bh=/RMJ9vglHRabpfidLDVP2vBp9Odg4KBJTy36nr1qkQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJlMjp2jDZMVt0osdGbWm7A0GhOXLgxcR6j73+nDhLgKv8QBvLkVnUoI3dqqtRrijN4MPYe3g7DSZPM9xv2yZWYE4OaP6NIHqs4BX8FYm0mbDd1+waxlXZiQiTZH81SV8PkQQ3Pl2ddOy/Vw6FsZ/YeSs0/+bIX16qsDiO4uQOpTG6PnB8ArVDwZKSGgiX1OY+i6YqO3CHiWhlWl1Dd+58g+Ko+EYZEb7o2yvGGV9Whc7RSpTUFi3AxlGuD1g6SJYIzX8J2NtLnrSUoyQuCQ9CMX3We1zYaD6nnh9GqM3a6z/6Y4kWejJX8ByU0CJ1G4+yLDD2005aqeugT8J8sv0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MB9xUxSA; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MB9xUxSA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMv9d2J2gz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 03:36:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E197160008;
	Fri, 27 Feb 2026 16:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1501EC116C6;
	Fri, 27 Feb 2026 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772210210;
	bh=Z3uhduLHgelJSPSi026On/FywI8UKkvvjlJZUY1E4uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MB9xUxSAbn+Di/nKHpsy4Owu9dULnOKmLKkKAH28ikPcwz8E+RbfqqGz2GrfUKoS2
	 rvjh4SLv6O9JiT+L+6SpQ0H/DrDTd5iZ4+QO2UVbr+MNaN2vtvrRDHMh8InzWzLS16
	 cncFCKpao/cWYr+w7ULn5xRgtHEAxOxUtF8TV9x/Gfm0Xhf56APc04TeRI/vI1HLWn
	 rCK2y6qdS+KgajafeMKD0K51X5N68v1p6QI6T4oKzSBTbcUtFAPrySuzhetHWqfeao
	 I9O/HuD47cl1xQtwtjRali7R0u0JCyq+rfuleR6cQliX8wPX4/lv7UgeBNEjV4a1Vi
	 RyCLvFYLUeHLQ==
Date: Fri, 27 Feb 2026 17:36:33 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] kbuild: Consolidate C dialect options
Message-ID: <aaHIEQPiAbd7DGlW@derry.ads.avm.de>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-1-8ee406d3c36c@kernel.org>
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
In-Reply-To: <20260223-fms-anonymous-structs-v1-1-8ee406d3c36c@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17401-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:torvalds@linux-foundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER(0.00)[nsc@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,arm.com,kernel.org,xen0n.name,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,linaro.org,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[derry.ads.avm.de:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 335281BADE9
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:10:28PM -0700, Nathan Chancellor wrote:
> Introduce CC_FLAGS_DIALECT to make it easier to update the various
> places in the tree that rely on the GNU C standard and Microsoft
> extensions flags atomically. All remaining uses of '-std=gnu11' and
> '-fms-extensions' are in the tools directory (which has its own build
> system) and other standalone Makefiles. This will allow the kernel to
> use a narrower option to enable the Microsoft anonymous tagged structure
> extension in a simpler manner. Place the CC_FLAGS_DIALECT block after
> the configuration include (so that a future change can move the
> selection of the flag to Kconfig) but before the
> arch/$(SRCARCH)/Makefile include (so that CC_FLAGS_DIALECT is available
> for use in those Makefiles).
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Makefile                              | 16 ++++++++++++----
>  arch/arm64/kernel/vdso32/Makefile     |  3 +--
>  arch/loongarch/vdso/Makefile          |  2 +-
>  arch/parisc/boot/compressed/Makefile  |  2 +-
>  arch/powerpc/boot/Makefile            |  3 +--
>  arch/s390/Makefile                    |  3 +--
>  arch/s390/purgatory/Makefile          |  3 +--
>  arch/x86/Makefile                     |  6 +-----
>  arch/x86/boot/compressed/Makefile     |  6 +-----
>  drivers/firmware/efi/libstub/Makefile |  3 +--
>  scripts/Makefile.warn                 |  5 -----
>  11 files changed, 21 insertions(+), 31 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

