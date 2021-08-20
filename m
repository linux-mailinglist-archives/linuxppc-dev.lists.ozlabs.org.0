Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B13F25DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 06:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrT8m3YyDz3cWN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 14:26:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qudDX4J8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qudDX4J8; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrT853bvfz2yxF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 14:25:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrT7x1KM1z9sW5;
 Fri, 20 Aug 2021 14:25:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629433517;
 bh=TY6nLrmjoHyAzLgmjUDiH3O3rM9kTfEtWkmi+ZvE6rY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qudDX4J8UWi+6+7ay40xF74TpJv5cn1tKDShtykYbqO0aN8uz7Dk+LBw4Gl6G5AXk
 /6jCrrW4nVyt2fmGYJy/vu8bu1j1y3yTDdDvMgHc0SDQRiTlnLzeJJ0UBwRIrqIvSU
 d/EFP6j2FHPpLCx1w5KGwNtKJ7PhGlIJuBMr/u2TdiPESqu76d2WNgpczVCBFFiH/X
 qidFxO9hZBiSMGIPElyGlVAsc1mtkzp2STrpSIXCawTHn6q4ne1W3x8xXP/sY8FYR1
 QBM71FxIuPndLFePXsK3aY761+IdT+UOAW3HRLllVgfahmq5wBwPeAQkmPe7b66adV
 mJy8XZkR/kZUQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Michael Neuling <mikey@neuling.org>, Anshuman
 Khandual <anshuman.khandual@arm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] powerpc: rectify selection to
 ARCH_ENABLE_SPLIT_PMD_PTLOCK
In-Reply-To: <87pmu99e4j.fsf@dja-thinkpad.axtens.net>
References: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
 <20210819113954.17515-3-lukas.bulwahn@gmail.com>
 <87pmu99e4j.fsf@dja-thinkpad.axtens.net>
Date: Fri, 20 Aug 2021 14:25:12 +1000
Message-ID: <87a6lceo9j.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
>
>> Commit 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
>> selects the non-existing config ARCH_ENABLE_PMD_SPLIT_PTLOCK in
>> ./arch/powerpc/platforms/Kconfig.cputype, but clearly it intends to select
>> ARCH_ENABLE_SPLIT_PMD_PTLOCK here (notice the word swapping!), as this
>> commit does select that for all other architectures.
>>
>> Rectify selection to ARCH_ENABLE_SPLIT_PMD_PTLOCK instead.
>>
>
> Yikes, yes, 66f24fa766e3 does seem to have got that wrong. It looks like
> that went into 5.13.
>
> I think we want to specifically target this for stable so that we don't
> lose the perfomance and scalability benefits of split pmd ptlocks:
>
> Cc: stable@vger.kernel.org # v5.13+
>
> (I don't think you need to do another revision for this, I think mpe
> could add it when merging.)

Yeah. I rewrote the change log a bit to make it clear this is a bug fix,
not a harmless cleanup.

cheers


  powerpc: Re-enable ARCH_ENABLE_SPLIT_PMD_PTLOCK
  
  Commit 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
  broke PMD split page table lock for powerpc.
  
  It selects the non-existent config ARCH_ENABLE_PMD_SPLIT_PTLOCK in
  arch/powerpc/platforms/Kconfig.cputype, but clearly intended to
  select ARCH_ENABLE_SPLIT_PMD_PTLOCK (notice the word swapping!), as
  that commit did for all other architectures.
  
  Fix it by selecting the correct symbol ARCH_ENABLE_SPLIT_PMD_PTLOCK.
  
  Fixes: 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
  Cc: stable@vger.kernel.org # v5.13+
  Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Reviewed-by: Daniel Axtens <dja@axtens.net>
  [mpe: Reword change log to make it clear this is a bug fix]
  Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
  Link: https://lore.kernel.org/r/20210819113954.17515-3-lukas.bulwahn@gmail.com
