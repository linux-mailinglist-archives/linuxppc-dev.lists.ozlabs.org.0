Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B22D369C4A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 04:56:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKpVq4jkbz3fq4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 14:56:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKpPt3frsz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 14:51:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKpPs0p7cz4x8f;
	Mon, 20 Feb 2023 14:51:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <20230217043226.1020041-1-sv@linux.ibm.com>
References: <20230217043226.1020041-1-sv@linux.ibm.com>
Subject: Re: [PATCH] powerpc/64: Fix unannotated intra-function call warning
Message-Id: <167686496231.2406274.11059338320839302829.b4-ty@ellerman.id.au>
Date: Mon, 20 Feb 2023 14:49:22 +1100
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
Cc: peterz@infradead.org, sfr@canb.auug.org.au, naveen.n.rao@linux.vnet.ibm.com, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Feb 2023 10:02:26 +0530, Sathvika Vasireddy wrote:
> objtool throws the following warning:
>   arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x6128:
>   unannotated intra-function call
> 
> Fix the warning by annotating start_initialization_book3s symbol with the
> SYM_FUNC_START_LOCAL and SYM_FUNC_END macros.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Fix unannotated intra-function call warning
      https://git.kernel.org/powerpc/c/38d73b671a817328334f2a70a23fed4d1f4a952c

cheers
