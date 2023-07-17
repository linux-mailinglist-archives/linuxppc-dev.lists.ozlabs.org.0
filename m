Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FDF7558DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 02:33:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R433j4V81z3cQZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:33:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R432B1q3Hz304b
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 10:32:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R43256Nh9z4wjG;
	Mon, 17 Jul 2023 10:32:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230706022405.798157-1-aneesh.kumar@linux.ibm.com>
References: <20230706022405.798157-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm/book3s64/hash/4k: Add pmd_same callback for 4K page size
Message-Id: <168955377883.195506.16141224510140543474.b4-ty@ellerman.id.au>
Date: Mon, 17 Jul 2023 10:29:38 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Hugh Dickins <hughd@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 06 Jul 2023 07:54:05 +0530, Aneesh Kumar K.V wrote:
> With commit 0d940a9b270b ("mm/pgtable: allow pte_offset_map[_lock]() to
> fail") the kernel is now using pmd_same to compare pmd values that are
> pointing to a level 4 page table page. Move the functions out of #ifdef
> CONFIG_TRANSPARENT_HUGEPAGE and add a variant that can work with both 4K
> and 64K page size.
> 
> kernel BUG at arch/powerpc/include/asm/book3s/64/hash-4k.h:141!
> Oops: Exception in kernel mode, sig: 5 [#1]
> LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> .....
> NIP [c00000000048aee0] __pte_offset_map_lock+0xf0/0x164
> LR [c00000000048ae78] __pte_offset_map_lock+0x88/0x164
> Call Trace:
>  0xc0003f000009a340 (unreliable)
>  __handle_mm_fault+0x1340/0x1980
>  handle_mm_fault+0xbc/0x380
>  __get_user_pages+0x320/0x550
>  get_user_pages_remote+0x13c/0x520
>  get_arg_page+0x80/0x1d0
>  copy_string_kernel+0xc8/0x250
>  kernel_execve+0x11c/0x270
>  run_init_process+0xe4/0x10c
>  kernel_init+0xbc/0x1a0
>  ret_from_kernel_user_thread+0x14/0x1c
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm/book3s64/hash/4k: Add pmd_same callback for 4K page size
      https://git.kernel.org/powerpc/c/cf53564b11cef5cdfafc548b172345c9aa753f89

cheers
