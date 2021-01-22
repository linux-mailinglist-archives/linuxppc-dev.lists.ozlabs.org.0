Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D68852FFC73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 07:13:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMTTK30PwzDqHY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 17:13:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMTRY5rTwzDqhm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 17:11:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=QPNdt7ovBYNhxHq39ggDMXhhyoXYMScMZEiARI31TjM=; b=z2C4K8hygWN2/0+W9n5SbxsWyc
 a5oSwKl3vasWP/GbetJhiYq63AaZHX0MZCmpd6RkVcb5WAEjWNoDsxhprqGTswUOXST/bukcV6LBA
 xGVTmd1dOn7hsqdy1CDzCXzOlxjrScuQ3fF3QTlz2cTIws2HnYceZnn+ukHWHbVdUV6fO7DEe+OU2
 tW7Oh2+o5rekEyyWHHdxCXZ3Cwfm671lReFgVsDljdZUxRAYeoEFL9rklsA5gD3/kddluqIvKAXZH
 CQtrfvl4HjPxoGaPaA8U/n4ybQ/xoqwHdM7If1apqaCLd1sNTlBCx26dI0CjdISsprxUZOVJCo3MR
 LVUB87Zg==;
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2pfN-00059h-UT; Fri, 22 Jan 2021 06:11:30 +0000
Subject: Re: [PATCH] powerpc/8xx: export 'cpm_setbrg' for modules
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org
References: <20210122010819.30986-1-rdunlap@infradead.org>
 <91159e78-4eea-c645-9171-a5b90271710f@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e8e78537-0775-95b2-3161-5b5e07e784fe@infradead.org>
Date: Thu, 21 Jan 2021 22:11:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <91159e78-4eea-c645-9171-a5b90271710f@csgroup.eu>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kernel test robot <lkp@intel.com>, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/21/21 9:51 PM, Christophe Leroy wrote:
> 
> 
> Le 22/01/2021 à 02:08, Randy Dunlap a écrit :
>> Fix missing export for a loadable module build:
>>
>> ERROR: modpost: "cpm_setbrg" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!
>>
>> Fixes: 4128a89ac80d ("powerpc/8xx: move CPM1 related files from sysdev/ to platforms/8xx")
> 
> I don't understand. Before that commit cpm_setbrg() wasn't exported either.
> 
> For me, it fixes the commit that brought the capability to build the cpm uart driver as a module, that is commit 1da177e4c3f4 ("Linux-2.6.12-rc")

OK, I didn't have a lot of confidence in that tag.

Thanks for commenting.

>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>> Cc: clang-built-linux@googlegroups.com
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> ---
>>   arch/powerpc/platforms/8xx/cpm1.c |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> --- linux-next-20210121.orig/arch/powerpc/platforms/8xx/cpm1.c
>> +++ linux-next-20210121/arch/powerpc/platforms/8xx/cpm1.c
>> @@ -280,6 +280,7 @@ cpm_setbrg(uint brg, uint rate)
>>           out_be32(bp, (((BRG_UART_CLK_DIV16 / rate) - 1) << 1) |
>>                     CPM_BRG_EN | CPM_BRG_DIV16);
>>   }
>> +EXPORT_SYMBOL(cpm_setbrg);
>>     struct cpm_ioport16 {
>>       __be16 dir, par, odr_sor, dat, intr;
>>


-- 
~Randy
RFC: Features and documentation: http://lwn.net/Articles/260136/
