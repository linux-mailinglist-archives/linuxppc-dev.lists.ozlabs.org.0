Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A13A4D2F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 03:50:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MChg41pjzDqWP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 11:50:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MCg049QKzDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 11:49:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46MCg01W0Lz9s7T;
 Mon,  2 Sep 2019 11:48:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alastair D'Silva <alastair@au1.ibm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Segher Boessenkool <segher@kernel.crashing.org>
Subject: RE: [RFC PATCH] powerpc: Convert ____flush_dcache_icache_phys() to C
In-Reply-To: <fcc94e7f347c3759a1698444239a7250b22cde7d.camel@au1.ibm.com>
References: <de7a813c71c4823797bb351bea8be15acae83be2.1565970465.git.christophe.leroy@c-s.fr>
 <9887dada07278cb39051941d1a47d50349d9fde0.camel@au1.ibm.com>
 <a0ad8dd8-2f5d-256d-9e88-e9c236335bb8@c-s.fr>
 <fcc94e7f347c3759a1698444239a7250b22cde7d.camel@au1.ibm.com>
Date: Mon, 02 Sep 2019 11:48:59 +1000
Message-ID: <87imqbtqlw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Alastair D'Silva" <alastair@au1.ibm.com> writes:
> On Wed, 2019-08-21 at 22:27 +0200, Christophe Leroy wrote:
>>=20
>> Le 20/08/2019 =C3=A0 06:36, Alastair D'Silva a =C3=A9crit :
>> > On Fri, 2019-08-16 at 15:52 +0000, Christophe Leroy wrote:
>>=20
>> [...]
>>=20
>> >=20
>> > Thanks Christophe,
>> >=20
>> > I'm trying a somewhat different approach that requires less
>> > knowledge
>> > of assembler. Handling of CPU_FTR_COHERENT_ICACHE is outside this
>> > function. The code below is not a patch as my tree is a bit messy,
>> > sorry:
>>=20
>> Can we be 100% sure that GCC won't add any code accessing some
>> global data or stack while the Data MMU is OFF ?
>
> +mpe
>
> I'm not sure how we would go about making such a guarantee, but I've
> tied every variable used to a register and addr is passed in a
> register, so there is no stack usage, and every call in there only
> operates on it's operands.

That's not safe, I can believe it happens to work but the compiler
people will laugh at us if it ever breaks.

Let's leave it in asm.

cheers
