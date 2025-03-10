Return-Path: <linuxppc-dev+bounces-6853-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D654CA5979E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 15:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBK9f1NVcz3064;
	Tue, 11 Mar 2025 01:32:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741617158;
	cv=none; b=FHqe358R2JET8vUiYu0bXK0ci8TRSTkGUcdGuLBwwciTJbEjlR4TQ365C5C3WnfdbRvwhHhJHKKlD5QHkEyNEcLMHUBHQzmK4JKjifGDpvk95Fl1pNj76fve056lHyiBxY24vx2OoFAVj46dpwRRhFbH6xO9+cusdNF3bJy95EwtVsrb78IuV99TBsVn+aE3HLcq7cdHj5FXt+rnZkt0xw+QL+HM18KWwo9qQ16eUaLiGccVkm17m1ncSmGvZ2NNtDt+1hfe4AKbDFBtXlxzkFM2khBPAsOkwj/mgS2IPNjHD6janZB3mkxEwuOyOeO4kgCi7koIGpyaXD/Y4EtYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741617158; c=relaxed/relaxed;
	bh=M5EHfeR58iUCT85lfmCt4OlAJ+pC71abO03PZrejgSk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=Jrv3OlIqvWiY128cdNFzOCmap6tbHERmwnddbNI4uLUFiX4rJ+zVRx6G4a/H55sTbH2clBVFa23zg2cjxmjkNe8EZliA/wpENTv4QnTJWNju90j4Sl7wZ9WGnt+gSLYY03Xla6i0all04NGRFBlTzWbhgRhhxKe3ZH47Af7lBwRQTQelYjI0pwE5dLuT9tIdFNn3xywyt4XrLCjO2lDXHXfKs3Zn5fggNQyw2/x3oyiJBC5Aur+PkED1qg8l5CzL8iBNgEYUfj/HuL1FiKlcTxPrMTMXo/RaaOirIgjzLG4f3luhvACzSAJtBPNpAiU/TklPmW2OpISw3glrvvWSmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LdVkIk2f; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LdVkIk2f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBK9c6JcTz2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 01:32:35 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2feb867849fso6528281a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741617153; x=1742221953; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5EHfeR58iUCT85lfmCt4OlAJ+pC71abO03PZrejgSk=;
        b=LdVkIk2fI4BqI5ALaG0jxONgCSJpK5qzwyGC6tSNLP+1uJp4begmddFYuCSVHuzQw6
         MDbUgiTGa6aPS3FVO0KOVu+aJcaycSs58k7QSKwIrUMNwZZIOVKmnWOob4ErSM1dPF3m
         OkaT7TVlkdxNq64ZTSKQnj3Lf+EpmpDmy7ew8UnolQAFW+wsp3PZO5cJg5SiQH4c9J+D
         6SVUXmyQOhTAVlq/GLOYXs3fCCikx5pTHwbxPWkg53FNS93AVJZo/5JR2DXizjvL62MH
         uwdtEcXOBenBApDK8t/lywINa2/XA5bC9fnf+6igkJzi8xg8Y2IgBfVB6h/hWtN/GcUE
         g1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617153; x=1742221953;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5EHfeR58iUCT85lfmCt4OlAJ+pC71abO03PZrejgSk=;
        b=Tt1fFFXFvwWvZjvBlctqIFXWtNqo9Yyr4xb3iL+o/CEcjD8JamAVA5q36AkdGmhjq0
         EzrFYg1kF29DCjp6jmvRg98XEJFL5zHIC2K+0oWXat1o2EfzGcoUVJXxjeAoq4KN1vxJ
         aAuCynqyyhi7jSsqrI330yTJ4KbhGdnlnpEx75sWnOWFr42CO75t5O/p835T188/gIp2
         8SQHmD59CP5NuBOjmZj3CzPdG8q1SMZpiIqUoXrYYkCD031RIygHHRuX7Px+5fMYad9E
         fyxVWbGdqquNlEXTGHp/3U1kFqyONjofn5og+f94tn4gDMgYCKOEdr833Xp2pXWYVkYW
         V60g==
