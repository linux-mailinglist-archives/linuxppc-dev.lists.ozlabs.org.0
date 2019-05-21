Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F802492E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 09:43:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457SS45mgvzDqMb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 17:43:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457SQt2DjPzDqFS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 17:42:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 457SQs0PKRz9s55;
 Tue, 21 May 2019 17:42:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/mm: mark more tlb functions as __always_inline
In-Reply-To: <CAK7LNAQNp+wsvNK84oYcGwR24=Kf=_N8WJdyZ2aUL9T3qDsVsA@mail.gmail.com>
References: <20190521061659.6073-1-yamada.masahiro@socionext.com>
 <16d967dd-9f8f-4e9e-97fd-3f9761e5d97c@c-s.fr>
 <CAK7LNAQNp+wsvNK84oYcGwR24=Kf=_N8WJdyZ2aUL9T3qDsVsA@mail.gmail.com>
Date: Tue, 21 May 2019 17:42:27 +1000
Message-ID: <87y3306yos.fsf@concordia.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> On Tue, May 21, 2019 at 3:54 PM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>> Le 21/05/2019 =C3=A0 08:16, Masahiro Yamada a =C3=A9crit :
>> > With CONFIG_OPTIMIZE_INLINING enabled, Laura Abbott reported error
>> > with gcc 9.1.1:
>> >
>> >    arch/powerpc/mm/book3s64/radix_tlb.c: In function '_tlbiel_pid':
>> >    arch/powerpc/mm/book3s64/radix_tlb.c:104:2: warning: asm operand 3 =
probably doesn't match constraints
>> >      104 |  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
>> >          |  ^~~
>> >    arch/powerpc/mm/book3s64/radix_tlb.c:104:2: error: impossible const=
raint in 'asm'
>> >
>> > Fixing _tlbiel_pid() is enough to address the warning above, but I
>> > inlined more functions to fix all potential issues.
>> >
>> > To meet the 'i' (immediate) constraint for the asm operands, functions
>> > propagating propagated 'ric' must be always inlined.
>> >
>> > Fixes: 9012d011660e ("compiler: allow all arches to enable CONFIG_OPTI=
MIZE_INLINING")
>> > Reported-by: Laura Abbott <labbott@redhat.com>
>> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> > ---
>> >
>> >   arch/powerpc/mm/book3s64/hash_native.c |  8 +++--
>> >   arch/powerpc/mm/book3s64/radix_tlb.c   | 44 +++++++++++++++---------=
--
>> >   2 files changed, 30 insertions(+), 22 deletions(-)
>> >
>> > diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/=
book3s64/hash_native.c
>> > index aaa28fd918fe..bc2c35c0d2b1 100644
>> > --- a/arch/powerpc/mm/book3s64/hash_native.c
>> > +++ b/arch/powerpc/mm/book3s64/hash_native.c
>> > @@ -60,9 +60,11 @@ static inline void tlbiel_hash_set_isa206(unsigned =
int set, unsigned int is)
>> >    * tlbiel instruction for hash, set invalidation
>> >    * i.e., r=3D1 and is=3D01 or is=3D10 or is=3D11
>> >    */
>> > -static inline void tlbiel_hash_set_isa300(unsigned int set, unsigned =
int is,
>> > -                                     unsigned int pid,
>> > -                                     unsigned int ric, unsigned int p=
rs)
>> > +static __always_inline void tlbiel_hash_set_isa300(unsigned int set,
>> > +                                                unsigned int is,
>> > +                                                unsigned int pid,
>> > +                                                unsigned int ric,
>> > +                                                unsigned int prs)
>>
>> Please don't split the line more than it is.
>>
>> powerpc accepts lines up to 90 chars, see arch/powerpc/tools/checkpatch.=
pl
>
> Ugh, I did not know this. Horrible.
>
> The Linux coding style should be global in the kernel tree.
> No subsystem should adopts its own coding style.

Well that ship sailed long ago.

But we don't have our own coding style, we just don't enforce 80 columns
rigidly, there are cases where a slightly longer line (up to ~90) is
preferable to a split line.

In a case like this with a long attribute and function name I think this
is probably the least worst option:

static __always_inline
void tlbiel_hash_set_isa300(unsigned int set, unsigned int is, unsigned int=
 pid,
			    unsigned int ric, unsigned int prs)
{
	...

cheers
