Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEF06EF421
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:16:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yX83DzZz3gW3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:16:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMY0M2Xz3f7V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMX6KSPz4xN4;
	Wed, 26 Apr 2023 22:08:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230325122904.2375060-1-npiggin@gmail.com>
References: <20230325122904.2375060-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/8] powerpc: copy_thread cleanups
Message-Id: <168251050519.3973805.1330134086150086022.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:01:45 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 25 Mar 2023 22:28:56 +1000, Nicholas Piggin wrote:
> This series cleans up copy_thread and hopefully makes the code
> easier to understand. The big changes in patch 3 and 4 which use
> the switch stack instead of user int stack for restoring
> fn and args parameters for the new thread.
> 
> I don't think there's any bugs fixed here because in the case of
> a kernel-user thread, kthread_exec would re-populate the user int
> frame with regs, so that should be okay.
> 
> [...]

Applied to powerpc/next.

[1/8] powerpc: copy_thread remove unused pkey code
      https://git.kernel.org/powerpc/c/c013e9f2bbe1d2be5e1c7f4a84216cd10837f20d
[2/8] powerpc: copy_thread make ret_from_fork register setup consistent
      https://git.kernel.org/powerpc/c/959791e45fd2a580403e03611a5aefb9e7abcfc0
[3/8] powerpc: use switch frame for ret_from_kernel_thread parameters
      https://git.kernel.org/powerpc/c/af5ca9d5c8b45244b237d7a5534e1ec2d01cce8e
[4/8] powerpc/64: ret_from_fork avoid restoring regs twice
      https://git.kernel.org/powerpc/c/5088a6246bd3dcfea504376f356683f750136f7f
[5/8] powerpc: copy_thread differentiate kthreads and user mode threads
      https://git.kernel.org/powerpc/c/eed7c420aac7fde5e5915d2747c3ebbbda225835
[6/8] powerpc: differentiate kthread from user kernel thread start
      https://git.kernel.org/powerpc/c/b504b6aade0403eaffa9ce51b8207d710705beaf
[7/8] powerpc: copy_thread don't set _TIF_RESTOREALL
      https://git.kernel.org/powerpc/c/d195ce4695ca1061993424e2d6c8995e5fc81606
[8/8] powerpc: copy_thread don't set PPR in user interrupt frame regs
      https://git.kernel.org/powerpc/c/89fb39134ae3b1e1f207af44a037721d92b32f70

cheers
