Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 808CD352BD1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 17:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBkcZ3hkPz3dld
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 02:34:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBkcF3CwBz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 02:34:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkc810p9z9v2m9;
 Fri,  2 Apr 2021 17:34:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id E-R23ddmhdI0; Fri,  2 Apr 2021 17:34:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkc76Npnz9v2m8;
 Fri,  2 Apr 2021 17:33:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE3098BB77;
 Fri,  2 Apr 2021 17:34:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KbAlGNza6YEe; Fri,  2 Apr 2021 17:34:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C1048BB6F;
 Fri,  2 Apr 2021 17:34:00 +0200 (CEST)
Subject: Re: [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
To: "Tan, Ley Foon" <ley.foon.tan@intel.com>,
 "will@kernel.org" <will@kernel.org>, "danielwa@cisco.com"
 <danielwa@cisco.com>, "robh@kernel.org" <robh@kernel.org>,
 "daniel@gimpelevich.san-francisco.ca.us"
 <daniel@gimpelevich.san-francisco.ca.us>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <85b1dc6339351cbc46d179e8fdb9dfc398e58303.1616765870.git.christophe.leroy@csgroup.eu>
 <BY5PR11MB38934E74AF74D40379E46AB9CC7E9@BY5PR11MB3893.namprd11.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <18f89697-5612-6a1a-ab9d-8842c1b943db@csgroup.eu>
Date: Fri, 2 Apr 2021 17:33:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB38934E74AF74D40379E46AB9CC7E9@BY5PR11MB3893.namprd11.prod.outlook.com>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 microblaze <monstr@monstr.eu>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/03/2021 à 03:35, Tan, Ley Foon a écrit :
> 
> 
>> -----Original Message-----
>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Sent: Friday, March 26, 2021 9:45 PM
>> To: will@kernel.org; danielwa@cisco.com; robh@kernel.org;
>> daniel@gimpelevich.san-francisco.ca.us
>> Cc: linux-arch@vger.kernel.org; devicetree@vger.kernel.org; linuxppc-
>> dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; linuxppc-
>> dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org; microblaze
>> <monstr@monstr.eu>; linux-mips@vger.kernel.org; Tan, Ley Foon
>> <ley.foon.tan@intel.com>; openrisc@lists.librecores.org; linux-
>> hexagon@vger.kernel.org; linux-riscv@lists.infradead.org; x86@kernel.org;
>> linux-xtensa@linux-xtensa.org; linux-sh@vger.kernel.org;
>> sparclinux@vger.kernel.org
>> Subject: [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
>>
>> This converts the architecture to GENERIC_CMDLINE.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/nios2/Kconfig        | 24 +-----------------------
>>   arch/nios2/kernel/setup.c | 13 ++++---------
>>   2 files changed, 5 insertions(+), 32 deletions(-)
>>
>> diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig index
>> c24955c81c92..f66c97b15813 100644
>> --- a/arch/nios2/Kconfig
>> +++ b/arch/nios2/Kconfig
>> @@ -90,31 +90,9 @@ config NIOS2_ALIGNMENT_TRAP
>>
>>   comment "Boot options"
>>
>> -config CMDLINE_BOOL
>> -	bool "Default bootloader kernel arguments"
>> -	default y
>> -
>> -config CMDLINE
>> -	string "Default kernel command string"
>> -	default ""
>> -	depends on CMDLINE_BOOL
>> -	help
>> -	  On some platforms, there is currently no way for the boot loader to
>> -	  pass arguments to the kernel. For these platforms, you can supply
>> -	  some command-line options at build time by entering them here.  In
>> -	  other cases you can specify kernel args so that you don't have
>> -	  to set them up in board prom initialization routines.
>> -
>> -config CMDLINE_FORCE
>> -	bool "Force default kernel command string"
>> -	depends on CMDLINE_BOOL
>> -	help
>> -	  Set this to have arguments from the default kernel command string
>> -	  override those passed by the boot loader.
>> -
>>   config NIOS2_CMDLINE_IGNORE_DTB
>>   	bool "Ignore kernel command string from DTB"
>> -	depends on CMDLINE_BOOL
>> +	depends on CMDLINE != ""
>>   	depends on !CMDLINE_FORCE
>>   	default y
>>   	help
> 
> Missing " select GENERIC_CMDLINE" ?

Added in v4

Thanks
Christophe
