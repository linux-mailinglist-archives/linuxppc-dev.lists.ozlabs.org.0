Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26225150C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 17:54:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yS3s58ZzzDqMV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 01:54:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="qlqC0hMJ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yS294r1nzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 01:53:21 +1000 (AEST)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C98C12053B;
 Mon,  6 May 2019 15:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557157999;
 bh=BLcD29/VI2mp8KC4x3+710PG8BnqJZVG8LHHcwbiiV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qlqC0hMJyDU4ed7PhIQar013DoZYr3shz8rwF80hGoNGfcrsQGevjFGQHvv+dzhrB
 PVS5yeILn9UMcvBXamMmjWOTf1AtaawkIjjLqwdwwrEGAnmKGT0peVCBPHLWDCVlKj
 10vho5MxpDWev0cNodnzMP+ERX7yencKEsi5foes=
Date: Mon, 6 May 2019 08:53:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] crypto: vmx - fix copy-paste error in CTR mode
Message-ID: <20190506155315.GA661@sol.localdomain>
References: <20190315020901.16509-1-dja@axtens.net>
 <20190315022414.GA1671@sol.localdomain>
 <875zsku5mk.fsf@dja-thinkpad.axtens.net>
 <20190315043433.GC1671@sol.localdomain>
 <8736nou2x5.fsf@dja-thinkpad.axtens.net>
 <20190410070234.GA12406@sol.localdomain>
 <87imvkwqdh.fsf@dja-thinkpad.axtens.net>
 <2c8b042f-c7df-cb8b-3fcd-15d6bb274d08@linux.vnet.ibm.com>
 <8736mmvafj.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8736mmvafj.fsf@concordia.ellerman.id.au>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: leo.barbosa@canonical.com, Nayna <nayna@linux.vnet.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Stephan Mueller <smueller@chronox.de>, nayna@linux.ibm.com,
 omosnacek@gmail.com, marcelo.cerri@canonical.com, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, leitao@debian.org,
 George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 13, 2019 at 01:41:36PM +1000, Michael Ellerman wrote:
> Nayna <nayna@linux.vnet.ibm.com> writes:
> 
> > On 04/11/2019 10:47 AM, Daniel Axtens wrote:
> >> Eric Biggers <ebiggers@kernel.org> writes:
> >>
> >>> Are you still planning to fix the remaining bug?  I booted a ppc64le VM, and I
> >>> see the same test failure (I think) you were referring to:
> >>>
> >>> alg: skcipher: p8_aes_ctr encryption test failed (wrong result) on test vector 3, cfg="uneven misaligned splits, may sleep"
> >>>
> >> Yes, that's the one I saw. I don't have time to follow it up at the
> >> moment, but Nayna is aware of it.
> >>
> >
> > Yes Eric, we identified this as a separate issue of misalignment and 
> > plan to post a separate patch to address it.
> 
> I also wrote it down in my write-only TODO list here:
> 
>   https://github.com/linuxppc/issues/issues/238
> 
> 
> cheers

Any progress on this?  Someone just reported this again here:
https://bugzilla.kernel.org/show_bug.cgi?id=203515

- Eric
