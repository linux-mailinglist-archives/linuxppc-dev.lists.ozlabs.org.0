Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2B538916
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 01:12:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBrlZ1K1Gz3bkS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 09:12:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rEab6xQw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=palmer@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rEab6xQw;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBrkv2dBlz2yyQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 09:11:33 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id i18so11617069pfk.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 16:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=XccysWYb9npF6/LhDMMloDpt6bBM9wjai1M7rMuSIWA=;
        b=rEab6xQwEY+eak1x8ft2kjj07SA4kneFvxf9adlurZbtSov84bRMpGloFeGQOBjiJE
         OQ2qrUSAwSfpyJM2Fcl4HvAPv3VSoYYPvdnUj2w6JucpE9uPQ0mnkx71/OhVqYg2+CWg
         BBQ/lbXI6x43ekWTRCgZ/Dm9K31i4HWACdKAO2U24CgCYtqI5zT0cLGqr9Ia8zvNX5Pp
         +rFWp27IhTGXJMo46x6MaK4PZXfQ2VWP1+42/N4/90uwBRCpvCKB4ArBfcdGDt08Vcxx
         q1AC3Q/Ldch9FHiiWGDvfctYxhGuvdatyIXFs2ah/NxknnESi/6v7I4Rby1xMSc8iLxh
         ULIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=XccysWYb9npF6/LhDMMloDpt6bBM9wjai1M7rMuSIWA=;
        b=vCwmFXs3xJNHcaZTTNq9hsq9puANXn0tjWXydGvPbxUXLzWKI8XyHEm0waNV7QtZ2E
         du4aRx6oVBSIjLMreFLceIyLcOwy2PT6FfWRWOt4B+JoXIphFRwLfnYs5NIEFRMVn3Sk
         s1Hr4etPBsJTnD4QCHhYO+0n4dRix6sejAD8W/ROImG7r7zCxFjqab66md8K1R5o/9rV
         IEMDDto7DNd6mBL5BKXmySj6JOkYbzR6T8kMdQIisAEeuJBg+gR4/GbyjqG9YHRHogyF
         efAR5QdjK1fNkNpJYI9pepuNW2z20Z98D0yylB9m0r/Esi8mMn8IQsDsBKOBVkVWfT9W
         fCeg==
X-Gm-Message-State: AOAM533i0qH6ph6pus597LIaNqtbySbKr1Dfu1dnBDpmupLJGeJDmCYR
	HsZq72aEpszpcoZqfzZrRYOkJw==
X-Google-Smtp-Source: ABdhPJywJkfeRl2r1A5LD7jIeXFcAGYOXC/vSUBBTpRc2bJNyDatde0HYxiGJjkDLh3XNObv/FtM4g==
X-Received: by 2002:a05:6a00:248c:b0:519:27f7:28a8 with SMTP id c12-20020a056a00248c00b0051927f728a8mr20376570pfv.32.1653952288194;
        Mon, 30 May 2022 16:11:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id z125-20020a626583000000b00518119900e9sm9372102pfb.53.2022.05.30.16.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 16:11:27 -0700 (PDT)
