Return-Path: <linuxppc-dev+bounces-7359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 387E3A73F0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 20:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNvQ73l2vz2yhW;
	Fri, 28 Mar 2025 06:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743105007;
	cv=none; b=EjHlusnxY0guENxSOG+sNJSlWsMK1Ojpo32HUzxUd+jwyK/3yuXPwegEeyDYEgOX9mWQQ2aTcXAqwlCmaPaI3Ezip+W7EdkyOZVxuIVXdC8OVQ9t76667r5rQFYbd/NHX12tWADjyOlOcnQpqpEMMtbHmkUOEivdbrbGc3Kp2HJmLwiOM9Jy7JS7G0fnHByQlfY+zU3km6BHOGWMlLjSS79l4fxQzodvXMeKuUTVe+XHfcjJMme1c2a3LFWreQ+kIPi//MCOnieLf/16to9XPIRzRNbmVctcCC0v48vO8uBl5gUltRlGdHPyUWEAVhLlRiEpQ1vsxjVTlgBQxIYb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743105007; c=relaxed/relaxed;
	bh=teY/IAl9/RDZ08ip2C2/xMfOMHxZKuunUStGQAsVbRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m2mUYLvxozTygaBb6yR0zu7mdpjBkMGtzRQaAPL7NC4vp1rEbmrbTpwkjXw7z7/a6vFh6+SCDyJRDIyq1PeYqfhhQ/9gioSSZZgvKv4gGsFc1ociQslGncMkJQ25/36p9PiIhwJpXvQ+MSFIif1Lrl5fkiOlq6DFGUmN0Ml9G39lTDvcrFz2EZC+Uw/VWNw/W0sEoTuq5oZ+1vkX9Df6pbRPQatoWXD7XOpNSSSAulJte4MbwR6q6NaAeX1Oh3O4xrR0TjVRVkQr3QdnlrKfJJg0ydY6Khcwe5RHKje5c+5QivypMvGhxvA5VoMdo6Ny3AMp9vgvkqEU5DV8u/RX0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 1799 seconds by postgrey-1.37 at boromir; Fri, 28 Mar 2025 06:50:05 AEDT
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNvQ542bgz2ySS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 06:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZNtCY6NVdz9v5M;
	Thu, 27 Mar 2025 19:55:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjaaxL0rvOli; Thu, 27 Mar 2025 19:55:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZNtCY5gJSz9tC6;
	Thu, 27 Mar 2025 19:55:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C18358B76E;
	Thu, 27 Mar 2025 19:55:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MK2dalRyhSYe; Thu, 27 Mar 2025 19:55:53 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 47F8A8B763;
	Thu, 27 Mar 2025 19:55:53 +0100 (CET)
Message-ID: <b37c7a1a-9ec8-417e-9d9d-adeffe409df8@csgroup.eu>
Date: Thu, 27 Mar 2025 19:55:53 +0100
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
Subject: Re: [main-line]Build warnings on PowerPC system
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
 <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
 <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
 <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
 <516febac-b2ba-48a0-83a4-ab259e972541@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <516febac-b2ba-48a0-83a4-ab259e972541@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/03/2025 à 17:24, Venkat Rao Bagalkote a écrit :
> 
> On 27/03/25 8:36 pm, Madhavan Srinivasan wrote:
>>
>> On 3/27/25 7:31 PM, Venkat Rao Bagalkote wrote:
>>> On 27/03/25 7:22 pm, Madhavan Srinivasan wrote:
>>>> On 3/27/25 12:33 AM, Venkat Rao Bagalkote wrote:
>>>>> Greetings!!!
>>>>>
>>>>> I see below build warnings while compiling mainline kernel on IBM 
>>>>> Power9 system.
>>>>>
>>>>> Repo Link: https://eur01.safelinks.protection.outlook.com/? 
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cd6121f3814a7497bc5e608dd6d4be6c8%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638786894952762400%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3el3Uw9JR2vxDzjOIvF%2BVnienBrwtOsA%2Ftg0kGBqziE%3D&reserved=0
>>>>>
>>>>> Head Commit: f6e0150b2003fb2b9265028a618aa1732b3edc8f
>>>>>
>>>>> Attached is the .config.
>>>>>
>>>>> Machine: IBM Power9
>>>>>
>>>>> gcc version 11.5.0
>>>> What is the ld version in your system.
>>> Please find the ld version below.
>>>
>>> GNU ld version 2.35.2-59.el9
>>
>> ah ok that explains. Kindly can you try with this patch and let us 
>> know whether
>> this fixes the warning in your setup
>>
>>
>> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
>> index 1db60fe13802..09ceb5a42d81 100755
>> --- a/arch/powerpc/boot/wrapper
>> +++ b/arch/powerpc/boot/wrapper
>> @@ -235,7 +235,7 @@ fi
>>   # suppress some warnings in recent ld versions
>>   nowarn="-z noexecstack"
>>   if ! ld_is_lld; then
>> -       if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
>> +       if [ "$LD_VERSION" -ge "$(echo 2.35 | ld_version)" ]; then
>>                  nowarn="$nowarn --no-warn-rwx-segments"
>>          fi
>>   fi
> Above change fixes the issue. No warnings observed. Thank you!!

Take care, this must be a special version of binutils.

With regular 2.36.1 I get following error:

$ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld --version
GNU ld (GNU Binutils) 2.36.1
Copyright (C) 2021 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) a later 
version.
This program has absolutely no warranty.

$ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld 
--no-warn-rwx-segments test.o
/opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: 
unrecognized option '--no-warn-rwx-segments'
/opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: use 
the --help option for usage information


