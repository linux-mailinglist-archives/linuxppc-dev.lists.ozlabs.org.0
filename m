Return-Path: <linuxppc-dev+bounces-4513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C70D9FE278
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 05:55:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM3hV5Kcfz2xQC;
	Mon, 30 Dec 2024 15:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735534554;
	cv=none; b=h9GMV8/PFC20uxGqWwWj+XWPIbh46QGyFCtdVgy37x5ZNNXWCHWTKGSfNkB686SYp0xFzBtFbILmSH+MJhtoW+wmNOmDhwsKomeNAuGPHGOUBTtj91ph/mj9Nd6N51DVdHlB1RcLnDy0pNpMzIUjmA9H1lsJVFVgURoG48r+b1rGM+T1rVZLKnze10liMd8+BPb9kmX10A/Pw+8sp3GGwnQM4E3CH1PU/00smKVe3SZRCs9KVW/D2LBqf3UJ7cpcfnWk0CJAvGVBpF652s9dd96tT4R9xATIAnvUvg+GMSUxjme8k6MNU34LHdDrsJoczxZY2b857EQvw/aOKKSB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735534554; c=relaxed/relaxed;
	bh=MLPKLeCfQ1ijGlwaEdWBBWtId0IsiPV7Gw+/VyTOg0k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TeWQP88VKBVp0bHMohpW+xOSYnEqNXHJVUKSDpd4Vv7jEAcetwgI+/Nw2eDyTR9LKZbclZPKOizXuZYUAkf8SOPulGB7ArDIxs4fTCyzMmhMmhMAO7QnqrUEC8TViYUCL/NdbOOG4M7wX656IHIyR1rGI/Px5lN43I4RV7xAzf0Gj9mTau0VuDbGHnpWM0tHiPAexZVIKVJawVjOq/yXoUxFFakx4s+cMAwmJHGcYNHJZ3ni3Etayvt5iw/ASg0B5V+7OiFZvHSvTU5q+ZH6zufK4DxVW0zqh6tBTRup2bByOeqqHypwZ084l7ho1x2YLh6HsC9tfDsLmS5kKZVQUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rhe3QlxD; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rhe3QlxD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM3hT3S4tz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 15:55:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB418A40336;
	Mon, 30 Dec 2024 04:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0FAC4CED0;
	Mon, 30 Dec 2024 04:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1735534547;
	bh=AJswIJAQd5FETiIh0u+rfDfZfqamfQp06InUDAPDuXA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rhe3QlxDLrSSLi3sUiu8VVb+GHWge7MOiJcFxtA8oK28fW9HmGNW19VjrwSTcCGgb
	 r2YmGYGxTSfcYGqg8CrarFXVALRtvCpH5QUm8X8Dcox5YzUhoHoyUwOYqQ6lnY9L2Q
	 H2PY79bq6wwE7WdNlWq8aScHu3jsSCDF3yqMjhok=
Date: Sun, 29 Dec 2024 20:55:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
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
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Message-Id: <20241229205545.e4fa797886f30cb20c38ad06@linux-foundation.org>
In-Reply-To: <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
	<b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
	<Z2_EPmOTUHhcBegW@kernel.org>
	<9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 30 Dec 2024 11:12:00 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> > For now struct ptdesc overlaps struct page, but the goal is to have them
> > separate and always operate on struct ptdesc when working with page tables.
> 
> OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
> intermediate products of the project.
> 
> Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
> [PATCH v3 17/17] from the mm-unstable branch?
> 
> For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
> can help do this in his patch series. ;)

I think it would be best if you were to send a v4 series.  Please
ensure that the changelogs are appropriately updated to reflect these
(and any other) changes.


