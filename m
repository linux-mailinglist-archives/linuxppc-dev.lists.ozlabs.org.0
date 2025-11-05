Return-Path: <linuxppc-dev+bounces-13794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 875DDC35B87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 13:56:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1lgg2svgz3bmk;
	Wed,  5 Nov 2025 23:56:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762347375;
	cv=none; b=WKR72fq7URx14+sFJYE/4IsfEHSj375xIfKqQ8Qm3x6PUpyjHKin3Qojx4qYRoM5M5nRisa7O4qFJhcfx9iauNu945KrsBSZHpPwmypRB60xsMDJlIdssm/NP8YMW+qSmkmonEw5fMfgWeg/uV2+ld4IiwD1z5NTFH3b6Q8UiIBTPpK26/Ai0H1EauS6H4Ipf6+wsIpQK4vca1zpHWwbxCxJ/E/SvLeQelZ+khJNYl4BukIcAsrmAOhme14h5hTVVNCpAkLRRjzNEMoQVBvGMM8xFePPylxOdLDj/MbfnV4T3FYlXA8Voa6Qrwlz4w5O/Ypb062ViVytCpWQ0ZLUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762347375; c=relaxed/relaxed;
	bh=bE00UD2ozi1TjxFPhaSfMHrkqaRtzchM5nf4A0iLV4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjWXtlw48aQqmAZSFo2WZOWWt2HIP1Tvu3Va1nXWpktaDNHEcKr7IHqegICZVPQoayhd/y+XuchJGRi7x5q8h6anee1VdbTvhXgfSdNHm16B1dbRgp0o6nzkYmQXqFp9dQShjJCEIatSgmwrFbqZaow773N7uq7qiZ9X/MZNL8dP/s/dPABPPE2JnSYe0dLsWxcbC7DDN6vSHoKeRU8zSJRQ9ANJ8RGxbRGv1U/ySGlu2wR7GnxTjcD3Kgp0eODCZDDomMRQ3XW4Qg/jQrWaWfl51eoF+Dp227KN+vPl+IT+c17+zbTxULrfy/nyZcQnSyZ/5JvMAwC/KpHzbayHCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dvflcplc; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dvflcplc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1lgf37ldz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 23:56:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D19A6434D3;
	Wed,  5 Nov 2025 12:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E408C4CEFB;
	Wed,  5 Nov 2025 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762347371;
	bh=/8YIJ/IkaELHTBMMbQStDRua58EN3fZrFED65ddxxfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvflcplcUhWkJ2R5yUdEfOV14GOSJI1qYLRskRrXY6+YlGQtU6WAL9dBEJQSIOCgS
	 SBA0Geu4mEjZ3pzr3SUXhUWkAZkJqYZeEJunjGOel6gLcX1D93hLyZVB+oL/5Mpgg+
	 4StU+OVzJpR3qdc0Igqi0KZCrTOhcErDOPCdPO58yadioNazHWvPuR8oeDBMe2EwQi
	 cfdIuD4LR5NZ9Rj5U1BRa2r1H/CPvA3H5Y3JgiS8VXyzleSNHWS0An+h80XOTz9i0i
	 +yjVbmYtY9B8+ntPBhb6kdfqZ96VHiMDCh+1okcWT0YHUnoS5evcpNcpWG3oSbFKCs
	 rL6FTo2ATZ5LA==
Date: Wed, 5 Nov 2025 13:56:02 +0100
From: Christian Brauner <brauner@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-efi@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Add '-fms-extensions' to areas with dedicated
 CFLAGS
Message-ID: <20251105-amnesie-eisig-277559b69bae@brauner>
References: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Nov 01, 2025 at 12:35:47PM -0400, Nathan Chancellor wrote:
> This is a follow up to commit c4781dc3d1cf ("Kbuild: enable
> -fms-extensions") but in a separate change due to being substantially
> different from the initial submission.
> 
> There are many places within the kernel that use their own CFLAGS
> instead of the main KBUILD_CFLAGS, meaning code written with the main
> kernel's use of '-fms-extensions' in mind that may be tangentially
> included in these areas will result in "error: declaration does not
> declare anything" messages from the compiler.
> 
> Add '-fms-extensions' to all these areas to ensure consistency, along
> with -Wno-microsoft-anon-tag to silence clang's warning about use of the
> extension that the kernel cares about using. parisc does not build with
> clang so it does not need this warning flag. LoongArch does not need it
> either because -W flags from KBUILD_FLAGS are pulled into cflags-vdso.
> 
> Reported-by: Christian Brauner <brauner@kernel.org>
> Closes: https://lore.kernel.org/20251030-meerjungfrau-getrocknet-7b46eacc215d@brauner/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I am taking the original '-fms-extensions' change [1] via a shared
> branch in kbuild [2] so I would appreciate acks. I plan to finalize that
> branch so that other maintainers can safely pull it on Thursday.
> 
> [1]: https://git.kernel.org/kbuild/c/c4781dc3d1cf0e017e1f290607ddc56cfe187afc
> [2]: https://git.kernel.org/kbuild/l/kbuild-ms-extensions
> ---

I'll give my ack:

Reviewed-by: Christian Brauner <brauner@kernel.org>

but don't invalidate the branch just to add my RvB if you've already had
it stable.

