Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C03371DA897
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 05:30:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RdZ55RD1zDqX2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:30:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RdXB0PrfzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 13:29:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49RdX90LHWz9sT6;
 Wed, 20 May 2020 13:29:13 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/7] powerpc: Add new HWCAP bits
Date: Wed, 20 May 2020 13:29:10 +1000
Message-ID: <3938008.enqZtH4Sbd@townsend>
In-Reply-To: <871rnf49a6.fsf@mpe.ellerman.id.au>
References: <20200519003157.31946-1-alistair@popple.id.au>
 <20200519003157.31946-2-alistair@popple.id.au>
 <871rnf49a6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: aneesh.kumar@linux.ibm.com, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday, 20 May 2020 12:42:09 PM AEST Michael Ellerman wrote:
> Alistair Popple <alistair@popple.id.au> writes:
> > POWER10 introduces two new architectural features - ISAv3.1 and matrix
> > multiply accumulate (MMA) instructions. Userspace detects the presence
> > of these features via two HWCAP bits introduced in this patch. These
> > bits have been agreed to by the compiler and binutils team.
> 
> Do we have an explanation of why we're exposing MMA separately.
> 
> I believe it's because ISA v3.1 says that MMA is optional, in the table
> on page ix?

Right, MMA is an optional feature and software should check for its presence 
prior to use. This is explicitly stated in the ISA on pg. 574:

7.6.1.12 VSX Matrix-Multiply Assist (MMA) Instructions
The MMA facility is optional. Software that uses this facility should test for 
its availability and provide an alternate
execution path.

The HWCAP bit is the mechanism for that. I can add the description to the 
commit message.

- Alistair
 
> cheers
> 
> > diff --git a/arch/powerpc/include/uapi/asm/cputable.h
> > b/arch/powerpc/include/uapi/asm/cputable.h index
> > 540592034740..2692a56bf20b 100644
> > --- a/arch/powerpc/include/uapi/asm/cputable.h
> > +++ b/arch/powerpc/include/uapi/asm/cputable.h
> > @@ -50,6 +50,8 @@
> > 
> >  #define PPC_FEATURE2_DARN		0x00200000 /* darn random number insn */
> >  #define PPC_FEATURE2_SCV		0x00100000 /* scv syscall */
> >  #define PPC_FEATURE2_HTM_NO_SUSPEND	0x00080000 /* TM w/out suspended
> >  state */> 
> > +#define PPC_FEATURE2_ARCH_3_1		0x00040000 /* ISA 3.1 */
> > +#define PPC_FEATURE2_MMA		0x00020000 /* Matrix Multiply Accumulate */
> > 
> >  /*
> >  
> >   * IMPORTANT!




