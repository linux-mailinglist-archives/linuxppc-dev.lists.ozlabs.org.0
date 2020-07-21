Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C89227F10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 13:38:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9xS60TdDzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 21:38:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9xQH6bn7zDqSs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:36:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JyhmLykP; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9xQH045Xz9sSJ;
 Tue, 21 Jul 2020 21:36:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595331415;
 bh=8cWqEZ7b8BkO4Lc0Yw9kRlVs08QZ7978e9X0CuvOH3I=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JyhmLykPfuVbCmNgLwFSzcomuXhpdEJTpqJ7z3tXJaJxIOnZheJmHY0gNc6ljONpf
 cWMncIFEKRaAuy9NXF8JOniiQPI/xhDLFO+9Ax0KCPFBLjqRf8NwaexBpxte9A0cuO
 OXhqY7VsIdhf1+ipTE9Vg2FayfKkcH/5ln1pjPAdm8TudEONBAezMcRR7wxrmuryG4
 dYAfSi4ZD+YZXmzfcgEPhyhpOGJWHWSv5Kfr+CCW9VTypwW9rTiGimSVyokaM+/onJ
 3mYDfMsC8liIOPX0svCn03YVxiDz4aP/76avkJ8BrxbNWSNbcSdXkbp+RS2HdljEsj
 F1BmP47NUh3kA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v4 09/10] powerpc/watchpoint: Return available watchpoints
 dynamically
In-Reply-To: <ccfcf488-0ec9-1737-8368-a848de1d72d1@linux.ibm.com>
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-10-ravi.bangoria@linux.ibm.com>
 <CACzsE9r0acLUkV35mVxy1AEK_xObs0yz+fD6UdbNdc6uz=Buqw@mail.gmail.com>
 <ccfcf488-0ec9-1737-8368-a848de1d72d1@linux.ibm.com>
Date: Tue, 21 Jul 2020 21:36:54 +1000
Message-ID: <87k0yxrtex.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 jolsa@kernel.org, pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
> On 7/20/20 9:12 AM, Jordan Niethe wrote:
>> On Fri, Jul 17, 2020 at 2:11 PM Ravi Bangoria
>> <ravi.bangoria@linux.ibm.com> wrote:
>>>
>>> So far Book3S Powerpc supported only one watchpoint. Power10 is
>>> introducing 2nd DAWR. Enable 2nd DAWR support for Power10.
>>> Availability of 2nd DAWR will depend on CPU_FTR_DAWR1.
>>>
>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>> ---
>>>   arch/powerpc/include/asm/cputable.h      | 4 +++-
>>>   arch/powerpc/include/asm/hw_breakpoint.h | 5 +++--
>>>   2 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>>> index 3445c86e1f6f..36a0851a7a9b 100644
>>> --- a/arch/powerpc/include/asm/cputable.h
>>> +++ b/arch/powerpc/include/asm/cputable.h
>>> @@ -633,7 +633,9 @@ enum {
>>>    * Maximum number of hw breakpoint supported on powerpc. Number of
>>>    * breakpoints supported by actual hw might be less than this.
>>>    */
>>> -#define HBP_NUM_MAX    1
>>> +#define HBP_NUM_MAX    2
>>> +#define HBP_NUM_ONE    1
>>> +#define HBP_NUM_TWO    2

>> I wonder if these defines are necessary - has it any advantage over
>> just using the literal?
>
> No, not really. Initially I had something like:
>
> #define HBP_NUM_MAX    2
> #define HBP_NUM_P8_P9  1
> #define HBP_NUM_P10    2
>
> But then I thought it's also not right. So I made it _ONE and _TWO.
> Now the function that decides nr watchpoints dynamically (nr_wp_slots)
> is in different file, I thought to keep it like this so it would be
> easier to figure out why _MAX is 2.

I don't think it makes anything clearer.

I had to stare at it thinking there was some sort of mapping or
indirection going on, before I realised it's just literally the number
of breakpoints.

So please just do:

static inline int nr_wp_slots(void)
{
       return cpu_has_feature(CPU_FTR_DAWR1) ? 2 : 1;
}

If you think HBP_NUM_MAX needs explanation then do that with a comment,
it can refer to nr_wp_slots() if that's helpful.

cheers
