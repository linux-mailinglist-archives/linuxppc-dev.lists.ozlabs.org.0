Return-Path: <linuxppc-dev+bounces-4514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61579FE294
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 06:01:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM3qM2QGcz2yjV;
	Mon, 30 Dec 2024 16:01:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735534911;
	cv=none; b=Ry5kv6FgVMdonB+iXbwRL1QSSvm2VBMm+z0jko0TE7xtTObkE3m/FQ32RSL4yFfnMcpPKkFRgUIOR+lWLglvnT2fP5PXeyuxI4YQ6KI9j8S4th5VgbDWeM4RR/rR9zgHCEU4NMELILpJDM/la3g1JvfADJYXRuJQxbCzMtkZauPmkjmBrnmXH3JvjTiITrOe3BGHrCNkmp9yoIUGVth3D8vZOV60Q7/FjrZA0kU1s7WWphcDebNtFNEzSoR34FN/yjqxEdz+7qlZWV/lbQDo9WtDEBcl2gsGwtUe0P1dTN2dh9B63mcNenN947SZzptKGiXfa8nn3Gn92lEkmj3liQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735534911; c=relaxed/relaxed;
	bh=z71RF7AQSzzvF96cC/aV2tD8Znb4DG916rBbscUdZ1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uxysx2LOh4BeujGbxku6xwpxJ0+uYlmdIYxbf5ZVNTN5o0ulvVUnvIDCQw5wTIJQjHSLA1Y3pF0KznwD+a8UGakZogUpRUekVrBQWw/bHhZhRCAfluteOxC6BtqSzgB6Eme1QJ2DVBMe4invaSSi6pa1rIbzW1+xVa+zUZ/WA8B7xaRBZDzsE1BPx03gN17AqOdT9QE5w0b3AM9W/ZlEm7rc9DSC0l8bAJrWS9q09Y6pSMCYz3PldrJ0TfIbVokpGui4A//QZj5NjKjHy5oNfFyGLyyZCPbQ6R3E6kn/KiHZwPv/L/b5jDTLhh42su8iCcTIap7cYbQlzxf3Ft/30A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HmmAbT4C; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HmmAbT4C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM3qK35SLz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 16:01:47 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21636268e43so14422225ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2024 21:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735534904; x=1736139704; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z71RF7AQSzzvF96cC/aV2tD8Znb4DG916rBbscUdZ1I=;
        b=HmmAbT4CGEZRtz29XUMZk6HPKnGPuF3aPbEcFOo8DFinSUa6ibzeu51c5vJJqak2/u
         DDgPjaCaz8TfC4K74iWjZQ+Z2Cma++6y9L5tXu6P72F0yDQwBY51umYDQJdGVBgK6qd/
         Hauu7aQm4+p9n5Dpb9fb4QcbqObbQkex2PNFj9kNjPl6OeETiSznrTPEcgHSFFqA7hQ2
         g5qPzYeS+m0Wzkn2TZFzXJ6syOf9BEHcVBT9jj2l1wH34VpIyyi88ZKbSV31ajLrdH7v
         mWVzVcsGXRxFmUeYl7WKKWprBJ4z76bjV/mh4Xc5QlR9ns+X0Yu8W1fFXZQNpNGkmstf
         e0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735534904; x=1736139704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z71RF7AQSzzvF96cC/aV2tD8Znb4DG916rBbscUdZ1I=;
        b=TsBeVWccscyLLYBPNfNVVAJ2r4XglE+gtw0erAUsG06mAp7s/lZJctjau51Xyrsh3L
         xBXioyX838ChjSW76nZh502W2Z7k4K/XPhsBzjx/jK699sUh4DAt32qkh9vJP/XGkpz2
         UZu5on3mvDXgjHegzU0xRGQzu+GJzEtb5LqoGFNGJLIgpo/v8U8vuY3K1m0wmYiM9oDR
         gAk6Sg/Dc6v4RYGGq4qQIiEnOfF30UpPwie3+kdgBUTTeSWhzkw529QIXbK618NZ/464
         igARmoF/EGt5SpQsytVNSqs7wcUOmQT0/Uzu2OFDSsNhWGgBub83sdZJ/2nNl+M3nqJa
         homw==
X-Forwarded-Encrypted: i=1; AJvYcCVq0/7Oy0M7u7rok7Cq/p3MfShUqIeOLI9Q1zwekTuollzkTYKWgzSe2UC5de2FkPKCC2yhV0JkZPqMTAQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGMgy5x8XB6PuL5u1BSj5qwFvKDzcOvxFs8qZCi5eFL7Ess7Ve
	uQbP8K3gwQy9W8MMA3kEyFO0nMD4A4z7AuoonaUL9DotpK/b0yDUq0hwenujzJQ=
X-Gm-Gg: ASbGncsV+mv3MiveQBN5V8Sp/08cAzIfZ8674eGYaCn6vSkkAB2H7Ku6OiWdHJBxkGU
	GSgNlkaX+8d2K7R8fcYM36ibgNYCFQLorap2zIPhIP6YfYzTBQRRpx8tFxOfLtFBQ8vLtTqtt4+
	/cAXF8hGWZx43RdU2lX5rjg1HIBYKipow7jvH3La19b8nnM6EooixERU3nm7yxDr9biTSqXBl/u
	hLR5DtMhiSDaLSeUqzH6tlehjM9tZ6e16dOnqEY6Lk5Bc8/jt1wZTE0/piojbob7eCQ72wN4+6N
	0Iq4iA==
X-Google-Smtp-Source: AGHT+IGNJA4bVLowcqsTNcTKWXSt9C1oo/1EXH42Qr0z5K3kcPv3AzGfuER3K4niOaxH4y3G0nd6hA==
X-Received: by 2002:a17:902:ce86:b0:215:a57e:88e7 with SMTP id d9443c01a7336-219e6e89215mr362710865ad.3.1735534904325;
        Sun, 29 Dec 2024 21:01:44 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba7325csm16914771a12.7.2024.12.29.21.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 21:01:43 -0800 (PST)
Message-ID: <efd81018-f637-4925-9104-c9586fef688c@bytedance.com>
Date: Mon, 30 Dec 2024 13:01:29 +0800
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, kevin.brodsky@arm.com,
 peterz@infradead.org, agordeev@linux.ibm.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
 <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
 <20241229205545.e4fa797886f30cb20c38ad06@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20241229205545.e4fa797886f30cb20c38ad06@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Andrew,

On 2024/12/30 12:55, Andrew Morton wrote:
> On Mon, 30 Dec 2024 11:12:00 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>>> For now struct ptdesc overlaps struct page, but the goal is to have them
>>> separate and always operate on struct ptdesc when working with page tables.
>>
>> OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
>> intermediate products of the project.
>>
>> Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
>> [PATCH v3 17/17] from the mm-unstable branch?
>>
>> For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
>> can help do this in his patch series. ;)
> 
> I think it would be best if you were to send a v4 series.  Please
> ensure that the changelogs are appropriately updated to reflect these
> (and any other) changes.

Got it. Will send a v4 ASAP (remove [PATCH v3 15/17] and
[PATCH v3 16/17], keep [PATCH v3 17/17]).

Thanks!

> 

