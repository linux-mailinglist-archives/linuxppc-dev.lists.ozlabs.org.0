Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7602955C098
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 13:16:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXMTr2vpzz3chr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 21:16:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N70eu5en;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N70eu5en;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXMTF688kz3bq2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 21:15:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C53AB61A78;
	Tue, 28 Jun 2022 11:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E243BC36AE2;
	Tue, 28 Jun 2022 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656414927;
	bh=mvtI/btKWfnTj6WXNoVCJqoXnRiwk3z7k27yaBrHk6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N70eu5enrxm4OiBTiSAzky1+jssaY1i3TRwY+QbOROq19VdriskmFaEvqP85ZzqfP
	 6qq/4zdDHuwpse8fQj+G22hgEoNyy+zmmFrhKeIUq6rS2LSzwiewGVn6u0EQWMHAHc
	 lQv0de9YCL/4tlYXZnL/5ty4nBMsWSiCPjoLT5NevrNiaC9KcXrZsAeuEeqdCMsMtg
	 4nHXglGzIHK2evVEkRuYL9a4ZKsoMckT9CdYW0rohjKedWtBAsZ3xdFu5IN6+EsnF6
	 0PrD1rJAs6gNPi9tz+I0vwpVnXTojbzLDaRO/bS+rdTiW5LGU3b9/kZGxu/9Q3gp2Q
	 FQJK6B45L/mXg==
Date: Tue, 28 Jun 2022 12:15:15 +0100
From: Will Deacon <will@kernel.org>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v6 02/10] arm64: asm-extable: move data fields
Message-ID: <20220628111514.GB23703@willie-the-truck>
References: <20220621072638.1273594-1-tongtiangen@huawei.com>
 <20220621072638.1273594-3-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621072638.1273594-3-tongtiangen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 21, 2022 at 07:26:30AM +0000, Tong Tiangen wrote:
> In subsequent patches we'll need to fill in extable data fields in
> regular assembly files. In preparation for this, move the definitions of
> the extable data fields earlier in asm-extable.h so that they are
> defined for both assembly and C files.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/arm64/include/asm/asm-extable.h | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

This (and the following) patch should retain Mark's authorship information
as they are taken from his git tree:

https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/extable/asm-uaccess

I plan to apply the first six patches for now, so I'll fix that up at the
same time.

Will
