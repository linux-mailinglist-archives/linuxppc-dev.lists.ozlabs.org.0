Return-Path: <linuxppc-dev+bounces-1618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309F5986D42
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 09:08:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDl7Q186pz2yVZ;
	Thu, 26 Sep 2024 17:08:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b9"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727334514;
	cv=none; b=QnBcdvvOvEGRyq9rhNNCImz/v5TGtGoPOkLyUeGcHtheDshkG7TNlWXwpv1SdaioEbu7Qd0+it3dglUf11Lzli7gnP+00SpoTcgusg/zK7cDkTrR2Hrh0a+5BgXIKEhsAT3Conzw0oIQmB9qGAI+5J8bShZwhq+zMo1W8Ez3VoIIjFEgTuZ8wwF91dKi1CJKnlTlrEMcmKBc6B3+FYJNma3i/SPUktG5quMJGU5FSKtAGU0kSrBOfcWgz73tYRR+5ncoDzjzv9gtgsUA40GJMqItH8ux5ZX1B4TvmD5kQ0b0PGanxWLZZjUrbYoOWBdg0kxHg1O8yx0p762tl8gnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727334514; c=relaxed/relaxed;
	bh=WclAnEXrzF/Gh4XbPxe2UDc6ATX/PcOlqBxVSmpUuVc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=le73TI7eGGVKTtpksm5LaNtqhThAwCJLv0wO1ZADMf6ticY1RmR1pc5PmwkSssFmvo12nSFXZh5jwBGz9R8WwuZpH1cYjYufzTnLasxxZdOcAEn74m8UBm60TqjZIclGWVXF+USp7PrdbKpbHqBT0EDTqhD0odqx/zJ1aLGV9OxZU3JrEXN8D96SJ/WFfhzEPGtWOxM385uNh3sBsTDe1R6/4Q8XqOHSLT8/G2DCsDSqe78l2jKD/uuOaqFF/ilZ/uhpP3fF+LqbyuKtFevmvTp/EwDKO1eQKOdokYYp6ZL/cwbHIgZJD2nHhcBvXu+Sx2fkZ6qdDIiRxgTkXMYhNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wSW+aXCy; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b9; helo=out-185.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wSW+aXCy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b9; helo=out-185.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [IPv6:2001:41d0:203:375::b9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDl7N0GlMz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 17:08:29 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727334482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WclAnEXrzF/Gh4XbPxe2UDc6ATX/PcOlqBxVSmpUuVc=;
	b=wSW+aXCyPsY6o4Dgbx65oTZJus+k13XJPDe/aM8cYxqcxGDREgn/+D7RD88j2kVPBa6cEI
	TykwwfZRqNlzTSPcaPt32nBl94JX6Zb7m3ubsqol8cO5a4MjKGHfaFvFbdW3CN2OMt1qMh
	MYXHGvqROg2c9qWaxO2wmgI48lcLwog=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v5 07/13] mm: khugepaged: collapse_pte_mapped_thp() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <055e42db68da00ac8ecab94bd2633c7cd965eb1c.1727332572.git.zhengqi.arch@bytedance.com>
Date: Thu, 26 Sep 2024 15:07:12 +0800
Cc: david@redhat.com,
 hughd@google.com,
 willy@infradead.org,
 vbabka@kernel.org,
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
Message-Id: <3418680E-14B2-4098-8730-6F569ABF51DD@linux.dev>
References: <cover.1727332572.git.zhengqi.arch@bytedance.com>
 <055e42db68da00ac8ecab94bd2633c7cd965eb1c.1727332572.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 26, 2024, at 14:46, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In collapse_pte_mapped_thp(), we may modify the pte and pmd entry after
> acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
> this time, the pte_same() check is not performed after the PTL held. So we
> should get pgt_pmd and do pmd_same() check after the ptl held.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.


