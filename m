Return-Path: <linuxppc-dev+bounces-11040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D2B272F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 01:24:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c31XW0Q2Rz30TG;
	Fri, 15 Aug 2025 09:24:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755213850;
	cv=none; b=SZv7Tg1FBxeN+Qxx5FbSE9MrnVmwEBh5Y2bTO8oJ8Z14A/uaF9ioZwiKF73OV5J+e0NgDH6JLOWkAzejqDe6DoEyE61y7JQamqtlNPvYmDGbOTPzNRaO+qMlm2k2eEA/mN4jD7kDBtTABHMaXVxKqqDILXsj+OB1GoR57BH5Ni1pN0GezDOpdvN9tm7Or6SLgRjYmcKAaPpmn19CeCD+cXsYasvZdT9ln80D5BrgvRZVlPp4cGkLiMgC1cQDjZMLbhFYRvXqXmqm1G6BuzrVoZMwc3kGu8vxrMvlEMNjY213aPsWQkIOUxh3tD3wFPTIr2ze/1oSkA1pwaxz+J/ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755213850; c=relaxed/relaxed;
	bh=41vZQE4qVj2qb70cjSoEC4RwtvqSxYt+zihXufpvrB4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dbUDbiU5yL/0QKZzQreBRf4CbGtIDv1hvKla2bN+TA7v5HJow2gsSwwkUgKWX968c1tSd/TkKBxa3nBnIY/qBzQZjNnHbpdR3ap3PRWh4KkSohBM5dxyvQL1SKT2ToLrjoz0fluxmhkz3mwdxww+ULaYnqn3IfOAfiOaiybVclNePPstHWAFMO4SBSMdbF+GuaPJEx/Rt45rWCOFxIr9ovmrogpRjun6YCWJSvH6mdrThH45U7bqQPQiePddVQr6fTSsgygsPLsbbRAeuhkk6223gWreVIXB0rs0iUHWEn7SpjnqC2X2xiC/xjclmMSpCAViJzCvRRQ81ucQb9WxoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=0jiS0MN4; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=0jiS0MN4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c31XV0gdXz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 09:24:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1C8C60053;
	Thu, 14 Aug 2025 23:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1B7C4CEED;
	Thu, 14 Aug 2025 23:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755213845;
	bh=Lt6jBIulxaTo9RIUgXftMb1SwjwcRMNvaTJxyrnlj78=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0jiS0MN4/TWhe764dHWzjTgvAGMJecSSdfZWFOkJUS7BuIjhyZKOl+A5PrqjFOduD
	 IsxvOxBO+k+v+PziyRQf+Q7TQM0DhZnFEQ2PaknBTmYhxEHSQRHua4azWjzIgmIkiW
	 ecFxYV+H+SUkeqY9R/HRVhofTlwwyNEN4NBGc7RU=
Date: Thu, 14 Aug 2025 16:24:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, x86@kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
 nicholas@linux.ibm.com, christophe.leroy@csgroup.eu, Rohan McLure
 <rmclure@linux.ibm.com>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v16 06/13] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
Message-Id: <20250814162404.e3a0f12e2aa1a87de51322e7@linux-foundation.org>
In-Reply-To: <5aa057d0-dc76-4723-80d1-82065320a428@ghiti.fr>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
	<20250813062614.51759-7-ajd@linux.ibm.com>
	<5aa057d0-dc76-4723-80d1-82065320a428@ghiti.fr>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 14 Aug 2025 14:11:45 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:

> >   	for (i = 0; i < nr; i++)
> > -		__page_table_check_pud_clear(mm, *(pudp + i));
> > +		__page_table_check_pud_clear(mm, addr + PUD_SIZE * i, *(pudp + i));
> >   	if (pud_user_accessible_page(pud))
> >   		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
> >   }
> 
> 
> So this made me realize we (riscv) did not implement 
> pudp_huge_get_and_clear(), which was a mistake since we support THP PUD. 
> I have implemented this function in this patch 
> https://lore.kernel.org/all/20250814-dev-alex-thp_pud_xchg-v1-1-b4704dfae206@rivosinc.com/T/#u
> 
> That's a fix so I'll merge it in 6.17 (at least I'll try) so your 
> patchset will break the build on riscv, I'll keep you posted when it 
> gets merged!

Thanks, I'll temporarily grab a copy of your "riscv: use an atomic xchg
in pudp_huge_get_and_clear()" to keep mm.git compilable and testable.  

