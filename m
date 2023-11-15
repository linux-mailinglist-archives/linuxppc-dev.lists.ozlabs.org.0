Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94F7EBBDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 04:27:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ie85LDVF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVT9Z6Q15z3d8d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 14:26:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ie85LDVF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVT8k197mz2yMJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 14:26:12 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-53fa455cd94so4560142a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 19:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700018769; x=1700623569; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWp83f3xN+vRZTVZqePAo5Ya5BJKoA3UZKs4+uAYCk4=;
        b=Ie85LDVFrPxR3EDMOg9TJb8+fucuBjFNm2Nygtpc0rpQJSEQ1iqnKeO/rXHtSyvwvJ
         A2oT2n6XSfYYceTpKGm90JAKs0j9YJ/KuLeJUR44zy0q5/X0T8ubekfZb1KqQ2EKzPOg
         E425AWrqueLW94CUJmv1rqMKAeKRnQ+2oRVw5pPi75OJsOzSAgKYfXlr6I3jlNa07/Kd
         x21i85YFT8oL2VlKMCTNfbxr7Vl1jOIysz8QloLu5Lf7OX/HkAHIDH8VaNZFtW0jh+Yi
         h/AIGZcS85jeyTIjg/rx3dEpa9WujHchAtt3337ej3YYxljv0zSQjH/4LCvjZIDea06T
         cvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018769; x=1700623569;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FWp83f3xN+vRZTVZqePAo5Ya5BJKoA3UZKs4+uAYCk4=;
        b=RZmojlEkfShB8O4+TA4ih5SMYcnBLXYkLslgnDEH0n3tA8Wdd3K95C5IgnuiqWd3Yp
         o/Q7Pnch8vlkZQylYyLxsEsMkSZ+4Y5hF0O7IhOtYBOusdo2LSb57WHxnA/l1d55vrar
         +1XcrEfLQxZD9Ik7w2CKFcTbcEwuzW1wQoBXAI/KB0ughvx8qI6Nt7pVvSzNahA+0Mb8
         UC/sGCrywgyphqNO+LFgvJeOIM3io7kBnyvCD6YlZ7Ul+6p3V23DfZsUQEn9Cc97QVwE
         Pj5ozu0zIG1px0p5KJiBSOxwkBk5urc24NnohN/wth8bFUxqFCKa+1xTp5lzK4/niXpX
         Nmsw==
X-Gm-Message-State: AOJu0YzbHqNQg5LsUDLfJtjoHmvDsYtN9EtaOi4cD2wAxLWDzwi7iFmR
	KYSWAVQzfUQad/TrcFtOI+NBY40ANic=
X-Google-Smtp-Source: AGHT+IFNMfcHU9K1QYufxxpkJIZl/NZ5ISNR86vQx76QBRQiiG3/oN1R2EBwe5j2ciIyRkooGdBMFA==
X-Received: by 2002:a17:90b:17c9:b0:27f:f260:ceaf with SMTP id me9-20020a17090b17c900b0027ff260ceafmr8975188pjb.10.1700018769086;
        Tue, 14 Nov 2023 19:26:09 -0800 (PST)
Received: from localhost ([1.145.207.198])
        by smtp.gmail.com with ESMTPSA id ga3-20020a17090b038300b00271c5811019sm5911805pjb.38.2023.11.14.19.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 19:26:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Nov 2023 13:25:47 +1000
Message-Id: <CWZ2CN22QYP0.2XINI4TL0M712@wheely>
Subject: Re: [PATCH] lazy tlb: consolidate lazy tlb mm switching fix
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.15.2
References: <20230607005622.583318-1-npiggin@gmail.com>
 <340b4d49-df81-05ad-3753-c1e60ec0df06@csgroup.eu>
In-Reply-To: <340b4d49-df81-05ad-3753-c1e60ec0df06@csgroup.eu>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Oct 13, 2023 at 11:12 PM AEST, Christophe Leroy wrote:
>
>
> Le 07/06/2023 =C3=A0 02:56, Nicholas Piggin a =C3=A9crit=C2=A0:
> > Fix an upstream powerpc bug that was discovered with a WARN_ON added in
> > "lazy tlb: consolidate lazy tlb mm switching":
> >=20
> >     Switching mm and tinkering with current->active_mm should be done w=
ith
> >      irqs disabled. There is a path where exit_lazy_flush_tlb can be ca=
lled
> >      with irqs enabled:
> >=20
> >          exit_lazy_flush_tlb
> >          flush_type_needed
> >          __flush_all_mm
> >          tlb_finish_mmu
> >          exit_mmap
> >=20
> >      Which results in the switching being incorrectly with irqs enabled=
.
> >=20
> >      Link: https://lore.kernel.org/linuxppc-dev/87a5xcgopc.fsf@mail.lho=
tse/T/#m105488939d0cd9f980978ed2fdeeb89bf731e673
> >      Fixes: a665eec0a22e1 ("powerpc/64s/radix: Fix mm_cpumask trimming =
race vs k>
> >=20
> > I will send that fix upstream, which will end up conflicting with these=
.
> > The resolution will be to take akpm's side of the merge (with this patc=
h).
> > Or drop the patch when it conflicts and I'll resend it rebased on the f=
ix.
>
> This seems to badly conflict at the moment, is it still applicable ?

Been away, will have to check where all this ended up.

Thanks,
Nick
