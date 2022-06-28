Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F455EA6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 19:03:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXWBY4xnnz3dxp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 03:03:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cKquhmx4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cKquhmx4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXW9x4XnHz3bls
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 03:02:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCB49618E2;
	Tue, 28 Jun 2022 17:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04EAC341CA;
	Tue, 28 Jun 2022 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656435761;
	bh=S32FMs79QFdhccYVIsfN0jeTR/UCl/EkVGQ6c7PUe/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cKquhmx4PgwAxI9qzdMAd6hTzqjou6Mp9wbsrIxG9MrcTQIz8S0N5qfU8rEhUwMsS
	 ZDwGlgYCSawYzZBh/iKkxouLSsicKaiju5HB7A+pe3Ny5B/SUfQwFtkauzlTE9GbTE
	 V1aIBruQfWCLpph393iPzJ49/g5Mqcd7mUBnvBCkaad0xJsmEp0iuy3nRkO7bb+AOB
	 1STJ9D0SGklLeomYlv/fn6AubEfvJz6DCfKv1qT5gCBeCH4HOLw5WTwI3JnMxEScPz
	 iXk1YB5IwvsgsOsc9a/dCZXcbHBQJhQVk9WNAh8VRdGC2CJMBii26enWIVvTFB3ekn
	 Xa1ZY9l+XSGZA==
From: Will Deacon <will@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Tong Tiangen <tongtiangen@huawei.com>,
	x86@kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Paul Mackerras <paulus@samba.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH -next v6 00/10]arm64: add machine check safe support
Date: Tue, 28 Jun 2022 18:02:29 +0100
Message-Id: <165641466190.2591451.4767914938130447014.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220621072638.1273594-1-tongtiangen@huawei.com>
References: <20220621072638.1273594-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>, kernel-team@android.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Guohanjun <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Jun 2022 07:26:28 +0000, Tong Tiangen wrote:
> With the increase of memory capacity and density, the probability of
> memory error increases. The increasing size and density of server RAM
> in the data center and cloud have shown increased uncorrectable memory
> errors.
> 
> Currently, the kernel has a mechanism to recover from hardware memory
> errors. This patchset provides an new recovery mechanism.
> 
> [...]

Applied first six patches to arm64 (for-next/extable), thanks!

[01/10] arm64: extable: add new extable type EX_TYPE_KACCESS_ERR_ZERO support
        https://git.kernel.org/arm64/c/4953fc3d3270
[02/10] arm64: asm-extable: move data fields
        https://git.kernel.org/arm64/c/5519d7de2f8e
[03/10] arm64: asm-extable: add asm uacess helpers
        https://git.kernel.org/arm64/c/59e8a1ce8f7b
[04/10] arm64: extable: make uaaccess helper use extable type EX_TYPE_UACCESS_ERR_ZERO
        https://git.kernel.org/arm64/c/c4ed0d73ede9
[05/10] arm64: extable: move _cond_extable to _cond_uaccess_extable
        https://git.kernel.org/arm64/c/e4208e80a353
[06/10] arm64: extable: cleanup redundant extable type EX_TYPE_FIXUP
        https://git.kernel.org/arm64/c/bacac637025c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

