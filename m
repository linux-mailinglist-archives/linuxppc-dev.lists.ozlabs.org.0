Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6D8C1E53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 08:46:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fZcReIHi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbKCt5V1Xz3cVt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 16:46:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fZcReIHi;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbKC85gtfz30Vv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 16:45:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715323539;
	bh=rM699BxKKfTpOXV0O6gqnfwjrfoCqJ0ZNz5G6uk7G5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fZcReIHimKi+lxM59zgsyNbib8ubnjYwwaEKh9XrAU2slJtaG5KPhgctcFz0hWjbl
	 SCFBeBYZoxvSgAH8eRISGUFHBOKACOB/bljBbFdj/mR1arEnJgkQclPEwNoXKjKlkq
	 nNzECpEvgLJ54comqBmRvp4SnQFfqTu9cSF3BLQ/p7NZy3+08DMQ3SwI9+6iTKelE4
	 VJAwV9ObqVLXvy4sZBwtHy31HgyyAEAhiYgBa2MVEcNkZ3krFkMANie9uMvnAaADhX
	 QL4OrrgthyA6Uy1la4GH+mYb7Xb7b13x4fHonavMhe7YC+0qQ8ewOmEPNzxjNqKobo
	 AkebCOWmn2sqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbKC70sxCz4wcF;
	Fri, 10 May 2024 16:45:39 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 3/3] powerpc: Check only single values are passed to
 CPU/MMU feature checks
In-Reply-To: <20240509163456.GX19790@gate.crashing.org>
References: <20240509121248.270878-1-mpe@ellerman.id.au>
 <20240509121248.270878-3-mpe@ellerman.id.au>
 <20240509163456.GX19790@gate.crashing.org>
Date: Fri, 10 May 2024 16:45:37 +1000
Message-ID: <87ikzmmage.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Thu, May 09, 2024 at 10:12:48PM +1000, Michael Ellerman wrote:
>> cpu_has_feature()/mmu_has_feature() are only able to check a single
>> feature at a time, but there is no enforcement of that.
>> 
>> In fact, as fixed in the previous commit, there was code that was
>> passing multiple values to cpu_has_feature().
>> 
>> So add a check that only a single feature is passed using popcount.
>> 
>> Note that the test allows 0 or 1 bits to be set, because some code
>> relies on cpu_has_feature(0) being false, the check with
>> CPU_FTRS_POSSIBLE ensures that. See for example CPU_FTR_PPC_LE.
>
> This btw is exactly
>
> 	BUILD_BUG_ON(feature & (feature - 1));
>
> but the popcount is more readable :-)

Yeah for those of us who don't see bits cascading in our sleep I think
the popcount is easier to understand ;)

cheers
