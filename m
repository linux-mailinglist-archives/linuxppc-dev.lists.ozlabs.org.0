Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 050111CF2C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 12:43:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LvYP5HGHzDqrM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 20:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LvWL1FqszDqlg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 20:42:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jVaQIBsA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49LvWJ4rq4z9sRf;
 Tue, 12 May 2020 20:42:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589280125;
 bh=irXY0vtb9zPvMX2q8c25NXhSXgzVaOoD927epiNXh70=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jVaQIBsA9/RvJnWQmp6Engcr92niJPir1oeJaEEd7rimbfWX8KTC7gMirQsjqBUab
 dtmzfksFEKiKvtXOI47pWgU/CjF6XP9nuiLgAuI+fwywpzGuqmQkHIwqpirlIeiwF+
 d/iFl6RbsFFh3d+OBNoEVMUtaQxSOzYfG59/OZVCtVdQQkzuQ4SRq9XpN3ly97V7Sl
 szVGU3QoI8Ge4GZnZepSuK19bE2UI0UTc966yfM/9VhdHhDtycOUKrRLvqR1WtOFqx
 G0miMHvi9gdP4EZalGKz1uQoXKo5ulZ8ue6cUpjCLBHCiYDm8WbZi8sKl+kw9zA/2w
 cy8aYJSKkZtkQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
In-Reply-To: <20200409002726.GA5135@blackberry>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
 <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
 <1585895551.7o9oa0ey62.astroid@bobo.none>
 <fb98f346a4d6a9d689ae64dae33cbd45d2f8b0df.camel@linux.ibm.com>
 <87v9majhh2.fsf@mpe.ellerman.id.au> <20200409002726.GA5135@blackberry>
Date: Tue, 12 May 2020 20:42:21 +1000
Message-ID: <87mu6dbfjm.fsf@mpe.ellerman.id.au>
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
Cc: peterz@infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Leonardo Bras <leonardo@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Enrico Weigelt <info@metux.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Mackerras <paulus@ozlabs.org> writes:
> On Wed, Apr 08, 2020 at 10:21:29PM +1000, Michael Ellerman wrote:
>> 
>> We should be able to just allocate the rtas_args on the stack, it's only
>> ~80 odd bytes. And then we can use rtas_call_unlocked() which doesn't
>> take the global lock.
>
> Do we instantiate a 64-bit RTAS these days, or is it still 32-bit?

No, yes.

> In the old days we had to make sure the RTAS argument buffer was
> below the 4GB point.

Yes you're right, that's still true.

I was thinking we were on the emergency stack, but we may not be.

> If that's still necessary then perhaps putting rtas_args inside the
> PACA would be the way to go.

Yeah I guess. Allocating a struct within the RMO for each CPU is not
that simple vs just putting it in the paca.

cheers
