Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD941315A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 12:11:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDHK53d0Tz2yfm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 20:11:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDHJc17Lkz2xtf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 20:11:25 +1000 (AEST)
Received: from [192.168.178.35] (unknown [88.130.155.181])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 53A2761E64760;
 Tue, 21 Sep 2021 12:11:17 +0200 (CEST)
Subject: Re: [PATCH v3] lib/zlib_inflate/inffast: Check config in C to avoid
 unused function warning
To: Nathan Chancellor <nathan@kernel.org>
References: <20210920084332.5752-1-pmenzel@molgen.mpg.de>
 <YUishGbHeaDMJDj+@archlinux-ax161>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <d00bb831-211e-0c7b-2734-1ed7769af2ef@molgen.mpg.de>
Date: Tue, 21 Sep 2021 12:11:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUishGbHeaDMJDj+@archlinux-ax161>
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
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Linux folks,


Am 20.09.21 um 17:45 schrieb Nathan Chancellor:
> On Mon, Sep 20, 2021 at 10:43:33AM +0200, Paul Menzel wrote:
>> Building Linux for ppc64le with Ubuntu clang version 12.0.0-3ubuntu1~21.04.1
>> shows the warning below.
>>
>>      arch/powerpc/boot/inffast.c:20:1: warning: unused function 'get_unaligned16' [-Wunused-function]
>>      get_unaligned16(const unsigned short *p)
>>      ^
>>      1 warning generated.
>>
>> Fix it, by moving the check from the preprocessor to C, so the compiler
>> sees the use.
>>
>> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
>> ---
>> v2: Use IS_ENABLED
>> v3: Use if statement over ternary operator as requested by Christophe
>>
>>   lib/zlib_inflate/inffast.c | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/zlib_inflate/inffast.c b/lib/zlib_inflate/inffast.c
>> index f19c4fbe1be7..2843f9bb42ac 100644
>> --- a/lib/zlib_inflate/inffast.c
>> +++ b/lib/zlib_inflate/inffast.c
>> @@ -253,13 +253,12 @@ void inflate_fast(z_streamp strm, unsigned start)
>>   
>>   			sfrom = (unsigned short *)(from);
>>   			loops = len >> 1;
>> -			do
>> -#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>> -			    *sout++ = *sfrom++;
>> -#else
>> -			    *sout++ = get_unaligned16(sfrom++);
>> -#endif
>> -			while (--loops);
>> +			do {
>> +			    if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
>> +				*sout++ = *sfrom++;
>> +			    else
>> +				*sout++ = get_unaligned16(sfrom++);
>> +			} while (--loops);
>>   			out = (unsigned char *)sout;
>>   			from = (unsigned char *)sfrom;
>>   		    } else { /* dist == 1 or dist == 2 */
>> -- 
>> 2.33.0

Just for the record,

I compared both object files by running `objdump -d`, and the result is 
the same.

The binary differed (`vbindiff`), but I guess this is due to the 
increased revision (`make bindeb-pkg`).

without a change (Linus’ current master):

0000 0B50: 00 00 00 00 00 00 00 00  1F 01 00 00 36 00 00 00  ........ 
....6...
                                      ^
0000 0B60: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ 
........
0000 0B70: 00 00 00 00 00 00 00 00  29 01 00 00 32 00 00 00  ........ 
)...2...
                                      ^

v2 (ternary operator):

0000 0B50: 00 00 00 00 00 00 00 00  1C 01 00 00 36 00 00 00  ........ 
....6...
0000 0B60: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ 
........
0000 0B70: 00 00 00 00 00 00 00 00  26 01 00 00 32 00 00 00  ........ 
&...2...

v3 (if-else statement):

0000 0B50: 00 00 00 00 00 00 00 00  1E 01 00 00 36 00 00 00  ........ 
....6...
0000 0B60: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ 
........
0000 0B70: 00 00 00 00 00 00 00 00  28 01 00 00 32 00 00 00  ........ 
(...2...


Kind regards,

Paul
