Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A0B5388F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 00:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBqsX22hsz3cdJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:32:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=G2A0nuMR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=palmer@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=G2A0nuMR;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBl6k1m0nz3015
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 04:58:19 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 137so10808846pgb.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 11:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=FFd5J9hlrCh2QSfJ0U9Wq/vsfh13pMH0ZkFo1eZIXtA=;
        b=G2A0nuMRKJztXPtT1GUrPx85rUqGPGHpsq6URvVAWa2fAqIkqlfU4RngPrGYBoa1Ni
         M6NJlw8gvJTBgkCc39LSTpamjbz9roIDkZlQnC9RO7k8Rc/xTX31a3GgYujadTBpfIga
         JQwSMuZ1HKoUjn6bSrBPFJvBaAnJAoYYH3EqEdZ9ex71cFuQ884I0tNEZG45hvUsKFSe
         SdW5ZEoZd6rbSNFsE45uC0UD8kqMIeKOTMqVLl/EmGGsbxPQhZqogmDjAeWQ19R+ngDM
         5BxwPho/sCen5YkWBuTX+8h/WXJiDTTq1gmrRwjtIax6oHnLs3pgInlqG/tnWA3am8JP
         E8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=FFd5J9hlrCh2QSfJ0U9Wq/vsfh13pMH0ZkFo1eZIXtA=;
        b=n/hoybmYq7TqGPGGrJwvO0rI0Xc880S98b5IrMKm9crHTnrn5+SXEFM4HM2q+jisNp
         YywgbyxyK9H1nx3F+2Yssa2sdWBaQgSRenbzR+8sYgF2GTBPw3mDUjAqYncY7+XQM2G0
         mQmB11hUPWQ1NTYPcS2m09keUhz8RBe5leQ0XOm/7pVSOcdNn3bQYaxo5Yj4tSqCbb11
         1jzRyrpAQXixE9vGyf5zEVsdNlctDYZ9q9lkWC86FyZbZ46w/W7hrIBrr//reFrKpps8
         DyQmMR6whYOG8DYgi2rx5P8uzi1fcVgf5RHj1sBhOu8PEbIiPv7/JrWSgUlEnGkSodwk
         vegQ==
X-Gm-Message-State: AOAM530rprYEhmKtvdIR8ivk6BrWpSrXgqkRKYdfg7C3q4nf/XFUnYZz
	osicKGrRP2bAdojRX9aJKgkhwg==
X-Google-Smtp-Source: ABdhPJxxJ8lgOI/t/BS91nMmuF/AA3XEFbCsJdbzVlMXQCjM93kfvxRGwUywbXar5ejrleDbO2A5Hg==
X-Received: by 2002:a63:2026:0:b0:3fa:cefb:e408 with SMTP id g38-20020a632026000000b003facefbe408mr25103264pgg.57.1653937096823;
        Mon, 30 May 2022 11:58:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id n16-20020aa79050000000b00518c6887217sm9107889pfo.58.2022.05.30.11.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:58:16 -0700 (PDT)
Date: Mon, 30 May 2022 11:58:16 -0700 (PDT)
X-Google-Original-Date: Mon, 30 May 2022 11:58:13 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Prepare dropping week attribute from arch_kexec_apply_relocations[_add]
In-Reply-To: <20220530074202.pydmbbgvbtaugw5j@pengutronix.de>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: u.kleine-koenig@pengutronix.de
Message-ID: <mhng-5872aea0-6f64-4685-8f8d-fdeb42e4c972@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 08:25:41 +1000
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
Cc: wangkefeng.wang@huawei.com, guoren@linux.alibaba.com, sunnanyong@huawei.com, jszhang@kernel.org, mick@ics.forth.gr, linux-riscv@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, alex@ghiti.fr, naveen.n.rao@linux.vnet.ibm.com, lizhengyu3@huawei.com, aou@eecs.berkeley.edu, liaochang1@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Topel <bjorn.topel@gmail.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, penberg@kernel.org, ebiederm@xmission.com, kernel@pengutronix.de, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 May 2022 00:42:02 PDT (-0700), u.kleine-koenig@pengutronix.de wrote:
> Without this change arch/riscv/kernel/elf_kexec.c fails to compile once
> commit 233c1e6c319c ("kexec_file: drop weak attribute from
> arch_kexec_apply_relocations[_add]") is also contained in the tree.
> This currently happens in next-20220527.
>
> Prepare the RISC-V similar to the s390 adaption done in 233c1e6c319c.
> This is safe to do on top of the riscv change even without the change to
> arch_kexec_apply_relocations.
>
> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
> Looks-good-to: liaochang (A) <liaochang1@huawei.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>
> On Mon, May 30, 2022 at 09:43:26AM +0800, liaochang (A) wrote:
>> > I can confirm that doing
>> > 
>> > diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
>> > index 206217b23301..eee260e8ab30 100644
>> > --- a/arch/riscv/include/asm/kexec.h
>> > +++ b/arch/riscv/include/asm/kexec.h
>> > @@ -55,6 +55,13 @@ extern riscv_kexec_method riscv_kexec_norelocate;
>> >  
>> >  #ifdef CONFIG_KEXEC_FILE
>> >  extern const struct kexec_file_ops elf_kexec_ops;
>> > +
>> > +struct purgatory_info;
>> > +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
>> > +				     Elf_Shdr *section,
>> > +				     const Elf_Shdr *relsec,
>> > +				     const Elf_Shdr *symtab);
>> > +#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
>> >  #endif
>> >  
>> >  #endif
>> 
>> LGTM, you could send a fixup patch to riscv, thanks.
>> 
>> > 
>> > on top of 838b3e28488f results in a compilable tree. And when merging
>> > 233c1e6c319c into this, it is still building.
>> > 
>> > I'm not enough into kexec (and riscv) to judge if this is sensible, or
>> > create a useful commit log but the obvious way forward is to apply the
>> > above patch to the riscv tree before it hits Linus' tree.
>
> Ok, here comes a patch with a generic commit log. 
>
> @riscv people: If you prefer, squash it into 838b3e28488f.

Sorry, just saw this after I sent my version of the fix.  They're the 
same, but do you mind sending a full-on patch so I can merge it?

>
> Best regards
> Uwe
>
>  arch/riscv/include/asm/kexec.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
> index 206217b23301..eee260e8ab30 100644
> --- a/arch/riscv/include/asm/kexec.h
> +++ b/arch/riscv/include/asm/kexec.h
> @@ -55,6 +55,13 @@ extern riscv_kexec_method riscv_kexec_norelocate;
>  
>  #ifdef CONFIG_KEXEC_FILE
>  extern const struct kexec_file_ops elf_kexec_ops;
> +
> +struct purgatory_info;
> +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> +				     Elf_Shdr *section,
> +				     const Elf_Shdr *relsec,
> +				     const Elf_Shdr *symtab);
> +#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
>  #endif
>  
>  #endif
>
> base-commit: 838b3e28488f702e2b5477b393f009b2639d2b1a
> -- 
> 2.36.1
>
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
