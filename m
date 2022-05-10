Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02209520AAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 03:28:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky0m50Tnbz3bdF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 11:28:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131;
 helo=out30-131.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky0lg2LNtz3bcy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 11:27:40 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R231e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=32; SR=0;
 TI=SMTPD_---0VCo8GaE_1652146048; 
Received: from 30.15.214.13(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCo8GaE_1652146048) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 10 May 2022 09:27:31 +0800
Message-ID: <86671cb8-51e7-0e8e-430a-a325887391b3@linux.alibaba.com>
Date: Tue, 10 May 2022 09:28:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
To: Peter Xu <peterx@redhat.com>, Mike Kravetz <mike.kravetz@oracle.com>
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <c91e04ebb792ef7b72966edea8bd6fa2dfa5bfa7.1651216964.git.baolin.wang@linux.alibaba.com>
 <20220429220214.4cfc5539@thinkpad>
 <bcb4a3b0-4fcd-af3a-2a2c-fd662d9eaba9@linux.alibaba.com>
 <20220502160232.589a6111@thinkpad>
 <48a05075-a323-e7f1-9e99-6c0d106eb2cb@linux.alibaba.com>
 <20220503120343.6264e126@thinkpad>
 <927dfbf4-c899-b88a-4d58-36a637d611f9@oracle.com>
 <YnlEQvipCM6hnIYT@xz-m1.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <YnlEQvipCM6hnIYT@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 linux-s390@vger.kernel.org, arnd@arndb.de, ysato@users.sourceforge.jp,
 deller@gmx.de, catalin.marinas@arm.com,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, borntraeger@linux.ibm.com,
 gor@linux.ibm.com, hca@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, svens@linux.ibm.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/10/2022 12:41 AM, Peter Xu wrote:
> On Fri, May 06, 2022 at 12:07:13PM -0700, Mike Kravetz wrote:
>> On 5/3/22 03:03, Gerald Schaefer wrote:
>>> On Tue, 3 May 2022 10:19:46 +0800
>>> Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
>>>> On 5/2/2022 10:02 PM, Gerald Schaefer wrote:
> 
> [...]
> 
>>>> Please see previous code, we'll use the original pte value to check if
>>>> it is uffd-wp armed, and if need to mark it dirty though the hugetlbfs
>>>> is set noop_dirty_folio().
>>>>
>>>> pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
>>>
>>> Uh, ok, that wouldn't work on s390, but we also don't have
>>> CONFIG_PTE_MARKER_UFFD_WP / HAVE_ARCH_USERFAULTFD_WP set, so
>>> I guess we will be fine (for now).
>>>
>>> Still, I find it a bit unsettling that pte_install_uffd_wp_if_needed()
>>> would work on a potential hugetlb *pte, directly de-referencing it
>>> instead of using huge_ptep_get().
>>>
>>> The !pte_none(*pte) check at the beginning would be broken in the
>>> hugetlb case for s390 (not sure about other archs, but I think s390
>>> might be the only exception strictly requiring huge_ptep_get()
>>> for de-referencing hugetlb *pte pointers).
> 
> We could have used is_vm_hugetlb_page(vma) within the helper so as to
> properly use either generic pte or hugetlb version of pte fetching.  We may
> want to conditionally do set_[huge_]pte_at() too at the end.
> 
> I could prepare a patch for that even if it's not really anything urgently
> needed. I assume that won't need to block this patchset since we need the
> pteval for pte_dirty() check anyway and uffd-wp definitely needs it too.

OK. Thanks Peter.
