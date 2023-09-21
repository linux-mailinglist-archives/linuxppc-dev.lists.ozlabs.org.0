Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3105B7A9311
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 11:28:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrqpR0D4xz3dj5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 19:28:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrqlM25pwz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:26:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RrqlG1X3wz4x5K;
	Thu, 21 Sep 2023 19:26:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230829063457.54157-1-bgray@linux.ibm.com>
References: <20230829063457.54157-1-bgray@linux.ibm.com>
Subject: Re: [PATCH 0/3] Fix preemption errors in watchpoints
Message-Id: <169528828844.872767.7469796002349483809.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:24:48 +1000
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

On Tue, 29 Aug 2023 16:34:54 +1000, Benjamin Gray wrote:
> When enabling debug config options relating to preemption, several bugs
> appear in the kernel log. With this series applied, the breakpoint code
> no longer prints bugs when running the powerpc/ptrace selftests.
> 
> Benjamin Gray (3):
>   powerpc/watchpoints: Disable preemption in thread_change_pc()
>   powerpc/watchpoint: Disable pagefaults when getting user instruction
>   powerpc/watchpoints: Annotate atomic context in more places
> 
> [...]

Applied to powerpc/fixes.

[1/3] powerpc/watchpoints: Disable preemption in thread_change_pc()
      https://git.kernel.org/powerpc/c/cc879ab3ce39bc39f9b1d238b283f43a5f6f957d
[2/3] powerpc/watchpoint: Disable pagefaults when getting user instruction
      https://git.kernel.org/powerpc/c/3241f260eb830d27d09cc604690ec24533fdb433
[3/3] powerpc/watchpoints: Annotate atomic context in more places
      https://git.kernel.org/powerpc/c/27646b2e02b096a6936b3e3b6ba334ae20763eab

cheers
