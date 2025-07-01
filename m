Return-Path: <linuxppc-dev+bounces-9943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD3AEEB17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 02:05:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWNbL3LfYz2yVV;
	Tue,  1 Jul 2025 10:05:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751328350;
	cv=none; b=Myu77A4afdoubSKoMthASyFwpoAA54sAB0DeJjuxh3XflNOvIUd4Pe5z7VB3gmYoeZxWq0XvP+FzYGWovg69WhQsbf6hgkIOXkRgjvqah35ozcsCbtWUgSEYV0+jbt8ooRSuhpGBsoRUskcNWYD7YrWBonZIo55tA66RGkM3zNfnMKLbq/9Dk2ySpz96/6gI6GUCyEUtiC7VcN6VOoEIGmrdJVF0GmECWJElj9gvlrhk+5h9DtN+D6c3Gy1QdsepFbZ8fj9AQVumprFP4aM4CHPDtbAKiV3PuQbXntG0wgmpNy9rqwu6ABWXAsvlNDFZPNXRAC/NWpr86oZynPMgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751328350; c=relaxed/relaxed;
	bh=/NU/cotq6f4HONcmMyxBEeQIjUm7DS3sDb6SMT+k9uQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=G8O7clPJT5CEiMmxczhQ/tJ1f6UuspXTWJkSHF/+JDFIINqucF0K3KkUC8cOLjQkiWGrzwmY8LUcZCrTebu9tQAzcuvbDEtgdkm88lMjznu6lPmaCJ8eFkye/MrIpK8h0pUZT/Sdq16DHlaya1uFpYMus/HCB+/Ch9tVjNf2nCdNkrtPJrSYuv982ZXvyz3ylpGmbiFVQI+fGKtYOsIpjO7PBy7K0IcauXXNoSJymWWxitH17pOdO9J6MK/89+dvoJktPxiRbUUhnaZ/a9gHJ1Vnw39mvdvz69miXPJg6EeWRvC6Plkq0w4w+yT5i74HoVhQXkDser4BjAe2llT3yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XbWONMuU; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XbWONMuU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWNbK2Wg3z2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 10:05:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 893A344B19;
	Tue,  1 Jul 2025 00:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEDDC4CEE3;
	Tue,  1 Jul 2025 00:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751328345;
	bh=qPg3TzNq6BpmYEZilw7ZTkiMjD24Iia3o39EQ4M66Vw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XbWONMuUrvz7T0Gq7YshVCh4gFQdvVevhuOhWKtFa8TmjgHwkc/w8ws5DNH5TGSks
	 Up2E/6UPAIGTQbT/oyMflhWrYdheKmsjDkuf1SuGhV56uHAYqrE1Pj+gCiIWQWTtKV
	 XJRP+qO/YfjkDDyNSfnZEETNqJc3s8u5cN7tglT8=
Date: Mon, 30 Jun 2025 17:05:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, richard@nod.at,
 anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 arnd@arndb.de, rppt@kernel.org, geert@linux-m68k.org, mcgrof@kernel.org,
 guoweikang.kernel@gmail.com, tiwei.btw@antgroup.com, kevin.brodsky@arm.com,
 benjamin.berg@intel.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 01/11] kasan: unify static kasan_flag_enabled across
 modes
Message-Id: <20250630170542.f4da6e3908f66b822408e699@linux-foundation.org>
In-Reply-To: <aGKDhPBgDv2JjJZr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
	<20250626153147.145312-2-snovitoll@gmail.com>
	<aGKDhPBgDv2JjJZr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
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

On Mon, 30 Jun 2025 14:31:00 +0200 Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> > +/*
> > + * Initialize Generic KASAN and enable runtime checks.
> > + * This should be called from arch kasan_init() once shadow memory is ready.
> > + */
> > +void __init kasan_init_generic(void)
> > +{
> > +	static_branch_enable(&kasan_flag_enabled);
> 
> s390 crashes at this line, when the whole series is applied.

oop.  Thanks, I'll demote this seres to the mm-new branch for now, which
takes it out of linux-next.

