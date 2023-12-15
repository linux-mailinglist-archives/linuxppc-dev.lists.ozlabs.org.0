Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3AC814315
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 09:00:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VWGGsr9g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss1px3tpjz3dLj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 19:00:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VWGGsr9g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss1p63lVFz3cM5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 18:59:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E93FFB8215D;
	Fri, 15 Dec 2023 07:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE0AC433C7;
	Fri, 15 Dec 2023 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702627161;
	bh=p7XzuqMp9NhCrk0y1WItaCpAXO5MjmBMXA2NzZY47U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWGGsr9gihUJo9sHqLqsalKs8SLfqSeu8K1zSrDQTHEwTZkdIAb8DT982rC4P3c9c
	 pfXzw/eFxtDF6elSytfdaf9zBqwhWzjHqnW9aOwYyBmMw7UKaP23tMyfVkpdXhh4Fw
	 xzIlsy2i2p8yh7u8GBjmvjgLn5RFk5trsyBwl6qbrFdqPdC/Pxjdn1O1WffR6WBdQP
	 L9XJZjqTZjwamuppNlD5E5gzbBC8mm8V0jdz7FWbx+Bom2eD1saX08XbT/XEFXnV/w
	 pEBrd5yZbwUrIJzFZaVCJ0vCv7p6snQvbVOUFsVgb8Zh5okjqbRz16XMNfbRB/eyb4
	 kMWZI3VZb2VWw==
Date: Fri, 15 Dec 2023 13:21:44 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: Re: [PATCH 07/13] powerpc/kprobes: Unpoison instruction in kprobe
 struct
Message-ID: <xn274hbvxsfwii6lwis72ntnphiixvcob6hkopn5fygutht3qe@j4sau5ejaxwj>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-8-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214055539.9420-8-nicholas@linux.ibm.com>
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
Cc: elver@google.com, iii@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-mm@kvack.org, glider@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 14, 2023 at 05:55:33AM +0000, Nicholas Miehlbradt wrote:
> KMSAN does not unpoison the ainsn field of a kprobe struct correctly.
> Manually unpoison it to prevent false positives.
> 
> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
> ---
>  arch/powerpc/kernel/kprobes.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index b20ee72e873a..1cbec54f2b6a 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -27,6 +27,7 @@
>  #include <asm/sections.h>
>  #include <asm/inst.h>
>  #include <linux/uaccess.h>
> +#include <linux/kmsan-checks.h>
>  
>  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> @@ -179,6 +180,7 @@ int arch_prepare_kprobe(struct kprobe *p)
>  
>  	if (!ret) {
>  		patch_instruction(p->ainsn.insn, insn);
> +		kmsan_unpoison_memory(p->ainsn.insn, sizeof(kprobe_opcode_t));

kprobe_opcode_t is u32, but we could be probing a prefixed instruction.  
You can pass the instruction length through ppc_inst_len(insn).


- Naveen
