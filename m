Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BCE43BD4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 00:35:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf69S3Xbxz2ywv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 09:35:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U7GGPV0a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U7GGPV0a; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf68s4C3fz2x98
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 09:35:25 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1B1861078;
 Tue, 26 Oct 2021 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635287722;
 bh=F7c4FLOG/JXpD5fMAX/T0ZjE8OJGkErTGZeG75EeKr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U7GGPV0a/Y0GUtoRJFPI+7hug+nZfuTykCoG6S301E2bNQWk77gwDGwnS0od4vXjG
 6eMUZO782AO5h4UEW9A0dbIW15ABmnbs91m9QqrjGHXyRITRll2SfCbz2MpjdX8irx
 KKj1kK03Fta62LWrP9FAztnV/3OoSDWNniishGobnNo9N8hjntmc2TTHj+oZyAh2oY
 5cyQ5OYdTGHK9y06i04G9bDCWxXXw9Ck/MwbFpFf9bQ6Yaag3bFkDWpVt5oRUJzucc
 nTzvn/rMoYcS7NCRt3QE/D8uK0pI2PA8PrSUWB3/iUuPJraxRc2riY7cukPSW6WHtZ
 VhClmkjPry6Bg==
Date: Tue, 26 Oct 2021 17:40:16 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH][next] powerpc/vas: Fix potential NULL pointer dereference
Message-ID: <20211026224016.GA1488461@embeddedor>
References: <20211015050345.GA1161918@embeddedor>
 <97c42e43-15b9-5db6-d460-dbb16f31954d@linux.ibm.com>
 <20211026184201.GB1457721@embeddedor>
 <87h7d3beqq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7d3beqq.fsf@mpe.ellerman.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Haren Myneni <haren@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 27, 2021 at 09:30:53AM +1100, Michael Ellerman wrote:
[..]
> > I think I'll take this in my tree.
> 
> I've already put it in powerpc/next:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=61cb9ac66b30374c7fd8a8b2a3c4f8f432c72e36

Oh, great. :)

> If you need to pick it up as well for some reason that's fine.

I just didn't  want it to get lost somehow. I'll drop it from tree now.

Thanks
--
Gustavo


