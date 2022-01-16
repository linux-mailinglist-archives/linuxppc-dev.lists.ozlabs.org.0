Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA1348FC31
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 11:42:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcBSx41Bhz3bbH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 21:42:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcBSY55VRz2yHZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 21:42:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JcBSX4D8xz4xtf;
 Sun, 16 Jan 2022 21:42:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <c55cddb8f65713bf5859ed675d75a50cb37d5995.1642159570.git.christophe.leroy@csgroup.eu>
References: <c55cddb8f65713bf5859ed675d75a50cb37d5995.1642159570.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/audit: Fix syscall_get_arch()
Message-Id: <164232966465.2885693.13588785394784064877.b4-ty@ellerman.id.au>
Date: Sun, 16 Jan 2022 21:41:04 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Dmitry V . Levin" <ldv@altlinux.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 Jan 2022 11:26:25 +0000, Christophe Leroy wrote:
> Commit 770cec16cdc9 ("powerpc/audit: Simplify syscall_get_arch()")
> and commit 898a1ef06ad4 ("powerpc/audit: Avoid unneccessary #ifdef
> in syscall_get_arguments()")
> replaced test_tsk_thread_flag(task, TIF_32BIT)) by is_32bit_task().
> 
> But is_32bit_task() applies on current task while be want the test
> done on task 'task'
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/audit: Fix syscall_get_arch()
      https://git.kernel.org/powerpc/c/252745240ba0ae774d2f80c5e185ed59fbc4fb41

cheers
