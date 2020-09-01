Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1812588FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 09:26:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgdsq0N49zDqQH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 17:26:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgdqp5tmCzDqM1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 17:24:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bgdqf4sSrz9v4j1;
 Tue,  1 Sep 2020 09:24:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Sue7XSqcYqIi; Tue,  1 Sep 2020 09:24:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bgdqf43vxz9v4hy;
 Tue,  1 Sep 2020 09:24:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 84BA98B75E;
 Tue,  1 Sep 2020 09:24:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fN6AmSliq6_W; Tue,  1 Sep 2020 09:24:31 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 203528B774;
 Tue,  1 Sep 2020 09:24:31 +0200 (CEST)
Subject: Re: [PATCH v11] Fixup for "powerpc/vdso: Provide
 __kernel_clock_gettime64() on vdso32"
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <7b3e35bdf93b93f3f1f0dcb4e1f373ce3b8a0035.1598938114.git.christophe.leroy@csgroup.eu>
 <20200901071908.GF29521@kitsune.suse.cz>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f0152154-1edb-a51e-b24e-443b072b8ea0@csgroup.eu>
Date: Tue, 1 Sep 2020 09:24:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901071908.GF29521@kitsune.suse.cz>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Le 01/09/2020 à 09:19, Michal Suchánek a écrit :
> Hello,
> 
> can you add Fixes: ?

That's a commit which is still in powerpc/next-test.
My intention was to provide something that Michael can squash/fixup into 
the culprit commit.

Christophe


> 
> Thanks
> 
> Michal
> 
> On Tue, Sep 01, 2020 at 05:28:57AM +0000, Christophe Leroy wrote:
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/vdso/gettimeofday.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
>> index 59a609a48b63..8da84722729b 100644
>> --- a/arch/powerpc/include/asm/vdso/gettimeofday.h
>> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
>> @@ -186,6 +186,8 @@ int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *res,
>>   #else
>>   int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
>>   			     const struct vdso_data *vd);
>> +int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
>> +			       const struct vdso_data *vd);
>>   int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
>>   			    const struct vdso_data *vd);
>>   #endif
>> -- 
>> 2.25.0
>>
