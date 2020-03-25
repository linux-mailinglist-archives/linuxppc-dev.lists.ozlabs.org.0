Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 759C01926EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 12:15:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQWT2P1fzDqd3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 22:15:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPr362v5zDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:44:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gvGIOEVp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48nPr331LXz9sP7;
 Wed, 25 Mar 2020 21:44:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585133059;
 bh=JCfgUxv8Z7QEd5lJDkr0s4EBV+1Z8zFeOkxFdnVIZYM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gvGIOEVpllM//KpSXEQHhRjPaRpXF8g90IG9bbOOw16TbnJ2H40BU/CvKn9LMNBK1
 lelnNQjfTB/daFRvh+rRZiLh9xf40kEoCW6eNTIjZ7Ecpzk9Vok+JpHc0uffirI3kF
 NzEElaO3qeBwKg/WHgePasmc51bsOuCTWlhIGLw6MIzDUSPAYaFoIyG2clJ2WSw+M0
 xdpOo8gaLH4TwfbIcKjmzVbg2S7DweeZBdRteNUIDDFxjuK+y7pWtYR9b5cAW9AgUd
 WlC9A1txpDKo4kxYL+pLlrI72bqDixdrfYluTNU7xY7xblLWsoC+JSovS7A68jRWvs
 YCjSunKAPaEew==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH v8 03/14] powerpc/vas: Define nx_fault_stamp in
 coprocessor_request_block
In-Reply-To: <1584987237.9256.15333.camel@hbabu-laptop>
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598437.9256.15247.camel@hbabu-laptop>
 <1584923120.arc9bj6gmg.astroid@bobo.none> <87bloncnnx.fsf@mpe.ellerman.id.au>
 <1584987237.9256.15333.camel@hbabu-laptop>
Date: Wed, 25 Mar 2020 21:44:26 +1100
Message-ID: <87pnd0ww6t.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> On Mon, 2020-03-23 at 22:32 +1100, Michael Ellerman wrote:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>> > Haren Myneni's on March 19, 2020 4:13 pm:
>> >> 
>> >> Kernel sets fault address and status in CRB for NX page fault on user
>> >> space address after processing page fault. User space gets the signal
>> >> and handles the fault mentioned in CRB by bringing the page in to
>> >> memory and send NX request again.
>> >> 
>> >> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
>> >> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> >> ---
>> >>  arch/powerpc/include/asm/icswx.h | 18 +++++++++++++++++-
>> >>  1 file changed, 17 insertions(+), 1 deletion(-)
>> >> 
>> >> diff --git a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/include/asm/icswx.h
>> >> index 9872f85..b233d1e 100644
>> >> --- a/arch/powerpc/include/asm/icswx.h
>> >> +++ b/arch/powerpc/include/asm/icswx.h
>> >
>> > "icswx" is not a thing anymore, after 6ff4d3e96652 ("powerpc: Remove old 
>> > unused icswx based coprocessor support").
>> 
>> Yeah that commit ripped out some parts of the previous attempt at a user
>> visible API for this sort of "coprocessor" stuff. VAS is yet another
>> attempt to do something useful with most of the same pieces but some
>> slightly different details.
>> 
>> > I guess NX is reusing some 
>> > things from it, but it would be good to get rid of the cruft and re-name
>> > this file and and relevant names.
>> 
>> > NX already uses this file, so I guesss that can happen after this series.
>> 
>> A lot of the CRB/CSB stuff is still the same, and P8 still uses icswx.
>> But I'd be happy if the header was renamed eventually, as icswx is now a
>> legacy name.
>
> We can move all macros and struct definitions to vas.h and remove
> icswx.h. Can I do this after this series? 

Well they're still needed by the non-vas Power8 code, so that wouldn't
be quite right either :)

But yeah we can do whatever movement later as a cleanup.

cheers
