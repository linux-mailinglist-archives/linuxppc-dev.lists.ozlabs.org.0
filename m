Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C072A520C8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 06:04:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky4Dw4T2Xz3cDs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 14:04:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=r+cD5N6b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=r+cD5N6b; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky4DD30Rtz30FR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 14:04:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23CFC60DE0;
 Tue, 10 May 2022 04:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748DCC385A6;
 Tue, 10 May 2022 04:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1652155446;
 bh=6OF+9C9FRL/t2E9bNeco9SygrOB7dQke1qTazheJwmM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r+cD5N6bK5cMK3KiBjz/TIE0kRJfxClVYedgOaDY6iruFtbN69I0EnTrs28Odgw2B
 MPfR9kQZKLh7AzrNokC+xb2QjO4x0B/CskDab9TBGZx07zjP3Yerqr9YNFkFVMGD3p
 VJh3Vtf4VnZ1h7g0napFf0tAy+VjYNyYdsYerxPc=
Date: Mon, 9 May 2022 21:04:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v3 0/3] Fix CONT-PTE/PMD size hugetlb issue when
 unmapping or migrating
Message-Id: <20220509210404.6a43aff15d0d6b3af0741001@linux-foundation.org>
In-Reply-To: <cover.1652147571.git.baolin.wang@linux.alibaba.com>
References: <cover.1652147571.git.baolin.wang@linux.alibaba.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, gor@linux.ibm.com, deller@gmx.de,
 ysato@users.osdn.me, catalin.marinas@arm.com, borntraeger@linux.ibm.com,
 arnd@arndb.de, hca@linux.ibm.com, songmuchun@bytedance.com,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 10 May 2022 11:45:57 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> Hi,
> 
> Now migrating a hugetlb page or unmapping a poisoned hugetlb page, we'll
> use ptep_clear_flush() and set_pte_at() to nuke the page table entry
> and remap it, and this is incorrect for CONT-PTE or CONT-PMD size hugetlb
> page,

It would be helpful to describe why it's wrong.  Something like "should
use huge_ptep_clear_flush() and huge_ptep_clear_flush() for this
purpose"?

> which will cause potential data consistent issue. This patch set
> will change to use hugetlb related APIs to fix this issue, please find
> details in each patch. Thanks.

Is a cc:stable needed here?  And are we able to identify a target for a
Fixes: tag?


