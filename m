Return-Path: <linuxppc-dev+bounces-4212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2CA9F3BA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 21:52:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBsZZ3ylyz2yys;
	Tue, 17 Dec 2024 07:52:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734382342;
	cv=none; b=R6GnQOZFx3prqXp7Q6CsJTfFXxu0/RNxt0jCRp3Y1dvZfK2Dl95q6t57aUnNeizO/30HsJos4P5Xxe5f8Kn6yxL4cieBw6pcSsHdYo0oABjJVy06OcLFwn4ARQv6GX4rsQqNXwNZA/TcAkCmxg3rTO72ji0a3o4y2atftJRaHYsRfUfp/GfhR0r/quqBEQMVWNSS4yLPUuCcY5fGMYAmMEu6ipJxWgQQuZToufucgBOIc8sNPWpniUWqW84PB7zIS0DkOhz83qy4xWdC+QylpCrIGyC5oIZe4p3gc0Khf5tF/I0jUYUUxCY+pjwNYET/UZ7d5jnJuEFp6vh7pvAtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734382342; c=relaxed/relaxed;
	bh=NHXX1HED21oZ/II5DDDw3kwZ2tG99e6+82TJozh7WhA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=DiMmaNQ1IsQ/IPwZlrAGZ3ejmyrnmHKXOyzRRezgCMipXLEeDc2sUdSbNW6uLXn1bp0Zc0zWlkKhm1AJYx0WB4ElZFfZSOz9mb3GpGeMnxiQMVFCjTrWlWZNgeTeMMqqRlSXRZJAfQpLqnKU9pXq7AxUcsdk9M6B2QTu6y38Zt3ikNFYZs4uyzZrN0lW2JSCCGShmMWEFDlCqcjlRe/MKicJQyA3Y9SARCdl9bWQM2ABSj1jK9FKubMWZ48qSYpcmrnJIZLbBRgl2bVIdZxKus1HVKXdjbievLOvN8b9V5oGw4gkLbmuhuRBXogkvR7seHizGTkcUR0toyR+qRz35g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mv1KRkQK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mv1KRkQK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBsZY3PnMz2ynR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 07:52:19 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-728e729562fso3873561b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 12:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734382338; x=1734987138; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NHXX1HED21oZ/II5DDDw3kwZ2tG99e6+82TJozh7WhA=;
        b=mv1KRkQKbUd7TO8i4S7ZG4vxcRLKiV/JyUueEWx9HratrsLSsh0YucXuTveDD1yK1n
         8UUecvxXNzLyEWb92oSpNOm/xXAebgEFBFn/18oKq6eNpxoJB1Cjtgl8I3zBJqb5fhbZ
         Kh0Jnj/GwMPWUnrk2AD+y82JDNRo/u+GOtAh6YueFpgtZX0KGu7jYodc+s5k7kW6XNeg
         dHZlJDsPKoYpAKdMbgpEY6D08yCeTU9yDVTuqYl2hv/HGbFHP69QcDXFw+YDeuBcM5sL
         kUB8cXgTAm5aunfE7JDyn4xvvLtvPhqTdysSglimiSKTnB8BUtOOJa1vfVOfGfMahaaV
         qocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734382338; x=1734987138;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHXX1HED21oZ/II5DDDw3kwZ2tG99e6+82TJozh7WhA=;
        b=ab55FXuBUhxdQpzX+ZPP8oU3Qa2xNpqmCFlAQ/ki8dabFbWUsFkRnteMF9kGbNjuqD
         epC7AVERKHzcYqK/pLqlCVt1Wry8kazXqoHfgGtLgwMd6FqrmXAAGGIsLoJQMEJmQuf4
         XWoNFr/u09PjAhtXNPt2z2Izt7kTmBoDNcYgh3lnqRJs2VWYRgjh0IVK8FoGbePlkFrF
         EFPkU/fthMR/D4FaFUxaBSICqhXJKZkbVwO+/i8gPnxZ2NBV5mFs2ZSX5pfS8pYz0cri
         pnz04caA6wy2fMavNUDW0aj/BZ6zDNYMuMmYMedhdmC5Xt07TJcqyyKdY2H6vzDZmiuA
         WK7A==