Date: Mon, 30 May 2022 16:11:27 -0700 (PDT)
X-Google-Original-Date: Mon, 30 May 2022 16:11:25 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Prepare dropping week attribute from arch_kexec_apply_relocations[_add]
In-Reply-To: <20220530194133.udwdjsb2l33hsiil@pengutronix.de>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: u.kleine-koenig@pengutronix.de
Message-ID: <mhng-99e09fbd-fa71-40fc-92da-ff4af0d209a5@palmer-mbp2014>
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
Cc: wangkefeng.wang@huawei.com, guoren@linux.alibaba.com, sunnanyong@huawei.com, jszhang@kernel.org, mick@ics.forth.gr, linux-riscv@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, alex@ghiti.fr, naveen.n.rao@linux.vnet.ibm.com, lizhengyu3@huawei.com, aou@eecs.berkeley.edu, liaochang1@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Topel <bjorn.topel@gmail.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, penberg@kernel.org, ebiederm@xmission.com, kernel@pengutronix.de, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 May 2022 12:41:33 PDT (-0700), u.kleine-koenig@pengutronix.de wrote:
> Hello,
>
> On Mon, May 30, 2022 at 11:58:16AM -0700, Palmer Dabbelt wrote:
>> On Mon, 30 May 2022 00:42:02 PDT (-0700), u.kleine-koenig@pengutronix.de wrote:
>> > Without this change arch/riscv/kernel/elf_kexec.c fails to compile once
>> > commit 233c1e6c319c ("kexec_file: drop weak attribute from
>> > arch_kexec_apply_relocations[_add]") is also contained in the tree.
>> > This currently happens in next-20220527.
>> > 
>> > Prepare the RISC-V similar to the s390 adaption done in 233c1e6c319c.
>> > This is safe to do on top of the riscv change even without the change to
>> > arch_kexec_apply_relocations.
>> > 
>> > Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
>> > Looks-good-to: liaochang (A) <liaochang1@huawei.com>
>> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> > ---
>> > 
>> > On Mon, May 30, 2022 at 09:43:26AM +0800, liaochang (A) wrote:
>> > > > I can confirm that doing
>> > > > > diff --git a/arch/riscv/include/asm/kexec.h
>> > > b/arch/riscv/include/asm/kexec.h
>> > > > index 206217b23301..eee260e8ab30 100644
>> > > > --- a/arch/riscv/include/asm/kexec.h
>> > > > +++ b/arch/riscv/include/asm/kexec.h
>> > > > @@ -55,6 +55,13 @@ extern riscv_kexec_method riscv_kexec_norelocate;
>> > > >  >  #ifdef CONFIG_KEXEC_FILE
>> > > >  extern const struct kexec_file_ops elf_kexec_ops;
>> > > > +
>> > > > +struct purgatory_info;
>> > > > +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
>> > > > +				     Elf_Shdr *section,
>> > > > +				     const Elf_Shdr *relsec,
>> > > > +				     const Elf_Shdr *symtab);
>> > > > +#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
>> > > >  #endif
>> > > >  >  #endif
>> > > 
>> > > LGTM, you could send a fixup patch to riscv, thanks.
>> > > 
>> > > > > on top of 838b3e28488f results in a compilable tree. And when
>> > > merging
>> > > > 233c1e6c319c into this, it is still building.
>> > > > > I'm not enough into kexec (and riscv) to judge if this is
>> > > sensible, or
>> > > > create a useful commit log but the obvious way forward is to apply the
>> > > > above patch to the riscv tree before it hits Linus' tree.
>> > 
>> > Ok, here comes a patch with a generic commit log.
>> > 
>> > @riscv people: If you prefer, squash it into 838b3e28488f.
>> 
>> Sorry, just saw this after I sent my version of the fix.  They're the same,
>> but do you mind sending a full-on patch so I can merge it?
>
> Sorry, I don't understand your request. I found
> https://lore.kernel.org/linux-riscv/20220530180408.16239-1-palmer@rivosinc.com/
>
> but I don't know what a full-on patch is and what stops you merging my
> patch. 
>
> Is it that it's in reply to a patch series and b4 fails to fetch the
> right patch and you ask to send it in a new thread?

Ya, with the reply bits in there my mail merge (which unfortunately 
isn't b4, I haven't gotten around to converting yet) got tripped up.  
It's kind of easy to for me to screw something up trying to pull bits 
out of replies and such, but I think this one was pretty simple (looks 
like maybe some PGP or MIME thing was the issue).

I just put 
<https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=7699f7aacf3ebfee51c670b6f796b2797f0f7487> 
on my staging branch, it looks OK to me but LMK if there's a problem.

Thanks!

>
> Best regards
> Uwe
>
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
