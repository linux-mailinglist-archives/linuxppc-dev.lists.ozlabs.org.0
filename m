Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F408B672B3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 23:23:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny0dY6S1Xz3fDK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 09:23:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d2qNB+Xf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=nadav.amit@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d2qNB+Xf;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny0cb3wn9z3bh4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 09:22:21 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so3663pjb.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 14:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0ldSOk59OSUgQEm352Q1IAMDrBH9zEdmVsSi4rhzHs=;
        b=d2qNB+Xf95ts7qkj9ZiaPnBajtLu/iVQiBTSgC7UnMvkJQfDG3lM4n6iSmLIyl4v3s
         3rmfStEJ3hoCz/N6NCboYVr8sGHYbUaDBZ3riuhEADQvr4DF2XEVHeWld8Td+GJ5fmjE
         EVyonHor1Yeb/PODxfsRmDbI1c3LrbUxKulzi1mF8cBSG67LMY3hCTMFiwdjHpWfJK2d
         shgzG2mHfNhl/hyynoWMxuolQGRmbCAJDNJTHOL4tRjYe6lN8vDWeKVoJyb7gns8eUTM
         cwDr4PdGMWl+hDydjkIigOM2lQ3ewGntx3K0JC4HnXQdlZNDHs32qYzhlq/8roY3Snpe
         mQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0ldSOk59OSUgQEm352Q1IAMDrBH9zEdmVsSi4rhzHs=;
        b=dfH8YaGGkeQmbpuhRDbbN5ZPjRXq5n6WQlA9T8iX1B6KybzVJUZis/qsFsDxH1/si3
         sH8hKbXOPubTCm3Y6G7mg7+ySuaPmuqKrSB4WQ1RQj7q9Rdmrw/WlHoa3jBh42JdObKv
         WC0jkWvkSguSBHJ4rmuSmVjhRN+Uddp1bj1EcUqxmQONndqn+MWiuggIUTc53+NmmhDr
         cJn6qC6mbdTG7Gp1yOvSgPhPKIYWlOTjfAeeYLx252VcItcCuFNDDf+75c+k7Gn9dQl2
         s9zwZkgU3WQ+r2XKeS852lDlrwnts3sbydFr9MvLGhUl/Y1R4Nw+qderf9L8foA+8tIP
         TOog==
X-Gm-Message-State: AFqh2kqnCrUX/r9LoY9E7JLo1KfopJkY+8lAPM/KEVXQPu50E2MpnaKf
	mU/uDqlg7FOxDoAYls5RUf4=
X-Google-Smtp-Source: AMrXdXvRavXFFRYE14blzdZLuVmL27/NTESzDN8xeMK+lNpE66Enb5Ky51V+R/46yv36y/vDYHNI+A==
X-Received: by 2002:a17:90b:368f:b0:229:1607:c830 with SMTP id mj15-20020a17090b368f00b002291607c830mr9173236pjb.25.1674080539376;
        Wed, 18 Jan 2023 14:22:19 -0800 (PST)
Received: from smtpclient.apple (c-24-6-216-183.hsd1.ca.comcast.net. [24.6.216.183])
        by smtp.gmail.com with ESMTPSA id dw13-20020a17090b094d00b00226f49eca92sm1840043pjb.28.2023.01.18.14.22.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Jan 2023 14:22:18 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH v6 3/5] lazy tlb: shoot lazies, non-refcounting lazy tlb
 mm reference handling scheme
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20230118080011.2258375-4-npiggin@gmail.com>
Date: Wed, 18 Jan 2023 14:22:07 -0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F3590B8-3F25-4EFB-BE3A-D32AAAC0B2F4@gmail.com>
References: <20230118080011.2258375-1-npiggin@gmail.com>
 <20230118080011.2258375-4-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
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



> On Jan 18, 2023, at 12:00 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> +static void do_shoot_lazy_tlb(void *arg)
> +{
> +	struct mm_struct *mm =3D arg;
> +
> + 	if (current->active_mm =3D=3D mm) {
> + 		WARN_ON_ONCE(current->mm);
> + 		current->active_mm =3D &init_mm;
> + 		switch_mm(mm, &init_mm, current);
> + 	}
> +}

I might be out of touch - doesn=E2=80=99t a flush already take place =
when we free
the page-tables, at least on common cases on x86?

IIUC exit_mmap() would free page-tables, and whenever page-tables are
freed, on x86, we do shootdown regardless to whether the target CPU TLB =
state
marks is_lazy. Then, flush_tlb_func() should call switch_mm_irqs_off() =
and
everything should be fine, no?

[ I understand you care about powerpc, just wondering on the effect on =
x86 ]

