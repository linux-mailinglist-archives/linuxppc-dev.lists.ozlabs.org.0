Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5F334AC0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:55:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6RQf5zWWz3c3Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 02:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6RQK3SM9z2xxj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 02:55:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6RQB6DtPz9v0Mx;
 Fri, 26 Mar 2021 16:55:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fRfLPhr5ARx4; Fri, 26 Mar 2021 16:55:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6RQB5JGZz9v0Mw;
 Fri, 26 Mar 2021 16:55:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 354458B8CF;
 Fri, 26 Mar 2021 16:55:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id o-ftwDSIO1we; Fri, 26 Mar 2021 16:55:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 249F98B8C7;
 Fri, 26 Mar 2021 16:55:31 +0100 (CET)
Subject: Re: [PATCH v3 01/17] cmdline: Add generic function to build command
 line.
To: Rob Herring <robh@kernel.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <58834b01-aad5-fa1e-554e-6417b2357202@csgroup.eu>
Date: Fri, 26 Mar 2021 16:55:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/03/2021 à 16:42, Rob Herring a écrit :
> On Fri, Mar 26, 2021 at 7:44 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> This code provides architectures with a way to build command line
>> based on what is built in the kernel and what is handed over by the
>> bootloader, based on selected compile-time options.
> 
> Note that I have this patch pending:
> 
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210316193820.3137-1-alex@ghiti.fr/
> 
> It's going to need to be adapted for this. I've held off applying to
> see if this gets settled.

good point.

Hope we can't have things like

	option="beautiful weather"

> 
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v3:
>> - Addressed comments from Will
>> - Added capability to have src == dst
>> ---
>>   include/linux/cmdline.h | 57 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 include/linux/cmdline.h
>>
>> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
>> new file mode 100644
>> index 000000000000..dea87edd41be
>> --- /dev/null
>> +++ b/include/linux/cmdline.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _LINUX_CMDLINE_H
>> +#define _LINUX_CMDLINE_H
>> +
>> +#include <linux/string.h>
>> +
>> +/* Allow architectures to override strlcat, powerpc can't use strings so early */
>> +#ifndef cmdline_strlcat
>> +#define cmdline_strlcat strlcat
>> +#endif
>> +
>> +/*
>> + * This function will append or prepend a builtin command line to the command
>> + * line provided by the bootloader. Kconfig options can be used to alter
>> + * the behavior of this builtin command line.
>> + * @dst: The destination of the final appended/prepended string.
>> + * @src: The starting string or NULL if there isn't one.
>> + * @len: the length of dest buffer.
>> + */
>> +static __always_inline void __cmdline_build(char *dst, const char *src, size_t len)
>> +{
>> +       if (!len || src == dst)
>> +               return;
>> +
>> +       if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !src) {
>> +               dst[0] = 0;
>> +               cmdline_strlcat(dst, CONFIG_CMDLINE, len);
>> +               return;
>> +       }
>> +
>> +       if (dst != src)
>> +               dst[0] = 0;
>> +
>> +       if (IS_ENABLED(CONFIG_CMDLINE_PREPEND))
>> +               cmdline_strlcat(dst, CONFIG_CMDLINE " ", len);
>> +
>> +       cmdline_strlcat(dst, src, len);
>> +
>> +       if (IS_ENABLED(CONFIG_CMDLINE_EXTEND))
> 
> Should be APPEND.

Not yet. For the time being all architectures use EXTEND only.

In patch 3 it is changed to:

-	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND))
+	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || IS_ENABLED(CONFIG_CMDLINE_APPEND))

Then in last patch, I forgot but I should have done:

-	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || IS_ENABLED(CONFIG_CMDLINE_APPEND))
+	if (IS_ENABLED(CONFIG_CMDLINE_APPEND))


> 
>> +               cmdline_strlcat(dst, " " CONFIG_CMDLINE, len);
>> +}
>> +
>> +#define cmdline_build(dst, src, len) do {                              \
> 
> Perhaps a comment why we need this to be a define.

Probably we don't need anymore as I finally decided to use COMMAND_LINE_SIZE instead of 'len' as the 
size of the temporary buffer.

> 
>> +       char *__c_dst = (dst);                                          \
>> +       const char *__c_src = (src);                                    \
>> +                                                                       \
>> +       if (__c_src == __c_dst) {                                       \
>> +               static char __c_tmp[COMMAND_LINE_SIZE] __initdata = ""; \
>> +                                                                       \
>> +               cmdline_strlcat(__c_tmp, __c_src, COMMAND_LINE_SIZE);   \
>> +               __cmdline_build(__c_dst, __c_tmp, (len));               \
>> +       } else {                                                        \
>> +               __cmdline_build(__c_dst, __c_src, (len));               \
>> +       }                                                               \
>> +} while (0)
>> +
>> +#endif /* _LINUX_CMDLINE_H */
>> --
>> 2.25.0
>>

Christophe
