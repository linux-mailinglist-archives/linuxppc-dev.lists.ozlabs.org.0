Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C38024C3D48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 05:34:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4cPT0dMVz3c9v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 15:34:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uvtrsu50;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=dinguyen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uvtrsu50; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4cNl6Wqjz2yfm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 15:33:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D636B829CF;
 Fri, 25 Feb 2022 04:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2F6C340E7;
 Fri, 25 Feb 2022 04:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645763634;
 bh=uh4UnFdDR53Ujc6m18f6ctjt+AIyhJXv2xufWpNaVhA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uvtrsu50Hf9ISgTqjw2cZIY/fdalMvrStTdfqoQM3mdhWwRTlcM+di3Mlxj2LfRYC
 sL2lOFI5CCKzGB0MNHSMJUWPqE4dtIOpz2JXIrS4+Xkvjw7ulJEnCWAELTi2BsI79T
 +YcmqfASppeT6+G8sHwqPvTdqA+0hk873k0laznUkKMLOPw4ZEEscH10+2t1L5fKp+
 8BfsQshsS4Im5IcgpwMXaxmFYPmHS4QO6tZE5Cu6VT+1C4lCHB7iNpJZvNEdHwtoNJ
 zTpbMfhiIoucAZFTRmPZuLhWqy/lBlhaelfx8iUJ+lK7d4LQiirbG9AaOIPIgpnmXG
 aNgH1u0nAoM1w==
Message-ID: <3927b6f5-c8d0-1421-407d-850ede02dd0f@kernel.org>
Date: Thu, 24 Feb 2022 22:33:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org>
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
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@redhat.com, geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, shorne@gmail.com,
 monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, linux-mips@vger.kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/16/22 07:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are no remaining callers of set_fs(), so CONFIG_SET_FS
> can be removed globally, along with the thread_info field and
> any references to it.
> 
> This turns access_ok() into a cheaper check against TASK_SIZE_MAX.
> 
> With CONFIG_SET_FS gone, so drop all remaining references to
> set_fs()/get_fs(), mm_segment_t and uaccess_kernel().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/Kconfig                              |  3 -
>   arch/alpha/Kconfig                        |  1 -
>   arch/alpha/include/asm/processor.h        |  4 --
>   arch/alpha/include/asm/thread_info.h      |  2 -
>   arch/alpha/include/asm/uaccess.h          | 19 ------
>   arch/arc/Kconfig                          |  1 -
>   arch/arc/include/asm/segment.h            | 20 -------
>   arch/arc/include/asm/thread_info.h        |  3 -
>   arch/arc/include/asm/uaccess.h            |  1 -
>   arch/arm/lib/uaccess_with_memcpy.c        | 10 ----
>   arch/csky/Kconfig                         |  1 -
>   arch/csky/include/asm/processor.h         |  2 -
>   arch/csky/include/asm/segment.h           | 10 ----
>   arch/csky/include/asm/thread_info.h       |  2 -
>   arch/csky/include/asm/uaccess.h           |  3 -
>   arch/csky/kernel/asm-offsets.c            |  1 -
>   arch/h8300/Kconfig                        |  1 -
>   arch/h8300/include/asm/processor.h        |  1 -
>   arch/h8300/include/asm/segment.h          | 40 -------------
>   arch/h8300/include/asm/thread_info.h      |  3 -
>   arch/h8300/kernel/entry.S                 |  1 -
>   arch/h8300/kernel/head_ram.S              |  1 -
>   arch/h8300/mm/init.c                      |  6 --
>   arch/h8300/mm/memory.c                    |  1 -
>   arch/hexagon/Kconfig                      |  1 -
>   arch/hexagon/include/asm/thread_info.h    |  6 --
>   arch/hexagon/kernel/process.c             |  1 -
>   arch/microblaze/Kconfig                   |  1 -
>   arch/microblaze/include/asm/thread_info.h |  6 --
>   arch/microblaze/include/asm/uaccess.h     | 24 --------
>   arch/microblaze/kernel/asm-offsets.c      |  1 -
>   arch/microblaze/kernel/process.c          |  1 -
>   arch/nds32/Kconfig                        |  1 -
>   arch/nds32/include/asm/thread_info.h      |  4 --
>   arch/nds32/include/asm/uaccess.h          | 15 +----
>   arch/nds32/kernel/process.c               |  5 +-
>   arch/nds32/mm/alignment.c                 |  3 -
>   arch/nios2/Kconfig                        |  1 -
>   arch/nios2/include/asm/thread_info.h      |  9 ---
>   arch/nios2/include/asm/uaccess.h          | 12 ----

For NIOS2:

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
