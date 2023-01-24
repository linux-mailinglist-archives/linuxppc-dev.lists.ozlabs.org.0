Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210B678E3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 03:30:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P19tj3zMkz3cCL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 13:30:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j4Co2CjF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j4Co2CjF;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P19sp1MN1z308w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 13:29:48 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id a184so10271271pfa.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 18:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EL33MbyBAeFj7W1ec+AuUrU/yhgkc3rBnt2BlC4w5M=;
        b=j4Co2CjFtUbQlY3aCX8ZaGPTa3bq/5mD2naMb3jg8EmNIah3y15FrWh/iDBJe8/mav
         3GWNT5fYif/IJNrSpvSxdRPB9dMBK/9iicboI5JbqCfSgQY0gF4g4daxhY/KxiwUWkma
         800yWr6LlupKIQRude2UxapBJLr1Oy/TbVhBWjgE9zONONrVzCUlBdkanBr3/c92sf/u
         zuUZw6bo5UqX35TYTDMPbkee/FuRVqkvyXO3S/HUIrnFYK30bzFbuQVvr0jVsegOh86M
         qtB235Tds0eSjSpFc+nNCn6URsIfJRxl7yZxH15S1Aqi++IxUOjAItYI/sP8MAZONqVw
         spGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6EL33MbyBAeFj7W1ec+AuUrU/yhgkc3rBnt2BlC4w5M=;
        b=XkMWgh2T95RAmJtRzflnGggFzexZu3geP795cHWz5QnjgkrcT2D1pQOX3BCqRofz0s
         EHI6EyBApqxIAp3FdFQDxyPVatiD6z8GcgRtml5bYE86ua+0Wx3Oqebean+W59iSXj1w
         KeVkFgOsb5yWNJWFAUt2d+BiNi+NmGRRfLy/YKL16nqtrCos3EHEkvPclqOKvlW2DCvk
         aKY0kUR/kH6+gcoJ9bn8u83sUZvisehrKZAzy9uksJ/SCyFvLl79zRAvvtErR+vnenkp
         WdSOFs6uIHjPOIUZBcvQt2jra//ohZD0t+ytRKbFphLwrT61KNm2vjW/5haTQ8Hksbi7
         igng==
X-Gm-Message-State: AFqh2krTgdYc0BjeodT9OkZDaeSnurGJ5MFspZfnmd2tb0IBqAJaJK+u
	9IyRT+7yEwX4DTr9tsjWfnM=
X-Google-Smtp-Source: AMrXdXsgWBdkF5aJcEXfGt3E1+MiooI3g5UFcMgOiKWWV2GlTsc9rdrcqnSd7HVwvPKPTbVy+5n6nw==
X-Received: by 2002:aa7:8bdd:0:b0:58d:be65:f781 with SMTP id s29-20020aa78bdd000000b0058dbe65f781mr27427114pfd.5.1674527385193;
        Mon, 23 Jan 2023 18:29:45 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id x12-20020aa793ac000000b005898fcb7c2bsm290307pff.170.2023.01.23.18.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 18:29:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jan 2023 12:29:38 +1000
Message-Id: <CQ02EXZ5THB8.4S19LP5ZFUM9@bobo>
Subject: Re: [PATCH v6 2/5] lazy tlb: allow lazy tlb mm refcounting to be
 configurable
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nadav Amit" <nadav.amit@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.13.0
References: <20230118080011.2258375-1-npiggin@gmail.com>
 <20230118080011.2258375-3-npiggin@gmail.com>
 <ee3844c0-b342-edc6-77cf-4cdc78e30a18@gmail.com>
 <4d26df97-3725-182b-6312-fa5cd8e9f85d@gmail.com>
In-Reply-To: <4d26df97-3725-182b-6312-fa5cd8e9f85d@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Andy Lutomirski <luto@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jan 23, 2023 at 6:02 PM AEST, Nadav Amit wrote:
>
>
> On 1/23/23 9:35 AM, Nadav Amit wrote:
> >> +=C2=A0=C2=A0=C2=A0 if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT)) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmdrop(mm);
> >> +=C2=A0=C2=A0=C2=A0 } else {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mmdrop_lazy_tlb mu=
st provide a full memory barrier, see the
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * membarrier comment=
 finish_task_switch which relies on this.
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 smp_mb();
> >> +=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 }
> >=20
> > Considering the fact that mmdrop_lazy_tlb() replaced mmdrop() in variou=
s=20
> > locations in which smp_mb() was not required, this comment might be=20
> > confusing. IOW, for the cases in most cases where mmdrop_lazy_tlb()=20
> > replaced mmdrop(), this comment was irrelevant, and therefore it now=20
> > becomes confusing.
> >=20
> > I am not sure the include the smp_mb() here instead of "open-coding" it=
=20
> > helps.
> I think that I now understand why you do need the smp_mb() here, so=20
> ignore my comment.

For the moment it's basically a convenience thing so the caller does not
have to care what option is configured. Possibly we could weaken it and
do necessary barriers in callers if we consolidated to one option, but
I'd have to be convinced it'd be worthwhile, because it would still make
it deviate from mmdrop(), and we'd probably at least need a release
barrier to drop the reference.

Thanks,
Nick
