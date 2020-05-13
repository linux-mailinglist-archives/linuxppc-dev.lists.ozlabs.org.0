Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6D71D1769
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 16:20:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49McJn2lyTzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 00:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49McFq3CvHzDqNm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 00:17:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rewOKpS2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49McFp1clmz9sRf;
 Thu, 14 May 2020 00:17:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589379470;
 bh=S7KWLeAxYuawKp+lGSo2IB9ylIe3wxgvRSlkLhzHnH8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rewOKpS2Q6p6Z0lEJU44/caNd0xcIY9Jt5YGrXmpc5darp7/sasAoz1L8KN+r+RpN
 tk4PAlvLZJ/a4n8ISam9WMrqGn9jICdzM15iJXygZ1gNM21qg4hVQs9va/rmSROGOP
 gVUJuuLaEtQlOZM7TjOqHF1MS8yg2Wx8XdbVzD+S1Sj81Z3eyWeIgwJumvDSc8NKCU
 5gCrfDaIpRA+cpLrJfIM/mFBN1ilG5e0C3wkI7mPa1Uh7wc+iFsATHBM8W6Ce2yJp0
 1R+qAuJ/Z+dsksdejKbCnVdWLN3XWtS+DcZj4ghgwg2WBvUDogGHm5M+skJs2cequJ
 ugQv+uqGpjZIw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 16/30] powerpc: Define and use __get_user_instr{,
 inatomic}()
In-Reply-To: <20200506034050.24806-17-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-17-jniethe5@gmail.com>
Date: Thu, 14 May 2020 00:18:06 +1000
Message-ID: <878shvc40x.fsf@mpe.ellerman.id.au>
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
Cc: christophe.leroy@c-s.fr, alistair@popple.id.au, npiggin@gmail.com,
 bala24@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 naveen.n.rao@linux.vnet.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> Define specific __get_user_instr() and __get_user_instr_inatomic()
> macros for reading instructions from user space.

At least for fix_alignment() we could be coming from the kernel, not
sure about the other cases.

I can tweak the change log.

> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 2f500debae21..c0a35e4586a5 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -105,6 +105,11 @@ static inline int __access_ok(unsigned long addr, unsigned long size,
>  #define __put_user_inatomic(x, ptr) \
>  	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
>  
> +#define __get_user_instr(x, ptr) \
> +	__get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
> +
> +#define __get_user_instr_inatomic(x, ptr) \
> +	__get_user_nosleep((x).val, (u32 *)(ptr), sizeof(u32))

I'm not super keen on adding new __ versions, which lack the access_ok()
check, but I guess we have to.

> diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
> index 3dd70eeb10c5..60ed5aea8d4e 100644
> --- a/arch/powerpc/kernel/vecemu.c
> +++ b/arch/powerpc/kernel/vecemu.c
> @@ -266,7 +266,7 @@ int emulate_altivec(struct pt_regs *regs)
>  	unsigned int va, vb, vc, vd;
>  	vector128 *vrs;
>  
> -	if (get_user(instr.val, (unsigned int __user *)regs->nip))
> +	if (__get_user_instr(instr, (void __user *)regs->nip))
>  		return -EFAULT;

That drops the access_ok() check, which is not OK, at least without a
reasonable justification.

Given it's regs->nip I guess it should be safe, but it should still be
called out. Or preferably switched to __get_user() in a precursor patch.

cheers
