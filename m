Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225B349C1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 23:12:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5zr32FBFz3byb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 09:12:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=il68+HIC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=il68+HIC; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5zqf6Fpgz302c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 09:12:28 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id u19so3201725pgh.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 15:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DYUjSc1vAjGrU7Upg//GwkOyzK5I7lVAlzXmtTspUfQ=;
 b=il68+HICDOpc315fwdeM5b5fe9U1OGmrgs8JA1Q4TimO7bh5f4kHrj87ZxXtRKuDVK
 lp+v5uD/1rHtyYh4J4hyvUcDa0a5JtY3jBtNgDZvnFz8WNrBCg+rxevJntyvuxlbO3yG
 LfmGszSXA9rGeLIiuuQTOjGLoQ1VPel2tP9d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DYUjSc1vAjGrU7Upg//GwkOyzK5I7lVAlzXmtTspUfQ=;
 b=hCTrN+pjWVRyEWD1gXNcuC7i0Oj+0w+pF3b9qTpfQ0dx8AuHXtrWwYwZ+whHJlb6y9
 gGaoesJDle14daljftIDvk2Vg2OUr5rprnJdsSuSlNm+n0d18hr3ByJr6l3yK6fwqCJT
 rfIt6QMu1dBrSH33xIZHHyL/MI6mhlZaeQqq6pgrbEw5pBQvEATx8lTEj4l77JfyAFDI
 X4GE5uZIhCB0GBRb6e+x22HqbTV8zEW5y3R92VAzio1X0V5apc5r/mAjerCqTLdG243S
 o9dAaOYAJtUhQNdNUtE0RRT1fuFavnHSsjhTwIzp2PHIGWr6XtiF7Jbo1BEa9Xvfad/K
 oa8A==
X-Gm-Message-State: AOAM533A6b81FL7xFGWHX/crr2Eqsa9CfaxENZxcFxE/boaTnfqppCqi
 82pIXj2MZUtX78mRxDa6HT/U0A==
X-Google-Smtp-Source: ABdhPJzyk3/6T2KTl3Q2oxAZNwgaIDL+ylwu4Jhi1U3VGe0zniFZfT/tDO/a8nD10ys8oqpnYWsUpw==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr9670244pgm.186.1616710345290; 
 Thu, 25 Mar 2021 15:12:25 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-5199-f2bf-3cbb-22e6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:5199:f2bf:3cbb:22e6])
 by smtp.gmail.com with ESMTPSA id w37sm6555685pgl.13.2021.03.25.15.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 15:12:24 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 06/15] powerpc/align: Don't use __get_user_instr() on
 kernel addresses
In-Reply-To: <d9ecbce00178484e66ca7adec2ff210058037704.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
 <d9ecbce00178484e66ca7adec2ff210058037704.1615398265.git.christophe.leroy@csgroup.eu>
Date: Fri, 26 Mar 2021 09:12:21 +1100
Message-ID: <877dlukhmi.fsf@dja-thinkpad.axtens.net>
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

> In the old days, when we didn't have kernel userspace access
> protection and had set_fs(), it was wise to use __get_user()
> and friends to read kernel memory.
>
> Nowadays, get_user() is granting userspace access and is exclusively
> for userspace access.
>
> In alignment exception handler, use probe_kernel_read_inst()
> instead of __get_user_instr() for reading instructions in kernel.
>
> This will allow to remove the is_kernel_addr() check in
> __get/put_user() in a following patch.
>

Looks good to me!

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/align.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index c4d7b445b459..8d4c7af262e2 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -310,7 +310,11 @@ int fix_alignment(struct pt_regs *regs)
>  	 */
>  	CHECK_FULL_REGS(regs);
>  
> -	if (unlikely(__get_user_instr(instr, (void __user *)regs->nip)))
> +	if (is_kernel_addr(regs->nip))
> +		r = probe_kernel_read_inst(&instr, (void *)regs->nip);
> +	else
> +		r = __get_user_instr(instr, (void __user *)regs->nip);
> +	if (unlikely(r))
>  		return -EFAULT;
>  	if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
>  		/* We don't handle PPC little-endian any more... */
> -- 
> 2.25.0
