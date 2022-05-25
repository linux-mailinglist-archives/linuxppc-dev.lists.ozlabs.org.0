Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C253387E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 10:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7PSR2glyz3bqg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 18:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L7PRz4QDNz303k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 18:31:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24AEB1FB;
 Wed, 25 May 2022 01:31:08 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.0.228])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3E743F73D;
 Wed, 25 May 2022 01:31:02 -0700 (PDT)
Date: Wed, 25 May 2022 09:30:55 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v4 3/7] arm64: add support for machine check error
 safe
Message-ID: <Yo3pP/Y+6HHuVBns@FVFF77S0Q05N>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-4-tongtiangen@huawei.com>
 <Yn54mA7KnlAs1dER@lakrids>
 <46e5954c-a9a8-f4a8-07cc-de42e2753051@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46e5954c-a9a8-f4a8-07cc-de42e2753051@huawei.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>,
 Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 02:29:54PM +0800, Tong Tiangen wrote:
> 
> 
> 在 2022/5/13 23:26, Mark Rutland 写道:
> > On Wed, Apr 20, 2022 at 03:04:14AM +0000, Tong Tiangen wrote:
> > > During the processing of arm64 kernel hardware memory errors(do_sea()), if
> > > the errors is consumed in the kernel, the current processing is panic.
> > > However, it is not optimal.
> > > 
> > > Take uaccess for example, if the uaccess operation fails due to memory
> > > error, only the user process will be affected, kill the user process
> > > and isolate the user page with hardware memory errors is a better choice.
> > 
> > Conceptually, I'm fine with the idea of constraining what we do for a
> > true uaccess, but I don't like the implementation of this at all, and I
> > think we first need to clean up the arm64 extable usage to clearly
> > distinguish a uaccess from another access.
> 
> OK,using EX_TYPE_UACCESS and this extable type could be recover, this is
> more reasonable.

Great.

> For EX_TYPE_UACCESS_ERR_ZERO, today we use it for kernel accesses in a
> couple of cases, such as
> get_user/futex/__user_cache_maint()/__user_swpX_asm(), 

Those are all user accesses.

However, __get_kernel_nofault() and __put_kernel_nofault() use
EX_TYPE_UACCESS_ERR_ZERO by way of __{get,put}_mem_asm(), so we'd need to
refactor that code to split the user/kernel cases higher up the callchain.

> your suggestion is:
> get_user continues to use EX_TYPE_UACCESS_ERR_ZERO and the other cases use
> new type EX_TYPE_FIXUP_ERR_ZERO?

Yes, that's the rough shape. We could make the latter EX_TYPE_KACCESS_ERR_ZERO
to be clearly analogous to EX_TYPE_UACCESS_ERR_ZERO, and with that I susepct we
could remove EX_TYPE_FIXUP.

Thanks,
Mark.
