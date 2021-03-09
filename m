Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B665C332260
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 10:55:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvrDT5W4Cz3cFx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 20:55:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=paevZ6o8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=paevZ6o8; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvrD26N9Sz30R7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 20:54:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DvrCy5l2bz9sCD;
 Tue,  9 Mar 2021 20:54:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615283697;
 bh=Ri8w2GYEiuBWXT9VNvVxkdDMG21BsNS2mKo2sif8myc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=paevZ6o8UaJVmUX2L2XTyeZZfeNqxqfjuWOHScSRtjZbMd+q1V7L317YqKeLEYR1l
 Qzl/avdN8X1Rq7D0u8Pt7Ux1VNRlA+QRkKDOCfcbRQALQXaMgXx/BFee7qpfRofAeO
 Ni+Eo3lZlkrE886yF6obtoh8LWQ8QVx2ik+J1nl4vHQdRVdiyDIgT3GDgq+VrM0w+f
 XOj8WcIr7tl5IFbuu4fQATKjIJFL5dtoUEslPfZt/+mwZVIhJ478fTgk6jw/uKyUx/
 CWgLrXRiR1m5TIDG9hd2HwPBgIQc8kqe86ESZsiNiG6tmlDR6XQAMOnvFiD/HfA4D0
 aj3HsDMUrHB3g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc/uprobes: Validation for prefixed instruction
In-Reply-To: <20210305115433.140769-1-ravi.bangoria@linux.ibm.com>
References: <20210305115433.140769-1-ravi.bangoria@linux.ibm.com>
Date: Tue, 09 Mar 2021 20:54:45 +1100
Message-ID: <87ft14r6sa.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, oleg@redhat.com,
 rostedt@goodmis.org, linux-kernel@vger.kernel.org, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
> As per ISA 3.1, prefixed instruction should not cross 64-byte
> boundary. So don't allow Uprobe on such prefixed instruction.
>
> There are two ways probed instruction is changed in mapped pages.
> First, when Uprobe is activated, it searches for all the relevant
> pages and replace instruction in them. In this case, if that probe
> is on the 64-byte unaligned prefixed instruction, error out
> directly. Second, when Uprobe is already active and user maps a
> relevant page via mmap(), instruction is replaced via mmap() code
> path. But because Uprobe is invalid, entire mmap() operation can
> not be stopped. In this case just print an error and continue.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Do we have a Fixes: tag for this?

> ---
> v3: https://lore.kernel.org/r/20210304050529.59391-1-ravi.bangoria@linux.ibm.com
> v3->v4:
>   - CONFIG_PPC64 check was not required, remove it.
>   - Use SZ_ macros instead of hardcoded numbers.
>
>  arch/powerpc/kernel/uprobes.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index e8a63713e655..4cbfff6e94a3 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -41,6 +41,13 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
>  	if (addr & 0x03)
>  		return -EINVAL;
>  
> +	if (cpu_has_feature(CPU_FTR_ARCH_31) &&
> +	    ppc_inst_prefixed(auprobe->insn) &&
> +	    (addr & (SZ_64 - 4)) == SZ_64 - 4) {
> +		pr_info_ratelimited("Cannot register a uprobe on 64 byte unaligned prefixed instruction\n");
> +		return -EINVAL;

I realise we already did the 0x03 check above, but I still think this
would be clearer simply as:

	    (addr & 0x3f == 60)

cheers
