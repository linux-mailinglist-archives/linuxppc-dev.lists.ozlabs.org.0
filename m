Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E63AC59C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 10:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5rxr4wwSz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 18:02:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=HJN793Eb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=HJN793Eb; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5rxM69lKz2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 18:02:15 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id 69so4282966plc.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=/EPZQKQYAB2b8zhhP6uGcKe+0BU9+3YWE31+Gx73b+A=;
 b=HJN793EbU4JTjIloNKkcfWSsiLVEJlQ5loEM0LJPQipMyqF6qBvmNasHt6l0cdY6WV
 k3nV4qAsLYE1cDm+ZmuHCCyIOQsBLGmcpV6Pw8ZWnpNJVF01rSDmAydM7k/i07z2N/cq
 In4TgpLTYYDaVn5nsxybtrtE/C4FHp4RMgHJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=/EPZQKQYAB2b8zhhP6uGcKe+0BU9+3YWE31+Gx73b+A=;
 b=Tk1hOFCvRMEIHnpV0xHX8rruiJOHKOXcv1Pn/NyqsCH9j20F+Ae/KB9LUt13a4soYj
 3h8+xYI/jTbzP/JhmeWxVMpa99huEqi9q5Ghr1cqrnJlJ46t6bVFLaZyk1gwr15aYFsa
 Hls00OR2cfnP/OrXQ0q5GI2UKnqqXIbBhwYpGNrq0Cjhw6X+W5rXxhYPnusJM7ej+rNk
 wsE0S9KWaN1G2oJosMirG/HJqYQ4hkoM0892uXWQv4r9CH1MQYudeBfg90WelvPb+2Kj
 YVnaCpVysGSeZre8UpFEcYd9uJorOd6myYCEBFuJ1VNxaen6hMcvf2596efd39ns4c2p
 4CQA==
X-Gm-Message-State: AOAM531OwgBOprDOR9Bt+KLLfTIN3gwuac5yzbZcnGJko28SWRQKZdms
 QFr5kG4Sv5hFTqVEroKz50tX4A==
X-Google-Smtp-Source: ABdhPJztgZb05LDQaym9VS/OstA+MiOdAwNXRdvl/8pLd7MtjHOargvjzpRMDCgUYHddzWi2E5J5tw==
X-Received: by 2002:a17:90b:3449:: with SMTP id
 lj9mr2117798pjb.123.1624003331829; 
 Fri, 18 Jun 2021 01:02:11 -0700 (PDT)
Received: from localhost ([120.17.188.88])
 by smtp.gmail.com with ESMTPSA id bg16sm7145752pjb.16.2021.06.18.01.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 01:02:11 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc: Enable KFENCE on BOOK3S/64
In-Reply-To: <87czsjsitg.fsf@dja-thinkpad.axtens.net>
References: <20210517061658.194708-1-jniethe5@gmail.com>
 <20210517061658.194708-5-jniethe5@gmail.com>
 <87czsjsitg.fsf@dja-thinkpad.axtens.net>
Date: Fri, 18 Jun 2021 18:02:07 +1000
Message-ID: <87a6nnsirk.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:

>> +#ifdef CONFIG_PPC64
>> +static inline bool kfence_protect_page(unsigned long addr, bool protect)
>> +{
>> +	struct page *page;
>> +
>> +	page = virt_to_page(addr);
>> +	if (protect)
>> +		__kernel_map_pages(page, 1, 0);
>> +	else
>> +		__kernel_map_pages(page, 1, 1);
>
> I lose track of the type conversions and code conventions involved, but
> can we do something like __kernel_map_pages(page, 1, !!protect)?

Ah, I missed that the if changed the truth/falsity. !protect, not
!!protect :P
>
> Apart from that, this seems good.
>
> Kind regards,
> Daniel
