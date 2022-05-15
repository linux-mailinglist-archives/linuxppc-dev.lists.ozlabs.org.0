Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6F5527704
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:34:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1Jdy2YxNz3cjM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:34:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JZM6PG2z3cfC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:31:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JZM5ZdNz4xZq;
 Sun, 15 May 2022 20:31:07 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <cover.1647962456.git.christophe.leroy@csgroup.eu>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 0/4] Kill the time spent in patch_instruction()
Message-Id: <165261053687.1047019.4165741740473209888.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:28:56 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Mar 2022 16:40:17 +0100, Christophe Leroy wrote:
> This series reduces by 70% the time required to activate
> ftrace on an 8xx with CONFIG_STRICT_KERNEL_RWX.
> 
> Measure is performed in function ftrace_replace_code() using mftb()
> around the loop.
> 
> With the series,
> - Without CONFIG_STRICT_KERNEL_RWX, 416000 TB ticks are measured.
> - With CONFIG_STRICT_KERNEL_RWX, 546000 TB ticks are measured.
> 
> [...]

Patches 1, 3 and 4 applied to powerpc/next.

[1/4] powerpc/code-patching: Don't call is_vmalloc_or_module_addr() without CONFIG_MODULES
      https://git.kernel.org/powerpc/c/cb3ac45214c03852430979a43180371a44b74596
[3/4] powerpc/code-patching: Use jump_label for testing freed initmem
      https://git.kernel.org/powerpc/c/b033767848c4115e486b1a51946de3bee2ac0fa6
[4/4] powerpc/code-patching: Use jump_label to check if poking_init() is done
      https://git.kernel.org/powerpc/c/1751289268ef959db68b0b6f798d904d6403309a

cheers
