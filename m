Return-Path: <linuxppc-dev+bounces-983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690196BAEE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 13:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzL8n0T7Tz2yS0;
	Wed,  4 Sep 2024 21:38:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725449897;
	cv=none; b=RqFr1pe//8t/C56fF2MKc12wg+KvDvj4ySwGULrgc11u9CQyQC9Xk5hQyRWfaqzcyrRozkU2dzelsbGZ+o1zuOfp+TxEP909PZ9XRT8beq66P6jWhN5WuDoDJWfBKMNZLEr2jBU6tnjfozwljsc7kv3nlbIRF4XYxQz566nOgEfPQs9WQJxIGcumHAuqKydDYZCkXJ+q8QG9YsBVFi7SLSp9/6jDUSo7E4L1fmSn5LU5iBIRjejYgf7grSYIuaDuKxBpYy9LobBwAevX/DEnDodJLqSHIOgHtw2GT9N/ZZIoPA3GAFTRt360RHD9FOv7p6J5C3QU5F3a6+KWZJFF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725449897; c=relaxed/relaxed;
	bh=b7RjP2YDjsQDAgpAI67p4oi8OpVaJqVhfPX6M63fqx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOIhcyj0/fieOyvajSQlKBR1aTOtgkyLp4SX7Q07vU7dxh54nAi9DV5tMgJHc5O6T8BaCisvpsyT+dg9Z44zsC3Rf1GKcJiQt/0FFY1iLhrooZyhu/t9etWpAv0AYbqzOD2CfE4a/B/Hb5jC417gm8GQn8VHqdqoGoJ14RIut8OSDle9bOSN+KgEx8FmkeSCIyWzLEfPzkZePElyL7B+vQVjcaC+huPuCLIv2jYk9wKZVYmFhplB6dSvWSF4weG9eM6xxU8jS2VQcjaEF95fVZeEqWQVnJqWCpi9pIvOEPCIVsDUC+b6JVU0FN1HfkwfIe0JkqI31ajQsZC9IFLxPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzL8m5mJvz2yRG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 21:38:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B69A5A43FAF;
	Wed,  4 Sep 2024 11:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4212C4CEC2;
	Wed,  4 Sep 2024 11:38:07 +0000 (UTC)
Date: Wed, 4 Sep 2024 12:38:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
	nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Message-ID: <ZthGnTz8wlcy4ncK@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <20240823144531.GH32156@willie-the-truck>
 <Zsi7ovLOfuFdfuuz@arm.com>
 <20240823170835.GA1181@willie-the-truck>
 <ZsjXtE7Kg0LQwNAL@arm.com>
 <20240827113803.GB4318@willie-the-truck>
 <ZtYNGBrcE-j35fpw@arm.com>
 <20240903145413.GB3669886@e124191.cambridge.arm.com>
 <20240904102254.GA13280@willie-the-truck>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904102254.GA13280@willie-the-truck>

On Wed, Sep 04, 2024 at 11:22:54AM +0100, Will Deacon wrote:
> On Tue, Sep 03, 2024 at 03:54:13PM +0100, Joey Gouly wrote:
> > commit 3141fb86bee8d48ae47cab1594dad54f974a8899
> > Author: Joey Gouly <joey.gouly@arm.com>
> > Date:   Tue Sep 3 15:47:26 2024 +0100
> > 
> >     fixup! arm64: context switch POR_EL0 register
> > 
> > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > index a3a61ecdb165..c224b0955f1a 100644
> > --- a/arch/arm64/kernel/process.c
> > +++ b/arch/arm64/kernel/process.c
> > @@ -515,11 +515,8 @@ static void permission_overlay_switch(struct task_struct *next)
> >                 return;
> > 
> >         current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > -       if (current->thread.por_el0 != next->thread.por_el0) {
> > +       if (current->thread.por_el0 != next->thread.por_el0)
> >                 write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> > -               /* ISB required for kernel uaccess routines when chaning POR_EL0 */
> > -               isb();
> > -       }
> >  }
> 
> What about the one in flush_poe()? I'm inclined to drop that as well.

Yes, that's a similar thing.

-- 
Catalin

