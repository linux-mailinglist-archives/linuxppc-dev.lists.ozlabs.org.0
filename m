Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8413B435B82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 09:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZdzx6k4Fz3c9c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 18:15:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I6du7kbI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=I6du7kbI; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZdzL0wclz2xY4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 18:15:09 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id v8so5066274pfu.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=AVD1KHmDyy7/4o6xKJSM8n659qhIMewIJ9C6fqk44R0=;
 b=I6du7kbICf5L6Vmzm/i3q2IjO9kpz4PDhsFsgze7Kcwa2auu4gnNJxc2+RUsyX4JS/
 W0A8uBWASRN4iHqSGc0xLQqWpMgz3mljCfG0PQVbHP+X30x0Bl9gclKlOg31GQkTFc03
 RLoodN2HL8Dm7X7U8ZS7ms4KIskNWePtBVxXjTrFj0JswCdcp31nOl7112UQGs1R/kUX
 3ShU4rwHP7K9iRtFlJ8/bZzwWkveyWbRuLpB9uJZL8oO9P8+IdRbS7VrBpdWCz0tn7Oy
 lMVI5EPwX803PmUZuKsFpnCUVbdvjRcxLuzVbL/WvejxPbR/rjHf0k53xq1SlG4MmH3c
 6aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=AVD1KHmDyy7/4o6xKJSM8n659qhIMewIJ9C6fqk44R0=;
 b=m1eZfZL2z9Za8hsyhwL2JZ4BG8QRNX0FQTQqGpcI/eu2DkumqGEHuAgntZR9hoUJrB
 +Xa0JhV2Wzd4jQLZVuYkDNyZE58MJZ8ePVuMEV3dLKfBTn0q33tVhdkEFvwwUkXYygyV
 IdWH8SDr0NIm6ZS3hU2TW5xpQJDNDtKfTISBPNZmmXigthYnqQAUgj0imZdw9stY8mt7
 QlgjSmxWkC0JOGpsS05C9/4BUKVtNhiACjhtra6gUgBMR0TN4/wGza59zLQNaC7GS9Rr
 Ain+PDnpIh3nb2aicMW4xdHLOjB42JwInBK/uV4HyFWBCeraWHOuLisb9ksH3R44oHlf
 U+kQ==
X-Gm-Message-State: AOAM531lwHaST0nPdxZV1opNp9gEaFIi1PGhYUJRa2ZE5yQKdGUqaNZk
 jTTl73AEqWZzChT3pDIOD/o=
X-Google-Smtp-Source: ABdhPJweGdtswh10sxHVETH/zsRwJlEs9vfdJr/1Q8E2SmO2mI7M1dHXJNeDv1qvALOmRedHWDqJbQ==
X-Received: by 2002:a05:6a00:140c:b0:44b:e251:fe13 with SMTP id
 l12-20020a056a00140c00b0044be251fe13mr3754429pfu.10.1634800508056; 
 Thu, 21 Oct 2021 00:15:08 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 p12sm4643196pjl.37.2021.10.21.00.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 00:15:07 -0700 (PDT)
Date: Thu, 21 Oct 2021 17:15:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 12/16] powerpc/64e: remove mmu_linear_psize
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-13-npiggin@gmail.com>
 <dc126027-0ad2-e643-748c-2035b6fff8e7@csgroup.eu>
In-Reply-To: <dc126027-0ad2-e643-748c-2035b6fff8e7@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634800456.mes77a8r0r.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of October 21, 2021 3:03 pm:
>=20
>=20
> Le 21/10/2021 =C3=A0 05:54, Nicholas Piggin a =C3=A9crit=C2=A0:
>> mmu_linear_psize is only set at boot once on 64e, is not necessarily
>> the correct size of the linear map pages, and is never used anywhere
>> except memremap_compat_align.
>>=20
>> Remove mmu_linear_psize and hard code the 1GB value instead in
>> memremap_compat_align.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/mm/ioremap.c    | 6 +++++-
>>   arch/powerpc/mm/nohash/tlb.c | 9 ---------
>>   2 files changed, 5 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
>> index 57342154d2b0..730c3bbe4759 100644
>> --- a/arch/powerpc/mm/ioremap.c
>> +++ b/arch/powerpc/mm/ioremap.c
>> @@ -109,12 +109,16 @@ void __iomem *do_ioremap(phys_addr_t pa, phys_addr=
_t offset, unsigned long size,
>>   */
>>   unsigned long memremap_compat_align(void)
>>   {
>> +#ifdef CONFIG_PPC_BOOK3E_64
>=20
> I don't think this function really belongs to ioremap.c
>=20
> Could avoid the #ifdef by going in:
>=20
> arch/powerpc/mm/nohash/book3e_pgtable.c
>=20
> and
>=20
> arch/powerpc/mm/book3s64/pgtable.c

Yeah that might work.

Thanks,
Nick
