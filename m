Return-Path: <linuxppc-dev+bounces-4681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BAAA01E61
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 04:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRKzk4W9Vz2yMX;
	Mon,  6 Jan 2025 14:53:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736135634;
	cv=none; b=d5r3dqlfMrH58gzQ7D3uJrTpMRrKdtJiZHG+RvgeoCkbCEw6kjFeAPDzWL7Rigm77s/1WEeCBaUEUJGxC87QNiLNSW2qx0VOJuElG/nrTGcsQz1wS1eVn0QU930vUVUS56meLzCkbI9hORE5j/N5FoZpRyF2wy1fKK5fn20Kob23Lo9zvgE+ayBk0uKbmxUOZ6N/4zj7BoO9Dw2cs6+LSKswj43BraL7W+bSd0YlZClK57scieVzlmTg0S34DTXAr3apDezgcGyRJ1M/pwisegLvAsGi5kp7J4eMDWKLeR/Fz5iqy58vl6JkCy28o3Ntc6R4GF5ibQ4qFXFr/sl85A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736135634; c=relaxed/relaxed;
	bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDhI7f1MJSGzoznMyRZWmyXRVFtiON8u4icexf0T2R20sye09gw4K8ThIE8uUoT+gCciQs0zdMsZTUMOoJCfSoeVwdky+gss5FEJ+nnn5B35lg2OQZZmqdANRtxX9tkiqx+YaImaXf329eMQE3/y5aXh9KsTz/izaAKHChHwhA8Zb/QYRAaRRiaB8ueNcyHEx6se6VAg5/jlLvPMMAtrWXW++nZmRwJYOu/hgiwFop+1ZxtU1s6mFJaz3Ud5qWJ7fbNtUrIGMWNp6Tf2O03IhuvbK5MlvJuxbT4+ubw6vPWTnzfqU6jdfYxlejI5G+OoY+Kn7EcX2rbtzqLH5OaOfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ro1QIni4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ro1QIni4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRKzj4Xkzz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 14:53:53 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f441904a42so20367442a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jan 2025 19:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736135630; x=1736740430; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=;
        b=Ro1QIni4qYqXbIiuMP0WO1hLsPLe28uZ02LRzBksnWSgLmJzCulG3rc8Ebt0HvdDhT
         IZjQbO0eREwhBwI9TFe6yPe1Xdmkzdjm+JL5DbmtrxqvfCyToAbmr3R7HV7qb+GQYvdI
         M8myKlHi51OT+oVch4LS46+apziDgnscaPHWASXBe0x6FRBgOfShgZUWkTxOKffvtLg1
         0Sxl4dtFuemnGIVi6W2+TUQ2y/TyiKnb30VMK7GX8v/X8SJXYGW4m0G9i+rH9gJ/C9jj
         PxxpHygQQR6kpXr+Lzfo+xYw12LY3tGZkHA0Bvn07iaXjorUFRY76HG8tTtz6WKXnQzx
         rBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736135630; x=1736740430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=;
        b=o4a/D1FLKEZQkt/bjY2t0hQ1r0iTRuuiJsokTUB1X5xBds0ZzmQ64D/EQXPZy6v/Wm
         KmiirBaY55P7wcA2iPg/+R6GiQFMdjREHTyvdIvN4lfhXDdkSiHV9jQZQV0qxkRpwaw6
         HETAkQDshUwyOlULrmisR5rLM1BBNcb5AmK9G5qTXDszHh7tRNXu+3+Z7/JL5I+8JI9f
         En212yGQfw28uxKq369jcwM7OlpAlmSNO1OoewU5R1H13AQBbuqPR+euJyrdNJeLzTNX
         2+VQK85XFn24CHCb0FUUuZpN90L8oTq0t2d1dEi8tYoSpc4hgCPQV70+Txp5NpHfyUii
         9CAA==
X-Forwarded-Encrypted: i=1; AJvYcCWHbavTkTVSR90XaJ56Uk46weWMrjKuykBv1pBYEGJ4bNs4c8XN0EA+z8Bx0CJg6LvPzScPYepsZrLycjM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw04cvst7DQ/n4N14AICOuyHH1y9uLStDrCmTFHtAcZU2ms2MsA
	SfAjDR8dq1VaHpY9WIe2SYAOtQoSUf3p+D1/6U9piKwLLx7ErkN+bwxstXTM9fI=
X-Gm-Gg: ASbGnctNDSOht1NGMyg93QHRbdBkXEoyRJR9QtUXIZ8TLY66XcEk49Qy0S7jECd4kHn
	ipuSycQvdlEI8vO2xfg1KKFBRZNCmPxhloirGZCizx9fV4iqneAOiao9vnAIHB9WR2JpaPXQUCG
	1C4wQ7+8uheLwmwpoFpEjCTVh6wIdrPfgqiuxahmxZ5hsLuN9tH9vJxn4Xf5eUu6xX5Ibp0DbPQ
	PnrEJiJ+RGKzRLjwYvG+p8+UdSJDG/EVbuCKO13U4ikcSVRkQ196G+HzDrTrn5JMEDzqLJfh19B
	1smQww==
X-Google-Smtp-Source: AGHT+IE2eKUVGb+J7TSGZASTVnkByt6mt8YLIy++PUNY+VFfsnF7zlybMe8WL3Umwm8kwi4ry/BkkA==
X-Received: by 2002:a17:90b:54c3:b0:2ee:a127:ba8b with SMTP id 98e67ed59e1d1-2f452ee83d9mr71788615a91.36.1736135630440;
        Sun, 05 Jan 2025 19:53:50 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02f72sm283551435ad.249.2025.01.05.19.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 19:53:49 -0800 (PST)
Message-ID: <a84a7b0f-dad5-4100-9d0c-3b515e7fb71f@bytedance.com>
Date: Mon, 6 Jan 2025 11:53:36 +0800
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
To: Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: agordeev@linux.ibm.com, kevin.brodsky@arm.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ryan.roberts@arm.com, linux-mm@kvack.org,
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
 <20250103111457.GC22934@noisy.programming.kicks-ass.net>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250103111457.GC22934@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/3 19:14, Peter Zijlstra wrote:
> On Sat, Dec 28, 2024 at 11:26:22AM +0200, Mike Rapoport wrote:
>> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
>>> Here we are explicitly dealing with struct page, and the following logic
>>> semms strange:
>>>
>>> tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
>>>
>>> tlb_remove_page_ptdesc
>>> --> tlb_remove_page(tlb, ptdesc_page(pt));
>>>
>>> So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
>>> directly.
>>
>> Please don't. The ptdesc wrappers are there as a part of reducing the size
>> of struct page project [1].
>>
>> For now struct ptdesc overlaps struct page, but the goal is to have them
>> separate and always operate on struct ptdesc when working with page tables.
> 
> I don't see how the current idiotic code helps with that at all.
> 
> Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
> there should not be a page-table anywhere near here *ever*.
> 
> Yes, some architectures use tlb_remove_page() for page-tables too, but
> that is more or less an implementation detail that can be fixed.
> 
> So no, please keep these patches and kill this utterly idiotic code.
> 
> The only thing that should eventually care about page-tables is
> tlb_remove_table(), and that takes a 'void *' and is expected to match
> whatever __tlb_remove_table() does.
> 
> Flipping those to pgdesc, once its actually a thing, should be fairly
> straight forward.

Well, since I've already sent v4, and that patch series is mainly for
bug fix, I'll send a separate patch series to do this.

Thanks!

