Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C02666CB6CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 08:17:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlzxP4xTPz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 17:17:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cRbhW9dO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cRbhW9dO;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlzwT0qqsz3cLs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 17:16:40 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso14113842pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679984196;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcLRyXldLlmCcR4pmWUBr92iDiYu0t6v6yVRvNxBVcI=;
        b=cRbhW9dOl7UvROaiVKonZAvtzkWQjh7es8Dkk67+M+XbstAQ/QNFYNxXKsy6MGwY3R
         kXAIQPDwVHr9QwOY1b312V/JV9XDULldKcXVZO4rC190r94OFKmethsf4DjtefyfW5u8
         Fsjx0lu4Edb+Y10ED6kVIbnhUQ0c2RiKDnaj/g0xJnzFe+npzUNPX/Uq88vFaXiI/eNV
         px8jrwExirejmX5q89zApxHDnmufiVH2cGTlxDtey8P6mhpKp9Y3wpYR1WoWDOwn/lF8
         gWa4uQmeoB7vOMB4ES0b0NbF3eGtMZ/YDfhl+OgUWJsfsrRQCvkTwj+uLKwQp5NAB1kl
         tvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679984196;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcLRyXldLlmCcR4pmWUBr92iDiYu0t6v6yVRvNxBVcI=;
        b=MkemPl7DC4iUYgT0IFSkY3EG2zsTBEHijkzl6K8LPqDVdXpVnxnoO870HKdkGudFkD
         H5tHIpnIsD5OyxdZZgLGJ6xbwNgZTC0UNlAm8OdWzxYtyCR95+wFq8o4Wp8IHeTillog
         O2+W9+0tpUY31frNqXl138lR3iB9ddinbau9nte1tAlG3iS58CUFK9Ty6gy9DP/9HivN
         PWrFEUNepzUah5GX8OGk0T/KX5YvX3llKWhCaQi3I7TgZB0SZhVod6Qx6FBQuCC22t5N
         WGKeD2LKq6WjoF4VZdvBE05yZRgHCswc9S1l4nKZdlgauPF2jZitF2SIadSoWZyG9T3p
         8MSA==
X-Gm-Message-State: AAQBX9cdRKa3OiG3Re3gWNl8Dm7Mwl9Xx5VnnDOMBVz1mRNJIZYGfU7L
	/MZ3AbIWCOOUBgJxWfUlcLw=
X-Google-Smtp-Source: AKy350YFYzj6u5y4CSVU7BC4GPog4wUGhKpUYZ7wa/p8GltxqEcKNTAN4IfAG+ZS0TU7EyGbjAR5bA==
X-Received: by 2002:a05:6a20:4a04:b0:df:559a:96dc with SMTP id fr4-20020a056a204a0400b000df559a96dcmr7357552pzb.32.1679984195626;
        Mon, 27 Mar 2023 23:16:35 -0700 (PDT)
Received: from localhost (118-211-28-230.tpgi.com.au. [118.211.28.230])
        by smtp.gmail.com with ESMTPSA id t8-20020a63dd08000000b00502ecb91940sm19148330pgg.55.2023.03.27.23.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:16:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Mar 2023 16:16:31 +1000
Message-Id: <CRHSOZ15ORYN.1DMP7BFBDRFII@bobo>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Jens Axboe"
 <axboe@kernel.dk>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL
 pt_regs
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
 <CRGYHQ3C77DV.1PXS812TV997N@bobo>
 <6727b289-aef6-89f9-8b4f-d63cbaeb81e5@csgroup.eu>
In-Reply-To: <6727b289-aef6-89f9-8b4f-d63cbaeb81e5@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Mar 27, 2023 at 8:26 PM AEST, Christophe Leroy wrote:
>
>
> Le 27/03/2023 =C3=A0 08:36, Nicholas Piggin a =C3=A9crit=C2=A0:
> > On Mon Mar 27, 2023 at 8:15 AM AEST, Jens Axboe wrote:
> >> Powerpc sets up PF_KTHREAD and PF_IO_WORKER with a NULL pt_regs, which
> >> from my (arguably very short) checking is not commonly done for other
> >> archs. This is fine, except when PF_IO_WORKER's have been created and
> >> the task does something that causes a coredump to be generated. Then w=
e
> >> get this crash:
> >=20
> > Hey Jens,
> >=20
> > Thanks for the testing and the patch.
> >=20
> > I think your patch would work, but I'd be inclined to give the IO worke=
r
> > a pt_regs so it looks more like other archs and a regular user thread.
> >=20
> > Your IO worker bug reminded me to resurrect some copy_thread patches I
> > had and I think they should do that
> >=20
> > https://lists.ozlabs.org/pipermail/linuxppc-dev/2023-March/256271.html
> >=20
> > I wouldn't ask you to test it until I've at least tried, do you have a
> > test case that triggers this?
>
> I fact, most architectures don't have thread.regs, but rely on something=
=20
> like:
>
> #define task_pt_regs(p) \
> 	((struct pt_regs *)(THREAD_SIZE + task_stack_page(p)) - 1)
>
>
> In powerpc, thread.regs was there because of the regs not being at the=20
> same place in the stack depending on which interrupt it was.
>
> However with the two commits below, we now have stable fixed location=20
> for the regs, so thread.regs shouldn't be needed anymore:
> - db297c3b07af ("powerpc/32: Don't save thread.regs on interrupt entry")
> - b5cfc9cd7b04 ("powerpc/32: Fix critical and debug interrupts on BOOKE")
>
> But in the meantime, thread.regs started to be used for additional=20
> purpose, like knowing if it is a user thread or a kernel thread by using=
=20
> thread.regs nullity.
>
>
> Now that thread.regs doesn't change anymore at each interrupt, it would=
=20
> probably be worth dropping it and falling back to task_pt_regs() as=20
> defined on most architecture.
> Knowing whether a thread is a kernel or user thread can for instance be=
=20
> known with PF_KTHREAD flag, so no need of thread.regs for that.

That would be nice if we can define regs that way, I agree. We should
look into doing that.

Thanks,
Nick
