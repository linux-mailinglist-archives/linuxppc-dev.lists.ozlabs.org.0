Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F7588AAE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 12:39:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LySz23dDpz3c3N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 20:39:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KEW9aIfV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LySyP3SkXz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 20:38:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KEW9aIfV;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LySyP0kWzz4x1J;
	Wed,  3 Aug 2022 20:38:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659523133;
	bh=cZzR6q2FC68zDJPpV+tjLqwkyB0kdhohIKX2ZW6ahVU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KEW9aIfVu20bRph3tSKCXmLslC5VsGcwfUzOYm1MZslcIr9AYIP/4zoqQTWJ0391c
	 1W8yy9NLlPyQvZdSFlwpi13uMHfiIEASKn2U0dHJMaqZUWwBg5dHR0gvFu7tpwn4Sk
	 ZpOALjuJ9BGIN1npA4FJx4a7GKGM0+ECN2EtiP+7BvEg235qcaz2j5FH50/E4avAGd
	 cYlfmJMBBNveyoLDCBR3gV3kmCy4B/ytDh3hxLFgxrsigD3kHein5LaAKokvexOAbO
	 s/D3+NSVHju4MaQMaJXHmIyjbaVfUewfxnFX9joocEIBTn3/wGMrmzxflQG93ONquM
	 ZIIVJLeSAamAQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 2/3] powerpc/ppc-opcode: Define and use PPC_RAW_TRAP()
 and PPC_RAW_TW()
In-Reply-To: <1659513939.dxqqwb8mat.naveen@linux.ibm.com>
References: <b2d762191b095530789ac8b71b167c6740bb6aed.1657205708.git.christophe.leroy@csgroup.eu>
 <52c7e522e56a38e3ff0363906919445920005a8f.1657205708.git.christophe.leroy@csgroup.eu>
 <1659513939.dxqqwb8mat.naveen@linux.ibm.com>
Date: Wed, 03 Aug 2022 20:38:48 +1000
Message-ID: <87les5a9xj.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
> Christophe Leroy wrote:
>> Add and use PPC_RAW_TRAP() instead of opencoding.
>> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>  arch/powerpc/include/asm/ppc-opcode.h | 2 ++
>>  arch/powerpc/include/asm/probes.h     | 3 ++-
>>  arch/powerpc/xmon/xmon.c              | 2 +-
>>  3 files changed, 5 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
>> index 89beabf5325c..5527a955fb4a 100644
>> --- a/arch/powerpc/include/asm/ppc-opcode.h
>> +++ b/arch/powerpc/include/asm/ppc-opcode.h
>> @@ -581,6 +581,8 @@
>>  
>>  #define PPC_RAW_BRANCH(offset)		(0x48000000 | PPC_LI(offset))
>>  #define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
>> +#define PPC_RAW_TW(t0, a, b)		(0x7f000008 | ___PPC_RS(t0) | ___PPC_RA(a) | ___PPC_RB(b))
>
> Shouldn't that be 0x7c000008 ?

Yes, my script agrees.

https://github.com/mpe/misc-scripts/blob/master/ppc/ppc-instruction-encode

$ ./ppc-instruction-encode 0:31 6:t0 11:ra 16:rb 21:4 31:
.long 0x7c000008
t0 << 21
ra << 16
rb << 11


I guess the only user is PPC_RAW_TRAP() which passes t0 = 31, so that's
why nothing has broken.

Send a fixup? :)

cheers
