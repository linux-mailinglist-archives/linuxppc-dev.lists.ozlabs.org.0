Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC0411152
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 10:48:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCdVk1jlJz2yxP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 18:47:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCdVG1CFpz2yJV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 18:47:32 +1000 (AEST)
Received: from [192.168.0.3] (ip5f5aef72.dynamic.kabel-deutschland.de
 [95.90.239.114])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0FB6E61E5FE00;
 Mon, 20 Sep 2021 10:47:29 +0200 (CEST)
Subject: Re: [PATCH v2] lib/zlib_inflate/inffast: Check config in C to avoid
 unused function warning
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20210920074633.13089-1-pmenzel@molgen.mpg.de>
 <00f8d7d7-cb13-203e-5a37-aee34a3258ff@csgroup.eu>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <dcae41fe-b09b-eb0c-f518-f49e2ea36aa8@molgen.mpg.de>
Date: Mon, 20 Sep 2021 10:47:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <00f8d7d7-cb13-203e-5a37-aee34a3258ff@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: llvm@lists.linux.dev, Zhen Lei <thunder.leizhen@huawei.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Christophe,


Thank you for the review.

Am 20.09.21 um 10:36 schrieb Christophe Leroy:
> 
> 
> Le 20/09/2021 à 09:46, Paul Menzel a écrit :
>> Building Linux for ppc64le with Ubuntu clang version 12.0.0-3ubuntu1~21.04.1
>> shows the warning below.
>>
>>      arch/powerpc/boot/inffast.c:20:1: warning: unused function 'get_unaligned16' [-Wunused-function]
>>      get_unaligned16(const unsigned short *p)
>>      ^
>>      1 warning generated.
>>
>> Fix it, by moving the check from the preprocessor to C, so the compiler
>> sees the use.
>>
>> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> ---
>>   lib/zlib_inflate/inffast.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/zlib_inflate/inffast.c b/lib/zlib_inflate/inffast.c
>> index f19c4fbe1be7..fb87a3120f0f 100644
>> --- a/lib/zlib_inflate/inffast.c
>> +++ b/lib/zlib_inflate/inffast.c
>> @@ -254,11 +254,8 @@ void inflate_fast(z_streamp strm, unsigned start)
>>               sfrom = (unsigned short *)(from);
>>               loops = len >> 1;
>>               do
>> -#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>> -                *sout++ = *sfrom++;
>> -#else
>> -                *sout++ = get_unaligned16(sfrom++);
>> -#endif
>> +                *sout++ = 
>> IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) ?
>> +                *sfrom++ : get_unaligned16(sfrom++);
> 
> I think it would be more readable as
> 
> do {
>          if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
>                  *sout++ = *sfrom++;
>          else
>                  *sout++ = get_unaligned16(sfrom++);
> } while (--loops);

I prefer the ternary operator, as it’s less lines, and it’s clear, that 
only the variable assignment is affected by the condition. But as style 
is subjective, I sent v3.

>>               while (--loops);
>>               out = (unsigned char *)sout;
>>               from = (unsigned char *)sfrom;


Kind regards,

Paul
