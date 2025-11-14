Return-Path: <linuxppc-dev+bounces-14166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C512C5B4E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 05:28:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d73z16Rpsz2ySq;
	Fri, 14 Nov 2025 15:27:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763094477;
	cv=none; b=UGhOUkBple/RCQJwqvVU4e80e5rMOfIIRV1m3cZd9MtFbYEwWT0OGCOrEQ2ROZtoa4qn/FWfMvNFPBe2V+Xaty7gL3ylNBlkqyOr+wdVqYOIHhmalkaij9pUWN/oa2crV1r3ZgWNId1oClPa5HcB+/h+CtM9Al4t2wQy+n6cpPca8gLYC+cGcjCPdVMgexlVFNDKA68IlJ1RtTAf7RQpoyPpsxCqlLFoDMyJ5n1gkI0r7QB9s9GB7CEVZsvx2g81v2fcRX97QPrGSFM9H+R83N35BXs0QJ73yH07QLyYoMmfhWljkDbItlFQKRt8TGHOCAuMbuV3FXDvVTrQicRzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763094477; c=relaxed/relaxed;
	bh=BPSO5uU+oeBSaHb8XGzfBYRuDDuMKYOIren4WKdMQ84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBCATGLQ2M+b/3IXupV/LQAZzSeRsyHA0LLCQoKcopL4eVAue3Bbh+emPItwcMSKi7CCBeR0KK0jZ6uoABEX897nB6pwFFFxn5a2M0EiHl01Ggu/kSWJwi9aSrjNaBeoc9p0kP3aozwvUfEDpRYU7OGglvSAfb+Ph2foGIMsUuhFHfENfb8axkmWaUQCXvPiXftELxNpyXMnyv9BKlddVDy24cI+Zywc6F4+i+d62RMEFSJ+JiG55vdFjrXCw7AwW3szOz5NR16x6BUGhbRVgDoj3mxw+J+Fyyb76etSTYJypYcxDfkbDCKL/LSqdvUlLkLaY9vL+IK624n4cJ8wsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MChFGhE2; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MChFGhE2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d73z05v0bz2xFS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 15:27:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E48F60128;
	Fri, 14 Nov 2025 04:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDC3C113D0;
	Fri, 14 Nov 2025 04:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094471;
	bh=BElALngLN2nFhaInsP852/aGs6CMGw4etVXE34fZIjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MChFGhE2l/mEBBnjKokUFr/WJR+V2WR/BNdIXlxZ7F4DWvd5LlA7WR+SbIsNd6T5p
	 XLohdaztk3jTypiLtJViRiMzBcBEj4n3u61lZ6DVKQTtmI2nc6sPXuyui+8eNcpWNN
	 z60MjTf+BRU/qYwxJnNFL50DT9aK3PSZWE+/UaN4vh2keuunX9DvbkE0d6uIt1rQMB
	 9xtjhrNA3YvSgTCuhcIYETlamknRCv8pQYWFIIS1hLgub5xGEWBnRrHhH8O0ZTPbG/
	 6xQOdNn34QRyl9zXUWZ0wi6BB2LZUX+YSZOVyfuQZfrBYX1Qz6BNc1cHvt3eCmgh/P
	 ND3ELNyp2KMPw==
Date: Thu, 13 Nov 2025 21:27:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Message-ID: <20251114042741.GA3582402@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 03:05:16PM +0200, Thomas Weiﬂschuh wrote:
> It is possible that the kernel toolchain generates warnings when used
> together with the system toolchain. This happens for example when the
> older kernel toolchain does not handle new versions of sframe debug
> information. While these warnings where ignored during the evaluation
> of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
> will later fail.
> 
> Example warning:
> 
> .../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
> error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
> collect2: error: ld returned 1 exit status
> 
> Make sure that the very simple example program does not generate
> warnings already to avoid breaking the userprog compilations.
> 
> Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assembler")
> Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

While this makes sense as a way to immediately fix the problem and align
cc-can-link.sh with the other test functions like cc-option and like, it
is rather unfortunate that this particular warning causes an error since
the rest of the userprogs infrastructure does not care about SFrame...
I wonder if there is a way to avoid it since I think this warning does
not point to a fundamental problem.

> ---
>  scripts/cc-can-link.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
> index 6efcead3198989d2ab2ab6772c72d8bb61c89c4e..e67fd8d7b6841e53341045b28dc5196cc1327cbe 100755
> --- a/scripts/cc-can-link.sh
> +++ b/scripts/cc-can-link.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
>  
> -cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
> +cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev/null 2>&1
>  #include <stdio.h>
>  int main(void)
>  {
> 
> -- 
> 2.51.0
> 

