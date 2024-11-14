Return-Path: <linuxppc-dev+bounces-3239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB39C93CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 22:07:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqCR13xVzz2xks;
	Fri, 15 Nov 2024 08:07:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731618461;
	cv=none; b=SZ2t9T52uL5Acm2TCNZKanDUv20AkKqhmqsUEhiCB9Pvp1uwyIu4nr+OYvHTN1Mk9DgcMuZ+d9TVukRC3gxiRNKJAIjDSED9hovYWUmRQWqr9uRagwEpGPzbAJQic+ueZAjoneJ9dqAdHNmzLeT7ta6RvxPSre6qBbYtpRhZcw8NOPbEuxKl4HeyuoxDq3nstTz+6Chin0qlsjDTwPAVtflu0Dx05SiKTwVEYZgDsYUWI63vbEdRWa+y/QMHblQbJWHA9eFBVKm5hmcd5E/5pjLXowcvMtUGPSadTTpAASLhsZLS/LcmvBp3gvZjYDl8r53TXKg+9DeroGDAVUaWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731618461; c=relaxed/relaxed;
	bh=0JrYNb2pY44MvCaP2czOqCaQo8x6Qw1+81m7BHABv4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+ibY7liFVTqfUMc4lwssR627Vl6dgBxbTMkP3CqUZi40NU9rx19c5P1hMdzf9qqxWPWdh+x7JnMXQA/t5Ys7l5Vjiiuv+rbUGBvSyI29QdIpVKNWwvNVlGuSp02KGyUAeN2xlUxFkd+9tphyE0FFaY7yFvdiLOTgJRKT1TKr5OrMXLlse59vaROJJs8xSuQQuEZ0DJ0ImrvVXMncjNhY6Vom9q+ZTHfaB6fXm8yW9gYxf+FpK/x3IYakg52Ig3XlgMdAfX7a7+uGjFfrz3l/l0NWIkh0308EwJvHvnNQck894p8gwTDGRaYEBZiBRkc3l/dG83SFVlyBB9XnToO+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqCQz1jHzz2xgr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 08:07:38 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4AEL4KlI000954;
	Thu, 14 Nov 2024 15:04:20 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4AEL4Ief000942;
	Thu, 14 Nov 2024 15:04:18 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 14 Nov 2024 15:04:18 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        geert@linux-m68k.org, arnd@arndb.de
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
Message-ID: <20241114210418.GM29862@gate.crashing.org>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 15, 2024 at 12:11:04AM +1100, Michael Ellerman wrote:
> CHRP (Common Hardware Reference Platform) was a standard developed by
> IBM & Apple for PowerPC-based systems.
> 
> The standard was used in the development of some machines but never
> gained wide spread adoption.
> 
> The Linux CHRP code only supports a handful of machines, all 32-bit, eg.
> IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possibly
> some from Motorola? No Apple machines should be affected.
> 
> All of those mentioned above are over or nearing 20 years old, and seem
> to have no active users.

This was used by all non-IBM 970 systems as well.  The last was SLOF on
JS20 and JS21, about 20 years ago yes, and I doubt anyone uses it still
(I don't).

> So remove the CHRP support. If there's interest in still supporting some
> of the machines that can be brought back from the git history.

Sorry to see it go, but that's the way of the world :-)

> Note there are still some references to CHRP/chrp in various comments
> and some in the code, because later standards (eg. RPA, PAPR) used some
> elements of CHRP or copied the CHRP behaviour. These will need to be
> cleaned up on a case-by-case basis to either refer to newer standards or
> left as-is when that's correct.
> 
> The CHRP code was copied from arch/ppc, and before that it mostly
> predates git, so the original authorship is largely lost. If anyone
> wrote any of this code and would like a CREDITS entry just let me know.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher

