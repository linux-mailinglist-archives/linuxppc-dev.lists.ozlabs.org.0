Return-Path: <linuxppc-dev+bounces-2646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FC29B389D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 19:02:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xch6m1zbfz2yHs;
	Tue, 29 Oct 2024 05:02:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730138528;
	cv=none; b=f0dgmNS2hcLix14nonqz4Ydq+ZYaHLjrYq1N97UIKf4tJa8BHWXiHRo+RA7CVPT7CAuYBGVBQkLvkEbnWtrDaD6r3+RMH9LauyFDVRvYt6xm49VAzfYKucfwtcPIDPYX40S4O2lAfY3DvmWZ7vmL/i4xdUhA6z3rLMP+609qu2kyAWI9Vh0jy5DeqUp69JGY46u2JhGcakVPxu4WvLUqYzhF+eWqB05rKX6firEqH5sWEaxIH22StKCmcK912mf9RL5STHlZbQU8gULphZVK7yZ47j4S22POZDz0YyeI6fDMNbJW0fCdlx3gGmEP0qWXY2/SrQBT3ZcDeK1zs3vgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730138528; c=relaxed/relaxed;
	bh=qlP5wrW6ke0vGocM1Z3CVT0nh5F9BiAmuKkmtCmLliI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7sv/kCJXTCSTxKgY+aF31VCHMvq/NHevcplQz0ly6oooa/YChj1G+P+UxGH/se5ZKK0uYMEytOYorsZHnsXBUQ9Et/ppyWn1l6y+1QtOpXlKIRBoOygqIMoIm2RTt+9AhZz4T5ztVX19YgFoPN98y+X/Ugz+/9OTWNzfNiONZozKixfFvn43HqlWzNY+6qXZCTccHEFLBM3hLaKilSLDx1rIcZ3Cc1e2QlScRDV5Mr+vr5joGoFnNpxGqjtvqhxxDaohs7lf/XRQa+KGiO0opFWuv41ThQTyjzCo2+xl/k+7IOj0pO0JoKQcl77mB0PMpon7vMWAcMupHew6FV3Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gtEcfTSA; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gtEcfTSA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xch6l2x3bz2y8B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 05:02:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9606A5C5C6E;
	Mon, 28 Oct 2024 18:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8251C4CEC7;
	Mon, 28 Oct 2024 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730138524;
	bh=Cqqg0EuRygm2muKmG3Em56D2KQbpxOn57TA3RY3+BS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtEcfTSA06walZP4EYky8YvX5+tSLqxGDLXcf9dA0tiJOg6r12ODMxN4IBYDVwhg7
	 /9sHuVvYEUTAUeLgzE/KvgtlkLSdirLw00I5bGlwJ/Cgt7TVO5MVaTO6+UMlpVICeX
	 OxI9y0jpxfslXPNVHEstnt5RNnozHioJPVXd5A12qMAr+Tmg8g+i3JF03owZspBheX
	 5WbgQU4+e5FVES1E30JvzTbHetoei1m463Q75tPDO+KVh/8FHNHcyhbP4oOnAr90BU
	 lHyfVNVrxZxPWRybYPdWzcCypiAkDKEiZjwaR4QWRqEopGgtZU/FsDxoBuXS7+xjxA
	 lBkIk08k8iv+A==
Date: Mon, 28 Oct 2024 18:01:54 +0000
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/28] arm64: vdso: Drop LBASE_VDSO
Message-ID: <20241028180153.GA3029@willie-the-truck>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-4-b64f0842d512@linutronix.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010-vdso-generic-base-v1-4-b64f0842d512@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 09:01:06AM +0200, Thomas Weiﬂschuh wrote:
> This constant is always "0", providing no value and making the logic
> harder to understand.
> Also prepare for a consolidation of the vdso linkerscript logic by
> aligning it with other architectures.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/include/asm/vdso.h       | 9 +--------
>  arch/arm64/kernel/vdso/vdso.lds.S   | 2 +-
>  arch/arm64/kernel/vdso32/vdso.lds.S | 2 +-
>  3 files changed, 3 insertions(+), 10 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

