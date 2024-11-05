Return-Path: <linuxppc-dev+bounces-2874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D79BCE9B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 15:04:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjVT80xfCz2yPD;
	Wed,  6 Nov 2024 01:04:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730815484;
	cv=none; b=kAunR9JjrzSRhnuHkhPuhdvCfMn0IXG9FTWWJWULXmfpYq09+mqRfEWg8y6qWLSifQJhzkHXA9eJB3UJbebt9UM+VNxqs7IC66gVhvk8VRQN36i62McY8K0K/kdYGbPp2OV2Ez6/q2CrUYwds9iPzSjO2SmFpGAIYYqtfTudL2qhrISUFuUYUhddKUogBwy+RHDZT80fhZAQwl4QhgTe5C0zjOBX9c4zb59nODA0gIRDW/ittq+VwSTqkQu/gcUD3bs7HQEYiMsUjeP3GQX+4HPNWDzCKVdDOqsskSzZDs6Zje6fwMuZo1afRaCHRrteU9tAI4nfce0NzCvMFcD9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730815484; c=relaxed/relaxed;
	bh=SEQmByjsZ7JmVvgpNHihNtVhTaz+UQIWRJMkAOd264I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTjT11WRo/6+WVZ4kvaGUECJAMnD+ctuGEfDeekzdwWmolJ8L0wBB5A/uZ3QWG6JDOBYP+OTtShz+IUjKZ0oy6LBK+XrNyEZp8JRlI7fZb+GsxsnIiP95quUgC5MSFoNSEGJUUnb/9DgdtPm2O1R3I6z3eRkU/PNWVRdgMHsiTlkhcJDOpwUwSISN+UYLwXvAjS+y2VqX12t/UWJVDgBxDuiaYixTo3sbBcCuuwRwXp0/DFfOJkF03QPziXRa22e0lAvuYl7gR7H69IzjFJg9zYy18+ZF50au3puYKC8D/7Pqgt37H5hHa6mIx3AgcVVhR7Qkeqsz1IOOmCaXULE0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjVT61wcbz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 01:04:41 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XjVT20D0Vz9sRr;
	Tue,  5 Nov 2024 15:04:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LoXpUD9JBUwx; Tue,  5 Nov 2024 15:04:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XjVSw68fmz9rvV;
	Tue,  5 Nov 2024 15:04:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC0698B763;
	Tue,  5 Nov 2024 15:04:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DUJhllzpqdGg; Tue,  5 Nov 2024 15:04:32 +0100 (CET)
Received: from [192.168.232.44] (unknown [192.168.232.44])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 228F48B770;
	Tue,  5 Nov 2024 15:04:32 +0100 (CET)
Message-ID: <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
Date: Tue, 5 Nov 2024 15:04:31 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
To: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Nam Cao <namcao@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <871pzxzuny.ffs@tglx>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <871pzxzuny.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 30/10/2024 à 12:39, Thomas Gleixner a écrit :
> Folks!
> 
> On Thu, Oct 10 2024 at 09:01, Thomas Weißschuh wrote:
>> Historically each architecture defined their own datapage to store the
>> VDSO data. This stands in contrast to the generic nature of the VDSO
>> code itself.
>> We plan to introduce a generic framework for the management of the VDSO
>> data storage that can be used by all architectures and which works
>> together with the existing generic VDSO code.
>>
>> Before that is possible align the different architectures by
>> standardizing on the existing generic infrastructure and moving things
>> out of the VDSO data page which does not belong there.
>>
>> Patches	 1- 2:	csky
>> Patch	    3:	s390
>> Patches	 4- 5:	arm64
>> Patch	    6:	riscv
>> Patch	    7:	arm
>> Patch	    8:	LoongArch
>> Patch	    9:	MIPS
>> Patches 10-20:	x86
>> Patches 21-27:	powerpc
>> Patch      28: 	Renamings to avoid a name clash with the new code.
> 
> As this has been sitting for two weeks now without major comments, I'm
> planning to merge that through the tip tree tomorrow.

To avoid any future conflicts with powerpc tree, I suggest you merge 
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git 
topic/vdso into your tree before applying this series.

Christophe

