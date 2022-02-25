Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7B84C3D33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 05:31:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4cKb3f16z3cCs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 15:31:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JQKxpsom;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=dinguyen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JQKxpsom; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4cJx2TPRz2yLT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 15:30:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 364CE618C4;
 Fri, 25 Feb 2022 04:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCC6C340E7;
 Fri, 25 Feb 2022 04:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645763438;
 bh=K1RaOpayOFOl9YrWjbFso6AxJRaB7d/hqz1cXZ69p68=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JQKxpsomaZBRaWmc5cvV6ib4A8rCg4TPitG6KtMN/3RrAcjKVTJT4yK2eDFUJ+cMs
 GGe2lQ0KwF+iTYeA1pEDWDB2RtmKuBiOhrq1UD43RSIKmGPeCxSvHgFkEuaxQ4Olvr
 2eAzhesO8mAMjdIVrsZ1nZFTt4sdpEeKUGFwUAwfuxPbqH/Wkgj8BdxrL7OB3VWTTd
 G6bo95wROzxmQJyLOX4tRd/qfCxU6mfLup3kLD3UTh5ardnvCDEhsvub+4i3ykdyNs
 K3IteETxgQ/sIy9c1oYc4VbyW0VV1YzXNoLx5Km6wu9MsETEo+EXnMVoPFvUjaAbVy
 MOmcxBoXdOugg==
Message-ID: <824a2d98-e992-0406-518f-adcde2a1372a@kernel.org>
Date: Thu, 24 Feb 2022 22:30:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 12/18] uaccess: fix type mismatch warnings from
 access_ok()
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-13-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-13-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>,
 bcain@codeaurora.org, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, shorne@gmail.com, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 linux-mips@vger.kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/16/22 07:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On some architectures, access_ok() does not do any argument type
> checking, so replacing the definition with a generic one causes
> a few warnings for harmless issues that were never caught before.
> 
> Fix the ones that I found either through my own test builds or
> that were reported by the 0-day bot.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arc/kernel/process.c           |  2 +-
>   arch/arm/kernel/swp_emulate.c       |  2 +-
>   arch/arm/kernel/traps.c             |  2 +-
>   arch/csky/kernel/signal.c           |  2 +-
>   arch/mips/sibyte/common/sb_tbprof.c |  6 +++---
>   arch/nios2/kernel/signal.c          | 20 +++++++++++---------

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