X-Forwarded-Encrypted: i=1; AJvYcCWLB/t1FZs+dbhDCucfbHQAaSTtC17pnjH/fjZiUc711DNzW++zngDLxf1+kBhfYIvsithdNKrLUiyhz1g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0tcrbPGJhiMdNzsDYCjEiD3qQM9PuGSlOzLzdf+95lpuaA7O7
	XjfuV1KK9spfz6ttuL4bs586aonMWnsvWpfHqy0yMmXjzPuPC0aN
X-Gm-Gg: ASbGncu5N5df7+DQVOBNffTd56DvfkdXmY9MR2gyXYoqAWgyi4n5dATgHG9Y+NDoPJN
	bf8kOfa5L/5Lh8GOzqbRRONCYClChdLUR8xhO8ICU/IoO4csgFHQPxzmW9Y//iA2HtqK/7MMsy7
	QX+pjqJWeXsTdRcX5sbwXlL/HssS2NCkimdaNs4t1FJBrNAAEUUOzPl9i7LuUSDZpuWceh00n54
	TCoE033IKFkJSFaYXXa+gNm/aH2hZSDfc19FZsyyO8kcsoo6lf9FLbYnkiqR1ZKTWAnayJG7esu
	E9+qHwNyyNPhAqzT5YQJvSr1kGP02DFUrMk=
X-Google-Smtp-Source: AGHT+IH4f9IHfsIEEZscpelwTwSJsSLVPeyfrluG+UnwRMODV88LsiDkTqQnD7xZryJnxEFuwbiVRA==
X-Received: by 2002:a17:90b:17c3:b0:2ff:4bac:6fba with SMTP id 98e67ed59e1d1-2ff7cf0b067mr21785757a91.24.1741617152904;
        Mon, 10 Mar 2025 07:32:32 -0700 (PDT)
Received: from dw-tp ([171.76.82.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff6933990csm8005318a91.10.2025.03.10.07.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:32:32 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Donet Tom <donettom@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v3 1/2] book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
In-Reply-To: <0a885183-0e83-458b-b2a7-94c7386fed99@csgroup.eu>
Date: Mon, 10 Mar 2025 19:49:06 +0530
Message-ID: <875xkh55ph.fsf@gmail.com>
References: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com> <0a885183-0e83-458b-b2a7-94c7386fed99@csgroup.eu>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 10/03/2025 à 13:44, Donet Tom a écrit :
>> From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
>> 
>> Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
>
> I don't understand your patch.
>
> As far as I can see, CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP is selected 
> when CONFIG_PPC_RADIX_MMU is selected, and radix_pgtable.o is built only 
> when CONFIG_PPC_RADIX_MMU is selected. So when radix_pgtable.o is built 
> CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP will always be selected.
>
> Can you clarify what the problem is ?
>

You are right CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP always gets enabled
by default for radix mmu. However, when we forcefully wanted to test the
!vmemmap_can_optimize() path in radix, we forcefully removed the support
of ARCH_WANT_OPTIMIZE_DAX_VMEMMAP from arch/powerpc/Kconfig (by making
the kernel change). That is when we were facing the compilation errors
due to duplicate definition of vmemmap_can_optimize(). 

The other one is defined in include/linux/mm.h under #ifdef
CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP and #else.

So it is only a good to have patch.

-ritesh

> Christophe
>
>> 
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/book3s64/radix_pgtable.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> index 311e2112d782..bd6916419472 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -976,7 +976,7 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
>>   	return 0;
>>   }
>>   
>> -
>> +#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
>>   bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
>>   {
>>   	if (radix_enabled())
>> @@ -984,6 +984,7 @@ bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
>>   
>>   	return false;
>>   }
>> +#endif
>>   
>>   int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>   				unsigned long addr, unsigned long next)

