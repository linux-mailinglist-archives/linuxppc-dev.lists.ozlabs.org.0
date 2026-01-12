Return-Path: <linuxppc-dev+bounces-15536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CEFD1194B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 10:46:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqSF71QScz304h;
	Mon, 12 Jan 2026 20:46:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768211179;
	cv=none; b=U4TT0geCVwyP5iZyhnQmFnRrJgXTjg/FC9CoO44Wq/Qc7d2Xq+u+UkQSAR0SblAy1ND92ICeR3vhbIR6ysdzgz0Y06z+PWCuBUTvII4mtnpwgmU4FZiSIpUC6huy4QCLi/ml4JzfF45yvUJOA5haUlg+3WJibTc8IXyGHQW9v5Xv+bkVLhygcLZFr4JZks+EVAz7PdPvzi/+BKZsslm/4KJrhLP4H3GD9fW1k5Jn6aydt4OqjWnz98SgkVdKO2lb9Fj+BGC9r1Nlz3b4NJMHYifr2zpuwXqra0IX6xRfQC6Swy9c8J7IQttateWgZgs2SaULxIYgJAyKC0yLiQ/oPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768211179; c=relaxed/relaxed;
	bh=fdMLvjeapQ/bfLWsnXGxaJQDtJcQspJseu6jDbRyKHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXS9rCHk1ifjV0PEx7tsiPnelrsgOgWVwovRjb2ZkbDiqS6+xsZwecF4J6BWqXoCINNY18rSjKX9PqU60yoU9A2OAh/ubr9d4C3wqsId5YPoINqzkL6I5Xbs9u7RHt6fDydpkOGCM20vxM/IKFc7GbFr0wy7ZtRF1Jyp4pVX/egljKtUI6yavvanieIjh6585jT8/oBYDqux/uwrM1UQnStqDzy41m0y86DVC7UsBf/4d2422I4DPx6A23b9viAFhHWCXJB6JMoPVWkdqjnagJweGP2Tods4R3rTxiXpjJ6QF7q/CfTUp1EJ0cZXzpBNE2B/9tv9XtV6QuF+U1b3Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqSF60Dg9z2ywy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 20:46:16 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A486339;
	Mon, 12 Jan 2026 01:45:37 -0800 (PST)
Received: from [10.57.48.185] (unknown [10.57.48.185])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5C6F3F694;
	Mon, 12 Jan 2026 01:45:36 -0800 (PST)
Message-ID: <f287a467-e707-459e-96b2-ae0bb0fdce37@arm.com>
Date: Mon, 12 Jan 2026 10:45:34 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-15-kevin.brodsky@arm.com>
 <1e123306-0efe-457f-953b-d4a27ce6bc60@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <1e123306-0efe-457f-953b-d4a27ce6bc60@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09/01/2026 16:07, David Hildenbrand (Red Hat) wrote:
>
> Very nice test 🙂

Thanks!

>
> I think I prefer the EXPORT_SYMBOL_IF_KUNIT over disabling the test
> for PPC and over making lazy_mmu_mode_enable() non-inlined functions
> with an exported symbol

The EXPORT_SYMBOL_IF_KUNIT approach is what's currently in mm-unstable
(with the fixes from Ritesh and me).

- Kevin

