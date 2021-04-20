Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F2C365CD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 18:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPpT02s3Zz30Bk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 02:06:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPpSf34DYz2xZn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 02:05:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FPpST5fYSz9tyMJ;
 Tue, 20 Apr 2021 18:05:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6qTfVqAOsH66; Tue, 20 Apr 2021 18:05:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FPpST4Shgz9tyMF;
 Tue, 20 Apr 2021 18:05:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B5AD8B807;
 Tue, 20 Apr 2021 18:05:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZiEcE-0Tlz-R; Tue, 20 Apr 2021 18:05:47 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0267E8B7ED;
 Tue, 20 Apr 2021 18:05:45 +0200 (CEST)
Subject: Re: [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
To: Daniel Walker <danielwa@cisco.com>, Rob Herring <robh@kernel.org>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
 <20210406173836.GW2469518@zorba>
 <20210408190408.GA1724284@robh.at.kernel.org>
 <20210409012349.GG3981976@zorba>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d92f99bf-20b7-a4b6-3d86-5b859e42cad8@csgroup.eu>
Date: Tue, 20 Apr 2021 18:05:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210409012349.GG3981976@zorba>
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
Cc: linux-arch@vger.kernel.org, arnd@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org, will@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/04/2021 à 03:23, Daniel Walker a écrit :
> On Thu, Apr 08, 2021 at 02:04:08PM -0500, Rob Herring wrote:
>> On Tue, Apr 06, 2021 at 10:38:36AM -0700, Daniel Walker wrote:
>>> On Fri, Apr 02, 2021 at 03:18:21PM +0000, Christophe Leroy wrote:
>>>> -config CMDLINE_BOOL
>>>> -	bool "Built-in kernel command line"
>>>> -	help
>>>> -	  For most systems, it is firmware or second stage bootloader that
>>>> -	  by default specifies the kernel command line options.  However,
>>>> -	  it might be necessary or advantageous to either override the
>>>> -	  default kernel command line or add a few extra options to it.
>>>> -	  For such cases, this option allows you to hardcode your own
>>>> -	  command line options directly into the kernel.  For that, you
>>>> -	  should choose 'Y' here, and fill in the extra boot arguments
>>>> -	  in CONFIG_CMDLINE.
>>>> -
>>>> -	  The built-in options will be concatenated to the default command
>>>> -	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
>>>> -	  command line will be ignored and replaced by the built-in string.
>>>> -
>>>> -	  Most MIPS systems will normally expect 'N' here and rely upon
>>>> -	  the command line from the firmware or the second-stage bootloader.
>>>> -
>>>
>>>
>>> See how you complained that I have CMDLINE_BOOL in my changed, and you think it
>>> shouldn't exist.
>>>
>>> Yet here mips has it, and you just deleted it with no feature parity in your
>>> changes for this.
>>
>> AFAICT, CMDLINE_BOOL equates to a non-empty or empty CONFIG_CMDLINE. You
>> seem to need it just because you have CMDLINE_PREPEND and
>> CMDLINE_APPEND. If that's not it, what feature is missing? CMDLINE_BOOL
>> is not a feature, but an implementation detail.
> 
> Not true.
> 
> It makes it easier to turn it all off inside the Kconfig , so it's for usability
> and multiple architecture have it even with just CMDLINE as I was commenting
> here.
> 

Among the 13 architectures having CONFIG_CMDLINE, todayb only 6 have a CONFIG_CMDLINE_BOOL in addition:

arch/arm/Kconfig:config CMDLINE
arch/arm64/Kconfig:config CMDLINE
arch/hexagon/Kconfig:config CMDLINE
arch/microblaze/Kconfig:config CMDLINE
arch/mips/Kconfig.debug:config CMDLINE
arch/nios2/Kconfig:config CMDLINE
arch/openrisc/Kconfig:config CMDLINE
arch/powerpc/Kconfig:config CMDLINE
arch/riscv/Kconfig:config CMDLINE
arch/sh/Kconfig:config CMDLINE
arch/sparc/Kconfig:config CMDLINE
arch/x86/Kconfig:config CMDLINE
arch/xtensa/Kconfig:config CMDLINE

arch/microblaze/Kconfig:config CMDLINE_BOOL
arch/mips/Kconfig.debug:config CMDLINE_BOOL
arch/nios2/Kconfig:config CMDLINE_BOOL
arch/sparc/Kconfig:config CMDLINE_BOOL
arch/x86/Kconfig:config CMDLINE_BOOL
arch/xtensa/Kconfig:config CMDLINE_BOOL


In the begining I hesitated about the CMDLINE_BOOL, at the end I decided to go the same way as what 
is done today in the kernel for initramfs with CONFIG_INITRAMFS_SOURCE.

The problem I see within adding CONFIG_CMDLINE_BOOL for every architecture which don't have it today 
is that when doing a "make oldconfig" on their custom configs, thousands of users will loose their 
CMDLINE without notice.

When we do the other way round, removing CONFIG_CMDLINE_BOOL on the 6 architectures that have it 
today will have no impact on existing config.

Also, in order to avoid tons of #ifdefs in the code as mandated by Kernel Codying Style §21, we have 
to have CONFIG_CMDLINE defined at all time, so at the end CONFIG_CMDLINE_BOOL is really redundant 
with an empty CONFIG_CMDLINE.

Unlike you, the approach I took for my series is to minimise the impact on existing implementation 
and existing configurations as much as possible.

I know you have a different approach where you break every existing config anyway.

https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation

Christophe
