Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A7775D154
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 20:25:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6yf70nP0z3cmR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 04:25:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6ydQ5Dcxz3cb3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 04:24:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DED9B61D70;
	Fri, 21 Jul 2023 18:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C25C433C8;
	Fri, 21 Jul 2023 18:24:35 +0000 (UTC)
Date: Fri, 21 Jul 2023 19:24:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Subject: Re: [PATCH v11 3/4] mm/tlbbatch: Introduce
 arch_flush_tlb_batched_pending()
Message-ID: <ZLrNYtekYsMFZuVK@arm.com>
References: <20230717131004.12662-1-yangyicong@huawei.com>
 <20230717131004.12662-4-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717131004.12662-4-yangyicong@huawei.com>
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
Cc: mark.rutland@arm.com, wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Jonathan.Cameron@huawei.com, yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org, guojian@oppo.com, xhao@linux.alibaba.com, linux-mips@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 17, 2023 at 09:10:03PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently we'll flush the mm in flush_tlb_batched_pending() to
> avoid race between reclaim unmaps pages by batched TLB flush
> and mprotect/munmap/etc. Other architectures like arm64 may
> only need a synchronization barrier(dsb) here rather than
> a full mm flush. So add arch_flush_tlb_batched_pending() to
> allow an arch-specific implementation here. This intends no
> functional changes on x86 since still a full mm flush for
> x86.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
