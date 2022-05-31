Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34305539434
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 17:46:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCGpR0syTz3bkM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 01:46:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5wcFHM/I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=palmer@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5wcFHM/I;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCGnk2jBJz2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 01:45:28 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id n18so13184099plg.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=+jxnpPySjns9WZXtYAeSufhkP2YRQS3HOSHZmGEDZ04=;
        b=5wcFHM/I1reVsJZKJ07bukcm1kBKagjnExNBI/xeoY/NTq2btN/4etr2hsEdw+VjFY
         njuEiKUEWBstz3Z6YWlCe0XhV8VUAn9rD3Z1Hc+vOQAGnsh6wv2MBchoWxLBXBJaE/qi
         aoo3RjfTDGBFAV2vbqK7AD515kHowYwxWU4UyOebqqWZLaY6QrpHLZDdfv3yDGcQM6Bx
         PP+VFt+dNd18lElH2Jv5oPozlWChl9bhqYU8fzaWwTGKDZY4eH3g+ZTGER3U9hER6/LM
         GEIV0308TxjluKDt9+lZ2/En5R+cg8sZ1Gt4rrv5PeoY2axRbQSl1I1+CuVO4Ik3RvRF
         AFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=+jxnpPySjns9WZXtYAeSufhkP2YRQS3HOSHZmGEDZ04=;
        b=DzpHX7xvbA+UWvRckjf2V7TJHid7IkfJmGgHvNjY+y9hlkqTLIKsJ4IlVVt4LZtI6e
         lY8ntylC9SJLsiJfNOGctv7w2tHyu/kwP47qYUhq9q37hIR74fhqokw1IeVQRlLKgoRu
         FchuOH35dPp0IoOAUUX48oJe1RwdYHA7xLX6Jo8IBedKgf+y4kdCj3jdfKCLwBirPEM7
         lgOUhS4laLic5KXS52D6dhmPZlhZvbT7k0d7q7rK8HdDMcp5Ye0yQhxtYrlY8NroscQ/
         LdEbMIeqKxM9qDa8Jjy+j0Dp3U5Pq3L03HQsYMSyPBILPEwN2fs7hOhhNbLnuG/eb7JR
         Q7kA==
X-Gm-Message-State: AOAM53040TykgzduqJnnltz3RM1e8mBozERMCUVjimeTu4rzvk4pibNP
	FW+cIj5n0msleGeBGb/uIDI17Q==
X-Google-Smtp-Source: ABdhPJxpSEaugMAP2DG8fBB1Cjqi+Yfmbfthf/yUFY5TNAY8Ag43tjDRozyvkZZkXSXKmeZdbvfFyw==
X-Received: by 2002:a17:90b:4d90:b0:1e3:3025:66fe with SMTP id oj16-20020a17090b4d9000b001e3302566femr5672640pjb.145.1654011925129;
        Tue, 31 May 2022 08:45:25 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902eb9000b0015ea95948ebsm5318319plg.134.2022.05.31.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 08:45:24 -0700 (PDT)
Date: Tue, 31 May 2022 08:45:24 -0700 (PDT)
X-Google-Original-Date: Tue, 31 May 2022 08:45:23 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Prepare dropping week attribute from arch_kexec_apply_relocations[_add]
In-Reply-To: <20220531055803.prq5fj6lajzqiiiu@pengutronix.de>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: u.kleine-koenig@pengutronix.de
Message-ID: <mhng-29ba2a72-3ea8-4b27-8436-acde7976914f@palmer-ri-x1c9>
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

