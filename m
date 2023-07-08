Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E574BE98
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 19:31:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QzeQwAce;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qyy3Q2xpkz3c3q
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 03:30:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QzeQwAce;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qyy2W13w3z30PN
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 03:30:09 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-992f15c36fcso399181766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688837401; x=1691429401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KYD6jlXBis0p+PBTKlv8qzvLQ1gqj2dZYI23tZfDs+4=;
        b=QzeQwAceDJjVXJvGJM+3WucNS3YwkJuqcjbVwBANp9B0yMPX6R+mPsBtM7EmTqinwO
         JDbtzZwZMizOiOl7fV7piKWPbwokJSlqBFiq4V9vWh/dTGbk4ezsUKKlbbj/sW9ieE+g
         T8gQKKc3AlrB4ZvceyWg+gm3K6DJ5+evwa4Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688837401; x=1691429401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYD6jlXBis0p+PBTKlv8qzvLQ1gqj2dZYI23tZfDs+4=;
        b=Cw3+fsKt+X5TcdiUsoKgIc7/bDmDsKukjUjnX640MBAO2LO2I35nLKhrusXfAZ4fLA
         kRazKgC6FvzZAnQ9vx12rYOPIuCv5CB5k6Z0u5jAmYzf8VodJ9r4KL166+ympvVId6vh
         z3lMGS8UVqHpobzBd1etmopNDAyFfLYmDb11QliwJShxeNyBYE6+H1N4BF3WWrOc916P
         3+BhFKmqGhmywtWt+7aD2b/G8z/58uT0z3Osp3KsZX20LE8dNJ9CD+9Wea8IffYNGdq2
         uQmJEOvn4ddg4Ot/CM//358FtwxhkZRs6PKiXkyhUrf0KsGu5GBXWRYywZC6F9MfG7RV
         H8qw==
X-Gm-Message-State: ABy/qLYxSdwXMxrUWbSkyyhPkq25bmyaSmCgyoabqhCEACXvP05U5Jyc
	Kmc/VoumGlXhUDhbr07Ofya+RuqN73DuuPKw+71LexEs
X-Google-Smtp-Source: APBJJlHBDlwPYZteYnpH8PzK4wR3CS6XcfN6ralG2diNniEGhLeAH/7HnCQ3Ntw3HEJBenX+ebhHwQ==
X-Received: by 2002:a17:906:b846:b0:992:7295:61c9 with SMTP id ga6-20020a170906b84600b00992729561c9mr6619365ejb.69.1688837401431;
        Sat, 08 Jul 2023 10:30:01 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id n16-20020a1709061d1000b00993664a9987sm3719933ejh.103.2023.07.08.10.29.59
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 10:29:59 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51d89664272so3870639a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 10:29:59 -0700 (PDT)
X-Received: by 2002:aa7:cc8d:0:b0:51b:e4b4:8bb0 with SMTP id
 p13-20020aa7cc8d000000b0051be4b48bb0mr5997528edt.2.1688837399295; Sat, 08 Jul
 2023 10:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org> <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info>
In-Reply-To: <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 10:29:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
Message-ID: <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 Jul 2023 at 04:35, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> The plan since early this week is to mark CONFIG_PER_VMA_LOCK as broken;
> latest patch that does this is this one afaics:

Bah.

Both marking it as broken and the pending fix seems excessive.

Why isn't the trivial fix just to say "yes, fork() gets the mmap_lock
for writing for a reason, and that reason is that it acts kind of like
mprotect()".

And then just do what those functions do.

IOW, why isn't the fix just to do

  --- a/kernel/fork.c
  +++ b/kernel/fork.c
  @@ -686,6 +686,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
        for_each_vma(old_vmi, mpnt) {
                struct file *file;

  +             vma_start_write(mpnt);
                if (mpnt->vm_flags & VM_DONTCOPY) {
                        vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mpnt));
                        continue;

and be done with this? Yes, we could move it down a bit more, ignoring
the VM_DONTCOPY vma's, but they are so uncommon as to not matter, so
who cares?

              Linus
