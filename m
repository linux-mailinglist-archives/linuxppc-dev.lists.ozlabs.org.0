Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC5672DB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 01:54:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny3zh1JcQz3cfP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 11:54:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VxMM+n7Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VxMM+n7Z;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny3ym5krwz3bZx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 11:53:18 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id k13so876126plg.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 16:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5OwSqaa3k71xkT8WUUyBE4GL1c8ehjEm+lG2U3+ww8=;
        b=VxMM+n7ZQ7ySdPZJagy+lvodZf7Ei6K4cGhxVW6vhCAISwMhETO4P0zAg5TL04X9mG
         so7hd1FvWPuhpb3FnNogypnG+GUvTjMyf29uuxUgkEKMKiKhjWFKZgy7XM+7zlRGbnLM
         XW8EB337vH9O7EDDbXqKRjCsTOjUSBIJYzj9n3ydNn7NDvys/PCYZU4rv+3ZH8698zjJ
         gjaog8MASkt1QYEddmOc4pZ/1fHtFmV0/EHae6jjaC9Tlr2Juoi/5SjXD2FC4l1tgw5X
         xSssM+NTSqUR/rVW3gPshuPqCCXxtCjGCfmoxOxkxaKFRfl3litjPnUrhQfV2nwMz9q0
         bytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O5OwSqaa3k71xkT8WUUyBE4GL1c8ehjEm+lG2U3+ww8=;
        b=606YVL7kJpiiRx8Qv52VKVyLaCp4Y91hZH2rfQICAbYiDyArMs1BX1NUP5Yy2vhv/8
         F754Dw2m9+0ov6T1pRt1QlaJkW4uYLusPgmBcT5S8hmqbHgZSdsm+4lkkEqQPdGllNsY
         iNk6pa0KgSlule4GetdkrLGhcoQydo9Swmio7JV8yuj7O79B7jOc8uoRV8soPRFzvRH5
         3nkvfWFFhYRenzRVA1CvHk81NZT32nRa/Q9PW/CWeckj1viK+q8UOJu0tBvTonsDoxt1
         P6cQrPQCmWNnigDkzSKnQrbfW7T5MjQtmU6CwdRBuR2PPIHciUbZ+/8B5ZLlRBmiM6n/
         YJUA==
X-Gm-Message-State: AFqh2kpTtmXkYJezZDC1gExYFPoHS0rWqUge5hbuFECN4Wizon+mspYJ
	qAMfD3HWyhQmoD4LTR6ejrU=
X-Google-Smtp-Source: AMrXdXsMSS9dcXgYVyvRoV4FT2tnzvT0wkiLbe+rSWN6jjYwj9dD2M9R08hcXMB91pi0HSAg9oFG6g==
X-Received: by 2002:a17:90a:5a45:b0:229:2bbb:261f with SMTP id m5-20020a17090a5a4500b002292bbb261fmr9919226pji.8.1674089594735;
        Wed, 18 Jan 2023 16:53:14 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id o11-20020a17090a420b00b002296312adcesm1888963pjg.56.2023.01.18.16.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 16:53:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 10:53:08 +1000
Message-Id: <CPVR8BY8XFWE.BF91Z0FOZWH8@bobo>
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

If you can easily piggyback on IPI work you already do in exit_mmap then
that's likely to be preferable. I don't know the details of x86 these
days but there is some discussion about it in last year's thread, it
sounded quite feasible.

This is stil required at final __mmdrop() time because it's still
possible that lazy mm refs will need to be cleaned. exit_mmap() itself
explicitly creates one, so if the __mmdrop() runs on a different CPU,
then there's one. kthreads using the mm could create others. If that
part of it is unclear or under-commented, I can try improve it.

Thanks,
Nick

