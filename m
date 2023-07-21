Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D12D675D14D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 20:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6ydZ5ghYz3cc0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 04:24:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6ycw2p4hz3cWh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 04:24:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A283161D7F;
	Fri, 21 Jul 2023 18:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C336DC433C8;
	Fri, 21 Jul 2023 18:24:06 +0000 (UTC)
Date: Fri, 21 Jul 2023 11:24:05 -0700
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Subject: Re: [PATCH v11 2/4] mm/tlbbatch: Rename and extend some functions
Message-ID: <ZLrNRSry+Hhn2dxA@arm.com>
References: <20230717131004.12662-1-yangyicong@huawei.com>
 <20230717131004.12662-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717131004.12662-3-yangyicong@huawei.com>
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
Cc: mark.rutland@arm.com, wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Jonathan.Cameron@huawei.com, yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org, guojian@oppo.com, xhao@linux.alibaba.com, linux-mips@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 17, 2023 at 09:10:02PM +0800, Yicong Yang wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> This patch does some preparation works to extend batched TLB flush to
> arm64. Including:
> - Extend set_tlb_ubc_flush_pending() and arch_tlbbatch_add_mm()
>   to accept an additional argument for address, architectures
>   like arm64 may need this for tlbi.
> - Rename arch_tlbbatch_add_mm() to arch_tlbbatch_add_pending()
>   to match its current function since we don't need to handle
>   mm on architectures like arm64 and add_mm is not proper,
>   add_pending will make sense to both as on x86 we're pending the
>   TLB flush operations while on arm64 we're pending the synchronize
>   operations.
> 
> This intends no functional changes on x86.
> 
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Nadav Amit <namit@vmware.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Tested-by: Yicong Yang <yangyicong@hisilicon.com>
> Tested-by: Xin Hao <xhao@linux.alibaba.com>
> Tested-by: Punit Agrawal <punit.agrawal@bytedance.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Reviewed-by: Xin Hao <xhao@linux.alibaba.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
