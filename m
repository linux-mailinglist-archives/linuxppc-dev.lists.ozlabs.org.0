Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C515400A3A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 09:12:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1m8K0bDJz2yp0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 17:12:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=sunnanyong@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1lPG3qxCz2xth
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Sep 2021 16:38:55 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H1lJ24SbKz8xB6;
 Sat,  4 Sep 2021 14:34:26 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 4 Sep 2021 14:38:43 +0800
Received: from [10.174.179.79] (10.174.179.79) by
 kwepemm600003.china.huawei.com (7.193.23.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sat, 4 Sep 2021 14:38:42 +0800
Subject: Re: [PATCH -next] powerpc/mm: check base flags in ioremap_prot
To: Christophe Leroy <christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <akpm@linux-foundation.org>,
 <npiggin@gmail.com>, <christophe.leroy@c-s.fr>
References: <20210903090339.3671524-1-sunnanyong@huawei.com>
 <90aa2b67-24c8-4a5f-d91a-b562054d5c5d@csgroup.eu>
From: Nanyong Sun <sunnanyong@huawei.com>
Message-ID: <e27f8786-7d43-4191-9b65-5a55a64cf158@huawei.com>
Date: Sat, 4 Sep 2021 14:38:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <90aa2b67-24c8-4a5f-d91a-b562054d5c5d@csgroup.eu>
Content-Type: multipart/alternative;
 boundary="------------F7F047D03684CB910C170F53"
X-Originating-IP: [10.174.179.79]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 04 Sep 2021 17:12:27 +1000
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
Cc: wangkefeng 00584194 <wangkefeng.wang@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--------------F7F047D03684CB910C170F53
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/9/3 17:16, Christophe Leroy wrote:
>
>
> Le 03/09/2021 à 11:03, Nanyong Sun a écrit :
>> Some drivers who call ioremap_prot without setting base flags like
>> ioremap_prot(addr, len, 0) may work well before
>> commit 56f3c1413f5c ("powerpc/mm: properly set PAGE_KERNEL flags in
>> ioremap()"), but now they will get a virtual address "successfully"
>> from ioremap_prot and badly fault on memory access later because that
>> patch also dropped the hack adding of base flags for ioremap_prot.
>>
>> So return NULL and throw a warning if the caller of ioremap_prot did
>> not set base flags properly. Why not just hack adding PAGE_KERNEL flags
>> in the ioremap_prot, because most scenarios can be covered by high level
>> functions like ioremap(), ioremap_coherent(), ioremap_cache()...
>> so it is better to keep max flexibility for this low level api.
>
> As far as I can see, there is no user of this fonction that sets flags 
> to 0 in the kernel tree.
>
> Did you find any ? If you did, I think it is better to fix the caller.
>
> Christophe
>
I see some vendor's drivers which are not on upstream has used 
ioremap_prot like

ioremap_prot(addr,len, _PAGE_NO_CACHE | _PAGE_GUARDED) or

ioremap_prot(addr,len, 0), and they worked well on old kernel versions 
before commit

56f3c1413f5c ("powerpc/mm: properly set PAGE_KERNEL flags in ioremap()").

Actually, in the commit( git show 56f3c1413f5c ), you can see that in old

kernel versions, the implementations of ioremap_xxx just set flags as 
_PAGE_xxx or 0,

Code examples of the commit:

In arch/powerpc/mm/pgtable_32.c

ioremap(phys_addr_t addr, unsigned long size)
  {
-       return __ioremap_caller(addr, size, _PAGE_NO_CACHE | _PAGE_GUARDED,
-                               __builtin_return_address(0));
+       unsigned long flags = pgprot_val(pgprot_noncached(PAGE_KERNEL));
+
+       return __ioremap_caller(addr, size, flags, 
__builtin_return_address(0));
  }

In arch/powerpc/mm/pgtable_64.c

void __iomem * ioremap(phys_addr_t addr, unsigned long size)
  {
-       unsigned long flags = pgprot_val(pgprot_noncached(__pgprot(0)));
+       unsigned long flags = pgprot_val(pgprot_noncached(PAGE_KERNEL));
         void *caller = __builtin_return_address(0);


They rely on the low level functions to add base flags.

So, these driver codes like 'ioremap_prot(addr,len, _PAGE_NO_CACHE) '

in old kernel version is**not very improper.

Ofcourse, when porting new kernel versions, they need to change because the

api implementation has changed, but it's difficult for driver developer 
to find out what

happend and how to change, because they still get a virtual address 
"successfully"

from ioremap_prot without base flags and then page fault on memory 
access later.

So, it is necessary to check and report base flags missing in 
ioremap_prot() timely.

Secondly, the commit 56f3c1413f5c ("powerpc/mm: properly set PAGE_KERNEL

flags in ioremap()") delete the hack adding of PAGE_KERNEL flags in low 
level

implementation and add flags properly for all ioremap_xx() APIs except 
ioreamp_prot,

for ioreamp_prot, it not only loss the hack adding, but also loss the 
basic flags check

which is necessary.

So we need add this basic check for this API.

Nanyong

>>
>> Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
>> ---
>>   arch/powerpc/mm/ioremap.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
>> index 57342154d2b0..b7eda0f0d04d 100644
>> --- a/arch/powerpc/mm/ioremap.c
>> +++ b/arch/powerpc/mm/ioremap.c
>> @@ -46,6 +46,10 @@ void __iomem *ioremap_prot(phys_addr_t addr, 
>> unsigned long size, unsigned long f
>>       pte_t pte = __pte(flags);
>>       void *caller = __builtin_return_address(0);
>>   +    /* The caller should set base page flags properly */
>> +    if (WARN_ON((flags & _PAGE_PRESENT) == 0))
>
> This probably doesn't work for some plateforms like book3s/64. You 
> should use helpers like pte_present().
>
> See the comment at 
> https://elixir.bootlin.com/linux/v5.14/source/arch/powerpc/include/asm/book3s/64/pgtable.h#L591
>
I'm afraid that pte_present() is not ok for book3s/64, because it also 
check _PAGE_PTE which will be set in the bottom

half of ioremap, so it would always return fail because the caller of 
ioremap_prot wouldn't set _PAGE_PTE. I think it's ok that

not check _PAGE_INVALID here because we intend to create a new valid PTE 
here.

And I think check _PAGE_PRESENT is ok  because in kernel version before 
commit 56f3c1413f5c , the function __ioremap_at()

and __ioremap_caller() used _PAGE_PRESENT to check base flags, book3s/64 
was also present by then.

Nanyong

>> +        return NULL;
>> +
>>       /* writeable implies dirty for kernel addresses */
>>       if (pte_write(pte))
>>           pte = pte_mkdirty(pte);
>>
> .

--------------F7F047D03684CB910C170F53
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/9/3 17:16, Christophe Leroy
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:90aa2b67-24c8-4a5f-d91a-b562054d5c5d@csgroup.eu">
      <br>
      <br>
      Le 03/09/2021 à 11:03, Nanyong Sun a écrit :
      <br>
      <blockquote type="cite">Some drivers who call ioremap_prot without
        setting base flags like
        <br>
        ioremap_prot(addr, len, 0) may work well before
        <br>
        commit 56f3c1413f5c ("powerpc/mm: properly set PAGE_KERNEL flags
        in
        <br>
        ioremap()"), but now they will get a virtual address
        "successfully"
        <br>
        from ioremap_prot and badly fault on memory access later because
        that
        <br>
        patch also dropped the hack adding of base flags for
        ioremap_prot.
        <br>
        <br>
        So return NULL and throw a warning if the caller of ioremap_prot
        did
        <br>
        not set base flags properly. Why not just hack adding
        PAGE_KERNEL flags
        <br>
        in the ioremap_prot, because most scenarios can be covered by
        high level
        <br>
        functions like ioremap(), ioremap_coherent(), ioremap_cache()...
        <br>
        so it is better to keep max flexibility for this low level api.
        <br>
      </blockquote>
      <br>
      As far as I can see, there is no user of this fonction that sets
      flags to 0 in the kernel tree.
      <br>
      <br>
      Did you find any ? If you did, I think it is better to fix the
      caller.
      <br>
      <br>
      Christophe
      <br>
      <br>
    </blockquote>
    <p>I see some vendor's drivers which are not on upstream has used
      ioremap_prot like <br>
    </p>
    <p>ioremap_prot(addr,len, _PAGE_NO_CACHE | _PAGE_GUARDED) or</p>
    <p>ioremap_prot(addr,len, 0), and they worked well on old kernel
      versions before commit</p>
    <p>56f3c1413f5c ("powerpc/mm: properly set PAGE_KERNEL flags in
      ioremap()").</p>
    <p>Actually, in the commit( git show 56f3c1413f5c ), you can see
      that in old</p>
    <p>kernel versions, the implementations of ioremap_xxx just set
      flags as _PAGE_xxx or 0,</p>
    <p>Code examples of the commit:</p>
    <p>In arch/powerpc/mm/pgtable_32.c<br>
    </p>
    <p>ioremap(phys_addr_t addr, unsigned long size)<br>
       {<br>
      -       return __ioremap_caller(addr, size, _PAGE_NO_CACHE |
      _PAGE_GUARDED,<br>
      -                               __builtin_return_address(0));<br>
      +       unsigned long flags =
      pgprot_val(pgprot_noncached(PAGE_KERNEL));<br>
      +<br>
      +       return __ioremap_caller(addr, size, flags,
      __builtin_return_address(0));<br>
       }</p>
    <p>In arch/powerpc/mm/pgtable_64.c</p>
    <p> void __iomem * ioremap(phys_addr_t addr, unsigned long size)<br>
       {<br>
      -       unsigned long flags =
      pgprot_val(pgprot_noncached(__pgprot(0)));<br>
      +       unsigned long flags =
      pgprot_val(pgprot_noncached(PAGE_KERNEL));<br>
              void *caller = __builtin_return_address(0);</p>
    <p><br>
    </p>
    <p>They rely on the low level functions to add base flags.<br>
    </p>
    <p>So, these driver codes like 'ioremap_prot(addr,len,
      _PAGE_NO_CACHE) '</p>
    <p>in old kernel version is<b> </b>not very improper. <br>
    </p>
    <p>Ofcourse, when porting new kernel versions, they need to change
      because the</p>
    <p>api implementation has changed, but it's difficult for driver
      developer to find out what</p>
    <p>happend and how to change, because they still get a virtual
      address "successfully" <br>
    </p>
    <p>from ioremap_prot without base flags and then page fault on
      memory access later.<br>
    </p>
    <p></p>
    So, it is necessary to check and report base flags missing in
    ioremap_prot() timely.
    <p>Secondly, the commit 56f3c1413f5c ("powerpc/mm: properly set
      PAGE_KERNEL</p>
    <p> flags in ioremap()") delete the hack adding of PAGE_KERNEL flags
      in low level</p>
    <p>implementation and add flags properly for all ioremap_xx() APIs
      except ioreamp_prot,</p>
    <p>for ioreamp_prot, it not only loss the hack adding, but also loss
      the basic flags check <br>
    </p>
    <p>which is necessary.</p>
    <p>So we need add this basic check for this API.</p>
    <p>Nanyong<br>
    </p>
    <blockquote type="cite"
      cite="mid:90aa2b67-24c8-4a5f-d91a-b562054d5c5d@csgroup.eu">
      <blockquote type="cite">
        <br>
        Signed-off-by: Nanyong Sun <a class="moz-txt-link-rfc2396E" href="mailto:sunnanyong@huawei.com">&lt;sunnanyong@huawei.com&gt;</a>
        <br>
        ---
        <br>
          arch/powerpc/mm/ioremap.c | 4 ++++
        <br>
          1 file changed, 4 insertions(+)
        <br>
        <br>
        diff --git a/arch/powerpc/mm/ioremap.c
        b/arch/powerpc/mm/ioremap.c
        <br>
        index 57342154d2b0..b7eda0f0d04d 100644
        <br>
        --- a/arch/powerpc/mm/ioremap.c
        <br>
        +++ b/arch/powerpc/mm/ioremap.c
        <br>
        @@ -46,6 +46,10 @@ void __iomem *ioremap_prot(phys_addr_t addr,
        unsigned long size, unsigned long f
        <br>
              pte_t pte = __pte(flags);
        <br>
              void *caller = __builtin_return_address(0);
        <br>
          +    /* The caller should set base page flags properly */
        <br>
        +    if (WARN_ON((flags &amp; _PAGE_PRESENT) == 0))
        <br>
      </blockquote>
      <br>
      This probably doesn't work for some plateforms like book3s/64. You
      should use helpers like pte_present().
      <br>
      <br>
      See the comment at
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v5.14/source/arch/powerpc/include/asm/book3s/64/pgtable.h#L591">https://elixir.bootlin.com/linux/v5.14/source/arch/powerpc/include/asm/book3s/64/pgtable.h#L591</a><br>
      <br>
    </blockquote>
    <p>I'm afraid that pte_present() is not ok for 
      book3s/64, because it also check _PAGE_PTE which will be set in
      the bottom <br>
    </p>
    <p>half of ioremap, so it would always return fail because the
      caller of ioremap_prot wouldn't set _PAGE_PTE. I think it's ok
      that <br>
    </p>
    <p>not check _PAGE_INVALID here because we intend to create a new
      valid PTE here.<br>
    </p>
    <p>And I think check _PAGE_PRESENT is ok  because in kernel version
      before commit 56f3c1413f5c , the function __ioremap_at()<br>
    </p>
    <p>and __ioremap_caller() used _PAGE_PRESENT to check base flags,
      book3s/64 was also present by then.</p>
    <p>Nanyong<br>
    </p>
    <blockquote type="cite"
      cite="mid:90aa2b67-24c8-4a5f-d91a-b562054d5c5d@csgroup.eu">
      <blockquote type="cite">+        return NULL;
        <br>
        +
        <br>
              /* writeable implies dirty for kernel addresses */
        <br>
              if (pte_write(pte))
        <br>
                  pte = pte_mkdirty(pte);
        <br>
        <br>
      </blockquote>
      .
      <br>
    </blockquote>
  </body>
</html>

--------------F7F047D03684CB910C170F53--
