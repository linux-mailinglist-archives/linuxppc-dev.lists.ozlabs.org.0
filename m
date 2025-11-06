Return-Path: <linuxppc-dev+bounces-13895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2F2C3CEFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 18:48:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2V5w30pHz2ySP;
	Fri,  7 Nov 2025 04:48:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762451284;
	cv=none; b=Kf+AO57FNLppSRQRqxREIwyN5m3LFSGaZ+MyfhOKdFBPF57yEp/rAdha/BFA3dvc4pP5KM/jpaIsJwL1wyN9KF51wKb1M4EUBwLCcUYcb1o3hflSaBRuD94PRe3lHSdWW5IYZ+ig583JbAvPNS7eGv/RM9uMozhJnhcH4DWokQz9JsAMfwYTyF3NkRe+NVf2XoVbxsyp0bmJxAvyhxXOegdxDzmxNs8VAWY183Y6JOTKQmF077ieLXaINdydfWfmoydVKL5XwEkzrDd3Fep4/2q+xw1jrTbReJBufjNm9oxhe9Fwj/4TnIQJ2rOIc/NoG4kTlRqExB/hTSNiO7BugA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762451284; c=relaxed/relaxed;
	bh=jUOcQwJRln67uS82tlcAA1G+Boy+nymiclVKiSDZbQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gsm5TGk5z/mw1XYUuAbd6rYpJvM+k7DygbtYWzbYs94VfyhUWAhbV3K8cTZcU68q+V32eTWleE1z06fQQ71lB3Hi12OOPLpANnx23L8XN2U6Ny5fIn9p3X9hhQhkNsaHlGlZoGvPxLBsxss90ANhoVRcyw7yE531SPeGmC1z+jMz+fZ2m2DK3bkDhrlZkBaAu25WoUuwWLCrCfpnB/WXe15PjRbfS9uZjEn2Z2lnWPwNdYKIoRiudkDaz8qFxrTLl3sp7iUD9oOLj9nrEwifY6OJYhZqSprIW5O8Zu1Q2K+7wwtsGxzr+DOCSI+ZAAXoMMPDl03GMn+fPLfrSAWg+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z9FnDBrL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z9FnDBrL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2V5v2Zrjz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 04:48:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23E6042B05;
	Thu,  6 Nov 2025 17:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD86C116C6;
	Thu,  6 Nov 2025 17:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762451281;
	bh=13WsgUGoeK4bC41loapHpdur+Ccm2Mdg30VVAbVHLjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9FnDBrLQxnVZ8j0S6dXWmgDdhzRapTlDLeZphuGquMG48Y0ehHhp+zTZ1t5KXHbE
	 txcGrmgh0jjFrb2R7Z4I4+T/u5lzxWz5dX1+SmKtEgYTcAlIG9Z7mJs448ffRsunb/
	 NKjfdgOv8bmEebgrBMp3h9vh4pR0Pq8RkV/w1GvjFyMBhyadJ/0oXUr1y1nJ50U0ub
	 aJnzIoOLRuwk0h/lQKZix1kH9a4jtd/PFlGQeCzBFejhXmzM34PXGVkA6w+0UTpxmg
	 kZW7+JyfWA+DtE0VoLbWXC2bDxthopkWbymWnjEda4G9uauXq3ZbYJQm9H/atPuoWh
	 K90fOO5tmdSWQ==
Date: Thu, 6 Nov 2025 10:47:52 -0700
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
Message-ID: <20251106174752.GA2440428@ax162>
References: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
 <20251105-amnesie-eisig-277559b69bae@brauner>
 <20251105193931.GA2480016@ax162>
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
In-Reply-To: <20251105193931.GA2480016@ax162>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025 at 12:39:31PM -0700, Nathan Chancellor wrote:
> I was planning to make it stable tomorrow to give folks time to chime in
> at the beginning of the week. I have your tag and Ard's to add. After
> that, we will just have to rely on the link to this submission for
> follow ups.

Alright, this should be the final result. If there are any other Acks
that come in later, they will just have to be recorded here. If there
are any follow up fixes needed, I will apply them on top and update the
tag but the branch will not be rebased.

Cheers,
Nathan

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-ms-extensions-6.19

for you to fetch changes up to 5ff8ad3909524ad55297a434f87c238224825bf4:

  kbuild: Add '-fms-extensions' to areas with dedicated CFLAGS (2025-10-30 21:26:28 -0400)

----------------------------------------------------------------
Shared branch between Kbuild and other trees for enabling '-fms-extensions' for 6.19

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Nathan Chancellor (2):
      jfs: Rename _inline to avoid conflict with clang's '-fms-extensions'
      kbuild: Add '-fms-extensions' to areas with dedicated CFLAGS

Rasmus Villemoes (1):
      Kbuild: enable -fms-extensions

 Makefile                              | 3 +++
 arch/arm64/kernel/vdso32/Makefile     | 3 ++-
 arch/loongarch/vdso/Makefile          | 2 +-
 arch/parisc/boot/compressed/Makefile  | 2 +-
 arch/powerpc/boot/Makefile            | 3 ++-
 arch/s390/Makefile                    | 3 ++-
 arch/s390/purgatory/Makefile          | 3 ++-
 arch/x86/Makefile                     | 4 +++-
 arch/x86/boot/compressed/Makefile     | 7 +++++--
 drivers/firmware/efi/libstub/Makefile | 4 ++--
 fs/jfs/jfs_incore.h                   | 6 +++---
 scripts/Makefile.extrawarn            | 4 +++-
 12 files changed, 29 insertions(+), 15 deletions(-)

