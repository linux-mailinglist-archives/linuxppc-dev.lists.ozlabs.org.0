Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB3729224E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 07:52:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF5WJ14QFzDqd7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 16:52:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF5TZ0Zz8zDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 16:50:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CF5TC3zYTzB09ZK;
 Mon, 19 Oct 2020 07:50:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sYt0Xg4oCd0o; Mon, 19 Oct 2020 07:50:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CF5TC2z5GzB09ZJ;
 Mon, 19 Oct 2020 07:50:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DD4A8B78A;
 Mon, 19 Oct 2020 07:50:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 68d6s7Q7joVC; Mon, 19 Oct 2020 07:50:44 +0200 (CEST)
Received: from [10.25.210.27] (unknown [10.25.210.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CA6A8B75E;
 Mon, 19 Oct 2020 07:50:44 +0200 (CEST)
Subject: Re: [PATCH] asm-generic: Force inlining of get_order() to work around
 gcc10 poor decision
To: Joel Stanley <joel@jms.id.au>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <96c6172d619c51acc5c1c4884b80785c59af4102.1602949927.git.christophe.leroy@csgroup.eu>
 <CACPK8XfgK0Bj3sLjKCi80jS6vK34FN5BTkU8FvBGcMR=RQn4Xw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0bd0afae-f043-2811-944b-c94d90e231d2@csgroup.eu>
Date: Mon, 19 Oct 2020 07:50:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XfgK0Bj3sLjKCi80jS6vK34FN5BTkU8FvBGcMR=RQn4Xw@mail.gmail.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/10/2020 à 06:55, Joel Stanley a écrit :
> On Sat, 17 Oct 2020 at 15:55, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> When building mpc885_ads_defconfig with gcc 10.1,
>> the function get_order() appears 50 times in vmlinux:
>>
>> [linux]# ppc-linux-objdump -x vmlinux | grep get_order | wc -l
>> 50
>>
>> [linux]# size vmlinux
>>     text    data     bss     dec     hex filename
>> 3842620  675624  135160 4653404  47015c vmlinux
>>
>> In the old days, marking a function 'static inline' was forcing
>> GCC to inline, but since commit ac7c3e4ff401 ("compiler: enable
>> CONFIG_OPTIMIZE_INLINING forcibly") GCC may decide to not inline
>> a function.
>>
>> It looks like GCC 10 is taking poor decisions on this.
>>
>> get_order() compiles into the following tiny function,
>> occupying 20 bytes of text.
>>
>> 0000007c <get_order>:
>>    7c:   38 63 ff ff     addi    r3,r3,-1
>>    80:   54 63 a3 3e     rlwinm  r3,r3,20,12,31
>>    84:   7c 63 00 34     cntlzw  r3,r3
>>    88:   20 63 00 20     subfic  r3,r3,32
>>    8c:   4e 80 00 20     blr
>>
>> By forcing get_order() to be __always_inline, the size of text is
>> reduced by 1940 bytes, that is almost twice the space occupied by
>> 50 times get_order()
>>
>> [linux-powerpc]# size vmlinux
>>     text    data     bss     dec     hex filename
>> 3840680  675588  135176 4651444  46f9b4 vmlinux
> 
> I see similar results with GCC 10.2 building for arm32. There are 143
> instances of get_order with aspeed_g5_defconfig.
> 
> Before:
>   9071838 2630138  186468 11888444         b5673c vmlinux
> After:
>   9069886 2630126  186468 11886480         b55f90 vmlinux
> 
> 1952 bytes smaller with your patch applied. Did you raise this with
> anyone from GCC?

Yes I did, see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97445

For the time being, it's at a standstill.

Christophe

> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> 
> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   include/asm-generic/getorder.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/asm-generic/getorder.h b/include/asm-generic/getorder.h
>> index e9f20b813a69..f2979e3a96b6 100644
>> --- a/include/asm-generic/getorder.h
>> +++ b/include/asm-generic/getorder.h
>> @@ -26,7 +26,7 @@
>>    *
>>    * The result is undefined if the size is 0.
>>    */
>> -static inline __attribute_const__ int get_order(unsigned long size)
>> +static __always_inline __attribute_const__ int get_order(unsigned long size)
>>   {
>>          if (__builtin_constant_p(size)) {
>>                  if (!size)
>> --
>> 2.25.0
>>
