Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3AA3A738C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 04:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3s4Z5F9Dz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 12:01:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pJdbSmq1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pJdbSmq1; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3s4726Zsz2ysk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 12:01:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3s4529sVz9sWD;
 Tue, 15 Jun 2021 12:01:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623722469;
 bh=Ioz32V7w9TF+SY5v/PGD0ofSTEUn3E3EmbxAg40Km+I=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pJdbSmq1eTCdU+3xkvsZXfkGUrUNxnvqycQiy7TAYrHQqEXe2H1JfXir8hEFvW5PW
 s0pYoh+OM9KregcJBM84Ab5oRqBWdQUtDxH342pO5rEtShAZ53WHVbnLubImLISSPX
 azL43TxmUj8r/nu85TSx647r0I/9Ce52y3jc8UhR31Px0eNgiQ7mWSAqkN7gtDcLJv
 PBaNN5yuaL/LqJq4YmO4s8li+oB1CsNBKXk7uPr4Fe04QRea1XJ836Qioa4Ms98u3w
 ZNtkNYUXKYmcAvK67benMlLYZ/DddfE95gn6rYDEGO1KVzRp4o3VaA/kwLNXr9rTWW
 fzv0vjEjM6Low==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Subject: Re: [PATCH v2 08/12] powerpc: Don't use 'struct ppc_inst' to
 reference instruction location
In-Reply-To: <7062722b087228e42cbd896e39bfdf526d6a340a.1621516826.git.christophe.leroy@csgroup.eu>
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
 <7062722b087228e42cbd896e39bfdf526d6a340a.1621516826.git.christophe.leroy@csgroup.eu>
Date: Tue, 15 Jun 2021 12:01:08 +1000
Message-ID: <871r93vqcb.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index 5a0740ebf132..32d318c3b180 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -139,7 +139,7 @@ static inline int ppc_inst_len(struct ppc_inst x)
>   * Return the address of the next instruction, if the instruction @value was
>   * located at @location.
>   */
> -static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc_inst *value)
> +static inline unsigned int *ppc_inst_next(unsigned int *location, unsigned int *value)
>  {
>  	struct ppc_inst tmp;
>  

It's not visible in the diff, but the rest of the function is:

	tmp = ppc_inst_read(value);

	return location + ppc_inst_len(tmp);
}

And so changing the type of location from void * to int * changes the
result of that addition, ie. previously it was in units of bytes, now
it's units of 4 bytes.

To fix it I've kept location as unsigned int *, and added a cast where
we do the addition. That way users of the function just see unsigned int *,
the cast to void * is an implementation detail.

We only have a handful of uses of ppc_inst_len(), so maybe that should
change name and return a result in units of int *. But that can be a
separate change.

> diff --git a/arch/powerpc/platforms/86xx/mpc86xx_smp.c b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
> index 87f524e4b09c..302f2a1e0361 100644
> --- a/arch/powerpc/platforms/86xx/mpc86xx_smp.c
> +++ b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
> @@ -83,7 +83,7 @@ smp_86xx_kick_cpu(int nr)
>  		mdelay(1);
>  
>  	/* Restore the exception vector */
> -	patch_instruction((struct ppc_inst *)vector, ppc_inst(save_vector));
> +	patch_instruction(vector, ppc_inst(save_vector));
>  
>  	local_irq_restore(flags);
>  

There was another usage in here:

 	/* Setup fake reset vector to call __secondary_start_mpc86xx. */
 	target = (unsigned long) __secondary_start_mpc86xx;
-	patch_branch((struct ppc_inst *)vector, target, BRANCH_SET_LINK);
+	patch_branch(vector, target, BRANCH_SET_LINK);
 
 	/* Kick that CPU */
 	smp_86xx_release_core(nr);

I fixed it up.

cheers