X-Forwarded-Encrypted: i=1; AJvYcCUslrpxsThdMr7JcMVpifDDMafC6Fxj5DYd0Dq6z1U86YTS8XIeFpJVfil3vm8eqO8AsDVtu18e/Yuh1ZY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyyl7na71PbGMrEB+eYSj9TwyX4wRHqDBaZwXxyonknia+6p5bh
	QKDjPvjgnd27lQLJ7AEDcMJGpNJLSo1KfjiKu1oZfNiFlmYsoDfZ
X-Gm-Gg: ASbGncuv7W9SJPsBdH/0ze7bC+KhYTN4zzmyWNoZk6Y+ylhUu1trvp/tKNqCtYfXsgc
	+xhkKYPyL0z4cAr8/PHStk71BgZFROr4q7MKchGfgrzCuwG3e0EBtckTwi03Jn0VadtJZDvOuon
	daasNDI9QQRp13sNjodz4xTeR1oHQl3uuBoVaCLI8PfH22j41itN45RTM332/Vg+PHFKwjpwwU9
	r0ivfOcqPEtIUd4R2Wd8OB1KD87Dakaiv73a7VJ6zmCtDV9zQ==
X-Google-Smtp-Source: AGHT+IGDJHOBpCmwux69wMHy5+xOa1x/wWblk6RHFHYEMKRDJL+RSDF6CxhSHMHck/xRMD9t4qO4Mw==
X-Received: by 2002:a05:6a20:914c:b0:1e1:ab63:c5ed with SMTP id adf61e73a8af0-1e1dfd9101bmr17369163637.23.1734382336679;
        Mon, 16 Dec 2024 12:52:16 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918b7c7c1sm5198770b3a.112.2024.12.16.12.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 12:52:16 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/book3s64/hugetlb: Fix disabling hugetlb when fadump is active
In-Reply-To: <87h6734gp8.fsf@gmail.com>
Date: Tue, 17 Dec 2024 02:19:27 +0530
Message-ID: <87frmn4alk.fsf@gmail.com>
References: <20241202054310.928610-1-sourabhjain@linux.ibm.com> <87h6734gp8.fsf@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> Commit 8597538712eb ("powerpc/fadump: Do not use hugepages when fadump
>> is active") disabled hugetlb support when fadump is active by returning
>> early from hugetlbpage_init():arch/powerpc/mm/hugetlbpage.c and not
>> populating hpage_shift/HPAGE_SHIFT.
>>
>> Later, commit 2354ad252b66 ("powerpc/mm: Update default hugetlb size
>> early") moved the allocation of hpage_shift/HPAGE_SHIFT to early boot,
>> which inadvertently re-enabled hugetlb support when fadump is active.
>>
>> Fix this by implementing hugepages_supported() on powerpc. This ensures
>> that disabling hugetlb for the fadump kernel is independent of
>> hpage_shift/HPAGE_SHIFT.
>>
>
> Thanks for describing the history of the changes clearly.
>
>> Fixes: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")
>> CC: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> CC: Hari Bathini <hbathini@linux.ibm.com>
>> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> Note: Even with this fix included, it is possible to enable gigantic
>> pages in the fadump kernel. IIUC, gigantic pages were never disabled
>> for the fadump kernel.
>>
>> Currently, gigantic pages are allocated during early boot as long as
>> the respective hstate is supported by the architecture.
>>
>> I will introduce some changes in the generic hugetlb code to allow the
>> architecture to decide on supporting gigantic pages on the go. Bringing
>> gigantic page allocation under hugepages_supported() does work for
>> powerpc but I need verify the impact on other architectures.
>>
>> Regarding the Fixes tag: This patch fixes a bug inadvertently introduced
>> by the commit mentioned under Fixes tag in the commit message. Feel free
>> to remove the tag if it is unnecessary.
>>
>> ---
>>  arch/powerpc/include/asm/hugetlb.h | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
>> index 18a3028ac3b6..f294e57663b0 100644
>> --- a/arch/powerpc/include/asm/hugetlb.h
>> +++ b/arch/powerpc/include/asm/hugetlb.h
>> @@ -15,6 +15,15 @@
>>  
>>  extern bool hugetlb_disabled;
>>  
>> +static inline int hugepages_supported(void)

I guess we may as well make it's return type as bool.

>> +{
>> +	if (hugetlb_disabled)
>> +		return 0;
>> +
>> +	return HPAGE_SHIFT != 0;
>> +}
>> +#define hugepages_supported hugepages_supported
>> +

-ritesh

