Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5E1903FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 04:53:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mcmf0xfbzDqtp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:53:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mcl26LK6zDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 14:52:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ks3YCF8m; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48mcl21mB7z9sRf;
 Tue, 24 Mar 2020 14:52:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585021934;
 bh=RJoMJcdEMljLlcgenVS1+yDtyidHq9++WOTh4gTO7/8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ks3YCF8mjYCIDw3SKt/+CoLOF3tmApRgq9fWTfYO9ofvvhgrwUTsqilIZ464phb4N
 C+kY767lRBbAhJPo596YgBhtJNz+ivzTbPPP4YseBO1HXGdRaHvrXAHBxewy21Fzm3
 94bL3prLkZ6t9hDy5RE0NeHSDsQ0fAMUao/0PPieZ6Owwen/rE+OU0/ZA8sLD02SSY
 kFyJRi2NrDFQH34uoblEwqmzO9AhxvtNKaWkXnbwuG8wmsQLdZ7zojPz7/j2e7gKNl
 abBVZ+hKwk6XZ91+YoG7HIuIR9yJ/1fzZO6p8AVwN5sQmPhZcXDzTPnsvrD2FPB39u
 TbLfVbRgAYY8w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Balamuruhan S <bala24@linux.ibm.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc xmon: drop the option `i` in cacheflush
In-Reply-To: <1584968594.gguy53jubt.naveen@linux.ibm.com>
References: <20200323112548.1077440-1-bala24@linux.ibm.com>
 <20200323124630.GP22482@gate.crashing.org>
 <1584968594.gguy53jubt.naveen@linux.ibm.com>
Date: Tue, 24 Mar 2020 14:52:21 +1100
Message-ID: <87wo7axvd6.fsf@mpe.ellerman.id.au>
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org, sandipan@linux.ibm.com,
 paulus@samba.org, ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Segher Boessenkool wrote:
>> On Mon, Mar 23, 2020 at 04:55:48PM +0530, Balamuruhan S wrote:
>>> Data Cache Block Invalidate (dcbi) instruction implemented in 32-bit
>>> designs prior to PowerPC architecture version 2.01 and got obsolete
>>> from version 2.01.

We still support 32-bit ...

>> It was added back in 2.03.  It also exists in 64-bit designs (using
>> category embedded), in 2.07 still even.
>
> Indeed, it has been part of Book3e.
>
> It isn't clear if this is still useful in this context (xmon) though, 
> since 'dcbf' seems to be equivalent in most respects. At the very least, 
> we should restrict this to Book3e, if it is of value there.

Looking at the ISA it looks like dcbf is more or less equivalent and we
could probably drop the explicit invalidate command.

But the simplest option is probably to just ifdef it out for
PPC_BOOK3S_64.

cheers
