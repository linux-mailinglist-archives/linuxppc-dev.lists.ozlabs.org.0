Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD15E24E919
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 19:38:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYlwY6KP9zDqq5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 03:38:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.139; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=YM7Tx+o3; dkim-atps=neutral
X-Greylist: delayed 646 seconds by postgrey-1.36 at bilbo;
 Sun, 23 Aug 2020 03:36:58 AEST
Received: from mx01.puc.rediris.es (outbound2mad.lav.puc.rediris.es
 [130.206.19.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYlty4RR8zDql0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Aug 2020 03:36:57 +1000 (AEST)
Received: from mta-out01.sim.rediris.es (mta-out01.sim.rediris.es
 [130.206.24.43])
 by mx01.puc.rediris.es  with ESMTP id 07MHPaoF008452-07MHPaoH008452
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 22 Aug 2020 19:25:36 +0200
Received: from mta-out01.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPS id 31DE3303A2C0;
 Sat, 22 Aug 2020 19:25:36 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTP id 1EBFE303A2C1;
 Sat, 22 Aug 2020 19:25:36 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out01.sim.rediris.es
Received: from mta-out01.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out01.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ti7X22fnqMYW; Sat, 22 Aug 2020 19:25:35 +0200 (CEST)
Received: from lt-gp.iram.es (32.236.223.87.dynamic.jazztel.es [87.223.236.32])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPA id DFFD9303A2C0;
 Sat, 22 Aug 2020 19:25:34 +0200 (CEST)
Date: Sat, 22 Aug 2020 19:25:24 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Guohua Zhong <zhongguohua1@huawei.com>
Subject: Re: =?utf-8?B?UmXvvJpSZQ==?= =?utf-8?Q?=3A?= [PATCH] powerpc: Fix a
 bug in __div64_32 if divisor is zero
Message-ID: <20200822172524.GA5451@lt-gp.iram.es>
References: <8dedfcce-04e0-ec7d-6af5-ec1d6d8602b0@csgroup.eu>
 <20200822165433.58228-1-zhongguohua1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200822165433.58228-1-zhongguohua1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=x/y1wL+17mpmDeW+i59qqK9LJ4zkB0EVEHsZvWq7Xuc=;
 b=YM7Tx+o3yeRzZ24WpGQ68/Dn0Vooij0NNhm/+FJzbgwQy6T9vdYp+Yh+oz4fGx0EK4c1Kus4JhBr
 rAYk/lgyba3RtpryBaOxbfc7ErnTw3mwwFtfPdQ8JJcwdeydZOAC9Xf3FjQlbvOsStvKiQQNw79T
 B7xaevQgDJ74uTknT8d/ysRwB5bgMxhaKHJDMqEHfKWKVw86u7BjuerZAfHQC7GhqNnRmuHtfgv0
 8HWNNJpEOOqYpA0mx42xBUrfCIaoOvIX9M2RIHDG/YH69PVW0l1S5oBH/zFl4k81OWEsijloIl8o
 6hn1+2iB2HP/mWD64Irwzofrj084a7Xj+utXdQ==
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
Cc: wangle6@huawei.com, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, paulus@samba.org, nixiaoming@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 23, 2020 at 12:54:33AM +0800, Guohua Zhong wrote:
> >In generic version in lib/math/div64.c, there is no checking of 'base' 
> >either.
> >Do we really want to add this check in the powerpc version only ?
> 
> >The only user of __div64_32() is do_div() in 
> >include/asm-generic/div64.h. Wouldn't it be better to do the check there ?
> 
> >Christophe
> 
> Yet, I have noticed that there is no checking of 'base' in these functions.
> But I am not sure how to check is better.As we know that the result is 
> undefined when divisor is zero. It maybe good to print error and dump stack.
>  Let the process to know that the divisor is zero by sending SIGFPE. 
> 
> diff --git a/include/asm-generic/div64.h b/include/asm-generic/div64.h
> index a3b98c86f077..161c656ee3ee 100644
> --- a/include/asm-generic/div64.h
> +++ b/include/asm-generic/div64.h
> @@ -43,6 +43,11 @@
>  # define do_div(n,base) ({                                     \
>         uint32_t __base = (base);                               \
>         uint32_t __rem;                                         \
> + if (unlikely(base == 0)) {                          \
> +         pr_err("do_div base=%d\n",base);            \
> +         dump_stack();                               \
> +         force_sig(SIGFPE);                          \
> + }      
> 

I suspect this will generate a strong reaction. SIGFPE is for user space
instruction attempting a division by zero. A division by zero in the
kernel is a kernel bug, period, and you don't want to kill a user
process for this reason.

If it happens in an interrupt, the context of the kernel may not even be
related to the current process.

Many other architectures (x86 for example) already trigger an exception
on a division by zero but the handler will find that the exception
happened in kernel context and generate an Oops, not raise a signal in a
(possibly innocent) userland process.

	Gabriel

> Then it also needto add this checking in functions of
> div64_s64(), div64_u64(), div64_u64_rem(), div_s64_rem and div_u64_rem () 
> in include/linux/math64.h
> 
> + if (unlikely(divisor == 0)) {
> +         pr_err("%s divisor=0\n",__func__);
> +         dump_stack();
> +         force_sig(SIGFPE);
> + }
> 
> Guohua
> 
> >>  	lwz	r5,0(r3)	# get the dividend into r5/r6
> >>  	lwz	r6,4(r3)
> >>  	cmplw	r5,r4
> >>@@ -52,6 +55,7 @@ __div64_32:
> >>  4:	stw	r7,0(r3)	# return the quotient in *r3
> >>  	stw	r8,4(r3)
> >>  	mr	r3,r6		# return the remainder in r3
> >>+5:					# return if divisor r4 is zero
> >>  	blr
> >>  
> >>  /*
> >>diff --git a/arch/powerpc/lib/div64.S b/arch/powerpc/lib/div64.S
> >>index 3d5426e7dcc4..1cc9bcabf678 100644
> >>--- a/arch/powerpc/lib/div64.S
> >>+++ b/arch/powerpc/lib/div64.S
> >>@@ -13,6 +13,9 @@
> >>  #include <asm/processor.h>
> >>  
> >>  _GLOBAL(__div64_32)
> >>+	li	r9,0
> >>+	cmplw	r4,r9	# check if divisor r4 is zero
> >>+	beq	5f			# jump to label 5 if r4(divisor) is zero
> >>  	lwz	r5,0(r3)	# get the dividend into r5/r6
> >>  	lwz	r6,4(r3)
> >>  	cmplw	r5,r4
> >>@@ -52,4 +55,5 @@ _GLOBAL(__div64_32)
> >>  4:	stw	r7,0(r3)	# return the quotient in *r3
> >>  	stw	r8,4(r3)
> >>  	mr	r3,r6		# return the remainder in r3
> >>+5:					# return if divisor r4 is zero
> >>  	blr
> >>
> 
 

