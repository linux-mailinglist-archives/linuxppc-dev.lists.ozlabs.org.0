Return-Path: <linuxppc-dev+bounces-999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FDB96C4DE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:05:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTQN4X5Zz2y8X;
	Thu,  5 Sep 2024 03:05:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725469532;
	cv=none; b=PwVSgIxltQGJyZ8H5KUd4Aux5b7Oy4WBbI55wdswKduojFv+NEwkJgVrUPWwuq1Olq4LAJRl/VsCBjoZ7vRtn7cEqKz3Li/zuQuAsI6/3dK+26GlEztOKwLtNkgl8EgXr9vqDmcnmJggK0MtHOk7mned7BGS55zrU9ELJmmG6pZrnAOnuM4EDULBorsbZxQ+j5ykefwg0WxX+pkRviYp1ec8ykCThaE5yd/mLvLnDB6/wJ+OleEfNNGtEZjizK6suexWU2zRe9tNyS+mDZ3QE4yD9A9+aeJ3eDaI0gk4zQSV3exeDEGXN7rNH4riTXq5a6OsizsEMfDaup1cMvobnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725469532; c=relaxed/relaxed;
	bh=3KPZwsxRmn2Zb0fXZONfEMnKNwenhQcWZ3s6o8HBVLc=;
	h=DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version:Content-Type; b=mAZhVSnE83QMNHjUhlEuxAY4ktL8yobUBVuosVt2etT6LeohyF0rtW2katCRjcWDvm9MzAMO0OBaghTfaX27r6RZd8cO/GzXCWLvs4LddBjOJarnxduKLwnACFfPs7KMcmBZetzLgfzsY9ytl3gG5ZG+muHPYKAkF3ZLRLfSdF5t3vzbxo71sTSZFIN0oeSwzZBCffjH6qYJuFlroHAnnhPrgSdqe8Z1pPqrTosV2TejOPYoUfy0yXisZS0SwWA5D+6vglS4707mzCGokSTC558a3nNIU+3wWmac++g2kYyRV3H+ntuUx/ZqmX5A0IwaeRaOz5YCRCzUj9kXd/U9nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qKlqsYDL; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qKlqsYDL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTQN1Kvnz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:05:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5DE1A445F1;
	Wed,  4 Sep 2024 17:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40408C4CEC5;
	Wed,  4 Sep 2024 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725469529;
	bh=0gw45QxN3fNUQlIV0l0iCm8GEARvkwPgJdU3FZfLCE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qKlqsYDLXHs0iW3ETzrWnTRx/FFUL3jDSU4JY29c9EYYGmqlPmyUvUnkw7/SWH2G3
	 VdNQNSRW6//Mm1pBsOORRXDfmjRazMqR1R/JqgZ2Zss1tL4l5Y7tLElrzXRanury9D
	 CeiQfmDFIxVzSo3roysBXKD6LYAXHzaV1WfP4ykVbE+8snaRnTD70u0d4y9cmZgNqB
	 LJYwhAn+SIMVfd0rHI3ly9q54Fa9Fcp/5aK0UtTYmnIHcRcr+pxha1T+d4XjGGGB2N
	 J6QtFp1RDFErkjMpK/FgI4UTUf/i9lpDKzMpYNBold6zhiVaRdpsn8KF7CHLvC0vq2
	 y5vpwwebK2gwA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sltRe-009hKx-M3;
	Wed, 04 Sep 2024 18:05:26 +0100
Date: Wed, 04 Sep 2024 18:05:26 +0100
Message-ID: <86plpjuz6x.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
In-Reply-To: <20240904161758.GA14323@willie-the-truck>
References: <Zsi7ovLOfuFdfuuz@arm.com>
	<20240823170835.GA1181@willie-the-truck>
	<ZsjXtE7Kg0LQwNAL@arm.com>
	<20240827113803.GB4318@willie-the-truck>
	<ZtYNGBrcE-j35fpw@arm.com>
	<20240903145413.GB3669886@e124191.cambridge.arm.com>
	<20240904102254.GA13280@willie-the-truck>
	<20240904113221.GA3891700@e124191.cambridge.arm.com>
	<20240904114301.GA13550@willie-the-truck>
	<20240904125503.GA3901671@e124191.cambridge.arm.com>
	<20240904161758.GA14323@willie-the-truck>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: will@kernel.org, joey.gouly@arm.com, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org, aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de, broonie@kernel.org, christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, mingo@redhat.com, mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com, oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org, szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Wed, 04 Sep 2024 17:17:58 +0100,
Will Deacon <will@kernel.org> wrote:
> 
> On Wed, Sep 04, 2024 at 01:55:03PM +0100, Joey Gouly wrote:
> > On Wed, Sep 04, 2024 at 12:43:02PM +0100, Will Deacon wrote:
> > > Right, there's quite a lot I need to do:
> > > 
> > > - Uncorrupt your patches
> > > - Fix the conflict in the kvm selftests
> > > - Drop the unnecessary ISBs
> > > - Fix the ESR checking
> > > - Fix the el2_setup labels
> > > - Reorder the patches
> > > - Drop the patch that is already in kvmarm
> > > 
> > > Working on it...
> > 
> > Sorry! I'm happy to rebase onto some arm64 branch if that will help, just let me know.
> 
> Please have a look at for-next/poe (also merged into for-next/core and
> for-kernelci) and let me know what I got wrong!
> 
> For Marc: I reordered the series so the KVM bits (and deps) are all the
> beginning, should you need them. The branch is based on a merge of the
> shared branch you created previously.

I just had a quick check, and while there is a small conflict with
kvmarm/next, it is extremely minor (small clash in the vcpu_sysreg,
for which the resolving order doesn't matter), and not worth dragging
additional patches in the shared branch.

However, if KVM's own S1PIE series [1] ends up being merged (which I'd
really like), I will definitely have to pull the prefix in, as this is
a bit more involved conflict wise.

Thanks,

	M.

[1] http://lore.kernel.org/all/20240903153834.1909472-1-maz@kernel.org

-- 
Without deviation from the norm, progress is not possible.

