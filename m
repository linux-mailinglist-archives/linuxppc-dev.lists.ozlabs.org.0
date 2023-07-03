Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D173C7454E7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:34:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZPR5R0qz2yHs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:34:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZNz2w5xz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:27 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4QvZNz1zszz4wqX; Mon,  3 Jul 2023 15:34:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZNz19ZPz4wbP;
	Mon,  3 Jul 2023 15:34:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Aditya Gupta <adityag@linux.ibm.com>
In-Reply-To: <20230615091047.90433-1-adityag@linux.ibm.com>
References: <20230615091047.90433-1-adityag@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/1] powerpc: update ppc_save_regs to save current r1 in pt_regs
Message-Id: <168836201893.50010.8702790714495746472.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Jun 2023 14:40:47 +0530, Aditya Gupta wrote:
> ppc_save_regs() skips one stack frame while saving the CPU register states.
> Instead of saving current R1, it pulls the previous stack frame pointer.
> 
> When vmcores caused by direct panic call (such as `echo c >
> /proc/sysrq-trigger`), are debugged with gdb, gdb fails to show the
> backtrace correctly. On further analysis, it was found that it was because
> of mismatch between r1 and NIP.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: update ppc_save_regs to save current r1 in pt_regs
      https://git.kernel.org/powerpc/c/b684c09f09e7a6af3794d4233ef785819e72db79

cheers
