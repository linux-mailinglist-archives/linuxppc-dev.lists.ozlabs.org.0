Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C8551EB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 16:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRX6m4zkrz3cHD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 00:27:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRX6J1sgSz3bqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 00:27:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C925E1596;
	Mon, 20 Jun 2022 07:26:44 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.70.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63A803F534;
	Mon, 20 Jun 2022 07:26:41 -0700 (PDT)
Date: Mon, 20 Jun 2022 15:26:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v5 2/8] arm64: extable: make uaaccess helper use
 extable type EX_TYPE_UACCESS_ERR_ZERO
Message-ID: <YrCDnc8ZjgbHAhGU@FVFF77S0Q05N>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-3-tongtiangen@huawei.com>
 <Yqw6TP3MhEqnQ+2o@FVFF77S0Q05N>
 <4371a7c9-8766-9fee-2558-e6f43f06ad19@huawei.com>
 <0da734f3-5743-3df3-3f90-d92e5bd585ce@huawei.com>
 <Yq3HoUyEcnKKk1AY@FVFF77S0Q05N>
 <684f0362-6e58-753d-32e1-112c6ffe6d12@huawei.com>
 <YrA5f44hySky8v5g@FVFF77S0Q05N>
 <908f4c14-b9cb-71f8-7a3c-7569f7c89033@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <908f4c14-b9cb-71f8-7a3c-7569f7c89033@huawei.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 20, 2022 at 10:13:41PM +0800, Tong Tiangen wrote:
> 
> 
> 在 2022/6/20 17:10, Mark Rutland 写道:
> > On Mon, Jun 20, 2022 at 10:59:12AM +0800, Tong Tiangen wrote:
> > > 在 2022/6/18 20:40, Mark Rutland 写道:
> > > The following errors are reported during compilation:
> > > [...]
> > > arch/arm64/lib/clear_user.S:45: Error: invalid operands (*ABS* and *UND*
> > > sections) for `<<'
> > > [...]
> > 
> > As above, I'm not seeing this.
> > 
> > This suggests that the EX_DATA_REG() macro is going wrong somehow. Assuming the
> > operand types correspond to the LHS and RHS of the expression, this would mean
> > the GPR number is defined, but the REG value is not, and I can't currently see
> > how that can happen.
 
> Now I can compile success, both versions 9.4.0 and 11.2.0.
> 
> I should have made a mistake. There is no problem using your implementation.
> I will send a new version these days.

No problem; thanks for confirming!

Mark.
