Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141D47BEFAD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 02:21:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=uQroNQB6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Gmg4W2jz3dDk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 11:21:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=uQroNQB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Glq5wPfz2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 11:21:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 24A1BB8092E;
	Tue, 10 Oct 2023 00:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9ABC433C7;
	Tue, 10 Oct 2023 00:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1696897264;
	bh=M2oTNjw+9oq9sArieyw8dMMJbRTMAqtdZlPZHyT7WZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uQroNQB6k9niizpuC63Fv9XYLdlrpW9Bngk5KLAi5UgTJ0dWDAlqM1+rDzHRmGwqd
	 lLJ3q8SiOEEdslQ7bN/Q4s/CPzA7AyOORjiP90Km+SwxICg3mRocb8bvgCiY+4DJfw
	 Mc5plxr0GwlubQrxCTRJ0fTbVOWmk3liNJnBW7i0=
Date: Mon, 9 Oct 2023 17:20:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v6 4/9] mm: thp: Introduce anon_orders and
 anon_always_mask sysfs files
Message-Id: <20231009172029.e558c08dd90d9b94fec3a036@linux-foundation.org>
In-Reply-To: <87fs2mrqld.fsf@mail.lhotse>
References: <20230929114421.3761121-1-ryan.roberts@arm.com>
	<20230929114421.3761121-5-ryan.roberts@arm.com>
	<20230929155530.a51e68e03e47a06b6b84c689@linux-foundation.org>
	<87fs2mrqld.fsf@mail.lhotse>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Yu Zhao <yuzhao@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, John Hubbard <jhubbard@nvidia.com>, David Rientjes <rientjes@google.com>, Itaru Kitayama <itaru.kitayama@gmail.com>, linux-arm-kernel@lists.infradead.org, Yin Fengwei <fengwei.yin@intel.com>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 08 Oct 2023 09:54:22 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:

> > I don't know why powerpc's PTE_INDEX_SIZE is variable.
> 
> To allow a single vmlinux to boot using either the Hashed Page Table
> MMU, or Radix Tree MMU, which have different page table geometry.
> 
> That's a pretty crucial feature for distros, so that they can build a
> single kernel to boot on Power8/9/10.

Dumb question: why can't distros ship two kernels and have the boot
loader (or something else) pick the appropriate one?
