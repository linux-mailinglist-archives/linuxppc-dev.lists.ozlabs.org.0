Return-Path: <linuxppc-dev+bounces-1493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C5197D744
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 17:07:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9G2d6wPSz2y1W;
	Sat, 21 Sep 2024 01:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726844841;
	cv=none; b=MW8/xMdpkcBv6bKCM8Por7HLOhHez01n7jrHlWqzdONSI8Q99Y+KGMcbyVGoj/AuSf7/CaWRVGcxWlGghrWDBbs0zSKbXGZZFv/wcY+Vhg2GjpsgY2hXzMZxc11S9rgOb/Ji+qFwO9aW+amOOb1bfSTvAn7/q6+L8TG/Xix6YAmETjnOEPSn/V7oycXOzPgBq3c0EUc4iIyVBk8QB9jOuGih4IAASjzTsHcXCDHU+Jqb+3rarkaq4RUdg+GsPioP6hYKKslIM2csSk4lRjjdX7p5jCFbn40ok1XMcVifnv5jD8NRUXEDsErB7zjO+q0YEuB5Fw2AWjUAuieUdTLDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726844841; c=relaxed/relaxed;
	bh=2Q+IMF2/yt5H2L3HnniAbyoUSeocuzaPiZHlEpHd550=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=kdfdiUDNGOLbKOb7SCV56L4X0Vvqf/v+FkvWUKqKisQIJ/FQihcbjWRTPCYbKl5f9Vggrm3mCU6D9k1cncCiqRBXbHPddUgLUhTUzm4jH0wQNgEh+VrrR1Rq7Pkd8rDIU4NeDvuG76MXAJL8ixr3Wh0Q4ugNcJ71K8aFXUyBVEWz9yDhuElYVKgifx1fzU4lMgl2v5xDByxYV7erEFjAHLgZ0ZF0jKF/R76+7Ywsd+nfRCp4siP9SQIew2JtTzgxzsT+atIFLF+//6L5lyKzQ71ljAXvM7gTvHPqKzkJxYlNs5mST9eA43S4m9UxGytiLpJGTaGtjyFtX1UCxvzKyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DT9UqX8h; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DT9UqX8h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9G2d24lbz2xxy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 01:07:19 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-718f4fd89e5so1855292b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726844837; x=1727449637; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Q+IMF2/yt5H2L3HnniAbyoUSeocuzaPiZHlEpHd550=;
        b=DT9UqX8h+XMCdYVZ1+cqrVpVn3L34HyCen56cGRuAe6fr7X87qOJDw9he2Hl53RqSz
         nRa28XxTnPSVgN12rf2Jb63RrnKcsJtMGV74tqeLAhlgPkDLjoTSwJlCEr/+RVzJUOZo
         VzN0eFvJvCBI45AEnD40N70ldC+twqH3JYNLLO9YNmQ94f/Grsk5GBsq/pMtvKS9FCWg
         3K6kqM+uMKc4LUSDv+Ew7EOEbaVqoTsB6Sgv81ni2iqwNMUIusu6el3rFvmy6mxOkC2E
         INMIomCIYSMezMe2qjvETJJpYcdwPI1pdQ7vFL5P8RuDUyFNnHnThacribJyj4ZxPdiU
         hF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726844837; x=1727449637;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Q+IMF2/yt5H2L3HnniAbyoUSeocuzaPiZHlEpHd550=;
        b=ABSfu0tH6iF5uMTt7zD8yQshZKsWsfCZaBo56QAPn4jbPXl6DA+lnUPOBrBkg3mL4T
         gxay7vuDOXRbSzTHHt8y2gJhQnzlzwbh3FIfhbWdlaUFoQiLi8i6wBYCRivBqt2GJqKW
         0cGBm5kvog5G5yzS6SpAmA9TH6qlt9gaDBBfC6C4y+jLfOzPotzksb9thmArXmN47ovb
         rMQVKrzf/HVW7CxlJVZsU9od5U9tYPjsBn/KM/w/v7LHtqf3GU8CcHs9xEsQ0uNcNleK
         f0BdMmazO8+B5kfNFY14VzAuouXqTG6/ax+MqCDHqkAtu18cB+jiLBUQ0aKgXpW8STFv
         iz4w==
X-Forwarded-Encrypted: i=1; AJvYcCUXyCGO/zcaYLBjmCPOCW4tU2Elb7/7IjNwwawZ1p88ge/CJ3VyX1oLLBZpJ6AwoXj1ay98AiJ4+dLqtGA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzATMQq+RubtCIeH2apet0XUzEIsbx9n2l5chqXBI5AQVNibVs1
	Tbj1w35SNmetB+YQU9YSBDb5QnUfOOcQLGD9k30BpMwEvzNeIpoA
X-Google-Smtp-Source: AGHT+IHyZ22f3lxsANEFklaZ2/EZeGFSKacy8PGIMcrt1N5/JNL+ZNPALh2X2l2osKnat3cAuMybWw==
X-Received: by 2002:a05:6a00:4616:b0:714:2533:1b82 with SMTP id d2e1a72fcca58-7199ca0318amr5430553b3a.23.1726844837137;
        Fri, 20 Sep 2024 08:07:17 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bb97fesm9923436b3a.183.2024.09.20.08.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:07:16 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, disgoel@linux.ibm.com, hbathini@linux.ibm.com, adubey@linux.ibm.com, gautam@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: kjain@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kvm: Fix typo in the kvm functions
In-Reply-To: <20240920113801.424651-1-kjain@linux.ibm.com>
Date: Fri, 20 Sep 2024 20:21:20 +0530
Message-ID: <87h6aagyzb.fsf@gmail.com>
References: <20240920113801.424651-1-kjain@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Kajol Jain <kjain@linux.ibm.com> writes:

> Fix typo in the following kvm function names from:
>
> kmvhv_counters_tracepoint_regfunc -> kvmhv_counters_tracepoint_regfunc
> kmvhv_counters_tracepoint_unregfunc -> kvmhv_counters_tracepoint_unregfunc

Gr8 spotting!
It took sometime to realize k[mv] and k[vm] is the change :) 

>
> Fixes: e1f288d2f9c6 ("KVM: PPC: Book3S HV nestedv2: Add support for reading VPA counters for pseries guests")

Right. This commit added the registration and unregistration helpers
for TRACE_EVEN_FN_COND tracepoint which mainly collects the
observability stats for nested guest on pseries.


> Reported-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_book3s_64.h | 4 ++--
>  arch/powerpc/kvm/book3s_hv.c             | 4 ++--
>  arch/powerpc/kvm/trace_hv.h              | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Not an expert in kvm area. But the change looks very straight forward to
me. Searching for "kmv" string in arch/powerpc/ after applying this
patch indeed resulted in zero hits. 

Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


