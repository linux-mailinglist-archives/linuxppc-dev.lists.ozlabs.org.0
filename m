Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6CD2935E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 09:36:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFlmZ1WTdzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 18:36:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFlk948lZzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 18:34:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nHptS6F7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CFlk721Hdz9sSC;
 Tue, 20 Oct 2020 18:34:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603179249;
 bh=zmNZh+ZEQ1WLOU/BNA8riKCW5xmCis1MYfzfQimpEhU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nHptS6F7eySdFEovSb7+ia+qEJhEV8hvOW501LZ5tAy7yGP/NwRkMUc/KWA3EGUCn
 MIpS2dnkLcal5HRvI0rbwRbnFrpf85pcgdhClRbyusVQQSzu7vID+lehXEsoBBCeLt
 DzOJGdn9OhAw30d1uknjCAwoXHvKh0u30Oh0MYpfYjMyYYpm1uUSQdXmx+HwctEUov
 Bs9B2s0iQHwajUSoqxnlSytMZ/itgVtPBqzhRQHArtsi5XM8Xgti9Klq0/xJs9SniZ
 QCfp7Idhh+C30SKUgGrj9pBuRKxpFnr8DM2as+9n10LXjbwdcL53ZSQetX7MmEm22+
 xcs8AV8BBiPkw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 3/8] powerpc: Mark functions called inside uaccess blocks
 w/ 'notrace'
In-Reply-To: <20201016094132.GI2611@hirez.programming.kicks-ass.net>
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-4-cmr@codefail.de>
 <20201016065616.GB9343@infradead.org>
 <20201016094132.GI2611@hirez.programming.kicks-ass.net>
Date: Tue, 20 Oct 2020 18:34:06 +1100
Message-ID: <87v9f5xsep.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Christopher M. Riedl" <cmr@codefail.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Fri, Oct 16, 2020 at 07:56:16AM +0100, Christoph Hellwig wrote:
>> On Thu, Oct 15, 2020 at 10:01:54AM -0500, Christopher M. Riedl wrote:
>> > Functions called between user_*_access_begin() and user_*_access_end()
>> > should be either inlined or marked 'notrace' to prevent leaving
>> > userspace access exposed. Mark any such functions relevant to signal
>> > handling so that subsequent patches can call them inside uaccess blocks.
>> 
>> I don't think running this much code with uaccess enabled is a good
>> idea.  Please refactor the code to reduce the criticial sections with
>> uaccess enabled.
>> 
>> Btw, does powerpc already have the objtool validation that we don't
>> accidentally jump out of unsafe uaccess critical sections?
>
> It does not, there was some effort on that a while ago, but I suspect
> they're waiting for the ARM64 effort to land and build on that.

Right, we don't have objtool support.

We would definitely like objtool support at least for this uaccess
checking, I'm sure we have some escapes.

There was someone working on it in their own-time but last I heard that
was still WIP.

I didn't realise the ARM64 support was still not merged, so yeah having
that land first would probably simplify things, but we still need
someone who has time to work on it.

cheers
