Return-Path: <linuxppc-dev+bounces-728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9560A963CC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 09:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvXrs3SJ3z2yqB;
	Thu, 29 Aug 2024 17:26:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::bd"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724916381;
	cv=none; b=dp7Vp9iAmHW0HQTIC6ALpRNCxLnixMkDE/4WqfRgd6XacF4J9Sz071qhjEQFhP8eIQUo8PfpZZfDMe9rDe6NP9ez1Ne0Wdt09b4X7FKf58GRf23BUEGLLJ/cz26XkOLtPR4fhitjzeHDXXqVxpCvhwpgQf57qJOXGO0TgvXR/sIxjvgdX32YOXbu0o3AHITJ3oOj2kNUWmhSGG0VxFBN9uvVzjTPpYoc6oyM1NdDSgT5fNMpc/Fgkb5ACR78AZIlM5Hmh1e2Rb+2A9CYdENv45G+Ih2GcoR0yBAQ2GtZywhYANIHVzD8a5gKZV0akv/lnBlLmoh0hLou81IgJ75WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724916381; c=relaxed/relaxed;
	bh=I5ri7U3ICw+kQAJ41Z0llXmXtxn3eNpISSEiLweTrSg=;
	h=Content-Type:DKIM-Signature:Mime-Version:Subject:X-Report-Abuse:
	 From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Migadu-Flow; b=nsMCWC+wvH7ZvJoXHU9MMHXYlzbYq36lQ62Imb56rRu0IP2OMxryzqqbBQhIc4j17FvfqsnPrC45+vZSx/6gbEMqdAYGE3UieOyOCXzX7tJbKt3vatJMl6IrXuoBA6+sCi/L5Z7dkhWBDlWC2QVBtVJK0ggYPR8xd/0hmSjRV5pgx3CMsxncgdBIjRbxjL26vsJrSV+TZ3Lp5LdpJ32FgBW6z4N3As2xtT85K7W5Jg4LXUJ15wFi7F8MQDFHnYQ4XasM1eWg0st59+JDYlfQRHd69SmZHmNkKITWFZCqyxlgurLW6ZAZeUUJhFYAo6QRlSzoEVhu6eMJOtwEyBwYUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XnC+ifnJ; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::bd; helo=out-189.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XnC+ifnJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::bd; helo=out-189.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [IPv6:2001:41d0:203:375::bd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvXrs1Rlgz2ypj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:26:20 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724916359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5ri7U3ICw+kQAJ41Z0llXmXtxn3eNpISSEiLweTrSg=;
	b=XnC+ifnJTUWJgifpFgmnQKUN1iA51s8smDtrDWc9xoYV0r2DvZRun/a80GBJIS/z8i5FQF
	+wZ5qMlmMJ+IFqorb4b4mjYQms1OtQTVe4PV36YN4amK8vx3MnqdJIgVq6RFI7WVKKQhOs
	08q3auveABGgxrlfI4bi/MoSiViz4lQ=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v2 05/14] mm: khugepaged: __collapse_huge_page_swapin()
 use pte_offset_map_ro_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <2b7dceaa12da273c6decf92e3bf2ebc4f4e85ec5.1724310149.git.zhengqi.arch@bytedance.com>
Date: Thu, 29 Aug 2024 15:25:19 +0800
Cc: David Hildenbrand <david@redhat.com>,
 Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 vishal.moola@gmail.com,
 peterx@redhat.com,
 ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Message-Id: <3BAB5012-B8A5-4DFF-9CAB-31D44AEEB4F4@linux.dev>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <2b7dceaa12da273c6decf92e3bf2ebc4f4e85ec5.1724310149.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Aug 22, 2024, at 15:13, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In __collapse_huge_page_swapin(), we just use the ptl for pte_same() check
> in do_swap_page(). In other places, we directly use pte_offset_map_lock(),
> so convert it to using pte_offset_map_ro_nolock().
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>



