Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193547F2DB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 11:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLfpV01G9z3bjC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 21:11:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CxvkMY23;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CxvkMY23; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLfnn67pxz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 21:10:35 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id gj24so9462548pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 02:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=LhcOzOtDO8pKm5olSdybERYUAZjiaaP0djecbAEsS/E=;
 b=CxvkMY23MoG9SsIn9LG4LfwR3m0aGwLZFuSce2pSEEFEGvfH1d5C/B7ZnHfIAHCVFz
 dDZLYxqBRRxLknCD98T8qo94eMR3yV669ywrHaWPvucGSje+YsV06vqvpalgl0XO2g9B
 uEahXxBVu1Wzh/H8csQLkVqRG+frNxifmoSZye2+hrvPzD/0DWxeCA1ElT8coft/9yUV
 ulj7pj5Xv5evJlqmyKT9cwAf4/5Fh4jaBUzoVvMryDEjSqEdBCBBozvj3431vH8529AM
 prxKuAliIBIYdniavtNDy0HsG7cUDbzFccjfAarytZOtgHVZHdFDkF2OJNsdLp7KBbsV
 I1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LhcOzOtDO8pKm5olSdybERYUAZjiaaP0djecbAEsS/E=;
 b=feMc6pRLRSuPDQHpkUMzYNUP4498GVf4Fkf1C+1o+Gi0kfARTQTFhXQoKbSxiS7+Ja
 SQOPPDZoK2AVqDpvMxiO0MbTIJLLVchtiZO4vsOlXttMkQkiL/td5Kwcgx6g40JTe3vN
 JK4r3jWAZ7O/CAgQL7Q08dqzqe2hrUdg4SEmaCb63dfUSlUI6YzHpTfWELiLl/qpfBnA
 OQ1jc6t7v0QA362E8qs2cBfVdCuqV00TPql811GiGlh64QHLSKim4zdnXBD1o0n/BKB5
 yLxRSosjrORSkOIXkVoqhQDWHZy3wlgLwQ+zcCecy0eNPwxlf7XCActGFAROL86y6Ph3
 IvrQ==
X-Gm-Message-State: AOAM533zj+foQZKrkE45xIgPial0fFQUKCuH4uXpTXthrAY7x/6odx5z
 olOkTcL2GzVWaz7sR6P9W+c=
X-Google-Smtp-Source: ABdhPJw9/CJXpyzJ8Au3DqUHi3UOos+BeEGxz/Uc+lcNC+qAtKz6xWjgLvyEBDbkJuRs1r63rqQYpA==
X-Received: by 2002:a17:903:234a:b0:148:a51b:d043 with SMTP id
 c10-20020a170903234a00b00148a51bd043mr9705488plh.105.1640427030760; 
 Sat, 25 Dec 2021 02:10:30 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id w76sm10870284pff.21.2021.12.25.02.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:10:30 -0800 (PST)
Date: Sat, 25 Dec 2021 20:10:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/5] powerpc/64: Add VIRTUAL_BUG_ON checks for __va and
 __pa addresses
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20190724084638.24982-1-npiggin@gmail.com>
 <20190724084638.24982-4-npiggin@gmail.com>
 <8926c850-a28b-0600-9116-1c794f80b532@csgroup.eu>
In-Reply-To: <8926c850-a28b-0600-9116-1c794f80b532@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1640426616.sx4j7ru11d.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of December 24, 2021 11:24 pm:
> Hi Nic,
>=20
> Le 24/07/2019 =C3=A0 10:46, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Ensure __va is given a physical address below PAGE_OFFSET, and __pa is
>> given a virtual address above PAGE_OFFSET.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/page.h | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/=
page.h
>> index 0d52f57fca04..c8bb14ff4713 100644
>> --- a/arch/powerpc/include/asm/page.h
>> +++ b/arch/powerpc/include/asm/page.h
>> @@ -215,9 +215,19 @@ static inline bool pfn_valid(unsigned long pfn)
>>   /*
>>    * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
>>    * with -mcmodel=3Dmedium, so we use & and | instead of - and + on 64-=
bit.
>> + * This also results in better code generation.
>>    */
>> -#define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET=
))
>> -#define __pa(x) ((unsigned long)(x) & 0x0fffffffffffffffUL)
>> +#define __va(x)								\
>> +({									\
>> +	VIRTUAL_BUG_ON((unsigned long)(x) >=3D PAGE_OFFSET);		\
>> +	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
>> +})
>> +
>> +#define __pa(x)								\
>> +({									\
>> +	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\
>=20
> With this, it is likely that virt_addr_valid() BUGs on a non valid addres=
s.
>=20
> I think the purpose of virt_addr_valid() is to check addresses=20
> seamlessly, see check_heap_object()

Looks like you're right. How did you catch that?

We could change virt_addr_valid() to make that test first. x86 and arm64
both do checking rather than relying on !pfn_valid for < PAGE_OFFSET
addresses.

Thanks,
Nick
