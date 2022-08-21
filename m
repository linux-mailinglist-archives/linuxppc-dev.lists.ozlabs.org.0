Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4B459B6AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 01:01:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9rbD20LVz3c87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 09:01:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F0ptjTbx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=shorne@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F0ptjTbx;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9jWS4mPYz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 03:42:59 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id u5so2854717wrt.11
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 10:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=7Nrg8mvlqxFEJfzKh/tw2+dBWE8D/s98GD2ZnmZvMl4=;
        b=F0ptjTbxLv2NJaVf2gvBlBshDMfCokLJPPMsIV35UHBlxVECPPma43FPvPitouEYuo
         8dgtnhsmPRFBvIO948wmtVOueVdGaHu/6efegZ+eBz+dquE2oOi9XMsurik6HL7oB6MX
         jV8pUVxH3f1RrwF0NH6pncq2tH6AwoMHlp65ZDTNCyiT6v1mar/Hou3sFmBJRov6RKag
         O1el0UDp9u/+GhEvUUZhnnL+z+SJXn9IfDfG4Dlp/Iuz3gqoHz6wEPHD+abHkg+f2q3v
         w/lO0XWXR94cHio73ZqXyXjLv1uGE7J2Xgag56CksB4nH92y765Uk+pyJbn+nJIZ5N3k
         uDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=7Nrg8mvlqxFEJfzKh/tw2+dBWE8D/s98GD2ZnmZvMl4=;
        b=xg/QfCw1As9UFZUANXJjtJnfU9RKh/Wbuit8E/hb36qNNEtBwPLL3BpqnWdH5axFex
         Ez6FCFIH6p519pkYsDpJ5kcupR7qzc64NuyosFwFiM4HyABidRGO6m25UdlQsAMjCl6n
         RcQ3rOfuDcr/rU+UyQuRsgWWwBNdAXMjB7b25uSiRpB1Z4Jok8tWwAzWHBCpMUJmFJRE
         iSn0uegIiC4P7O/1PcDfqwdW1FMnMc+XkhdYl9Ent4s+k7SpnbUmxXlEmewPXjL48cn6
         8Eau/8U+ipC7xHo/TjW5kcTGS0F2zqb/SUl8Y4gVxzSs06Np+Czwh+xoPKoW92BLa4M+
         6fmg==
X-Gm-Message-State: ACgBeo2Hq6sPZCor6T9caOwQVpTQB8KHz6VGHZ6TTYmTkwjBx6xLb2Ll
	/zUf4tOhdZ2vjrsYCuMacDk=
X-Google-Smtp-Source: AA6agR6ii5ETBOVbnXGvrEQ2XHp9wCOCZjRgmUsSrgmsT/hEBxdRm1IL0twc5nHL0nICTG/92OzUKA==
X-Received: by 2002:a05:6000:993:b0:222:d509:4b5b with SMTP id by19-20020a056000099300b00222d5094b5bmr9262211wrb.52.1661103772368;
        Sun, 21 Aug 2022 10:42:52 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
        by smtp.gmail.com with ESMTPSA id t24-20020a1c7718000000b003a643ac2b08sm6876286wmi.8.2022.08.21.10.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 10:42:51 -0700 (PDT)
Date: Sun, 21 Aug 2022 17:42:51 +0000
From: Stafford Horne <shorne@gmail.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] kernel: exit: cleanup release_thread()
Message-ID: <YwJum2c1I8JhY0B8@oscomms1>
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
X-Mailman-Approved-At: Mon, 22 Aug 2022 09:01:13 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Bornt
 raeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>, Chris Zankel <chris@zankel.net>, linux-um@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Richard Weinberger <richard
 @nod.at>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 19, 2022 at 09:44:06AM +0800, Kefeng Wang wrote:
> Only x86 has own release_thread(), introduce a new weak
> release_thread() function to clean empty definitions in
> other ARCHs.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---

>  arch/openrisc/include/asm/processor.h   | 1 -
>  arch/openrisc/kernel/process.c          | 4 ----

> diff --git a/arch/openrisc/include/asm/processor.h b/arch/openrisc/include/asm/processor.h
> index aa1699c18add..ed9efb430afa 100644
> --- a/arch/openrisc/include/asm/processor.h
> +++ b/arch/openrisc/include/asm/processor.h
> @@ -72,7 +72,6 @@ struct thread_struct {
>  
>  
>  void start_thread(struct pt_regs *regs, unsigned long nip, unsigned long sp);
> -void release_thread(struct task_struct *);
>  unsigned long __get_wchan(struct task_struct *p);
>  
>  #define cpu_relax()     barrier()
> diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
> index 52dc983ddeba..f94b5ec06786 100644
> --- a/arch/openrisc/kernel/process.c
> +++ b/arch/openrisc/kernel/process.c
> @@ -125,10 +125,6 @@ void show_regs(struct pt_regs *regs)
>  	show_registers(regs);
>  }
>  
> -void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  /*
>   * Copy the thread-specific (arch specific) info from the current
>   * process to the new one p

For OpenRISC bits.

Acked-by: Stafford Horne <shorne@gmail.com>
