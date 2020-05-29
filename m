Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7461E7B70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 13:15:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YMRr5bLHzDqjT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 21:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YMQB0M5qzDqf1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 21:13:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Oc8S+4q3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49YMQ93YrBz9sSy;
 Fri, 29 May 2020 21:13:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590750833;
 bh=Yq9DEeBm1nCGg1Bhdy8qVS3tc4qz0wlQyx8I/1BSAXg=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=Oc8S+4q3q3hmxcKWPZjQPw3/U/SNaCMUPG/Ta+QWwI54zUdAcqrGiT8qPznw7NDhU
 vApljLpxd8HUGkeSvIjMzN+5sOSdVDyvL9JY51EFjYH+oXm7LnSpvKk8EFX5Et3tsp
 SBbYQlQIzDxTBSICaqnx88p3Ng/KCZ9Mx4glqsJV9ouMKNTudcAnqdN6fI3+93SnBY
 h0jXX9kDlKzIwfSEEXDX0hzdCto3Y7dcrIbFgMI5HYl+mCsBP971CFpI45Z1PS0qaq
 Gpars4lOCDfWtl5RBbPXHgqANpSJJ7k7hn5YJMqr3gqBbh7rqpubizMQ3Rjpiywd1U
 btj1Kr2JSv5ow==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Subject: Re: [PATCH] powerpc/64/syscall: Disable sanitisers for C syscall
 entry/exit code
In-Reply-To: <2fc6270d-9c63-32ab-8d32-66875f8e5d4f@linux.ibm.com>
References: <20200529061446.2773-1-dja@axtens.net>
 <2fc6270d-9c63-32ab-8d32-66875f8e5d4f@linux.ibm.com>
Date: Fri, 29 May 2020 21:14:17 +1000
Message-ID: <87o8q7hu2e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On 29/5/20 4:14 pm, Daniel Axtens wrote:
>> syzkaller is picking up a bunch of crashes that look like this:
>> 
>> Unrecoverable exception 380 at c00000000037ed60 (msr=8000000000001031)
>> Oops: Unrecoverable exception, sig: 6 [#1]
>> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>> Modules linked in:
>> CPU: 0 PID: 874 Comm: syz-executor.0 Not tainted 5.7.0-rc7-syzkaller-00016-gb0c3ba31be3e #0
>> NIP:  c00000000037ed60 LR: c00000000004bac8 CTR: c000000000030990
>> REGS: c0000000555a7230 TRAP: 0380   Not tainted  (5.7.0-rc7-syzkaller-00016-gb0c3ba31be3e)
>> MSR:  8000000000001031 <SF,ME,IR,DR,LE>  CR: 48222882  XER: 20000000
>> CFAR: c00000000004bac4 IRQMASK: 0
>> GPR00: c00000000004bb68 c0000000555a74c0 c0000000024b3500 0000000000000005
>> GPR04: 0000000000000000 0000000000000000 c00000000004bb88 c008000000910000
>> GPR08: 00000000000b0000 c00000000004bac8 0000000000016000 c000000002503500
>> GPR12: c000000000030990 c000000003190000 00000000106a5898 00000000106a0000
>> GPR16: 00000000106a5890 c000000007a92000 c000000008180e00 c000000007a8f700
>> GPR20: c000000007a904b0 0000000010110000 c00000000259d318 5deadbeef0000100
>> GPR24: 5deadbeef0000122 c000000078422700 c000000009ee88b8 c000000078422778
>> GPR28: 0000000000000001 800000000280b033 0000000000000000 c0000000555a75a0
>> NIP [c00000000037ed60] __sanitizer_cov_trace_pc+0x40/0x50
>> LR [c00000000004bac8] interrupt_exit_kernel_prepare+0x118/0x310
>> Call Trace:
>> [c0000000555a74c0] [c00000000004bb68] interrupt_exit_kernel_prepare+0x1b8/0x310 (unreliable)
>> [c0000000555a7530] [c00000000000f9a8] interrupt_return+0x118/0x1c0
>> --- interrupt: 900 at __sanitizer_cov_trace_pc+0x0/0x50
>> ...<random previous call chain>...
>> 
>> That looks like the KCOV helper accessing memory that's not safe to
>> access in the interrupt handling context.
>> 
>> Do not instrument the new syscall entry/exit code with KCOV, GCOV or
>> UBSAN.
>> 
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit logic in C")
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> This seems reasonable - I've verified that this does indeed suppress the 
> kcov trace calls.

Thanks.

> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
>
> (does this need to be tagged for stable? the Fixes: commit is in 5.6 but 
> we're at 5.7-rc7 at this point...)

No. The Fixed commit is based on v5.6-rc2, but it didn't go in until v5.7-rc1:

  $ git describe --contains --match 'v*' 68b34588e202
  v5.7-rc1~35^2~46

I plan to send it to Linus before the v5.7 release.

cheers
