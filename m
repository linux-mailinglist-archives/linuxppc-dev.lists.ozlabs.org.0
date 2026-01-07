Return-Path: <linuxppc-dev+bounces-15360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34007CFCB67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:02:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMW32c0Sz2yFh;
	Wed, 07 Jan 2026 20:02:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=143.55.146.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767776559;
	cv=none; b=FL71kgBgh1VRs+5ZN2BW0lnsG+ddIvnTyvDBIDEHWuyUyO0T82mtQqAHs7ZoCnShHXZn6hxcrlGQZp6Rgh4OcmTS4dpBbTgqx22Gmuy+ZmSc/omKqg7UjumV10zb3nyLhfyoCnShwqCKiHIg8Os9JHVifwM2290aZYT9qGo7PexB2FKBZBFH8/qTynbozVCDiozR5KLmxVejUHz39A8gTWceUQwWILZQZ9Tg2y4BR94rW3+xD1R4gGUIBEnjN+hmvsfKHUYEsclCWjFZSiJ9RtpKHm4KfdtFDKlDr+bG/GG19Bd03UqlMdLqb5kbuijmSEEur7AjBvzOWQyoLu2m3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767776559; c=relaxed/relaxed;
	bh=ZROlfH7qS7KjrkXqJNeC7I2Vdn7vmWGFHNg3DEaZF+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqMZnA5FmE/pN3KnyDdZBWPdZrkAD71LEHelyJ/YIFrWAa40S+6vAUdJhO+24E6VJIdTwk2VNaGmRUj9yLF9BahBdESJVauNSzc0vdXW38HbjXGiTpBCCTXjJyYaW63Qf/Q+SYY7AR4DMK60M5A3KMl+WzXUt1So0DAEcRqPe9zv+kPfFGzL9XPlAGX/ua7/vLZXk+s9Xhz/sAVtYFNGL5iBVLq+YnCPVNTQ7TSl78Xa2cugimXPvFxVo1Sm7n7Eq6iZBDbPtgo2GgMqim7ZjKw38hS4K1HKtrEcIqe73QkNQV7lmglE02SKtS86BxwApteofpUppMSwufby+Bm/3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=iram.es; dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=me/btcHj; dkim-atps=neutral; spf=pass (client-ip=143.55.146.78; helo=mx07-006a4e02.pphosted.com; envelope-from=paubert@iram.es; receiver=lists.ozlabs.org) smtp.mailfrom=iram.es
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=me/btcHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iram.es (client-ip=143.55.146.78; helo=mx07-006a4e02.pphosted.com; envelope-from=paubert@iram.es; receiver=lists.ozlabs.org)
X-Greylist: delayed 1645 seconds by postgrey-1.37 at boromir; Wed, 07 Jan 2026 20:02:36 AEDT
Received: from mx07-006a4e02.pphosted.com (mx07-006a4e02.pphosted.com [143.55.146.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMW024z5z2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:02:34 +1100 (AEDT)
Received: from pps.filterd (m0316689.ppops.net [127.0.0.1])
	by m0316689.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 60780YVH1390739;
	Wed, 7 Jan 2026 09:34:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iram.es; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=dkim3; bh=ZROlfH7qS7KjrkXqJNeC7I2Vdn7v
	mWGFHNg3DEaZF+Q=; b=me/btcHjTJMiodyv9SHOilNvtN3f6ZBXAYqaGXfUfyhz
	OvGZF8yQJp72GRpihdaAKtqVl1ktswj+j1/E9rKY51xEz5viOfyJICcTwTMFQkdQ
	nTrapGMZEkOPV8HxNBXApcT14hdgCYpM9BjBGv/ULXwLD95XerHKMFVOj/ypIJrB
	fg4BrMMgg8/QL0dRIYrnA3MpoaN39uUHdGlA5SZgrG7kBEtzNd177bAWk/5OfM7o
	CFl05JiFFTrBkAE33+X3R78mbfuD/TBENCiQ+nlPeOcXwwh56cUod1Jq2c3KA64h
	q/d/1lfLCrzsGuPxEhjHxAgL0aOf4F+Ewr5COhnRPA==
Received: from mta-out03.sim.rediris.es (mta-out03.sim.rediris.es [130.206.24.45])
	by m0316689.ppops.net (PPS) with ESMTPS id 4bh6xww2t6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 09:34:35 +0100 (CET)
Received: from mta-out03.sim.rediris.es (localhost.localdomain [127.0.0.1])
	by mta-out03.sim.rediris.es (Postfix) with ESMTPS id 3E8441204FC;
	Wed,  7 Jan 2026 09:34:35 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta-out03.sim.rediris.es (Postfix) with ESMTP id 1F82C120513;
	Wed,  7 Jan 2026 09:34:35 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out03.sim.rediris.es
Received: from mta-out03.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out03.sim.rediris.es [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 68audRkzUgCa; Wed,  7 Jan 2026 09:34:35 +0100 (CET)
Received: from front02.sim.rediris.es (front02.sim.rediris.es [130.206.24.72])
	by mta-out03.sim.rediris.es (Postfix) with ESMTPS id EDF881204FC;
	Wed,  7 Jan 2026 09:34:34 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by front02.sim.rediris.es (Postfix) with ESMTP id D835E8047B;
	Wed,  7 Jan 2026 09:34:34 +0100 (CET)
Received: from front02.sim.rediris.es ([127.0.0.1])
 by localhost (front02.sim.rediris.es [127.0.0.1]) (amavis, port 10032)
 with ESMTP id QhjiHLlyorgF; Wed,  7 Jan 2026 09:34:34 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by front02.sim.rediris.es (Postfix) with ESMTP id 779B680537;
	Wed,  7 Jan 2026 09:34:34 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 front02.sim.rediris.es
X-Virus-Scanned: amavis at sim.rediris.es
Received: from front02.sim.rediris.es ([127.0.0.1])
 by localhost (front02.sim.rediris.es [127.0.0.1]) (amavis, port 10026)
 with ESMTP id JTYhGd1kwpLU; Wed,  7 Jan 2026 09:34:34 +0100 (CET)
Received: from lt-gp.iram.es (93.red-83-60-244.dynamicip.rima-tde.net [83.60.244.93])
	by front02.sim.rediris.es (Postfix) with ESMTPA id E807F8047B;
	Wed,  7 Jan 2026 09:34:33 +0100 (CET)
Date: Wed, 7 Jan 2026 09:34:27 +0100
From: Gabriel Paubert <paubert@iram.es>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 7/7] powerpc/uaccess: Implement masked user access
Message-ID: <aV4ak8YoXsAVSbru@lt-gp.iram.es>
References: <cover.1766574657.git.chleroy@kernel.org>
 <8f418183d9125cc0bf23922bc2ef2a1130d8b63a.1766574657.git.chleroy@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f418183d9125cc0bf23922bc2ef2a1130d8b63a.1766574657.git.chleroy@kernel.org>
X-Proofpoint-GUID: FDdEX3WVRiOk49kjDroZIMOdSpMxfbBQ
X-Proofpoint-ORIG-GUID: FDdEX3WVRiOk49kjDroZIMOdSpMxfbBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2OCBTYWx0ZWRfXyrYRAbtWQ9+U
 oHNFZguAPT7IVfOiG1VLWEQlLN8H+h5AjKMxgcTtb3ybOIV5W1EaoI8dvq5A8W6RZVLPfCyjse8
 MS6LplmhBB1vAvB8EFxUAbyyRtRm6oWCysnvNRMElFIWmwx5o2ja93LcVkJWaVgIvQgqrmtOjhG
 65yC6ONlUc4oP6u5jUxeeWH//x0a8F9plXO3vR1g4naISWD3VQK0qK8Vmg5ZJ0vm+w37/DmLpyo
 nm3XZEeFYLRjtalr85IvlrQKCfYyTQdKjpf/KHLPqssmnoz4tB906SjPpxnTwb4Pw5DrsY9A/1l
 EGoZS0TyQ6P7P1vDQrS4GaQuoiysUxQ2XAwd3mV0qhteAUWr/tUmYTzOmJEYBToLj7fxbXXa2L2
 MAnL6Kz6QxsQcordQAENTrPzGTM1tVDUMTGguFbA49ZmZ1V/5HIQP2rCCFCOhl8n+XthN6RNAKL
 Yvyr+pAwiWWu4OZ+o7g==
X-Authority-Analysis: v=2.4 cv=Xf2EDY55 c=1 sm=1 tr=0 ts=695e1a9b cx=c_pps
 a=iwL1hAB+OANaoz4/dZZFVA==:117 a=iwL1hAB+OANaoz4/dZZFVA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1UX6Do5GAAAA:8 a=T5CSHJqlTurtTRJvuSIA:9 a=CjuIK1q_8ugA:10
 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=salida_notspam policy=salida score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070068
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

On Wed, Dec 24, 2025 at 12:20:55PM +0100, Christophe Leroy (CS GROUP) wrote:
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Masked user access avoids the address/size verification by access_ok().
> Allthough its main purpose is to skip the speculation in the
> verification of user address and size hence avoid the need of spec
> mitigation, it also has the advantage of reducing the amount of
> instructions required so it even benefits to platforms that don't
> need speculation mitigation, especially when the size of the copy is
> not know at build time.
> 
> So implement masked user access on powerpc. The only requirement is
> to have memory gap that faults between the top user space and the
> real start of kernel area.
> 
> On 64 bits platforms the address space is divided that way:
> 
> 	0xffffffffffffffff	+------------------+
> 				|                  |
> 				|   kernel space   |
>  		 		|                  |
> 	0xc000000000000000	+------------------+  <== PAGE_OFFSET
> 				|//////////////////|
> 				|//////////////////|
> 	0x8000000000000000	|//////////////////|
> 				|//////////////////|
> 				|//////////////////|
> 	0x0010000000000000	+------------------+  <== TASK_SIZE_MAX
> 				|                  |
> 				|    user space    |
> 				|                  |
> 	0x0000000000000000	+------------------+
> 
> Kernel is always above 0x8000000000000000 and user always
> below, with a gap in-between. It leads to a 3 instructions sequence:
> 
>  150:	7c 69 fe 76 	sradi   r9,r3,63
>  154:	79 29 00 40 	clrldi  r9,r9,1
>  158:	7c 63 48 78 	andc    r3,r3,r9
> 
> This sequence leaves r3 unmodified when it is below 0x8000000000000000
> and clamps it to 0x8000000000000000 if it is above.
> 
> On 32 bits it is more tricky. In theory user space can go up to
> 0xbfffffff while kernel will usually start at 0xc0000000. So a gap
> needs to be added in-between. Allthough in theory a single 4k page
> would suffice, it is easier and more efficient to enforce a 128k gap
> below kernel, as it simplifies the masking.
> 
> e500 has the isel instruction which allows selecting one value or
> the other without branch and that instruction is not speculative, so
> use it. Allthough GCC usually generates code using that instruction,
> it is safer to use inline assembly to be sure. The result is:
> 
>   14:	3d 20 bf fe 	lis     r9,-16386
>   18:	7c 03 48 40 	cmplw   r3,r9
>   1c:	7c 69 18 5e 	iselgt  r3,r9,r3
> 
> On other ones, when kernel space is over 0x80000000 and user space
> is below, the logic in mask_user_address_simple() leads to a
> 3 instruction sequence:
> 
>   64:	7c 69 fe 70 	srawi   r9,r3,31
>   68:	55 29 00 7e 	clrlwi  r9,r9,1
>   6c:	7c 63 48 78 	andc    r3,r3,r9
> 
> This is the default on powerpc 8xx.
> 
> When the limit between user space and kernel space is not 0x80000000,
> mask_user_address_32() is used and a 6 instructions sequence is
> generated:


Actually I took the opportunity of a the recenet flu epidemic here
(first me, than my son and finally my wife), to work a bit on this, and
found a way to shrink the gap to 64k with 6 instructions, the exact
sequence depends on the MSB of the boundary, but it's just flipping
between "or" and "andc".

The test code below uses different constant names and interfaces (no
__user annotation for a start), but adapting your mask_user_address_32
to use it is trivial.


#define LIMIT 0x70000000 // or 0xc0000000
#define MASK (LIMIT-0x10000)


/* The generated code is (several gcc versions tested):
 * for LIMIT 0xc0000000
 * 00000000 <mask_addr>:
 * 	addis   r9,r3,16385
 *	andc    r9,r3,r9
 * 	srawi   r9,r9,31
 * 	andc    r3,r3,r9
 *  	andis.  r9,r9,49151
 * 	or      r3,r3,r9
 * 	blr
 * for LIMIT 0x70000000
 * 00000000 <mask_addr>:
 *	addis   r9,r3,4097
 *	or      r9,r9,r3
 *	srawi   r9,r9,31
 *	andc    r3,r3,r9
 *	andis.  r9,r9,28671
 *	or      r3,r3,r9
 * 	blr
 */

With some values of LIMIT, for example 0x70010000, the compiler
generates "rlwinm" instead of "andis.", but that's the only variation
I've seen.

The C code is:

unsigned long masked_addr(unsigned long addr)
{
	unsigned long mask;
	signed long tmp;
	if (MASK & 0x80000000) {
		tmp = addr - MASK; // positive if invalid
		tmp = addr & ~tmp; // positive if valid, else negative
	} else {
		tmp = addr + (0x80000000 - MASK); // negative if invalid
		tmp |= addr; // positive if valid, else negative
	}
	tmp >>= 31;                  // 0 if valid, -1 if not
	mask = tmp & MASK;           // 0 if valid, else LIMIT
	return (addr & ~tmp) | mask; // addr if valid, else LIMIT
}

Regards,
Gabriel

> 
>   24:	54 69 7c 7e 	srwi    r9,r3,17
>   28:	21 29 57 ff 	subfic  r9,r9,22527
>   2c:	7d 29 fe 70 	srawi   r9,r9,31
>   30:	75 2a b0 00 	andis.  r10,r9,45056
>   34:	7c 63 48 78 	andc    r3,r3,r9
>   38:	7c 63 53 78 	or      r3,r3,r10
> 
> The constraint is that TASK_SIZE be aligned to 128K in order to get
> the most optimal number of instructions.
> 
> When CONFIG_PPC_BARRIER_NOSPEC is not defined, fallback on the
> test-based masking as it is quicker than the 6 instructions sequence
> but not quicker than the 3 instructions sequences above.
> 
> As an exemple, allthough barrier_nospec() voids on the 8xx, this
> change has the following impact on strncpy_from_user(): the length of
> the function is reduced from 488 to 340 bytes:
> 
> Start of the function with the patch:
> 
> 00000000 <strncpy_from_user>:
>    0:	7c ab 2b 79 	mr.     r11,r5
>    4:	40 81 01 40 	ble     144 <strncpy_from_user+0x144>
>    8:	7c 89 fe 70 	srawi   r9,r4,31
>    c:	55 29 00 7e 	clrlwi  r9,r9,1
>   10:	7c 84 48 78 	andc    r4,r4,r9
>   14:	3d 20 dc 00 	lis     r9,-9216
>   18:	7d 3a c3 a6 	mtspr   794,r9
>   1c:	2f 8b 00 03 	cmpwi   cr7,r11,3
>   20:	40 9d 00 b4 	ble     cr7,d4 <strncpy_from_user+0xd4>
> ...
> 
> Start of the function without the patch:
> 
> 00000000 <strncpy_from_user>:
>    0:	7c a0 2b 79 	mr.     r0,r5
>    4:	40 81 01 10 	ble     114 <strncpy_from_user+0x114>
>    8:	2f 84 00 00 	cmpwi   cr7,r4,0
>    c:	41 9c 01 30 	blt     cr7,13c <strncpy_from_user+0x13c>
>   10:	3d 20 80 00 	lis     r9,-32768
>   14:	7d 24 48 50 	subf    r9,r4,r9
>   18:	7f 80 48 40 	cmplw   cr7,r0,r9
>   1c:	7c 05 03 78 	mr      r5,r0
>   20:	41 9d 01 00 	bgt     cr7,120 <strncpy_from_user+0x120>
>   24:	3d 20 80 00 	lis     r9,-32768
>   28:	7d 25 48 50 	subf    r9,r5,r9
>   2c:	7f 84 48 40 	cmplw   cr7,r4,r9
>   30:	38 e0 ff f2 	li      r7,-14
>   34:	41 9d 00 e4 	bgt     cr7,118 <strncpy_from_user+0x118>
>   38:	94 21 ff e0 	stwu    r1,-32(r1)
>   3c:	3d 20 dc 00 	lis     r9,-9216
>   40:	7d 3a c3 a6 	mtspr   794,r9
>   44:	2b 85 00 03 	cmplwi  cr7,r5,3
>   48:	40 9d 01 6c 	ble     cr7,1b4 <strncpy_from_user+0x1b4>
> ...
>  118:	7c e3 3b 78 	mr      r3,r7
>  11c:	4e 80 00 20 	blr
>  120:	7d 25 4b 78 	mr      r5,r9
>  124:	3d 20 80 00 	lis     r9,-32768
>  128:	7d 25 48 50 	subf    r9,r5,r9
>  12c:	7f 84 48 40 	cmplw   cr7,r4,r9
>  130:	38 e0 ff f2 	li      r7,-14
>  134:	41 bd ff e4 	bgt     cr7,118 <strncpy_from_user+0x118>
>  138:	4b ff ff 00 	b       38 <strncpy_from_user+0x38>
>  13c:	38 e0 ff f2 	li      r7,-14
>  140:	4b ff ff d8 	b       118 <strncpy_from_user+0x118>
> ...
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v4: Rebase on top of core-scoped-uaccess tag and simplified as suggested by Gabriel
> 
> v3: Rewrite mask_user_address_simple() for a smaller result on powerpc64, suggested by Gabriel
> 
> v2: Added 'likely()' to the test in mask_user_address_fallback()
> ---
>  arch/powerpc/include/asm/task_size_32.h |  6 +-
>  arch/powerpc/include/asm/uaccess.h      | 76 +++++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/task_size_32.h b/arch/powerpc/include/asm/task_size_32.h
> index 42a64bbd1964..725ddbf06217 100644
> --- a/arch/powerpc/include/asm/task_size_32.h
> +++ b/arch/powerpc/include/asm/task_size_32.h
> @@ -13,7 +13,7 @@
>  #define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
>  #define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
>  #define MODULES_BASE	(MODULES_VADDR & ~(UL(SZ_4M) - 1))
> -#define USER_TOP	MODULES_BASE
> +#define USER_TOP	(MODULES_BASE - SZ_4M)
>  #endif
>  
>  #ifdef CONFIG_PPC_BOOK3S_32
> @@ -21,11 +21,11 @@
>  #define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
>  #define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
>  #define MODULES_BASE	(MODULES_VADDR & ~(UL(SZ_256M) - 1))
> -#define USER_TOP	MODULES_BASE
> +#define USER_TOP	(MODULES_BASE - SZ_4M)
>  #endif
>  
>  #ifndef USER_TOP
> -#define USER_TOP	ASM_CONST(CONFIG_PAGE_OFFSET)
> +#define USER_TOP	((ASM_CONST(CONFIG_PAGE_OFFSET) - SZ_128K) & ~(UL(SZ_128K) - 1))
>  #endif
>  
>  #if CONFIG_TASK_SIZE < USER_TOP
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 721d65dbbb2e..ba1d878c3f40 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -2,6 +2,8 @@
>  #ifndef _ARCH_POWERPC_UACCESS_H
>  #define _ARCH_POWERPC_UACCESS_H
>  
> +#include <linux/sizes.h>
> +
>  #include <asm/processor.h>
>  #include <asm/page.h>
>  #include <asm/extable.h>
> @@ -435,6 +437,80 @@ static __must_check __always_inline bool __user_access_begin(const void __user *
>  #define user_access_save	prevent_user_access_return
>  #define user_access_restore	restore_user_access
>  
> +/*
> + * Masking the user address is an alternative to a conditional
> + * user_access_begin that can avoid the fencing. This only works
> + * for dense accesses starting at the address.
> + */
> +static inline void __user *mask_user_address_simple(const void __user *ptr)
> +{
> +	unsigned long addr = (unsigned long)ptr;
> +	unsigned long mask = (unsigned long)(((long)addr >> (BITS_PER_LONG - 1)) & LONG_MAX);
> +
> +	return (void __user *)(addr & ~mask);
> +}
> +
> +static inline void __user *mask_user_address_isel(const void __user *ptr)
> +{
> +	unsigned long addr;
> +
> +	asm("cmplw %1, %2; iselgt %0, %2, %1" : "=r"(addr) : "r"(ptr), "r"(TASK_SIZE) : "cr0");
> +
> +	return (void __user *)addr;
> +}
> +
> +/* TASK_SIZE is a multiple of 128K for shifting by 17 to the right */
> +static inline void __user *mask_user_address_32(const void __user *ptr)
> +{
> +	unsigned long addr = (unsigned long)ptr;
> +	unsigned long mask = (unsigned long)((long)((TASK_SIZE >> 17) - 1 - (addr >> 17)) >> 31);
> +
> +	addr = (addr & ~mask) | (TASK_SIZE & mask);
> +
> +	return (void __user *)addr;
> +}
> +
> +static inline void __user *mask_user_address_fallback(const void __user *ptr)
> +{
> +	unsigned long addr = (unsigned long)ptr;
> +
> +	return (void __user *)(likely(addr < TASK_SIZE) ? addr : TASK_SIZE);
> +}
> +
> +static inline void __user *mask_user_address(const void __user *ptr)
> +{
> +#ifdef MODULES_VADDR
> +	const unsigned long border = MODULES_VADDR;
> +#else
> +	const unsigned long border = PAGE_OFFSET;
> +#endif
> +
> +	if (IS_ENABLED(CONFIG_PPC64))
> +		return mask_user_address_simple(ptr);
> +	if (IS_ENABLED(CONFIG_E500))
> +		return mask_user_address_isel(ptr);
> +	if (TASK_SIZE <= UL(SZ_2G) && border >= UL(SZ_2G))
> +		return mask_user_address_simple(ptr);
> +	if (IS_ENABLED(CONFIG_PPC_BARRIER_NOSPEC))
> +		return mask_user_address_32(ptr);
> +	return mask_user_address_fallback(ptr);
> +}
> +
> +static __always_inline void __user *__masked_user_access_begin(const void __user *p,
> +							       unsigned long dir)
> +{
> +	void __user *ptr = mask_user_address(p);
> +
> +	might_fault();
> +	allow_user_access(ptr, dir);
> +
> +	return ptr;
> +}
> +
> +#define masked_user_access_begin(p) __masked_user_access_begin(p, KUAP_READ_WRITE)
> +#define masked_user_read_access_begin(p) __masked_user_access_begin(p, KUAP_READ)
> +#define masked_user_write_access_begin(p) __masked_user_access_begin(p, KUAP_WRITE)
> +
>  #define arch_unsafe_get_user(x, p, e) do {			\
>  	__long_type(*(p)) __gu_val;				\
>  	__typeof__(*(p)) __user *__gu_addr = (p);		\
> -- 
> 2.49.0
> 
> 
 

 


