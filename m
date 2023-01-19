Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDAE67301F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 05:25:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny8g94Qv4z3fCS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 15:25:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WZDUjfOL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WZDUjfOL;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny8fF6Dc5z3c7d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 15:24:19 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id k13so1248816plg.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 20:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1J7vuOigOymY1Zk38Z4JeTgNz+j/oREHGhmGUsHx/8=;
        b=WZDUjfOLPsSuFKt/G39tLSbM/WFTPs7WukHsli7BbMY9RzqZl6rMnrLDVXibgONhry
         djMp0q12Qm8cDRHYTlSDHiDDtOR2lrDlAybOJVmnJks/ZHqOQL9VXE2eBoJZAahlTbvs
         rusBqUT/CMizS3EaWLfbxmgu6Po0I2w05ZQAN4eqq3IbKLykiU/5zWkQSbb1p1hYj7TQ
         La8n5Z+SvnWryMnobOTU3UQV+wCiyvvyK2cdyGBxONGIULOFdREjZVVrqQLCFU1F3lsr
         n/QHvaimR4CBSjxB7TJuT5hwcRhRaBKXp2zrSJV6m4yE+KnjyNP/AYt80HWDtVt+zOB2
         fa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1J7vuOigOymY1Zk38Z4JeTgNz+j/oREHGhmGUsHx/8=;
        b=P15RMF6Y2p01IO8CWjZ3ycHpK3ojI652Ibkzz9syKjf+87pfkiVGv5jKqUw4aVPjg6
         2RfEfGfxTKOgg+IoLHQwcsy4JIjQ+vB04y1kFp0rUrqnOmUqJ/xrKWZFY+Z1XrhHP/ip
         R8Aqx2ONyFgoRS9cFGtyi2XuZPc0h18qhBdYx0j8fjIO7jqKCWBHKOwobKldCrP6y5iM
         opaQACsZivQDaGMmocTC0Cn6Sr1rrXGHNNB/bKarbWlC9h3wV9Ysv1VW7Fr9h+S2qL8H
         0Ta23B0mnorvYPKEgTs5XLRg5RzxVwFdWjOLfBUjTlsjZ4PUWURviq/2tpYQsEqoR1ST
         NNsA==
X-Gm-Message-State: AFqh2kouoPJFvyKgljVXU/JSviNAlw+AVN51MrCT6/qeH6EO9MQlS+CY
	QNbVMh9Zs6F53x+9khj/AIE=
X-Google-Smtp-Source: AMrXdXuKZidOPo/a2pzghQNLOHD10FYNqkFh/Sf6FufPl/1jnSobgpJ6H0O40d0XuF6uZUnDLidggw==
X-Received: by 2002:a05:6a20:7a83:b0:b8:eaee:54cc with SMTP id u3-20020a056a207a8300b000b8eaee54ccmr6174042pzh.54.1674102256049;
        Wed, 18 Jan 2023 20:24:16 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id a82-20020a621a55000000b00587c11bc925sm19655163pfa.168.2023.01.18.20.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 20:24:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 14:22:52 +1000
Message-Id: <CPVVOWQ6SE2S.NQ3R9R77MFKI@bobo>
Subject: Re: [PATCH v6 3/5] lazy tlb: shoot lazies, non-refcounting lazy tlb
 mm reference handling scheme
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nadav Amit" <nadav.amit@gmail.com>
X-Mailer: aerc 0.13.0
References: <20230118080011.2258375-1-npiggin@gmail.com>
 <20230118080011.2258375-4-npiggin@gmail.com>
 <5F3590B8-3F25-4EFB-BE3A-D32AAAC0B2F4@gmail.com>
In-Reply-To: <5F3590B8-3F25-4EFB-BE3A-D32AAAC0B2F4@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-mm <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Jan 19, 2023 at 8:22 AM AEST, Nadav Amit wrote:
>
>
> > On Jan 18, 2023, at 12:00 AM, Nicholas Piggin <npiggin@gmail.com> wrote=
:
> >=20
> > +static void do_shoot_lazy_tlb(void *arg)
> > +{
> > +	struct mm_struct *mm =3D arg;
> > +
> > + 	if (current->active_mm =3D=3D mm) {
> > + 		WARN_ON_ONCE(current->mm);
> > + 		current->active_mm =3D &init_mm;
> > + 		switch_mm(mm, &init_mm, current);
> > + 	}
> > +}
>
> I might be out of touch - doesn=E2=80=99t a flush already take place when=
 we free
> the page-tables, at least on common cases on x86?
>
> IIUC exit_mmap() would free page-tables, and whenever page-tables are
> freed, on x86, we do shootdown regardless to whether the target CPU TLB s=
tate
> marks is_lazy. Then, flush_tlb_func() should call switch_mm_irqs_off() an=
d
> everything should be fine, no?
>
> [ I understand you care about powerpc, just wondering on the effect on x8=
6 ]

Now I come to think of it, Rik had done this for x86 a while back.

https://lore.kernel.org/all/20180728215357.3249-10-riel@surriel.com/

I didn't know about it when I wrote this, so I never dug into why it
didn't get merged. It might have missed the final __mmdrop races but
I'm not not sure, x86 lazy tlb mode is too complicated to know at a
glance. I would check with him though.

Thanks,
Nick
