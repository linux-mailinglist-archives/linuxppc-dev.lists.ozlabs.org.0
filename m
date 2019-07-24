Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B78072B74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 11:33:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tqsB5btXzDqND
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 19:33:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tqqJ5gw2zDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:31:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="ekczK6N+"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45tqqJ4FWRz8sxB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:31:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45tqqJ3n4Fz9sLt; Wed, 24 Jul 2019 19:31:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="ekczK6N+"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45tqqH5tcqz9sBZ
 for <linuxppc-dev@ozlabs.org>; Wed, 24 Jul 2019 19:31:39 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id k8so46482497edr.11
 for <linuxppc-dev@ozlabs.org>; Wed, 24 Jul 2019 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nEkTF+cqPf/v2CMmPE5u5s1dVQ6nE3Sqg5k1QdIwMS4=;
 b=ekczK6N+BR0shxexBKgIZQ4TSWiAI9mE07FsYpvO4oyWt/i9GexLYk7EoZdy3iwKRH
 g+BuyeJawN4iS6909W2c6JtM2AxtdiJqQwpEE6HgpKRVjB3HwNu/UJuYiuwmMsT4OeZ3
 utiMHUgGTNB0iP3G7lzOJC3WRUUNkHkvh+mZ5OVbYoSagg2/TJ3jJALK5iNmhoUYOjM3
 NlRHa50acd36Wqrh942AmrQvBqL4C6La4S3p+HLy5ZsMHdz2yjJCnNm6DnX8UXJUqczg
 1+moIY35SUyBEgDtu3qCiaB7G/oO3cpq8g2j8bOv5LFImmEt7ZNpK8b1M/VXvUkU3lAc
 u1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nEkTF+cqPf/v2CMmPE5u5s1dVQ6nE3Sqg5k1QdIwMS4=;
 b=dJDGn2Yic4SpqrChwtEDJ2vc2wupJwprLhhvjs4TQ6EpzydvuhdfKPC4pRLvf3p+55
 BeRDeWi7Fe5kR9pklyrs1ywgMN54V24ZcFfrgMNRGlstMJAvz5pQp08EX87GcYS/4et9
 lsvVieJftgBtBQlzfFMc6v5xx3aKcBDE6W2QluADf1w7ge3ShnKyxj2gIlNLBaMB9C7G
 BwfbwEyVBMO8Z1+Avpz7c0thZTBeP28LMWwH88UMwX8fQxN7g3+5k8ZcHjD6VgmftnkV
 JFH7s7uvRewPEEYIr6scuo6ICKMm6e8us5FxssvIw5iEVWFHTl8fjdqaYGstM88ye7js
 329Q==
X-Gm-Message-State: APjAAAVnBXip85y56rL3SC0ivGMidQQv2v+9/a0qcGFEElEIn+OFjL9w
 13Hs11vcHYzlyVCH7dOgqAk=
X-Google-Smtp-Source: APXvYqwgJ29U2DdS0WD8cMY2jrFDebelcceKx3kTwHiFfem/dqd2jhAjcifGI4qRDD5QHt9HaLW/oQ==
X-Received: by 2002:a17:906:3612:: with SMTP id
 q18mr63278352ejb.278.1563960695291; 
 Wed, 24 Jul 2019 02:31:35 -0700 (PDT)
Received: from brauner.io ([178.19.218.101])
 by smtp.gmail.com with ESMTPSA id l35sm12571254edc.2.2019.07.24.02.31.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 02:31:34 -0700 (PDT)
Date: Wed, 24 Jul 2019 11:31:34 +0200
From: Christian Brauner <christian@brauner.io>
To: Arseny Solokha <asolokha@kb.kras.ru>
Subject: Re: [PATCH] powerpc: Wire up clone3 syscall
Message-ID: <20190724093132.orflnhvyiff75yrd@brauner.io>
References: <20190722133701.g3w5g4crogqb7oi5@brauner.io>
 <87ftmwknr9.fsf@kb.kras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ftmwknr9.fsf@kb.kras.ru>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 12:25:14PM +0700, Arseny Solokha wrote:
> Hi,
> 
> may I also ask to provide ppc_clone3 symbol also for 32-bit powerpc? Otherwise
> Michael's patch breaks build for me:

Makes sense. Michael, are you planning on picking this up? :)

Christian

> 
>   powerpc-e500v2-linux-gnuspe-ld: arch/powerpc/kernel/systbl.o: in function `sys_call_table':
>   (.rodata+0x6cc): undefined reference to `ppc_clone3'
>   make: *** [Makefile:1060: vmlinux] Error 1
> 
> The patch was tested using Christian's program on a real e500 machine.
> 
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -597,6 +597,14 @@ ppc_clone:
>  	stw	r0,_TRAP(r1)		/* register set saved */
>  	b	sys_clone
> 
> +	.globl	ppc_clone3
> +ppc_clone3:
> +	SAVE_NVGPRS(r1)
> +	lwz	r0,_TRAP(r1)
> +	rlwinm	r0,r0,0,0,30		/* clear LSB to indicate full */
> +	stw	r0,_TRAP(r1)		/* register set saved */
> +	b	sys_clone3
> +
>  	.globl	ppc_swapcontext
>  ppc_swapcontext:
>  	SAVE_NVGPRS(r1)
> 
> I don't think this trivial hunk deserves a separate patch submission.
> 
> Thanks,
> Arseny
