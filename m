Return-Path: <linuxppc-dev+bounces-11522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED1B3C7FF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 06:59:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDNGb30Kgz2yvv;
	Sat, 30 Aug 2025 14:59:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756529975;
	cv=none; b=JQe7fO9/rpYb7cNLdUFWyfjhV5BOaziUXlIWJsMaTHRWrQZqDZYDPD5ojAdxJVjJZgcu/3+3yCoQkeGujWiHZR75+MLPNvXCdI4F4N8cmzXLP8GiZH5ZEaYOYG2IlJe1lHibUfZPHw4e91JKZJMj1QNxhZEuSptpeBuewmhefXAfB0HkaUHsgaSjcwaYSBvnMwwA/oezU+HezymXVK7tLe9eyNAki2km4wGJTEfTOnTqi3sbHS4BgduRnnq5E211J2jl/gK5vbDYGKxYjclT7PmNVgsaCLeCJd2WZoFJ/gfUpotZjOOwNBMWsX7mdBvRFl75bxUXncBmaX9kR1Ztvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756529975; c=relaxed/relaxed;
	bh=ECUtRIXM/m3p0uCZ6iejxUu4ieJmp6wy4rmOCxQvy0I=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=E4RSY0qrgwINCCtl0ceUB0BOBgSMlKJZ73mTTMKPxzeaVNAuoV+z35Ml2vAn34rGg2P1ab6Nbdkkbn/QgAM07+P0qjwXTBlxeiUaH88QrWaiZHQ9ioA09RcE4DUAfZ8J53u2mM3rR+Llb3FOsyYaHEsMkolB1LQw27XL1wXz3qF4L41ON3tGkg9Syphy2H3mlRnzBu+Hg4h8wR8rs5kxhhWYPy4/wjFbeGnhphKFBsZ6CKe5Guqhkb0fV5+OZlrnUUfsB876w8EEfl+4pfJALf+kyADy5U2W2F/7Oaa14Jy5tc1dqw0SY6jl+e/fzCtX0NdSqb4uzIHlGPcTqFU/eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FxKjoP13; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FxKjoP13;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDNGZ2Myhz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 14:59:33 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-77201f3d389so3003871b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 21:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756529972; x=1757134772; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ECUtRIXM/m3p0uCZ6iejxUu4ieJmp6wy4rmOCxQvy0I=;
        b=FxKjoP13TM52iPiWTpJ0qpDT9pDGl/mnd6dWnwf15E+rUKVzSuRzAljIb0zRu8bUVA
         YKDQz+3/hoIf62xJIKg7Ei3Gxk4PTNZd7ZlPC0DcfHCs2NJX6sAWaMrxVSlU7gfEmKCH
         hROOjxyqdnAIZgIYSuRVl8qCnfczK/wenpwdtLFioGTEKp9KsXV2YlW38qPN694Vvvo8
         LMlyGzrzYjGGn/3ws8CecokZP3ii+C/Ypz5OnPqWwlt51lAzDgyMx+thqoNyjQ434KRa
         7doLZHliQ0BA7L9rtuCuwQybvN4FHC0vwvZd5ItZYcP2XGerqGvpgUUTlCNOqimMPO78
         Td0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756529972; x=1757134772;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECUtRIXM/m3p0uCZ6iejxUu4ieJmp6wy4rmOCxQvy0I=;
        b=iSMBhWbsfMcrN0qcM54uw66GC4kX3u5ng2EnmOVFyRMr7Z1yzd53+K2RdPJJqhdE5L
         AMDmhM/5Xa7rB7X+wTDv9TgaTHZxA4ADey55AUKddnagcsJZSFAn0GTkVPy2tzsDWYUp
         b4m/Yu2RrkXp9Otxx25G7Ia2nCxQJra+xC5GNY6tn07bmAzXrQBsew95kI6/aBrB4uuq
         vzHPFnOAnBxpeXl5PFsSyYOGvb5UfJ46wvGD5aulf1XYxdbhfj+hp4dA/jgg3B1nqGsD
         HG2fkcTM7uiwXZaN5wjIyreUVC4LN+Xe2WTU1VBujhbcrI6i9wvBpg3P4M27BG5sggqc
         +Dmg==
