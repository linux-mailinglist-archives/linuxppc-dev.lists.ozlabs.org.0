Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B87245A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:20:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbCKz58DHz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 00:20:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FtdmKnJT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FtdmKnJT;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb3g76MXDz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 18:34:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E555A62EB2;
	Tue,  6 Jun 2023 08:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EF9C4339B;
	Tue,  6 Jun 2023 08:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686040464;
	bh=IBidPa4YTyIF5atWcJcRcHpMTfYQvXCVIu3C1ReCwe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtdmKnJTbh0Th4rLzQVdzsyHI4nobuWxYORj11iWeWhGlMgvLcF7mRuKDFP/3SjWj
	 E5Za6vAzdwMhU2Fl7W+Yd14DBVHDobnBWLRAmob+EsEIFyB5d80PGYjA3JIjQUBajb
	 InBHOAv0cNMXRLtMH0xOOu4RRhUp3kA2MYZeOzlJOygnQC7JmPUZ5PDtqTXJfHRnP2
	 1AWELankUVH81S+2sDfidjLYiiUjlwt7jNuRuO9T4Eih88JdAH2XgOt0pTjw3cIR7b
	 lmQCCanbigXkSgQ/AIlWp5wfiem/MA7KeHluPdl6au2zq8eAq591Yb0A87DeofIIFq
	 Tf4L4UWn/XCBw==
Date: Tue, 6 Jun 2023 16:34:15 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH mm-unstable v2 01/10] mm/kvm: add
 mmu_notifier_ops->test_clear_young()
Message-ID: <ZH7vh1GmsV+UCPwv@google.com>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-2-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526234435.662652-2-yuzhao@google.com>
X-Mailman-Approved-At: Wed, 07 Jun 2023 00:19:27 +1000
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fab
 iano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 26, 2023 at 05:44:26PM -0600, Yu Zhao wrote:
> +/*
> + * Architectures that implement kvm_arch_test_clear_young() should override
> + * kvm_arch_has_test_clear_young().
> + *
> + * kvm_arch_has_test_clear_young() is allowed to return false positive, i.e., it
> + * can return true if kvm_arch_test_clear_young() is supported but disabled due
> + * to some runtime constraint. In this case, kvm_arch_test_clear_young() should

Is it a typo here?  s/kvm_arch_test_clear_young/kvm_arch_has_test_clear_young/.

> +static inline int mmu_notifier_clear_young(struct mm_struct *mm,
> +					   unsigned long start,
> +					   unsigned long end)
> +{
> +	return 0;
> +}
> +

This looks irrelevant to the patch but a fix for commit 1d7715c676a1
("mmu-notifier: add clear_young callback") instead.
