Return-Path: <linuxppc-dev+bounces-2236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A8399D553
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 19:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS3dl1zhkz3brP;
	Tue, 15 Oct 2024 04:10:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728925835;
	cv=none; b=O9Os3qW0g9j8RZxhdQjojDehzbByzN5zmVj+Pf5BlpP+e1mh08L8W0WzlQQh5zOTyCsTBrCPuSbz3cw3srGYXlK3owGAA2rQoCek/QS3kHRRPH/bUwgoNT4rUtjvWpbe0a7eLHdt5kJ4q4aJ6F/pcuTWBHW9f8LuPxr9KVrgXj5n//iRY4gP6LGuGyPaJ9hXIyL+qaGLWmbEqPma/Lur9uh3XSsfhEaQyG5DK7x9jhsOlD3K1mVWNFtvCmjQ6De4nYK8rfnFJs27q2BorgghOq2orLi8SQ9gmnH0/yCmd/ifUG6F2fkjK30SeRua4p8NZoWDJeJX57D+jO5FBobU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728925835; c=relaxed/relaxed;
	bh=3HFDu+RgBC8QB7MBej0VOt4wFOEq6q2+8KySSKiShFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ug5Ni3W8GVnXdldYZwPhnkj8j/6TtZ7Eee6Jxx2xThpodifSpPUVldzhX6PxiO22CNcipjD5Gqipy9MPeg7PZkdVQNal5THGphcE8BunVaGCK6WQ/PsFq/hssOKWucZ0HE38khEzcgzR76TMow9lis+kBb6+hpMkbTzvApA6WZeFmFoUs1za+lpt9ftP18nAdLW48WbE39ok4nrxg7YblrYglN7NcyPjq2KFXQ525uwea10jA+nqJElL/Cj70ZL7wA0nWSz2XRwZCt1S/k3EL5U2Rxu/ndbvolTTMRCsURKMk9Iikp4PEWL2gxUWXpR5Lp+VoG4dff0ZwaUV41ds/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fZuGXBvf; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fZuGXBvf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS3dk2D2Pz3bbS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 04:10:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4934D5C4C1B;
	Mon, 14 Oct 2024 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932D4C4CEC3;
	Mon, 14 Oct 2024 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728925831;
	bh=iLl0lXkXeALAMr5KDjF+8vkYFyZnHpji9UAQw4I8NLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZuGXBvfqai+/3NsOa9W9cD3IlOY9aT3U0WbINyOpuWErGCK6ZB6IOUBzMOrcOcny
	 pu72RD2Q/eOijBUJKudsa5AgJol2pWXeoLojf4MNniYLbSJgH2kEtVhDGVb6Gm14Df
	 9EGatG41Z1BUkjfjmG1t0dtC3E9OVP/UsR4ZXtN7/cC9OYFti03Mmwc+YQYgMcx9FF
	 id1TyF5286pt2Y3czQbj/ZxkcUQEN2KJW1lxao1NLV3WYoMqD/KKpW+g9w8uWA2Aqn
	 /L7Px0nG8PKBofrF7r6MreT7d1B0i8Jz1iBY6w6RO2ZAzUeeOvYCehz+aQLkdHLfpI
	 KopOxy2RDs1Dw==
Date: Mon, 14 Oct 2024 18:10:23 +0100
From: Will Deacon <will@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
	nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 19/30] arm64: add POE signal support
Message-ID: <20241014171023.GA18295@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-20-joey.gouly@arm.com>
 <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
 <20241009144301.GA12453@willie-the-truck>
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
In-Reply-To: <20241009144301.GA12453@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Kevin, Joey,

On Wed, Oct 09, 2024 at 03:43:01PM +0100, Will Deacon wrote:
> On Tue, Sep 24, 2024 at 01:27:58PM +0200, Kevin Brodsky wrote:
> > On 22/08/2024 17:11, Joey Gouly wrote:
> > > @@ -1178,6 +1237,9 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
> > >  		sme_smstop();
> > >  	}
> > >  
> > > +	if (system_supports_poe())
> > > +		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
> > 
> > At the point where setup_return() is called, the signal frame has
> > already been written to the user stack. In other words, we write to the
> > user stack first, and then reset POR_EL0. This may be problematic,
> > especially if we are using the alternate signal stack, which the
> > interrupted POR_EL0 may not grant access to. In that situation uaccess
> > will fail and we'll end up with a SIGSEGV.
> > 
> > This issue has already been discussed on the x86 side, and as it happens
> > patches to reset PKRU early [1] have just landed. I don't think this is
> > a blocker for getting this series landed, but we should try and align
> > with x86. If there's no objection, I'm planning to work on a counterpart
> > to the x86 series (resetting POR_EL0 early during signal delivery).
> 
> Did you get a chance to work on that? It would be great to land the
> fixes for 6.12, if possible, so that the first kernel release with POE
> support doesn't land with known issues.

Looking a little more at this, I think we have quite a weird behaviour
on arm64 as it stands. It looks like we rely on the signal frame to hold
the original POR_EL0 so, if for some reason we fail to allocate space
for the POR context, I think we'll return back from the signal with
POR_EL0_INIT. That seems bad?

Will

