Return-Path: <linuxppc-dev+bounces-6133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F14ECA32D39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 18:18:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtQ543JYMz2yVt;
	Thu, 13 Feb 2025 04:18:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739380712;
	cv=none; b=K6M5TeE5XLouNfmcuBI/uys6PlF8Znf5hZTDUim+v/1DeZGGAWsXTyVLLNTs9Ey0nxPIfIabzIDKh7biiHLqgK5yLtXtvjh0eoP5A7DuZ9UdkINDBAv9VoBYmuOA4EQ+xZrg/O64dbycOAp1Z54isiSxZsWdyPvezQvxVYsFgyewsS6iEv5N2jJF2n9mr8x7wMT476SwtLTx246ztJFVK8EixL30r8tHO1PSIb3UvcFOAJXvAmJtaZsfwcJDDLOLQgADdAVS1lJ+RI8CvZnGD0mlf3a6th4jm4Y7YRH4+EvRHdPsMbYmlAYbcGC6NGhOXnD9+jGurm5LhYGhC/zE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739380712; c=relaxed/relaxed;
	bh=Rlgz5seG82Ux+fkG2i/legtN8SP4dQp1hc1HwNMZJ+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAXivXmngxc4qKstbyDivRH+KzCBT7xC72XGFEOE13Grq9Hck2X+vUuOR3lmZWxJuhk1+ybgCjYMUHIu8u1Z+xR2n9T/qdSul31Qav3fuU/yTUZkXfXwI9SqRpsRaq1lL4RSnccf7QO83mvDtCYW9wtdjBXfQT2AWzj64740iMI33NHs9pyInquDbn51FJexE/VB88LfMrOHfb4Y+013JZX++Ye9lGrdJEmZHvWmEvxnVrrGlmSAUsT7oGRYMMKMXKReJ+BspYrJ1K1d7/ICgwIYnvX1z4lLibBKvW+77q4yYtfr46jYXIpu4lZAH0AYaeEwsrPYv/dsyclkeFIVnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtQ534wBTz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 04:18:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6A1D5C5FFC;
	Wed, 12 Feb 2025 17:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15C2C4CEDF;
	Wed, 12 Feb 2025 17:18:23 +0000 (UTC)
Date: Wed, 12 Feb 2025 17:18:21 +0000
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
Subject: Re: [PATCH v13 5/5] arm64: introduce copy_mc_to_kernel()
 implementation
Message-ID: <Z6zX3Ro60sMH7C13@arm.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-6-tongtiangen@huawei.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209024257.3618492-6-tongtiangen@huawei.com>
X-Spam-Status: No, score=-2.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 09, 2024 at 10:42:57AM +0800, Tong Tiangen wrote:
> The copy_mc_to_kernel() helper is memory copy implementation that handles
> source exceptions. It can be used in memory copy scenarios that tolerate
> hardware memory errors(e.g: pmem_read/dax_copy_to_iter).
> 
> Currently, only x86 and ppc support this helper, Add this for ARM64 as
> well, if ARCH_HAS_COPY_MC is defined, by implementing copy_mc_to_kernel()
> and memcpy_mc() functions.
> 
> Because there is no caller-saved GPR is available for saving "bytes not
> copied" in memcpy(), the memcpy_mc() is referenced to the implementation
> of copy_from_user(). In addition, the fixup of MOPS insn is not considered
> at present.

Same question as on the previous patch, can we not avoid the memcpy()
duplication if the only difference is entries in the exception table?
IIUC in patch 2 fixup_exception() even ignores the new type. The error
must come on the do_sea() path.

-- 
Catalin