X-Gm-Message-State: AOJu0YwI3dTQep4+4YUrVM7Iugdhb436Ym7snGgnjG3D2icGIlaLtyll
	2AUhs3ZCHuE2H6VjF6NWT5opYVBN3RTSaBe+lZC1ZYMEf7LUH6xWocOd
X-Gm-Gg: ASbGncuuajp4rTQBt0QUTEnd3EyMR7nuPk+NzCMVETlKj0KxTUb/MSLQr1MsjDf2pqH
	F8fxEpvtpE8/oUhPEwHSFi5CeqCB7zqh0wuFZM2qQzjN/eIVtDzP9LWRYYFi9ehiIvsO5+3uTQi
	KSiyqZR1jmLBVN+wQIFtQuzDgU4jiG65ug0S7hNzWWv9ATPwoRAYF4TR4QoEhPlIcEVOYhoaznq
	AbIp1qhjwZxaEbtBti8qMor2m6ByWlrpCup6yPij7TLUv35bJ5kD5iyiIX2j0kbW8IJuSHAUtI9
	UMvGyaGtutLG2OlGn5a9OMW8QAe2pRd/uJEk9JjEI0sqFCmICQFMjQlaxjreDsUm9xYXh6e0+YZ
	9URZAx1tywARCGWc=
X-Google-Smtp-Source: AGHT+IFocOUBHixe2wv+gU96RrWRxGPvxKCNnqco4rS/r7Pe4pX8vYeeFZ0tFygY5WYh3POLg7pdfg==
X-Received: by 2002:a05:6a20:728b:b0:243:bfc4:463c with SMTP id adf61e73a8af0-243d6e5b012mr1543524637.25.1756529971878;
        Fri, 29 Aug 2025 21:59:31 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4de04a9ea7sm1557942a12.16.2025.08.29.21.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 21:59:31 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Donet Tom <donettom@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC 8/8] powerpc/book3s64/slb: Add slb faults to vmstat
In-Reply-To: <20250830144542.6ba0e774@canb.auug.org.au>
Date: Sat, 30 Aug 2025 10:26:45 +0530
Message-ID: <87y0r1jtki.fsf@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com> <e05ac86618d8a52feccf5bac99da44b11871382c.1756522067.git.ritesh.list@gmail.com> <20250830144542.6ba0e774@canb.auug.org.au>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Ritesh,
>
> On Sat, 30 Aug 2025 09:21:47 +0530 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com> wrote:
>>
>> diff --git a/mm/vmstat.c b/mm/vmstat.c
>> index 71cd1ceba191..8cd17a5fc72b 100644
>> --- a/mm/vmstat.c
>> +++ b/mm/vmstat.c
>> @@ -1464,6 +1464,11 @@ const char * const vmstat_text[] = {
>>  	[I(DIRECT_MAP_LEVEL2_COLLAPSE)]		= "direct_map_level2_collapses",
>>  	[I(DIRECT_MAP_LEVEL3_COLLAPSE)]		= "direct_map_level3_collapses",
>>  #endif
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +	"slb_kernel_faults",
>> +	"slb_user_faults",
>> +#endif
>> +
>>  #ifdef CONFIG_PER_VMA_LOCK_STATS
>>  	[I(VMA_LOCK_SUCCESS)]			= "vma_lock_success",
>>  	[I(VMA_LOCK_ABORT)]			= "vma_lock_abort",
>
> Should you be using explicit indexes and the I() macro?

Aah yes, I guess the branch where I developed the patches was not
upstream tip and when I rebased and tested, I missed to see the I()
macro change in mm/vmstat. 

Thanks Stephen for pointing it out. I will fix that in the next revision.

-ritesh

>
> -- 
> Cheers,
> Stephen Rothwell

