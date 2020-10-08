Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6BC28723B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 12:07:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Rj25fLWzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 21:07:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6RgH414TzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 21:06:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rk18GFBM; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6RgG0Wqkz9sSn;
 Thu,  8 Oct 2020 21:06:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602151578;
 bh=uzcQtunbIyI7pt736Imzp1NEubPV5O7L5FOd/FEjg4Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rk18GFBMMlbyxIn5M25XRkAkieZXp5TOWji69AxWF2fgqD3oGT/xY+yphxUUh+wQM
 YxMSEvGvt/risrJye6SYaAjfb3vThJ2mijNlov+8crsPWYPljC26bu6iYEKnpQWJo6
 TURmjds8zDr19SW6GAkU7F5NOH0lUsBMqmmTSaeXHnyV8TEQiOxvLt2wkuLze3Fphw
 u/paMF+UYGZ21mpd8lVcop6hME0C1eFkPo+/2MvwUlmsydSCgo7+AAMp79gGWaZcID
 hsda3L+6DJmjJ/j519F/dbdX+70B79kmWFisqRTpPJMEig7DiQ8Gou7BKoNi802/nt
 9RDs6/5786zsg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, Sasha Levin <sashal@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc/rtas: Restrict RTAS requests from userspace
In-Reply-To: <421cba41-20bf-f874-c81a-8b7f9944c845@linux.ibm.com>
References: <20200820044512.7543-1-ajd@linux.ibm.com>
 <20200826135348.AD06422B4B@mail.kernel.org>
 <421cba41-20bf-f874-c81a-8b7f9944c845@linux.ibm.com>
Date: Thu, 08 Oct 2020 21:06:16 +1100
Message-ID: <87v9fl117r.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com, stable@vger.kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On 26/8/20 11:53 pm, Sasha Levin wrote:
>> How should we proceed with this patch?
>
> mpe: I believe we came to the conclusion that we shouldn't put this in 
> stable just yet?

Yeah.

Let's give it a little time to get some wider testing before we backport
it.

cheers
