Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C1219C3E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 11:30:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2W9f5zr0zDqQH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 19:30:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::1042; helo=mail-pj1-x1042.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=iSHy1MDA; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2W2Z6tSVzDr0K
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 19:24:06 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id f16so851103pjt.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wP1C3MQ6c2y8K6+n0RoLcUu8VpzfAA5eezGlRHptUJ8=;
 b=iSHy1MDAr59s+SkR48IifZHZc0ySZTL45sCxFEZsRYcjr8rsEKubi5U76FUxL5EGDU
 84WzEjy+ItN9GcjrTH6X5uUFU+JXcg6DO/2me9T+Xecz1ulteZdVNl4kBF5xhwex9T0f
 a2js98AbT7WEj4f5jvcPNoU3R4513hYB9pxo7Mq0/ciH32dKKE9muF5bM9FTXnQ/0OzD
 5h8EIAeAAUZuwiyvMM3SDcrmmq1ApFQ8OWx5zIdVsgZ1xmZ5d1IeFM7Yk8J4t1ToWKHq
 xZnqUVKOSAiXnq7T26Bo8DHuLuxBrCpvvtNpDszr0CeOek7a2NeG2HRSrB+M24OiJk+N
 4IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=wP1C3MQ6c2y8K6+n0RoLcUu8VpzfAA5eezGlRHptUJ8=;
 b=QGDSyj/qt0tbZ8uXrovYAWZrENUmfuRhKY2QBivvW/5RoFoI/PHfjpEDKxPuDQn7OA
 VB2g1kIXRSeyM9MPI188pvQjc0iwLV3c4lKtaNx7mKCwnB1u5VF+sjKzA96uq5LTTBA6
 aISSBr9p3xa8LnI77Lq0/4Iy/lXyY/MSu4UvAGSZagp8/lzDdzDtFuAT3bYob4lAG5DD
 rJJ3aFECf6fvd3oO6+Hl85OlVcpOTh0cZ/c4IfMtu+MrAN6AvwDYxJZM3iw4Gk/eaXFE
 mtyuRv6lyECiUwLSUqRgBcvrKRvPYgpdHtY1Pkb7jTRqPXOtCVkNsCPwurPYPuIiQrFD
 UlNQ==
X-Gm-Message-State: AOAM533xl6HUJ1BZTdWHKweAH2XUGdK92q8x75EkumLe1oWvZakGMCzW
 1hpIlDf6yCA8Mw3q/qhPAgx/6Q==
X-Google-Smtp-Source: ABdhPJw6z/MB20ecGE4mkqeUK3JXSGt+Qr3blt7lIBHwszJie7t+8tnNEUUO3AYvWmYCkQLrqwSSsA==
X-Received: by 2002:a17:90a:7185:: with SMTP id
 i5mr14944964pjk.170.1594286642670; 
 Thu, 09 Jul 2020 02:24:02 -0700 (PDT)
Received: from localhost ([203.223.190.240])
 by smtp.gmail.com with ESMTPSA id c139sm2143495pfb.65.2020.07.09.02.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 02:24:02 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH RESEND 1/2] powerpc/mce: Add MCE notification chain
In-Reply-To: <f722e532-070e-1961-3bae-6f385caa5ead@csgroup.eu>
References: <20200709075635.643740-1-santosh@fossix.org>
 <f722e532-070e-1961-3bae-6f385caa5ead@csgroup.eu>
Date: Thu, 09 Jul 2020 14:54:00 +0530
Message-ID: <87h7uhqbwv.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 09/07/2020 =C3=A0 09:56, Santosh Sivaraj a =C3=A9crit=C2=A0:
>> Introduce notification chain which lets know about uncorrected memory
>> errors(UE). This would help prospective users in pmem or nvdimm subsystem
>> to track bad blocks for better handling of persistent memory allocations.
>>=20
>> Signed-off-by: Santosh S <santosh@fossix.org>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/mce.h |  2 ++
>>   arch/powerpc/kernel/mce.c      | 15 +++++++++++++++
>>   2 files changed, 17 insertions(+)
>>=20
>> Send the two patches together, so the dependencies are clear. The earlie=
r patch reviews are
>> here: https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganesh=
gr@linux.ibm.com/
>>=20
>> Rebase the patches on top on 5.8-rc4
>>=20
>> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/m=
ce.h
>> index 376a395daf329..a57b0772702a9 100644
>> --- a/arch/powerpc/include/asm/mce.h
>> +++ b/arch/powerpc/include/asm/mce.h
>> @@ -220,6 +220,8 @@ extern void machine_check_print_event_info(struct ma=
chine_check_event *evt,
>>   unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>>   extern void mce_common_process_ue(struct pt_regs *regs,
>>   				  struct mce_error_info *mce_err);
>> +extern int mce_register_notifier(struct notifier_block *nb);
>> +extern int mce_unregister_notifier(struct notifier_block *nb);
>
> Using the 'extern' keyword on function declaration is pointless and=20
> should be avoided in new patches. (checkpatch.pl --strict usually=20
> complains about it).

I will remove that in the v2 which I will be sending for your comments for
the other patch.

Thanks,
Santosh

>
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   void flush_and_reload_slb(void);
>>   #endif /* CONFIG_PPC_BOOK3S_64 */
>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>> index fd90c0eda2290..b7b3ed4e61937 100644
>> --- a/arch/powerpc/kernel/mce.c
>> +++ b/arch/powerpc/kernel/mce.c
>> @@ -49,6 +49,20 @@ static struct irq_work mce_ue_event_irq_work =3D {
>>=20=20=20
>>   DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
>>=20=20=20
>> +static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);
>> +
>> +int mce_register_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_register(&mce_notifier_list, nb);
>> +}
>> +EXPORT_SYMBOL_GPL(mce_register_notifier);
>> +
>> +int mce_unregister_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_unregister(&mce_notifier_list, nb);
>> +}
>> +EXPORT_SYMBOL_GPL(mce_unregister_notifier);
>> +
>>   static void mce_set_error_info(struct machine_check_event *mce,
>>   			       struct mce_error_info *mce_err)
>>   {
>> @@ -278,6 +292,7 @@ static void machine_process_ue_event(struct work_str=
uct *work)
>>   	while (__this_cpu_read(mce_ue_count) > 0) {
>>   		index =3D __this_cpu_read(mce_ue_count) - 1;
>>   		evt =3D this_cpu_ptr(&mce_ue_event_queue[index]);
>> +		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
>>   #ifdef CONFIG_MEMORY_FAILURE
>>   		/*
>>   		 * This should probably queued elsewhere, but
>>=20
>
> Christophe
