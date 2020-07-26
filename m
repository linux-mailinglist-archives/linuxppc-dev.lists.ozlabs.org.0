Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060122E1AA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 19:26:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BF8wz30y0zDqWT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 03:26:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=nqSV0vVk; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BF8tf4LhQzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 03:24:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ADfgOkZpL5WzehjuzLBluAXVAZXyuzvYtlTRuQw3g88=; b=nqSV0vVkeTRz1z26a1nTex27ZM
 zk8kaLqScsd3AX0M17pd8y0mntGmOxdZ2wnFUy2DdxgxI8SVOYLte3Gx/WtWkV+6edVDDMzSGeF4c
 x6XBgLuoAlcoIQUb11euDWULtZOghRUPsDNhKKV8rBwkoeo3+D7qjvDqcNjfM2fmiBOr1Tc4y5t1F
 bPDyBYEmzQORpa3RwsNDmcma9IdBIOtaP0IntVAo/KZEXdrnMVnadmpzpsPn0xoGDfTUDdoqJ+yLK
 ipxPcGAI84A0RXxJ6PiOEOcGVUGyZ11nb0QMJwDLJHu+p6Bvg4KPI2b1Fqnkqmc/AsrP6v0i42DsL
 q9lXDKYA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzkNR-0003eR-Ky; Sun, 26 Jul 2020 17:23:57 +0000
Subject: Re: [PATCH 0/9] powerpc: delete duplicated words
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20200726162902.Horde.TCqHYaODbkzEpM-rFzDd8A2@messagerie.si.c-s.fr>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b796e912-e945-3cb1-03f8-0f38009634a4@infradead.org>
Date: Sun, 26 Jul 2020 10:23:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200726162902.Horde.TCqHYaODbkzEpM-rFzDd8A2@messagerie.si.c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/26/20 7:29 AM, Christophe Leroy wrote:
> Randy Dunlap <rdunlap@infradead.org> a écrit :
> 
>> Drop duplicated words in arch/powerpc/ header files.
> 
> How did you detect them ? Do you have some script for tgat, or you just read all comments ?

Yes, it's a script that finds lots of false positives, so I have to check
each and every one of them for validity.

>> Cc: Michael Ellerman <mpe@ellerman.id.au>
> 
> You say you Cc Michael, but in fact you don't ... Allthough he is the powerpc maintainer

Thanks for noticing that.
[time passes]
I checked all of my emails for this patch series and they say that Mike was Cc:ed
on all of them.

I am adding his email address back to this one.
Mike, did you receive this patch series?


> Christophe
> 
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>>
>>  arch/powerpc/include/asm/book3s/64/mmu-hash.h |    2 +-
>>  arch/powerpc/include/asm/book3s/64/radix-4k.h |    2 +-
>>  arch/powerpc/include/asm/cputime.h            |    2 +-
>>  arch/powerpc/include/asm/epapr_hcalls.h       |    4 ++--
>>  arch/powerpc/include/asm/hw_breakpoint.h      |    2 +-
>>  arch/powerpc/include/asm/ppc_asm.h            |    2 +-
>>  arch/powerpc/include/asm/reg.h                |    2 +-
>>  arch/powerpc/include/asm/smu.h                |    2 +-
>>  arch/powerpc/platforms/powernv/pci.h          |    2 +-
>>  9 files changed, 10 insertions(+), 10 deletions(-)


thanks.
-- 
~Randy

