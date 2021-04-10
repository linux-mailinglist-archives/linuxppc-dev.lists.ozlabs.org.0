Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C112D35B0C5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 01:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHs1f5L55z3bvl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 09:40:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TDBrsBDO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TDBrsBDO; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHs172lzCz302g
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 09:39:54 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id m13so9728845oiw.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jbh9yWlGg2BNKfvTRjSRQJvtgak2JcPfucDME7L6Hms=;
 b=TDBrsBDOgQO2yz/IwOBWyZR3aeSBrlRYc88mJ0J3cuHmUATj33Nln6vqyboKsUOsUO
 KJvirM9eVf8WlNTnuoHT9pO46Rqlzs+DvxPBdh7oNqv03EJ2AG3zKiuooprzoMi9xha+
 Hey/Jx4jsjv6bKpqpewrPEI4Hf41pmU3hXLiKE7nuPa0kn7tXlzkRLKDtpTkt67hvytH
 9+oZv1V2zlwZd1cZqhNT44nqtmAR+g5MvMZpdE7yLRY7TDe/FKLVRA3pb1UamuLM4ftS
 p9gxLMTr2VV0kQqB6u1I3QU9hVO63b/tpLpN0ajg/bzqZUymsd4HPDHF29r+cVMRvLsQ
 S8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=jbh9yWlGg2BNKfvTRjSRQJvtgak2JcPfucDME7L6Hms=;
 b=qJCdgCfvSoF35sS5Re1Az/NLBXjb4FsvnhJcVuk97duU5PokJf26RURQBTh0N/vWlT
 2gE9yhuZpFuOYPJdX2157q/Hu44EO1TJ7DQae0YWjkZOYSXu1CJ372aCboQP+mvVfS5w
 8jJ3ekeHEN4GnML3ol1hhQygTbIY+bhWmfWFNu7R68L9vzzZNzxMUZ4QdXhqHREdHyk8
 c7nzXmVn4iprqHPiaIVCAuIVR9qsyoqPUC68nQcpEazn3CJxm/EbvThE5NoTGwYzds9B
 9zkGL2ebkbWu2Orn7sfNDHIhE+EdDn3/5oSy2J0GqtVDZ/5otu3Vl9KDgP/ktAsXXR79
 wrpg==
X-Gm-Message-State: AOAM530ivWPfsVjMgzkfCfNiF3oF5jEb8kZWbEh7DPB+FmSewIn//Vxk
 kNpyVVg7EK5nhP12sDPtdhc=
X-Google-Smtp-Source: ABdhPJyTDoW2zL12quMalKfpVkWtz6CY7vQs+OXkH7mWHcoSSFAacdHFNAIa9Rjp/Om/Bw+pFB14Kg==
X-Received: by 2002:aca:cf95:: with SMTP id
 f143mr14594033oig.104.1618097989394; 
 Sat, 10 Apr 2021 16:39:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p3sm1645085otk.9.2021.04.10.16.39.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 10 Apr 2021 16:39:48 -0700 (PDT)
Date: Sat, 10 Apr 2021 16:39:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 08/10] powerpc/signal32: Convert restore_[tm]_user_regs()
 to user access block
Message-ID: <20210410233947.GA202696@roeck-us.net>
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
 <181adf15a6f644efcd1aeafb355f3578ff1b6bc5.1616151715.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181adf15a6f644efcd1aeafb355f3578ff1b6bc5.1616151715.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-kernel@vger.kernel.org, cmr@codefail.de,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 11:06:57AM +0000, Christophe Leroy wrote:
> Convert restore_user_regs() and restore_tm_user_regs()
> to use user_access_read_begin/end blocks.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
...
>  static long restore_user_regs(struct pt_regs *regs,
>  			      struct mcontext __user *sr, int sig)
>  {
...
> @@ -567,19 +569,22 @@ static long restore_user_regs(struct pt_regs *regs,
>  	regs->msr &= ~MSR_SPE;
>  	if (msr & MSR_SPE) {
>  		/* restore spe registers from the stack */
> -		if (__copy_from_user(current->thread.evr, &sr->mc_vregs,
> -				     ELF_NEVRREG * sizeof(u32)))
> -			return 1;
> +		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
> +				      ELF_NEVRREG * sizeof(u32));

arch/powerpc/kernel/signal_32.c: In function 'restore_user_regs':
arch/powerpc/kernel/signal_32.c:565:36: error: macro "unsafe_copy_from_user" requires 4 arguments, but only 3 given

Guenter
