Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36942169B36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 01:31:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qjfb3YhzzDqLv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 11:31:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qjcv74YWzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 11:29:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MAa2CVzD; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Qjcs6qCRz9sP7;
 Mon, 24 Feb 2020 11:29:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582504189;
 bh=fq+U1JY4Bj/ArorQIFPhS/G3I5kh+b9vUKRbrQLIob0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MAa2CVzDDOKwqeN9B/Jpad6SeBdowjHp0QC00NB5la1JJSn4J4Vvz1oWJifK8LfHC
 G+aiy1/5+x6q9mwGSFrjVfnBEAxd5f5P+Ch1KyBeV1JVIPjcQIAeKNyUjUlikHKsi1
 v18u0mH+jxffHs6hu4EkNnaRf8/8x7jhQFxXCDXU5her/qTyOz8dDkBpdH8kkm+a51
 jUjEeS5Ji/Smz8bC3MXaFLRpkd5K3FAA+4weYZ1RDq7tPbpOqRwXBnQt9aZ133SZ9L
 44t4BLrHiLZVUpQEdsbZKaGgD/fECpkSxcwo6HBB92/RX/plmOcq8SWo3ecp0PzD1V
 jbJM7J+Lz2YVg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: Include .BTF section
In-Reply-To: <20200220113132.857132-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20200220113132.857132-1-naveen.n.rao@linux.vnet.ibm.com>
Date: Mon, 24 Feb 2020 11:29:47 +1100
Message-ID: <8736b0j090.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Selecting CONFIG_DEBUG_INFO_BTF results in the below warning from ld:
>   ld: warning: orphan section `.BTF' from `.btf.vmlinux.bin.o' being placed in section `.BTF'
>
> Include .BTF section in vmlinux explicitly to fix the same.

I don't see any other architectures doing this in their linker script.
Why are we special?

cheers

> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index b4c89a1acebb..a32d478a7f41 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -303,6 +303,12 @@ SECTIONS
>  		*(.branch_lt)
>  	}
>  
> +#ifdef CONFIG_DEBUG_INFO_BTF
> +	.BTF : AT(ADDR(.BTF) - LOAD_OFFSET) {
> +		*(.BTF)
> +	}
> +#endif
> +
>  	.opd : AT(ADDR(.opd) - LOAD_OFFSET) {
>  		__start_opd = .;
>  		KEEP(*(.opd))
> -- 
> 2.24.1
