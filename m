Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D334348ED4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 12:22:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5jPm35Bfz3brp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 22:22:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5jPQ543Yz2yyq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 22:22:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F5jPF3Rmmz9v07B;
 Thu, 25 Mar 2021 12:22:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 23Jg9s7auSVF; Thu, 25 Mar 2021 12:22:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F5jPF2Xh6z9v076;
 Thu, 25 Mar 2021 12:22:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 905718B850;
 Thu, 25 Mar 2021 12:22:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 17HwWPOOzqFZ; Thu, 25 Mar 2021 12:22:10 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95F028B84F;
 Thu, 25 Mar 2021 12:22:09 +0100 (CET)
Subject: Re: [PATCH v2 6/7] cmdline: Gives architectures opportunity to use
 generically defined boot cmdline manipulation
To: Will Deacon <will@kernel.org>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
 <2eb6fad3470256fff5c9f33cd876f344abb1628b.1614705851.git.christophe.leroy@csgroup.eu>
 <20210303175747.GD19713@willie-the-truck>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8db81511-3f28-4ef1-5e66-188cf7cafad1@csgroup.eu>
Date: Thu, 25 Mar 2021 12:18:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210303175747.GD19713@willie-the-truck>
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, danielwa@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/03/2021 à 18:57, Will Deacon a écrit :
> On Tue, Mar 02, 2021 at 05:25:22PM +0000, Christophe Leroy wrote:
>> Most architectures have similar boot command line manipulation
>> options. This patchs adds the definition in init/Kconfig, gated by
>> CONFIG_HAVE_CMDLINE that the architectures can select to use them.
>>
>> In order to use this, a few architectures will have to change their
>> CONFIG options:
>> - riscv has to replace CMDLINE_FALLBACK by CMDLINE_FROM_BOOTLOADER
>> - architectures using CONFIG_CMDLINE_OVERRIDE or
>> CONFIG_CMDLINE_OVERWRITE have to replace them by CONFIG_CMDLINE_FORCE.
>>
>> Architectures also have to define CONFIG_DEFAULT_CMDLINE.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   init/Kconfig | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 56 insertions(+)
>>
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 22946fe5ded9..a0f2ad9467df 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -117,6 +117,62 @@ config INIT_ENV_ARG_LIMIT
>>   	  Maximum of each of the number of arguments and environment
>>   	  variables passed to init from the kernel command line.
>>   
>> +config HAVE_CMDLINE
>> +	bool
>> +
>> +config CMDLINE_BOOL
>> +	bool "Default bootloader kernel arguments"
>> +	depends on HAVE_CMDLINE
>> +	help
>> +	  On some platforms, there is currently no way for the boot loader to
>> +	  pass arguments to the kernel. For these platforms, you can supply
>> +	  some command-line options at build time by entering them here.  In
>> +	  most cases you will need to specify the root device here.
> 
> Why is this needed as well as CMDLINE_FROM_BOOTLOADER? IIUC, the latter
> will use CONFIG_CMDLINE if it fails to get anything from the bootloader,
> which sounds like the same scenario.
> 
>> +config CMDLINE
>> +	string "Initial kernel command string"
> 
> s/Initial/Default
> 
> which is then consistent with the rest of the text here.
> 
>> +	depends on CMDLINE_BOOL
> 
> Ah, so this is a bit different and I don't think lines-up with the
> CMDLINE_BOOL help text.
> 
>> +	default DEFAULT_CMDLINE
>> +	help
>> +	  On some platforms, there is currently no way for the boot loader to
>> +	  pass arguments to the kernel. For these platforms, you can supply
>> +	  some command-line options at build time by entering them here.  In
>> +	  most cases you will need to specify the root device here.
> 
> (same stale text)
> 
>> +choice
>> +	prompt "Kernel command line type" if CMDLINE != ""
>> +	default CMDLINE_FROM_BOOTLOADER
>> +	help
>> +	  Selects the way you want to use the default kernel arguments.
> 
> How about:
> 
> "Determines how the default kernel arguments are combined with any
>   arguments passed by the bootloader"
> 
>> +config CMDLINE_FROM_BOOTLOADER
>> +	bool "Use bootloader kernel arguments if available"
>> +	help
>> +	  Uses the command-line options passed by the boot loader. If
>> +	  the boot loader doesn't provide any, the default kernel command
>> +	  string provided in CMDLINE will be used.
>> +
>> +config CMDLINE_EXTEND
> 
> Can we rename this to CMDLINE_APPEND, please? There is code in the tree
> which disagrees about what CMDLINE_EXTEND means, so that will need be
> to be updated to be consistent (e.g. the EFI stub parsing order). Having
> the generic option with a different name means we won't accidentally end
> up with the same inconsistent behaviours.

Argh, yes. Seems like the problem is even larger than that IIUC:

- For ARM it means to append the bootloader arguments to the CONFIG_CMDLINE
- For Powerpc it means to append the CONFIG_CMDLINE to the bootloader arguments
- For SH  it means to append the CONFIG_CMDLINE to the bootloader arguments
- For EFI it means to append the bootloader arguments to the CONFIG_CMDLINE
- For OF it means to append the CONFIG_CMDLINE to the bootloader arguments

So what happens on ARM for instance when it selects CONFIG_OF for instance ?
Or should we consider that EXTEND means APPEND or PREPEND, no matter which ?
Because EXTEND is for instance used for:

	config INITRAMFS_FORCE
		bool "Ignore the initramfs passed by the bootloader"
		depends on CMDLINE_EXTEND || CMDLINE_FORCE


Christophe
