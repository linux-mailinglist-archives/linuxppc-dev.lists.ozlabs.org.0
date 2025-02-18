Return-Path: <linuxppc-dev+bounces-6326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A361A3A7DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 20:43:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yy90t4Jb9z2ysv;
	Wed, 19 Feb 2025 06:42:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739907774;
	cv=none; b=RDVy5Q2RaG9OTQv27J8RiN50cZUSN/j4FgvLvixNcDbJ3iN7gN1Fxd2VNHJ776LTUIVO83h7B+ZGG2GlY5bwOHo8X/RgpPARux8Dti9wsfFWgR0spEBOlMr87Ahr2a/6nX/MkN+ZseSd2bOotYU6w7zeH5dcAopYQkDSX7fB4rsbqmB8WZWBlJayvV8r53CtUvSPDm0yzk78qPkJfI0PO6C64JLMclCna26cUp+s9H06brcsVVflz2aLsJnlmh2fBNv5pDPSUzir8wmXveYY0smEamp95hzSUQh09DXNIQ/EZZe2gedFYLOdWVqS+mIeQeDRIY4LnXkAbjPTVIwdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739907774; c=relaxed/relaxed;
	bh=l0OefYp6gIJsoBkqWu85YVPRb1yh3g60mRPL0+SvOSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alH0IlGzabxAo1dlZDknlr24vDK1RWE5Zs9dwS1/1Dq/VeoLmV3lmK+83BqTjbqthC04EfbWlsQXRzpou1r2zhosydDF3TF1OgENnsOMGY3d2Wz4Mo6OnnRG5eGaylKZHogaI6MwXzVwc6/DOn+baygBP6CFoNc5EBzVuE18KdT8qpvASa7of385Wf8YPUeZNwuoL358F7jn28LVQax10Hv0B/0LC7x6U+HIGvHhFi9kPw3osEcvMejJvHGARm+0HEAeVeCQh94wWHMIqM3dLo4ZYzvIiC7/aI8y/TP855NlsKUGCt4ApcYLHSIXYRYimZxDjyH8exPpew7OZBAsEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yy90s0pQZz2ygQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 06:42:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0790A414A0;
	Tue, 18 Feb 2025 19:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637C7C4CEE2;
	Tue, 18 Feb 2025 19:42:44 +0000 (UTC)
Date: Tue, 18 Feb 2025 19:42:42 +0000
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
Message-ID: <Z7TisqB5qCIF5nYI@arm.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-5-tongtiangen@huawei.com>
 <Z6zWSXzKctkpyH7-@arm.com>
 <69955002-c3b1-459d-9b42-8d07475c3fd3@huawei.com>
 <Z698SFVqHjpGeGC0@arm.com>
 <e1d2affb-5c6b-00b5-8209-34bbca36f96b@huawei.com>
 <Z7NN5Pa-c5PtIbcF@arm.com>
 <3b181285-2ff3-b77a-867b-725f38ea86d3@huawei.com>
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
In-Reply-To: <3b181285-2ff3-b77a-867b-725f38ea86d3@huawei.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 18, 2025 at 07:51:10PM +0800, Tong Tiangen wrote:
> > > > > 在 2025/2/13 1:11, Catalin Marinas 写道:
> > > > > > On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
> > > > > > > Currently, many scenarios that can tolerate memory errors when copying page
> > > > > > > have been supported in the kernel[1~5], all of which are implemented by
> > > > > > > copy_mc_[user]_highpage(). arm64 should also support this mechanism.
> > > > > > > 
> > > > > > > Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> > > > > > > architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> > > > > > > __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
> > > > > > > 
> > > > > > > Add new helper copy_mc_page() which provide a page copy implementation with
> > > > > > > hardware memory error safe. The code logic of copy_mc_page() is the same as
> > > > > > > copy_page(), the main difference is that the ldp insn of copy_mc_page()
> > > > > > > contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
> > > > > > > main logic is extracted to copy_page_template.S. In addition, the fixup of
> > > > > > > MOPS insn is not considered at present.
> > > > > > 
> > > > > > Could we not add the exception table entry permanently but ignore the
> > > > > > exception table entry if it's not on the do_sea() path? That would save
> > > > > > some code duplication.
[...]
> So we need another way to distinguish the different processing of the
> same exception type on SEA and non-SEA path.

Distinguishing whether the fault is SEA or non-SEA is already done by
the exception handling you are adding. What we don't have though is
information about whether the caller invoked copy_highpage() or
copy_mc_highpage(). That's where the code duplication comes in handy.

It's a shame we need to duplicate identical functions just to have
different addresses to look up in the exception table. We are also short
of caller saved registers to track this information (e.g. an extra
argument to those functions that the exception handler interprets).

I need to think a bit more, we could in theory get the arm64 memcpy_mc()
to return an error code depending on what type of fault it got (e.g.
-EHWPOISON for SEA, -EFAULT for non-SEA). copy_mc_highpage() would
interpret this one and panic if -EFAULT. But we lose some fault details
we normally get on a faulty access like some of the registers.

Well, maybe the simples is still to keep the function duplication. I'll
have another look at the series tomorrow.

-- 
Catalin

