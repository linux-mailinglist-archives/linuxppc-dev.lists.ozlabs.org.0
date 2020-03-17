Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE88F187B76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 09:44:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hRYr03sVzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 19:44:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=pv8MzjDt; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hRXN0WSvzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 19:43:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hRXH56xJz9tyF8;
 Tue, 17 Mar 2020 09:43:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pv8MzjDt; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jJ7QbpjNsTiX; Tue, 17 Mar 2020 09:43:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hRXH435dz9tyF7;
 Tue, 17 Mar 2020 09:43:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584434607; bh=1bMuDk15/zuaGXBlkTCqaPwZYzG0RpwgAfWjBHT6CaM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pv8MzjDtC/3V1DSFohSmacKIE/GQE1Ng5gTPItAOnv2k8QI1GSinRQSPAQdUSBfjF
 C8HFBnMWvhtFw5Z/ODEpXgnSIenQwHj0gwJaIYl6GjIHYcyvlX/hUNYhtbeKBLCLw5
 sEHRv7DnuR90if+soeH1ODt0XhhP+unK3Ej1uqfc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 761A18B786;
 Tue, 17 Mar 2020 09:43:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sGIbwQtVgw9w; Tue, 17 Mar 2020 09:43:28 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D4CC58B782;
 Tue, 17 Mar 2020 09:43:26 +0100 (CET)
Subject: Re: [PATCH] mm/hugetlb: Fix build failure with HUGETLB_PAGE but not
 HUGEBTLBFS
To: Baoquan He <bhe@redhat.com>
References: <7e8c3a3c9a587b9cd8a2f146df32a421b961f3a2.1584432148.git.christophe.leroy@c-s.fr>
 <20200317082550.GA3375@MiWiFi-R3L-srv>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <60117fd7-46ff-326b-34f1-0c7087111ca7@c-s.fr>
Date: Tue, 17 Mar 2020 09:43:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317082550.GA3375@MiWiFi-R3L-srv>
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
Cc: Nick Piggin <npiggin@suse.de>, Andi Kleen <ak@suse.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Adam Litke <agl@us.ibm.com>,
 Nishanth Aravamudan <nacc@us.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/03/2020 à 09:25, Baoquan He a écrit :
> On 03/17/20 at 08:04am, Christophe Leroy wrote:
>> When CONFIG_HUGETLB_PAGE is set but not CONFIG_HUGETLBFS, the
>> following build failure is encoutered:
> 
>  From the definition of HUGETLB_PAGE, isn't it relying on HUGETLBFS?
> I could misunderstand the def_bool, please correct me if I am wrong.

AFAIU, it means that HUGETLBFS rely on HUGETLB_PAGE, by default 
HUGETLB_PAGE is not selected when HUGETLBFS is not. But it is still 
possible for an arch to select HUGETLB_PAGE without selecting HUGETLBFS 
when it uses huge pages for other purpose than hugetlb file system.

Christophe

> 
> config HUGETLB_PAGE
>          def_bool HUGETLBFS
> 
>>
>> In file included from arch/powerpc/mm/fault.c:33:0:
>> ./include/linux/hugetlb.h: In function 'hstate_inode':
>> ./include/linux/hugetlb.h:477:9: error: implicit declaration of function 'HUGETLBFS_SB' [-Werror=implicit-function-declaration]
>>    return HUGETLBFS_SB(i->i_sb)->hstate;
>>           ^
>> ./include/linux/hugetlb.h:477:30: error: invalid type argument of '->' (have 'int')
>>    return HUGETLBFS_SB(i->i_sb)->hstate;
>>                                ^
>>
>> Gate hstate_inode() with CONFIG_HUGETLBFS instead of CONFIG_HUGETLB_PAGE.
>>
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Link: https://patchwork.ozlabs.org/patch/1255548/#2386036
>> Fixes: a137e1cc6d6e ("hugetlbfs: per mount huge page sizes")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   include/linux/hugetlb.h | 19 ++++++++-----------
>>   1 file changed, 8 insertions(+), 11 deletions(-)
>>
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index 1e897e4168ac..dafb3d70ff81 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -390,7 +390,10 @@ static inline bool is_file_hugepages(struct file *file)
>>   	return is_file_shm_hugepages(file);
>>   }
>>   
>> -
>> +static inline struct hstate *hstate_inode(struct inode *i)
>> +{
>> +	return HUGETLBFS_SB(i->i_sb)->hstate;
>> +}
>>   #else /* !CONFIG_HUGETLBFS */
>>   
>>   #define is_file_hugepages(file)			false
>> @@ -402,6 +405,10 @@ hugetlb_file_setup(const char *name, size_t size, vm_flags_t acctflag,
>>   	return ERR_PTR(-ENOSYS);
>>   }
>>   
>> +static inline struct hstate *hstate_inode(struct inode *i)
>> +{
>> +	return NULL;
>> +}
>>   #endif /* !CONFIG_HUGETLBFS */
>>   
>>   #ifdef HAVE_ARCH_HUGETLB_UNMAPPED_AREA
>> @@ -472,11 +479,6 @@ extern unsigned int default_hstate_idx;
>>   
>>   #define default_hstate (hstates[default_hstate_idx])
>>   
>> -static inline struct hstate *hstate_inode(struct inode *i)
>> -{
>> -	return HUGETLBFS_SB(i->i_sb)->hstate;
>> -}
>> -
>>   static inline struct hstate *hstate_file(struct file *f)
>>   {
>>   	return hstate_inode(file_inode(f));
>> @@ -729,11 +731,6 @@ static inline struct hstate *hstate_vma(struct vm_area_struct *vma)
>>   	return NULL;
>>   }
>>   
>> -static inline struct hstate *hstate_inode(struct inode *i)
>> -{
>> -	return NULL;
>> -}
>> -
>>   static inline struct hstate *page_hstate(struct page *page)
>>   {
>>   	return NULL;
>> -- 
>> 2.25.0
>>
>>