On Mon, 30 May 2022 22:58:03 PDT (-0700), u.kleine-koenig@pengutronix.de wrote:
> On Mon, May 30, 2022 at 04:11:27PM -0700, Palmer Dabbelt wrote:
>> On Mon, 30 May 2022 12:41:33 PDT (-0700), u.kleine-koenig@pengutronix.de wrote:
>> > Hello,
>> > 
>> > On Mon, May 30, 2022 at 11:58:16AM -0700, Palmer Dabbelt wrote:
>> > > On Mon, 30 May 2022 00:42:02 PDT (-0700), u.kleine-koenig@pengutronix.de wrote:
>> > > > Without this change arch/riscv/kernel/elf_kexec.c fails to compile once
>> > > > commit 233c1e6c319c ("kexec_file: drop weak attribute from
>> > > > arch_kexec_apply_relocations[_add]") is also contained in the tree.
>> > > > This currently happens in next-20220527.
>> > > > > Prepare the RISC-V similar to the s390 adaption done in
>> > > 233c1e6c319c.
>> > > > This is safe to do on top of the riscv change even without the change to
>> > > > arch_kexec_apply_relocations.
>> > > > > Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
>> > > > Looks-good-to: liaochang (A) <liaochang1@huawei.com>
>> > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> > > > ---
>> > > > > On Mon, May 30, 2022 at 09:43:26AM +0800, liaochang (A) wrote:
>> > > > > > I can confirm that doing
>> > > > > > > diff --git a/arch/riscv/include/asm/kexec.h
>> > > > > b/arch/riscv/include/asm/kexec.h
>> > > > > > index 206217b23301..eee260e8ab30 100644
>> > > > > > --- a/arch/riscv/include/asm/kexec.h
>> > > > > > +++ b/arch/riscv/include/asm/kexec.h
>> > > > > > @@ -55,6 +55,13 @@ extern riscv_kexec_method riscv_kexec_norelocate;
>> > > > > >  >  #ifdef CONFIG_KEXEC_FILE
>> > > > > >  extern const struct kexec_file_ops elf_kexec_ops;
>> > > > > > +
>> > > > > > +struct purgatory_info;
>> > > > > > +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
>> > > > > > +				     Elf_Shdr *section,
>> > > > > > +				     const Elf_Shdr *relsec,
>> > > > > > +				     const Elf_Shdr *symtab);
>> > > > > > +#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
>> > > > > >  #endif
>> > > > > >  >  #endif
>> > > > > > > LGTM, you could send a fixup patch to riscv, thanks.
>> > > > > > > > > on top of 838b3e28488f results in a compilable tree. And
>> > > when
>> > > > > merging
>> > > > > > 233c1e6c319c into this, it is still building.
>> > > > > > > I'm not enough into kexec (and riscv) to judge if this is
>> > > > > sensible, or
>> > > > > > create a useful commit log but the obvious way forward is to apply the
>> > > > > > above patch to the riscv tree before it hits Linus' tree.
>> > > > > Ok, here comes a patch with a generic commit log.
>> > > > > @riscv people: If you prefer, squash it into 838b3e28488f.
>> > > 
>> > > Sorry, just saw this after I sent my version of the fix.  They're the same,
>> > > but do you mind sending a full-on patch so I can merge it?
>> > 
>> > Sorry, I don't understand your request. I found
>> > https://lore.kernel.org/linux-riscv/20220530180408.16239-1-palmer@rivosinc.com/
>> > 
>> > but I don't know what a full-on patch is and what stops you merging my
>> > patch.
>> > 
>> > Is it that it's in reply to a patch series and b4 fails to fetch the
>> > right patch and you ask to send it in a new thread?
>> 
>> Ya, with the reply bits in there my mail merge (which unfortunately isn't
>> b4, I haven't gotten around to converting yet) got tripped up.  It's kind of
>> easy to for me to screw something up trying to pull bits out of replies and
>> such, but I think this one was pretty simple (looks like maybe some PGP or
>> MIME thing was the issue).
>> 
>> I just put <https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=7699f7aacf3ebfee51c670b6f796b2797f0f7487>
>> on my staging branch, it looks OK to me but LMK if there's a problem.
>
> there is indeed a problem, but caused by me: If you are ready to rewrite
> it, please do s/week/weak/ in the subject line. Otherwise looks good to
> me.

Ah, sorry, I missed that too.  I was hoping to send a PR this morning, 
I'd usually just rewrite and delay this one but given it's necessary to 
make the post-merge build work I'm going to just send it up with the 
spelling error.

>
> Best regards and thanks,
> Uwe
>
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
