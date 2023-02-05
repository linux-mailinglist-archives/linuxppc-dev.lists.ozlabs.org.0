Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3260F68AF0E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 10:44:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8kyJ0tvqz3f5q
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 20:44:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8kvT4vRSz2yV5
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 20:42:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8kvT1c5Qz4y02;
	Sun,  5 Feb 2023 20:42:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230128124138.1066176-1-sv@linux.ibm.com>
References: <20230128124138.1066176-1-sv@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Fix objtool warning for unannotated intra-function call in head_85xx.o
Message-Id: <167559010230.1647710.1516957967915526835.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 20:41:42 +1100
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
Cc: naveen.n.rao@linux.vnet.ibm.com, lkp@intel.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 28 Jan 2023 18:11:38 +0530, Sathvika Vasireddy wrote:
> Objtool throws the following warning:
> arch/powerpc/kernel/head_85xx.o: warning: objtool: .head.text+0x1a6c:
> unannotated intra-function call
> 
> Fix this warning by annotating KernelSPE symbol with SYM_FUNC_START_LOCAL
> and SYM_FUNC_END macros.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Fix objtool warning for unannotated intra-function call in head_85xx.o
      https://git.kernel.org/powerpc/c/8afffce6aa3bddc940ac1909627ff1e772b6cbf1

cheers
