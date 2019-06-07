Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC043848D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 08:43:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KtJw18TpzDqvy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 16:43:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MnT9AIXy"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KtH72lGBzDqhk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 16:41:54 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c5so427256pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 23:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=3BLP3ekijkK+wrh0qdt9QXc+1tLAjWaM6aBRWK37yrs=;
 b=MnT9AIXyaw9X1gvjLukGW4GHb9WlEmhIVdIl4b7fXwHLQyyr4ROHH7SPo8bzGuNdOb
 SLN5y3szvqcuQK36TJGrcS2ojiL75xqv+QuSqVaMbxqnpD66loMmWVZaaupOTfmCP5Pv
 vrr3AEUG/DEzBSM2lrgitgu0aWQ/HiRy3KCmLSfIk7wRozHwd31ad3SggN7Q/Jnm8xru
 RbDHn2qfQ+cks4n56g4pkf8Kpq9LWw7AT6GJCeRxhVegqFYTmwRSdprDvpzBKZF8LgZr
 Z/0G25OGkhI7mjZLN7Ky+ujIzlsNzP1GX90/zJlVMliyOM3a7lMposHMU5d9eigGDTYY
 +g/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=3BLP3ekijkK+wrh0qdt9QXc+1tLAjWaM6aBRWK37yrs=;
 b=YRoYmIPjNA7NnKgPrkPAisGbGcO5Xfam2HrlqPVMVqzXUPlFQ7Snohc0XnmDa1kBvE
 G0aAJmCiZWjJH5eNI5pXP1GnBzuukJy6fRzvCQ3BBZjky1LvayQ0SdTSkXObdMNavqkS
 nRAasvYKPvDCUCW5p/R9cA0yTxFd3lnuYnb6eMtfkXMSgoAIwcA4vUfn8z34MW+vKg82
 wf/doXcUffSK4l7YGX7BP+/xpz9Z/0Rx0CFyqw9yY4Gmmy0wtF1QNqGehF9gfNgMMCeT
 rM1NsWtjDs5YTJ/Zqry3l3AfoL2IQn3/LaYdhxpTG68X19B8BBtbECqMh4nVJgNaH1zU
 Yx+g==
X-Gm-Message-State: APjAAAX05+xTxVstAZzjcdYcp1/1ACRRJgWVLhsF/k10UTtEULlSdDcy
 T8JLtT26AOtlNhh0dIraLvQUed/rE5k=
X-Google-Smtp-Source: APXvYqzCP5KMMW6rOei+NKFsRi+/+3IRXXwvLE0VLnLnoIKhViju5oLu+0BIHUDYnr1+aLKznfuBaA==
X-Received: by 2002:a17:902:e2:: with SMTP id
 a89mr54611497pla.210.1559889712489; 
 Thu, 06 Jun 2019 23:41:52 -0700 (PDT)
Received: from localhost ([202.125.30.143])
 by smtp.gmail.com with ESMTPSA id j2sm1978021pfb.157.2019.06.06.23.41.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 23:41:51 -0700 (PDT)
Date: Fri, 07 Jun 2019 16:40:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix THP PMD collapse serialisation
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190607035636.5446-1-npiggin@gmail.com>
 <696d26a4-90e2-cb16-975f-d00cf6a01b67@c-s.fr>
In-Reply-To: <696d26a4-90e2-cb16-975f-d00cf6a01b67@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1559889211.i6ap0cklqg.astroid@bobo.none>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on June 7, 2019 3:34 pm:
>=20
>=20
> Le 07/06/2019 =C3=A0 05:56, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Commit 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion
>> in pte helpers") changed the actual bitwise tests in pte_access_permitte=
d
>> by using pte_write() and pte_present() helpers rather than raw bitwise
>> testing _PAGE_WRITE and _PAGE_PRESENT bits.
>>=20
>> The pte_present change now returns true for ptes which are !_PAGE_PRESEN=
T
>> and _PAGE_INVALID, which is the combination used by pmdp_invalidate to
>> synchronize access from lock-free lookups. pte_access_permitted is used =
by
>> pmd_access_permitted, so allowing GUP lock free access to proceed with
>> such PTEs breaks this synchronisation.
>>=20
>> This bug has been observed on HPT host, with random crashes and corrupti=
on
>> in guests, usually together with bad PMD messages in the host.
>>=20
>> Fix this by adding an explicit check in pmd_access_permitted, and
>> documenting the condition explicitly.
>>=20
>> The pte_write() change should be okay, and would prevent GUP from fallin=
g
>> back to the slow path when encountering savedwrite ptes, which matches
>> what x86 (that does not implement savedwrite) does.
>>=20
>> Fixes: 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion=
 in pte helpers")
>> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>=20
>> I accounted for Aneesh's and Christophe's feedback, except I couldn't
>> find a good way to replace the ifdef with IS_ENABLED because of
>> _PAGE_INVALID etc., but at least cleaned that up a bit nicer.
>=20
> I guess the standard way is to add a pmd_is_serializing() which return=20
> always false in book3s/32/pgtable.h and in nohash/pgtable.h


>=20
>>=20
>> Patch 1 solves a problem I can hit quite reliably running HPT/HPT KVM.
>> Patch 2 was noticed by Aneesh when inspecting code for similar bugs.
>> They should probably both be merged in stable kernels after upstream.
>>=20
>>   arch/powerpc/include/asm/book3s/64/pgtable.h | 30 ++++++++++++++++++++
>>   arch/powerpc/mm/book3s64/pgtable.c           |  3 ++
>>   2 files changed, 33 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc=
/include/asm/book3s/64/pgtable.h
>> index 7dede2e34b70..ccf00a8b98c6 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -876,6 +876,23 @@ static inline int pmd_present(pmd_t pmd)
>>   	return false;
>>   }
>>  =20
>> +static inline int pmd_is_serializing(pmd_t pmd)
>=20
> should be static inline bool instead of int ?

I think just about all the p?d_blah boolean functions in the tree are
int at the moment, so I followed that pattern.

May be a good tree wide change to make at some point.

Thanks,
Nick


=
