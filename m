Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6682B701AC5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 May 2023 01:09:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJhCS2BJSz3cKV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 May 2023 09:09:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dN+ICr/4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dN+ICr/4;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJhBd42jkz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 09:08:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TjHGaJUHIwmLNfBiBtZv+iP/AFRHxIyXSIV7GUOs+zI=; b=dN+ICr/4RxuEUk8/Phal1CmN0+
	/BgX/tHEsIlXbb1LbMRyUKHFqKbaUPG0P3ENvRTc8TCvx0pKEW9H4LTuy9YaJDxlXEFDjQGsxV0tC
	FJKCwGRqoHstc6bvPdbv1tn7Wdp+v1QAOC9Ji+D/autlh3LE6+sLl8ubl8Pis8DZ2F0br8KmvGZFz
	FVsSocPHokMAPPVJXMQ6gWk1c/mT0tOFT/xxG1BckwB6DQ8XzS+sABVIG/TCZCE22CouvdLsP4VMK
	n+lhatc+xJNgruDf0ipdkdlljNUgRsLq84hqt2a/hNzwaFaOpR+asWzd5jKDp5EJcvVNN+UIdgVJU
	4VR2UxaA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pxyLc-00G3JT-19;
	Sat, 13 May 2023 23:08:20 +0000
Message-ID: <f1e07fba-142e-2f27-6fed-c3c908deb2dd@infradead.org>
Date: Sat, 13 May 2023 16:08:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH] powerpc: udbg: export udbg_putc
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
References: <20230513055804.23775-1-rdunlap@infradead.org>
 <20230513091358.pzlexqnff5ydhlzf@pali>
 <af2ca59b-b5ba-a154-991f-536d9170cc05@infradead.org>
 <20230513230532.ojjf2xkmkx4v4zdo@pali>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230513230532.ojjf2xkmkx4v4zdo@pali>
Content-Type: text/plain; charset=UTF-8
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/13/23 16:05, Pali Rohár wrote:
> On Saturday 13 May 2023 15:53:19 Randy Dunlap wrote:
>> Hi Pali,
>>
>> On 5/13/23 02:13, Pali Rohár wrote:
>>> On Friday 12 May 2023 22:58:04 Randy Dunlap wrote:
>>>> In a randconfig with CONFIG_SERIAL_CPM=m and
>>>> CONFIG_PPC_EARLY_DEBUG_CPM=y, there is a build error:
>>>> ERROR: modpost: "udbg_putc" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!
>>>>
>>>> The build can be fixed by exporting "udbg_putc" in udbg.c.
>>>>
>>>> OTOH, maybe something like this is more appropriate in
>>>> arch/powerpc/Kconfig.debug?
>>>>
>>>> config PPC_EARLY_DEBUG_CPM
>>>> 	bool "Early serial debugging for Freescale CPM-based serial ports"
>>>> -	depends on SERIAL_CPM
>>>> +	depends on SERIAL_CPM=y
>>>>
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: Nicholas Piggin <npiggin@gmail.com>
>>>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> Cc: linuxppc-dev@lists.ozlabs.org
>>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>>> Cc: "Pali Rohár" <pali@kernel.org>
>>>> ---
>>>>  arch/powerpc/kernel/udbg.c |    1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff -- a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
>>>> --- a/arch/powerpc/kernel/udbg.c
>>>> +++ b/arch/powerpc/kernel/udbg.c
>>>> @@ -14,6 +14,7 @@
>>>>  #include <asm/udbg.h>
>>>>  
>>>>  void (*udbg_putc)(char c);
>>>> +EXPORT_SYMBOL(udbg_putc);
>>>>  void (*udbg_flush)(void);
>>>>  int (*udbg_getc)(void);
>>>>  int (*udbg_getc_poll)(void);
>>>
>>> Hello! I do not think that it is a good idea to export udbg functions
>>> for kernel modules. I have quickly looked at the cpm_uart driver file
>>
>> Sure, that was just a conversation starter.
>>
>>> drivers/tty/serial/cpm_uart/cpm_uart_core.c and it looks like that once
>>> udbg from it is registered then there is no code for unregistering it.
>>> So I have feeling that compiling cpm_uart driver as module should not be
>>> allowed when CONFIG_SERIAL_CPM_CONSOLE is enabled, and early debug
>>> should depend on CONFIG_CONSOLE_POLL || CONFIG_SERIAL_CPM_CONSOLE.
>>
>> The other change above also fixes the build error: (Option 2)
>>
>>>> config PPC_EARLY_DEBUG_CPM
>>>> 	bool "Early serial debugging for Freescale CPM-based serial ports"
>>>> -	depends on SERIAL_CPM
>>>> +	depends on SERIAL_CPM=y
>>
>>
>> Also, making SERIAL_CPM (cpm_uart driver) be restricted to not allow it
>> as a module when SERIAL_CPM_CONSOLE is enabled [how does one express that
>> in Kconfig language?] will cause a circular dependency since SERIAL_CPM_CONSOLE
>> depends on SERIAL_CPM=y. It looks like you are suggesting reversing the
>> dependencies.
> 
> I see that SERIAL_CPM_CONSOLE has already "depends on SERIAL_CPM=y".
> Am I right that this already disallow compiling cpm_uart driver as
> module when SERIAL_CPM_CONSOLE is enabled?

No, it just prevents SERIAL_CPM_CONSOLE from being set when
SERIAL_CPM=m.

>>> Any other opinion?
>>
>> Yes, please. Otherwise I prefer my option 2.
>>
>> -- 
>> ~Randy
> 
> Option 2 looks like a better solution.

Thanks.
-- 
~Randy
