Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 617BA1DB1C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:31:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RrD750JFzDqBY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:31:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RqXT67jbzDqfC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 21:00:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqXT49tzz9sV0; Wed, 20 May 2020 21:00:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mikey@neuling.org, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 mpe@ellerman.id.au
In-Reply-To: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
References: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v6 00/16] powerpc/watchpoint: Preparation for more than
 one watchpoint
Message-Id: <158997215393.943180.1297096710553012191.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 21:00:08 +1000 (AEST)
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
Cc: christophe.leroy@c-s.fr, apopple@linux.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 May 2020 16:47:25 +0530, Ravi Bangoria wrote:
> So far, powerpc Book3S code has been written with an assumption of
> only one watchpoint. But Power10[1] is introducing second watchpoint
> register (DAWR). Even though this patchset does not enable 2nd DAWR,
> it makes the infrastructure ready so that enabling 2nd DAWR should
> just be a matter of changing count.
> 
> Existing functionality works fine with the patchset. I've tested it
> with perf, ptrace(gdb), xmon. All hw-breakpoint selftests are passing
> as well. And I've build tested for 8xx and 'AMCC 44x, 46x or 47x'.
> 
> [...]

Applied to powerpc/next.

[01/16] powerpc/watchpoint: Rename current DAWR macros
        https://git.kernel.org/powerpc/c/09f82b063aa9c248a3ef919aeec361054e7b044a
[02/16] powerpc/watchpoint: Add SPRN macros for second DAWR
        https://git.kernel.org/powerpc/c/4a4ec2289a5d748cb64ff67ca8d74535a76a8436
[03/16] powerpc/watchpoint: Introduce function to get nr watchpoints dynamically
        https://git.kernel.org/powerpc/c/a6ba44e8799230e36c8ab06fda7f77f421e9e795
[04/16] powerpc/watchpoint/ptrace: Return actual num of available watchpoints
        https://git.kernel.org/powerpc/c/45093b382e0ac25c206b4dcd210c6be1f5e56e60
[05/16] powerpc/watchpoint: Provide DAWR number to set_dawr
        https://git.kernel.org/powerpc/c/a18b834625d345bfa89c4e2754dd6cbb0133c4d7
[06/16] powerpc/watchpoint: Provide DAWR number to __set_breakpoint
        https://git.kernel.org/powerpc/c/4a8a9379f2af4c9928529b3959bc2d8f7023c6bc
[07/16] powerpc/watchpoint: Get watchpoint count dynamically while disabling them
        https://git.kernel.org/powerpc/c/c2919132734f29a7a33e1339bef8a67b11f322eb
[08/16] powerpc/watchpoint: Disable all available watchpoints when !dawr_force_enable
        https://git.kernel.org/powerpc/c/22a214e461c5cc9428b86915d9cfcf84c6e11ad7
[09/16] powerpc/watchpoint: Convert thread_struct->hw_brk to an array
        https://git.kernel.org/powerpc/c/303e6a9ddcdc168e92253c78cdb4bbe1e10d78b3
[10/16] powerpc/watchpoint: Use loop for thread_struct->ptrace_bps
        https://git.kernel.org/powerpc/c/6b424efa119d5ea06b15ff240dddc3b4b9f9cdfb
[11/16] powerpc/watchpoint: Introduce is_ptrace_bp() function
        https://git.kernel.org/powerpc/c/c9e82aeb197df2d93b1b4234bc0c80943fa594e8
[12/16] powerpc/watchpoint: Use builtin ALIGN*() macros
        https://git.kernel.org/powerpc/c/e68ef121c1f4c38edf87a3354661ceb99d522729
[13/16] powerpc/watchpoint: Prepare handler to handle more than one watchpoint
        https://git.kernel.org/powerpc/c/74c6881019b7d56c327fffc268d97adb5eb1b4f9
[14/16] powerpc/watchpoint: Don't allow concurrent perf and ptrace events
        https://git.kernel.org/powerpc/c/29da4f91c0c1fbda12b8a31be0d564930208c92e
[15/16] powerpc/watchpoint/xmon: Don't allow breakpoint overwriting
        https://git.kernel.org/powerpc/c/514db915e7b33e7eaf8e40192b93380f79b319b5
[16/16] powerpc/watchpoint/xmon: Support 2nd DAWR
        https://git.kernel.org/powerpc/c/30df74d67d48949da87e3a5b57c381763e8fd526

cheers
