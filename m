Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BDC1260CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 12:29:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dqQY6JfnzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 22:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dqLS1l8lzDqp5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 22:25:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="P0pIMkw4"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47dqLP6ntkz9sPn;
 Thu, 19 Dec 2019 22:25:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576754734;
 bh=Zx5Yd53JL3kH4J/q4/1yt1DPvG/CjFpohvESNKMplWE=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=P0pIMkw4ErNb1nuX21DZj5B+bxMWXCI5nmpMnd5T6pbiUuAxWRe3O7aYGiY6JIHWI
 6tKOYZBhSeKKirWC2ajlvKX8n1LklGqR3iEtRq/0czGjJPqibcwrb2HCaq/bJfHlQW
 joz438XnOFK6gVX3n/z5HJbu5x/xI6epfBhcV9zVSWTH6idQzG9F210BkUS6QdCYuI
 awM9SDsFVPT7frGLLHg40y4fFq+ze3zhybiXysOeieaka8bMOVc5xH7gaDcMVeatEI
 jH2+2xsu8mlfVjwjs/jy3HW60tJTnpLnEAELufqZjXp02xJHY8SFdXpJmz5rwaazsu
 wzDaeBRGKO6PQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Christophe Leroy <christophe.leroy@c-s.fr>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v4 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
In-Reply-To: <87bls4tzjn.fsf@dja-thinkpad.axtens.net>
References: <20191219003630.31288-1-dja@axtens.net>
 <20191219003630.31288-5-dja@axtens.net>
 <c4d37067-829f-cd7d-7e94-0ec2223cce71@c-s.fr>
 <87bls4tzjn.fsf@dja-thinkpad.axtens.net>
Date: Thu, 19 Dec 2019 22:25:32 +1100
Message-ID: <87fthgmuab.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> On 12/19/2019 12:36 AM, Daniel Axtens wrote:
>>> KASAN support on Book3S is a bit tricky to get right:
...
>>> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
>>> index 296e51c2f066..f18268cbdc33 100644
>>> --- a/arch/powerpc/include/asm/kasan.h
>>> +++ b/arch/powerpc/include/asm/kasan.h
>>> @@ -2,6 +2,9 @@
>>>   #ifndef __ASM_KASAN_H
>>>   #define __ASM_KASAN_H
>>>   
>>> +#include <asm/page.h>
>>> +#include <asm/pgtable.h>
>>
>> What do you need asm/pgtable.h for ?
>>
>> Build failure due to circular inclusion of asm/pgtable.h:
>
> I see there's a lot of ppc32 stuff, I clearly need to bite the bullet
> and get a ppc32 toolchain so I can squash these without chewing up any
> more of your time. I'll sort that out and send a new spin.

I think you run Ubuntu, in which case it should just be:

$ apt install gcc-powerpc-linux-gnu

cheers
