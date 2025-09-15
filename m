Return-Path: <linuxppc-dev+bounces-12214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6DB57690
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQLzC4pP3z3cyf;
	Mon, 15 Sep 2025 20:35:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757932551;
	cv=none; b=RDDWzt0hDmg1tgsDewyrgGbEMqOUHtuu5JAMYLpDz7keDVI+dZfcwMB/VQ/DK9wq05ea/iw5urMQdsFt3co4rrbNO0ZrZGhggtbWVbumf1bLdKBl9BkG2ooDNZLn0BZVDx1oVS3GoNCZNgzryRVQFwqqu3Lbr1Q7lVD3B/H8MsOVgjtLgtJkyzAbfnqsoF0K5ybM2UGe03ZkcCnGTKN89Vut7q8UMbbGn6BSJwn51ryR0wXPQXuMc/9Px2JhprBYaAwGAr11KiDq9UJzErWyHkicWI29lB/xzr2Z2w46upkmJ+992ygDF4NrKU9ww6fOQqNRs725z4f1VYVMDqwN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757932551; c=relaxed/relaxed;
	bh=UgxAjeqJy1+oB7bCgdA2gcYmn4AIRVZ9GkWi6fbS6G8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRCCIRpLSe1pEOLZLPipTfTkPYa1F4+y9WzgYpPwx5WItI4/GIq2RptfBxYbxMNHFHNEbTcdvWpV3d7K1hXWoOJAwSFVkwWaORu4cto9+Lnblr021ABXG82abvsqOJhML/mE0uFeHSuWWXf/RHTmqJWWTfdVcVX47ejf8g2Xvjj+463mIP0ISOx6ynQhXw21rpNkJTYkpugG/hNqJxC0d0qcP2HnSBkRyfUcd0Sw02xQLw3sMjPaxkJhBS4PmMAjW/QxMg03XFKgEIlumyZWNL7msVxB39KyzenxuHpfB12QOWvS8glhPBxmM/vigx+s7ZOnTbtcFHDWs12QxA8vQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQLz45lptz304l
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:35:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UgxAjeqJy1+oB7bCgdA2gcYmn4AIRVZ9GkWi6fbS6G8=; b=uA5pgx7jxIHyBFy30qLsN861Et
	FLj7Z8T9JS/hr3Orow3hv8aF9jbHkQ/qBqwU4mAMJbnYqRKuzm75faBzrQwVNH0O62LPllDoEWbon
	JG9zJTuiHgyRX0Gg9CBlPJxMH5KKf4K7OKRY4BGUc457bFljzQsz/pUR7hhkgR3PzSfoPAvAWgCST
	tU/cVVOIvEg5nsRN7yTN9pWLFekUABB2W5V5gPaTkVMhwD1zvA1chvKQS4HJbpv1ZCZWqW0+w5ztQ
	ypMBjcpJD5ldPZBPsnDoF5px/4JLHx1EKPmrhhQ8IlUj9yFTzn8WRxI7QNMH0QAk+puVGlFF7Z3U+
	HQ373aNg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Y7-0000000D6F6-0hE9;
	Mon, 15 Sep 2025 10:35:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A7674302E03; Mon, 15 Sep 2025 12:35:06 +0200 (CEST)
Date: Mon, 15 Sep 2025 12:35:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org,
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, kees@kernel.org, masahiroy@kernel.org,
	aliceryhl@google.com, ojeda@kernel.org,
	thomas.weissschuh@linutronix.de, xur@google.com,
	ruanjinjie@huawei.com, gshan@redhat.com, maz@kernel.org,
	suzuki.poulose@arm.com, zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com, dianders@chromium.org,
	gautam@linux.ibm.com, arnd@arndb.de, zhao.xichao@vivo.com,
	rppt@kernel.org, lihuafei1@huawei.com, coxu@redhat.com,
	jpoimboe@kernel.org, yaozhenguo1@gmail.com,
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org,
	wangjinchao600@gmail.com, yury.norov@gmail.com,
	thorsten.blum@linux.dev, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] watchdog: remove HARDLOCKUP_DETECTOR_PERF
Message-ID: <20250915103506.GA3245006@noisy.programming.kicks-ass.net>
References: <20250915035355.10846-1-cuiyunhui@bytedance.com>
 <aMfpwYPX6_i6ROOY@willie-the-truck>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMfpwYPX6_i6ROOY@willie-the-truck>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 11:26:09AM +0100, Will Deacon wrote:

>   | If all CPUs are hard locked up at the same time the buddy system
>   | can't detect it.
> 
> Ok, so why is that limitation acceptable? It looks to me like you're
> removing useful functionality.

Yeah, this. I've run into this case waaay too many times to think it
reasonable to remove the perf/NMI based lockup detector.


