Return-Path: <linuxppc-dev+bounces-6268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9AEA3870A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 15:55:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxQh04mwBz2yyD;
	Tue, 18 Feb 2025 01:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739804144;
	cv=none; b=HxIYfAaMWy6dgxqhvJNnS9tGvCBo2dJTql1hHNput0Kh6X80SusSYZCe2oiF8fi0tQv17eC9edlmCMzccvy9atItR2GWL8442nPb8n+/djD9HkJVQrSOLlQpQGt2tX8tQufesvjrnusbw+UUNGTZHxoZB6Jh02JoGcn3fIDl0kWW5IA2ugR4N6VOfGCVuY5tpmkqiMa3uviWOnodj4XCFXUrdsKc1NC0p0hGAtOrlfELWKirD1t7Ows4tfIqIORcx1kTyzgndc0xRh1PIl18uOFE1dgdYjji/46cSTezJu0JHHImpoA01xCh+agwiwud5lHPvUGIbT1qlxHEp90WVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739804144; c=relaxed/relaxed;
	bh=+M34uV/zkct1kEAaK2pLJ3/QmCI3GfHP6imSRuJbcm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmhCPv/66+XQlB8Qav/4s2nv7nj89ZKbZqlCPycHy4le6Alzg8MdCqgM2kMNOarrMWkgfPw9f10rPvTLcn+kfBMC4am05yqe+oObB6NzDmkHWpk/a7929AXLRrgnisseLXK+Nm/Hn8XXN1LCK/OslxMGJ3Ys2neECf43IlKRPQeQbNgH3ZNix2JDrbVUU6sCiA3Wj3I4SkhxrMxEFqec2zgDCi0uGKS2/ALNaSS9BxE/lgJhMpMVqzDaVqpEHrfViWIwJfkyeId+ZpSXskoQOdRHRmp0SHbmWeuHiNN9l/wZNJK9Hds2/uO/GQfbbUbvnVzsb0B5bOD1JB3PaDijFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxQgz1R1qz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 01:55:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E9CC5C57AC;
	Mon, 17 Feb 2025 14:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453CDC4CED1;
	Mon, 17 Feb 2025 14:55:35 +0000 (UTC)
Date: Mon, 17 Feb 2025 14:55:32 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, wangkefeng.wang@huawei.com,
	Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH v13 4/5] arm64: support copy_mc_[user]_highpage()
Message-ID: <Z7NN5Pa-c5PtIbcF@arm.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-5-tongtiangen@huawei.com>
 <Z6zWSXzKctkpyH7-@arm.com>
 <69955002-c3b1-459d-9b42-8d07475c3fd3@huawei.com>
 <Z698SFVqHjpGeGC0@arm.com>
 <e1d2affb-5c6b-00b5-8209-34bbca36f96b@huawei.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1d2affb-5c6b-00b5-8209-34bbca36f96b@huawei.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 17, 2025 at 04:07:49PM +0800, Tong Tiangen wrote:
> 在 2025/2/15 1:24, Catalin Marinas 写道:
> > On Fri, Feb 14, 2025 at 10:49:01AM +0800, Tong Tiangen wrote:
> > > 在 2025/2/13 1:11, Catalin Marinas 写道:
> > > > On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
> > > > > Currently, many scenarios that can tolerate memory errors when copying page
> > > > > have been supported in the kernel[1~5], all of which are implemented by
> > > > > copy_mc_[user]_highpage(). arm64 should also support this mechanism.
> > > > > 
> > > > > Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> > > > > architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> > > > > __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
> > > > > 
> > > > > Add new helper copy_mc_page() which provide a page copy implementation with
> > > > > hardware memory error safe. The code logic of copy_mc_page() is the same as
> > > > > copy_page(), the main difference is that the ldp insn of copy_mc_page()
> > > > > contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
> > > > > main logic is extracted to copy_page_template.S. In addition, the fixup of
> > > > > MOPS insn is not considered at present.
> > > > 
> > > > Could we not add the exception table entry permanently but ignore the
> > > > exception table entry if it's not on the do_sea() path? That would save
> > > > some code duplication.
> > > 
> > > I'm sorry, I didn't catch your point, that the do_sea() and non do_sea()
> > > paths use different exception tables?
> > 
> > No, they would have the same exception table, only that we'd interpret
> > it differently depending on whether it's a SEA error or not. Or rather
> > ignore the exception table altogether for non-SEA errors.
> 
> You mean to use the same exception type (EX_TYPE_KACCESS_ERR_ZERO) and
> then do different processing on SEA errors and non-SEA errors, right?

Right.

> If so, some instructions of copy_page() did not add to the exception
> table will be added to the exception table, and the original logic will
> be affected.
> 
> For example, if an instruction is not added to the exception table, the
> instruction will panic when it triggers a non-SEA error. If this
> instruction is added to the exception table because of SEA processing,
> and then a non-SEA error is triggered, should we fix it?

No, we shouldn't fix it. The exception table entries have a type
associated. For a non-SEA error, we preserve the original behaviour even
if we find a SEA-specific entry in the exception table. You already need
such logic even if you duplicate the code for configurations where you
have MC enabled.

-- 
Catalin

