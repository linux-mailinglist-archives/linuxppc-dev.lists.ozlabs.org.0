Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A60E24C0749
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 02:44:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Jk902kcz3cTM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:44:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4LFj9bz4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4LFj9bz4; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3JhJ4ckpz3bPH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 12:42:55 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso735081pju.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 17:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=N2UCfbLp79h/dkfWTGY4WIVSQeEuINCqmpbos16sW34=;
 b=4LFj9bz4NwjfZrhnHEdaivZOeq/+lWRcuq5Y1wzU2pkH5M1EbGGH+iS2dAWte4zzK0
 uhfsYDkF8v/YwKD4UrkItpNjka+Xnb5VDUm1+nNaSTfiwLfufG7rXr/ximrBJWWJ3I98
 SVPPLrKIpK7zmmK0mTw99x5pVOqdEe7hcOHvTEa4Vd3384rUHgzjAjmsWfjUCq+/kFkH
 LdIKEFlWMPZJtDKZwldMNodHN+jWw5yu0bDJ44NRvdh2aClgYR4rkjeegQmMBQE1UbfI
 CHqHwSMlqOGdpTnIqkYZYWyNY/pga1f2aIBpTtYLUdCay8XLPTHf+igsHER5SXIaDjrF
 Bjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=N2UCfbLp79h/dkfWTGY4WIVSQeEuINCqmpbos16sW34=;
 b=0+ixqtQZzF9yqPWOlOTULmumSuxlBECHAXca+mQpkdjm/pYrcTXvGltdhNeZdmIqJZ
 bM48rlgCAy36Quex18E2LvM9P1tKXd7UefShqffPfn0eHMgbuOUNczMf+jnGczfHCjaa
 8BOt9nWS7g+F9zFiy4s3CgNNLmPbYwWYTkfps0EypTuK+TyisnnetNEjwtCq4NWe7Ide
 2B6MAvCN/fT24bwQGWlI9LyHxOsCC1pTC6lTkrZ1kmYB1z2svyZl6zNCzj/rFRHqEQYk
 g2jCEOGJbY78z7hzkFrDDB5UptcsJUUIxYEug/XdWF004e6cDwJxUBgPcjPnOpdDfa3K
 hAvA==
X-Gm-Message-State: AOAM533Zxi4Dn7L7MnMRY8xpk7WfXu4iVBVEtILOi9dq+79oLVyZKeNL
 G3GVCLqqwdZqu/vpzflceXEfLg==
X-Google-Smtp-Source: ABdhPJziibP3VeHPcI77/p+oZjngxSrgPOeEDAz92xaYnjXHit/HBL3E+aw7A2/vfSyzdBkgFOVIog==
X-Received: by 2002:a17:90a:a502:b0:1bc:8dd6:a859 with SMTP id
 a2-20020a17090aa50200b001bc8dd6a859mr2404594pjq.46.1645580569193; 
 Tue, 22 Feb 2022 17:42:49 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id bd13sm4528769pfb.60.2022.02.22.17.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:42:48 -0800 (PST)
Date: Tue, 22 Feb 2022 17:42:48 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 15:29:49 PST (-0800)
Subject: Re: [PATCH V5 13/21] riscv: compat: process: Add UXL_32 support in
 start_thread
In-Reply-To: <20220201150545.1512822-14-guoren@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-5c3b969c-9a23-48dc-ab10-a1addc6a5349@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 guoren@linux.alibaba.com, linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>,
 drew@beagleboard.org, anup@brainfault.org, wangjunqiang@iscas.ac.cn,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, guoren@kernel.org, liush@allwinnertech.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, wefu@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 01 Feb 2022 07:05:37 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> If the current task is in COMPAT mode, set SR_UXL_32 in status for
> returning userspace. We need CONFIG _COMPAT to prevent compiling
> errors with rv32 defconfig.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/kernel/process.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 03ac3aa611f5..1a666ad299b4 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>  	}
>  	regs->epc = pc;
>  	regs->sp = sp;
> +
> +#ifdef CONFIG_COMPAT
> +	if (is_compat_task())
> +		regs->status |= SR_UXL_32;

Not sure if I'm just misunderstanding the bit ops here, but aren't we 
trying to set the UXL field to 1 (for UXL=32)?  That should be a bit 
field set op, not just an OR.

> +#endif
>  }
>
>  void flush_thread(void)

Additionally: this isn't really an issue so much with this patch, but it 
does bring up that we're relying on someone else to have set UXL=64 on 
CONFIG_COMPAT=n systems.  I don't see that in any spec anywhere, so we 
should really be setting UXL in Linux for all systems (ie, not just those with
COMPAT=y).
