Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6728451C108
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 15:42:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvFHh2cPQz3bpf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:42:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvFHD1ZBNz3bns
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 23:42:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C4BA61E77;
 Thu,  5 May 2022 13:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D69C385A8;
 Thu,  5 May 2022 13:41:51 +0000 (UTC)
Date: Thu, 5 May 2022 14:41:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v4 4/7] arm64: add copy_{to, from}_user to machine
 check safe
Message-ID: <YnPUHC3GlZs6XHU4@arm.com>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-5-tongtiangen@huawei.com>
 <YnJU4NIrJmHLawgk@arm.com>
 <7da54d72-e5fa-41b5-67ea-a0b084e4c94a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7da54d72-e5fa-41b5-67ea-a0b084e4c94a@huawei.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>,
 Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05, 2022 at 02:39:43PM +0800, Tong Tiangen wrote:
> 在 2022/5/4 18:26, Catalin Marinas 写道:
> > On Wed, Apr 20, 2022 at 03:04:15AM +0000, Tong Tiangen wrote:
> > > Add copy_{to, from}_user() to machine check safe.
> > > 
> > > If copy fail due to hardware memory error, only the relevant processes are
> > > affected, so killing the user process and isolate the user page with
> > > hardware memory errors is a more reasonable choice than kernel panic.
> > 
> > Just to make sure I understand - we can only recover if the fault is in
> > a user page. That is, for a copy_from_user(), we can only handle the
> > faults in the source address, not the destination.
> 
> At the beginning, I also thought we can only recover if the fault is in a
> user page.
> After discussion with a Mark[1], I think no matter user page or kernel page,
> as long as it is triggered by the user process, only related processes will
> be affected. According to this
> understanding, it seems that all uaccess can be recovered.
> 
> [1]https://patchwork.kernel.org/project/linux-arm-kernel/patch/20220406091311.3354723-6-tongtiangen@huawei.com/

We can indeed safely skip this copy and return an error just like
pretending there was a user page fault. However, my point was more
around the "isolate the user page with hardware memory errors". If the
fault is on a kernel address, there's not much you can do about. You'll
likely trigger it later when you try to access that address (maybe it
was freed and re-allocated). Do we hope we won't get the same error
again on that kernel address?

-- 
Catalin
