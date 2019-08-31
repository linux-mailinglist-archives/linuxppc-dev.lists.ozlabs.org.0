Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4EA42F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 08:55:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46L6Yb4TSLzDqx6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 16:55:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46L6Wg3Wc5zDqlw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 16:53:48 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id BF53B15520975;
 Fri, 30 Aug 2019 23:53:39 -0700 (PDT)
Date: Fri, 30 Aug 2019 23:53:37 -0700 (PDT)
Message-Id: <20190830.235337.570776316111294728.davem@davemloft.net>
To: linyunsheng@huawei.com
Subject: Re: [PATCH v2 7/9] sparc64: numa: check the node id consistently
 for sparc64
From: David Miller <davem@davemloft.net>
In-Reply-To: <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 30 Aug 2019 23:53:41 -0700 (PDT)
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, peterz@infradead.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 heiko.carstens@de.ibm.com, linuxarm@huawei.com, jiaxun.yang@flygoat.com,
 linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com, paulus@samba.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org,
 cai@lca.pw, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 x86@kernel.org, rppt@linux.ibm.com, borntraeger@de.ibm.com,
 dledford@redhat.com, mingo@redhat.com, jeffrey.t.kirsher@intel.com,
 jhogan@kernel.org, nfont@linux.vnet.ibm.com, mattst88@gmail.com,
 len.brown@intel.com, gor@linux.ibm.com, anshuman.khandual@arm.com,
 bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru,
 akpm@linux-foundation.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yunsheng Lin <linyunsheng@huawei.com>
Date: Sat, 31 Aug 2019 13:58:21 +0800

> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
> of proximity domain is optional, as below:

What in the world does the ACPI spec have to do with sparc64 NUMA
node ID checking?
