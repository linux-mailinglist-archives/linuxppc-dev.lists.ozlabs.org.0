Return-Path: <linuxppc-dev+bounces-6201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C2A3647B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 18:24:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yvf785MGCz30W0;
	Sat, 15 Feb 2025 04:24:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739553876;
	cv=none; b=dCdH3AxginJ9Mf5uUGl7yDvbrrEwERuLiiXHTiuy1YiJWt/sCVwOFcw0vTX9phOkSARPGiZkHF4n0NlCuflMQHTq0kJKy8EwqLqO3m1DGgAJHessiaxpXG3sZWPkZPTbtfbAUrexNEWHCKtb0V6byDDnCYiYbB5Bw6M18LCCEd9yGO5kStkvQRSCG6qUEhfbhJ/NBwI8bXUUnR0OIqylZmX8pmf1vLjC/wmb9F3IccBn+b1eYxTY8U0E1o7RLNk/gCT6FX4I+DCwr7Q2KSrii5ASC7wN1RwXEHmGfB0aXMUHPJ+4bfGCGVbiKeCS+uHyyGbFXAkQhnwPfNvtzQQtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739553876; c=relaxed/relaxed;
	bh=5YtMi32FHQ7+fawZb+ziAVgUu2Jkosuh7gVhJkARHqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3/jjmcXs5q573lnPbenSCtnDXHPWsGx42KoiYlqkMJyZYO2Fl1DQkMUtyowaS2Cx3Yn1fZLo0raaLoTRBdqtBlZpipMz7IG+v3Zsm/orvvpAozfDDYzQIOoz8L8PUUydGv8eKioYMz4s4lX5Bgo0gBQOFIRs74ctfWhGbV2I/jlDZQ+JBsY2kH+O1JfeWGuO0JFgGVrlhJV0E7e1z+qJmE5ISQNbmlNDKqqyhznoc+jBWFR6U+vtRaV6MaSax9MwitnM9bjNkqxSgI/hysMjSkAYTsx3uZGsNYv2y93E8t3gO4mMBaXOT3fiZ1T1ygfoARwzqDsQJLqahOKunsm4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yvf772ZC3z2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 04:24:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30CE55C5A25;
	Fri, 14 Feb 2025 17:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF84C4CED1;
	Fri, 14 Feb 2025 17:24:27 +0000 (UTC)
Date: Fri, 14 Feb 2025 17:24:24 +0000
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
Message-ID: <Z698SFVqHjpGeGC0@arm.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-5-tongtiangen@huawei.com>
 <Z6zWSXzKctkpyH7-@arm.com>
 <69955002-c3b1-459d-9b42-8d07475c3fd3@huawei.com>
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
In-Reply-To: <69955002-c3b1-459d-9b42-8d07475c3fd3@huawei.com>
X-Spam-Status: No, score=-2.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 14, 2025 at 10:49:01AM +0800, Tong Tiangen wrote:
> 在 2025/2/13 1:11, Catalin Marinas 写道:
> > On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
> > > Currently, many scenarios that can tolerate memory errors when copying page
> > > have been supported in the kernel[1~5], all of which are implemented by
> > > copy_mc_[user]_highpage(). arm64 should also support this mechanism.
> > > 
> > > Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> > > architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> > > __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
> > > 
> > > Add new helper copy_mc_page() which provide a page copy implementation with
> > > hardware memory error safe. The code logic of copy_mc_page() is the same as
> > > copy_page(), the main difference is that the ldp insn of copy_mc_page()
> > > contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
> > > main logic is extracted to copy_page_template.S. In addition, the fixup of
> > > MOPS insn is not considered at present.
> > 
> > Could we not add the exception table entry permanently but ignore the
> > exception table entry if it's not on the do_sea() path? That would save
> > some code duplication.
> 
> I'm sorry, I didn't catch your point, that the do_sea() and non do_sea()
> paths use different exception tables?

No, they would have the same exception table, only that we'd interpret
it differently depending on whether it's a SEA error or not. Or rather
ignore the exception table altogether for non-SEA errors.

> My understanding is that the
> exception table entry problem is fine. After all, the search is
> performed only after a fault trigger. Code duplication can be solved by
> extracting repeated logic to a public file.

If the new exception table entries are only taken into account for SEA
errors, why do we need a duplicate copy_mc_page() function generated?
Isn't the copy_page() and copy_mc_page() code identical (except for the
additional labels to jump to for the exception)?

-- 
Catalin

