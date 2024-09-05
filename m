Return-Path: <linuxppc-dev+bounces-1057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EF196D861
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 14:24:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzz7p6sJYz2yw7;
	Thu,  5 Sep 2024 22:24:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b5"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725539078;
	cv=none; b=Hve+DzlHEOWT5ChJrqHnEuQ48/0pf6wXBoADuiIMyb0Y43MPl1F4suW8eq88h58g5K/glfjGi5b97s2gtsPBOA2NPvehwZotHWlQIJcUCHXEnwSNwt6pff1WAxkWopAnvQVb2SG/Dw9fXzjwBVpC9GJa2IrqjoQdq0fO0gspf3QFynTMw1P6KhgV038c46Pas6kmJyaSaDVZvH4T3//lLN7JuEGB1MOcjXHexVndmgXCixSh097NWhV8ppccCScuPfex4pzJFov4j98VR4znDD89odNm7Wbjuc+bI/cIXbeM03hsTSP0s8iVRrzItIlEsPVWUZ+EnvZxPFovny2+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725539078; c=relaxed/relaxed;
	bh=gz1yGhbZpgLoXsIxhz2uE7McRGPNwSJIR5f5xqDCVYw=;
	h=Content-Type:DKIM-Signature:Mime-Version:Subject:From:In-Reply-To:
	 Date:Cc:Message-Id:References:To; b=EPpR/SNBH1ELGxx8znDVlfY62nf8mzGTgpT5F/AbIEz4l3IAZfH7v7sPcRhI/xLZNqsK9z6h+Peddu9NTJIzAio3D/ozDDJn6KuoruWNQTGoyyIj0mJ+RX+Zf4waIvQrz48/3+CGYoHmAs52C5w6wqHkVzZBGJfjrReHW+Rx/f8ayWdzfzOlGDIAJRj4KFw4pnUEFSSPgzl6cEXEUI/HVw6iRD3MZcOdCSVx8vOewYwhbmgYYjzyyUa/30TCk0jgFuhFUpGOu08BmFVB+WYLoOcP/bDF+nZzMEdq/NqyR4tzMDIQ72+BuyqxIGvS3xe8i35qiYvH/+7atkw430dKZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IbfmN4E+; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IbfmN4E+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzz7p4tDrz2ysg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 22:24:38 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725539058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gz1yGhbZpgLoXsIxhz2uE7McRGPNwSJIR5f5xqDCVYw=;
	b=IbfmN4E+hY5GdZdW3kzN35EwKMbO/B59nTdimCMm7n7hbuasFapv9oc/4nSaHcdtDM9AZl
	fl+4kluQcnMSAxiEJUtwokk7fx7aQyKc4TpoWLrENMSinKQ7nLlEi5VTvJw0abWcdChzYX
	0ZUBr/L4TFbDm9dAPKU4Q1+r3jTRrLg=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v3 13/14] mm: pgtable: remove pte_offset_map_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240904084022.32728-14-zhengqi.arch@bytedance.com>
Date: Thu, 5 Sep 2024 20:23:44 +0800
Cc: David Hildenbrand <david@redhat.com>,
 Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 akpm@linux-foundation.org,
 rppt@kernel.org,
 vishal.moola@gmail.com,
 peterx@redhat.com,
 ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Message-Id: <13E28978-C156-45CA-A57B-15C4AE668C9B@linux.dev>
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-14-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 4, 2024, at 16:40, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Now no users are using the pte_offset_map_nolock(), remove it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.


