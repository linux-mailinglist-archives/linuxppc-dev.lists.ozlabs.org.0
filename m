Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1984550A6B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 13:57:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQrqT4T6tz3dpZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 21:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQrpk6ByCz3059
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 21:56:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LQrpk3P3mz4xYD;
	Sun, 19 Jun 2022 21:56:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220609103328.41306-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20220609103328.41306-1-naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: Enable execve syscall exit tracepoint
Message-Id: <165563974778.2516477.17102529346167041855.b4-ty@ellerman.id.au>
Date: Sun, 19 Jun 2022 21:55:47 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 9 Jun 2022 16:03:28 +0530, Naveen N. Rao wrote:
> On execve[at], we are zero'ing out most of the thread register state
> including gpr[0], which contains the syscall number. Due to this, we
> fail to trigger the syscall exit tracepoint properly. Fix this by
> retaining gpr[0] in the thread register state.
> 
> Before this patch:
>   # tail /sys/kernel/debug/tracing/trace
> 	       cat-123     [000] .....    61.449351: sys_execve(filename:
>   7fffa6b23448, argv: 7fffa6b233e0, envp: 7fffa6b233f8)
> 	       cat-124     [000] .....    62.428481: sys_execve(filename:
>   7fffa6b23448, argv: 7fffa6b233e0, envp: 7fffa6b233f8)
> 	      echo-125     [000] .....    65.813702: sys_execve(filename:
>   7fffa6b23378, argv: 7fffa6b233a0, envp: 7fffa6b233b0)
> 	      echo-125     [000] .....    65.822214: sys_execveat(fd: 0,
>   filename: 1009ac48, argv: 7ffff65d0c98, envp: 7ffff65d0ca8, flags: 0)
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Enable execve syscall exit tracepoint
      https://git.kernel.org/powerpc/c/ec6d0dde71d760aa60316f8d1c9a1b0d99213529

cheers
