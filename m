Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC7C25CC69
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 23:37:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjDfv0LlvzDr8t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 07:37:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Ec6bULyL; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjDcc0q4vzDr6Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 07:35:26 +1000 (AEST)
Received: from X1 (nat-ab2241.sltdut.senawave.net [162.218.216.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1F30206D4;
 Thu,  3 Sep 2020 21:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599168924;
 bh=8lhpq/ItjUmj3MX5tjQcyhgz2GMdUwZAiSEw3suAPEA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ec6bULyL2b36pvkavYfRw2/J6W5pR7LFlcb52maBrMn7dAtkihmTBslUAgaFv8kNo
 80qykYHfEKiKlkbj1mxA7unJVQ1bFk9rDD8AW/quxn81DlitrvfeujDyL47aGlNkSY
 WsgcSmhLyn7lpZqmCRjCc4oKccJm3gB3LW0Kv5ew=
Date: Thu, 3 Sep 2020 14:35:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] mm: check for memory's node later during boot
Message-Id: <20200903143523.02e163bf06be3b48bac7f967@linux-foundation.org>
In-Reply-To: <20200902090911.11363-1-ldufour@linux.ibm.com>
References: <20200902090911.11363-1-ldufour@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: nathanl@linux.ibm.com, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, cheloha@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  2 Sep 2020 11:09:11 +0200 Laurent Dufour <ldufour@linux.ibm.com> wrote:

> register_mem_sect_under_nodem() is checking the memory block's node id only
> if the system state is "SYSTEM_BOOTING". On PowerPC, the memory blocks are
> registered while the system state is "SYSTEM_SCHEDULING", the one before
> SYSTEM_RUNNING.
> 
> The consequence on PowerPC guest with interleaved memory node's ranges is
> that some memory block could be assigned to multiple nodes on sysfs. This
> lately prevents some memory hot-plug and hot-unplug to succeed because
> links are remaining. Such a panic is then displayed:
> 
> ------------[ cut here ]------------
> kernel BUG at /Users/laurent/src/linux-ppc/mm/memory_hotplug.c:1084!
> Oops: Exception in kernel mode, sig: 5 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in: rpadlpar_io rpaphp pseries_rng rng_core vmx_crypto gf128mul binfmt_misc ip_tables x_tables xfs libcrc32c crc32c_vpmsum autofs4
> CPU: 8 PID: 10256 Comm: drmgr Not tainted 5.9.0-rc1+ #25
> NIP:  c000000000403f34 LR: c000000000403f2c CTR: 0000000000000000
> REGS: c0000004876e3660 TRAP: 0700   Not tainted  (5.9.0-rc1+)
> MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24000448  XER: 20040000
> CFAR: c000000000846d20 IRQMASK: 0
> GPR00: c000000000403f2c c0000004876e38f0 c0000000012f6f00 ffffffffffffffef
> GPR04: 0000000000000227 c0000004805ae680 0000000000000000 00000004886f0000
> GPR08: 0000000000000226 0000000000000003 0000000000000002 fffffffffffffffd
> GPR12: 0000000088000484 c00000001ec96280 0000000000000000 0000000000000000
> GPR16: 0000000000000000 0000000000000000 0000000000000004 0000000000000003
> GPR20: c00000047814ffe0 c0000007ffff7c08 0000000000000010 c0000000013332c8
> GPR24: 0000000000000000 c0000000011f6cc0 0000000000000000 0000000000000000
> GPR28: ffffffffffffffef 0000000000000001 0000000150000000 0000000010000000
> NIP [c000000000403f34] add_memory_resource+0x244/0x340
> LR [c000000000403f2c] add_memory_resource+0x23c/0x340
> Call Trace:
> [c0000004876e38f0] [c000000000403f2c] add_memory_resource+0x23c/0x340 (unreliable)
> [c0000004876e39c0] [c00000000040408c] __add_memory+0x5c/0xf0
> [c0000004876e39f0] [c0000000000e2b94] dlpar_add_lmb+0x1b4/0x500
> [c0000004876e3ad0] [c0000000000e3888] dlpar_memory+0x1f8/0xb80
> [c0000004876e3b60] [c0000000000dc0d0] handle_dlpar_errorlog+0xc0/0x190
> [c0000004876e3bd0] [c0000000000dc398] dlpar_store+0x198/0x4a0
> [c0000004876e3c90] [c00000000072e630] kobj_attr_store+0x30/0x50
> [c0000004876e3cb0] [c00000000051f954] sysfs_kf_write+0x64/0x90
> [c0000004876e3cd0] [c00000000051ee40] kernfs_fop_write+0x1b0/0x290
> [c0000004876e3d20] [c000000000438dd8] vfs_write+0xe8/0x290
> [c0000004876e3d70] [c0000000004391ac] ksys_write+0xdc/0x130
> [c0000004876e3dc0] [c000000000034e40] system_call_exception+0x160/0x270
> [c0000004876e3e20] [c00000000000d740] system_call_common+0xf0/0x27c
> Instruction dump:
> 48442e35 60000000 0b030000 3cbe0001 7fa3eb78 7bc48402 38a5fffe 7ca5fa14
> 78a58402 48442db1 60000000 7c7c1b78 <0b030000> 7f23cb78 4bda371d 60000000
> ---[ end trace 562fd6c109cd0fb2 ]---
> 
> To prevent this multiple links, make the node checking done for states
> prior to SYSTEM_RUNNING.

Did you consider adding a cc:stable to this fix?
