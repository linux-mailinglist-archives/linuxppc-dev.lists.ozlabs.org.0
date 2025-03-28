Return-Path: <linuxppc-dev+bounces-7370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97872A749B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 13:20:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPKNT6XSdz2yNG;
	Fri, 28 Mar 2025 23:20:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743164409;
	cv=none; b=UqCkXhyD44H9TmuJ6OelfRGQhNLTjO6uIC9bsVOTrD1iDYBPEis3XiSn5Y0Rvd3LLF5Yym+mtivB8fWoJyYBV/TLps/2GPEeixS5rRs3aaRWLzkrXKQUUZSgBMHDFuVVPVlJc8Kd3PJKpJ8ZL/g4Kg6eW/Ti2NH7THKlKloUT1F9nMO2NFSqXbW8GIOqQx6wypNq0nykLJwHyu4uML9s8dlVraOVxKTJI1bXomVfPceiBbO80GdovTiDjDbQ9ZjVJGKzHxZdCzpZc7WSHCQy7TM7s7Ovr4jhoPDOv3RnhS06KUqAJ8K5Dvb3BXVBV4cePFmT3PS2LmTJrqQgXpon9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743164409; c=relaxed/relaxed;
	bh=bGtpXL1dUtWy+TEazjTBdJdXx6NCaF93j6BaQDjC7F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=E/ZHIjwgHg2cdhkk9wg2g4pLKd9xQECFfVQQs/Zn7aFXc2mJlyTOo+xah5JUgD5nNROkoaVJcEjuzQxhxMm33/1586u+Fw9vPZmdn1l+GgRh+HtO2JoK4VPuPlebPGtguik835IqvG0Nx4H37Q0PJnNST1tJiv39/WdgFTDbblpfSCpT5yndCe/u9xfSc2L5t4qUDdfX4qSB6S2wQ99Gb4KJG8eYq6e1+fCwSmxHe93lQpmdGdAqd5E+jPAYyFY7DmsvJLF2hc1CqOVqRxnaLTLHHGI+t0M/SHTWyL7FHkJUzhPV5ayahXYkXrNOdlK9cPg90E8i/YNuFzN7tu7d1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPKNQ54sXz2yKs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 23:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZPJhQ0sv0z9vdk;
	Fri, 28 Mar 2025 12:48:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHeEn-jhQIqn; Fri, 28 Mar 2025 12:48:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZPJhP2w1Bz9tjl;
	Fri, 28 Mar 2025 12:48:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 827338B76E;
	Fri, 28 Mar 2025 12:48:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wUjXM0YDApDW; Fri, 28 Mar 2025 12:48:53 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C80F8B763;
	Fri, 28 Mar 2025 12:48:53 +0100 (CET)
Message-ID: <d021d85f-e00e-4795-878f-ee53a5fd886c@csgroup.eu>
Date: Fri, 28 Mar 2025 12:48:53 +0100
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
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
 <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
 <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
 <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
 <516febac-b2ba-48a0-83a4-ab259e972541@linux.ibm.com>
 <b37c7a1a-9ec8-417e-9d9d-adeffe409df8@csgroup.eu>
 <e18df940-bb30-44c9-9384-7325e8d02d25@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <e18df940-bb30-44c9-9384-7325e8d02d25@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 28/03/2025 à 12:14, Madhavan Srinivasan a écrit :
> 
>>>> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
>>>> index 1db60fe13802..09ceb5a42d81 100755
>>>> --- a/arch/powerpc/boot/wrapper
>>>> +++ b/arch/powerpc/boot/wrapper
>>>> @@ -235,7 +235,7 @@ fi
>>>>    # suppress some warnings in recent ld versions
>>>>    nowarn="-z noexecstack"
>>>>    if ! ld_is_lld; then
>>>> -       if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
>>>> +       if [ "$LD_VERSION" -ge "$(echo 2.35 | ld_version)" ]; then
>>>>                   nowarn="$nowarn --no-warn-rwx-segments"
>>>>           fi
>>>>    fi
>>> Above change fixes the issue. No warnings observed. Thank you!!
>>
>> Take care, this must be a special version of binutils.
>>
>> With regular 2.36.1 I get following error:
>>
>> $ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld --version
>> GNU ld (GNU Binutils) 2.36.1
>> Copyright (C) 2021 Free Software Foundation, Inc.
>> This program is free software; you may redistribute it under the terms of
>> the GNU General Public License version 3 or (at your option) a later version.
>> This program has absolutely no warranty.
>>
>> $ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld --no-warn-rwx-segments test.o
>> /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: unrecognized option '--no-warn-rwx-segments'
>> /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: use the --help option for usage information
>>
> 
> Nice catch. Thanks Christophe.
> 
> May be we need to handle this special/specific case with an
> additional check
> 
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 1db60fe13802..d3779c20e548 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -237,6 +237,8 @@ nowarn="-z noexecstack"
>   if ! ld_is_lld; then
>          if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
>                  nowarn="$nowarn --no-warn-rwx-segments"
> +        elif [ "$LD_VERSION" -eq "235020000" ]; then
> +                nowarn="$nowarn --no-warn-rwx-segments"
>          fi
>   fi
> 

I think it is not the official version of 2.35.2, it is a modified 
version from a distribution. It doesn't exist in the official 2.35.2:

$ git remote -v
origin	https://sourceware.org/git/binutils-gdb.git (fetch)
origin	https://sourceware.org/git/binutils-gdb.git (push)

$ git grep rwx-segments origin/binutils-2_35-branch
[empty]

What about doing something like commit 0d362be5b142 ("Makefile: link 
with -z noexecstack --no-warn-rwx-segments") ?

Christophe

