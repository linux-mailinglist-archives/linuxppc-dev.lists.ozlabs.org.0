Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B2F8240BB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 12:34:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xvw6CZ7/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5Pcf5jGqz3cVM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 22:34:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xvw6CZ7/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5Pbn3FFBz3btm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 22:33:24 +1100 (AEDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3606a0ce096so295775ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jan 2024 03:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1704368001; x=1704972801; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Dt7uLNKLulzrg/dNC959xAVcdyKjB2fv5qTZvClME8=;
        b=xvw6CZ7/Jz0PYXauntbh3LOFJRppFWdRGY0R6r5cB8UbWZ/9zeeFimWasiuXGiYfm2
         2qpbkbVpkSduwewDwxKFjkmXIUWQqHB92Rccws49W3OAtzKApfDC1su2jp9VNF6ePWP0
         OZf96kS4/lgYpyusceGGz7+ZKgVNufY2YysaNhO4jqva27JdFy4LMwobixsxxwSh3DRm
         m2G6U7bDsZ09pKTTvzqcIc/rMnN1x2l2+vvSVlGufmUsYPpYiWXMGOaLbiwtNwOsqBRk
         tEmAXoSqxjhQlharJb0a8laDLcYXYdj0/fU7DEek71I8Z37OH3vGD2aX9iShh4YrEBzJ
         ZIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704368001; x=1704972801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Dt7uLNKLulzrg/dNC959xAVcdyKjB2fv5qTZvClME8=;
        b=sDwnMH/BmYVoP59C3cAyl6q3AeavGJ3uoFMEAiT/0k7cYnXtVy5oV6e8HIYRB38Nj+
         pUTi2E1u67gH4bE0Y+z/KSrTmvoa7GLTd7LG0g6te7KokpsDOiGb7GwuwTfbeTLYuJTj
         ew+LcfcjA0QXik5EjxjcAniRh5wHVO0YSc19n4TFp6c+17/T56Wx5ZE4ck+BeGRpzMJA
         PgY2ylRFcCwmRyyMWMtC5xE0WJv47toiPobOzIrugDQQME/r2SqrMeLZ/pFWkg5DO51z
         E41hgPZdjkzMyA/BHl4xJVEiJ58xJlwHghDHTv14fRV9vHKo0yk0T3aaGp8goJIrloW9
         JFQw==
X-Gm-Message-State: AOJu0YzfA0n+zujcURTCLqgJBmndh7gp25trPV59sQx8E6qBmeztJUq1
	yF5uwGI4BP6IXvf838eINHnzwoMIQMzMDu4aefESdQHya6ZHzQ==
X-Google-Smtp-Source: AGHT+IEiLv7qiits4vk8xdWF1s4r4OiPqhbNMM2mLBiLLO2wGlETEHoIcyBn6dRE3jspd9+Bb4GSzadf5GgKpkLl1DU=
X-Received: by 2002:a05:6e02:17c9:b0:360:16c7:2d6a with SMTP id
 z9-20020a056e0217c900b0036016c72d6amr482112ilu.48.1704368001050; Thu, 04 Jan
 2024 03:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20240104104307.16019-2-ajones@ventanamicro.com>
 <20240104-d5ebb072b91a6f7abbb2ac76@orel> <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
 <20240104-6a5a59dde14adcaf3ac22a35@orel>
In-Reply-To: <20240104-6a5a59dde14adcaf3ac22a35@orel>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jan 2024 17:03:10 +0530
Message-ID: <CAAhSdy0uVZXsP1_3zZiwXXEXBZGkmWX5ujptirojD8S4nuzQpQ@mail.gmail.com>
Subject: Re: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
To: Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: sfr@canb.auug.org.au, aou@eecs.berkeley.edu, kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, atishp@atishpatra.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-next@vger.kernel.org, palmer@dabbelt.com, rdunlap@infradead.org, kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, pbonzini@redhat.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 4, 2024 at 4:51=E2=80=AFPM Andrew Jones <ajones@ventanamicro.co=
m> wrote:
>
> On Thu, Jan 04, 2024 at 12:07:51PM +0100, Alexandre Ghiti wrote:
> > On 04/01/2024 11:52, Andrew Jones wrote:
> > > This applies to linux-next, but I forgot to append -next to the PATCH
> > > prefix.
> >
> >
> > Shoudn't this go to -fixes instead? With a Fixes tag?
>
> I'm not sure how urgent it is since it's a randconfig thing, but if we
> think it deserves the -fixes track then I can do that. The Fixes tag isn'=
t
> super easy to select since, while it seems like it should be 8132d887a702
> ("KVM: remove CONFIG_HAVE_KVM_EVENTFD"), it could also be 99cdc6c18c2d
> ("RISC-V: Add initial skeletal KVM support").
>
> I'll leave both the urgency decision and the Fixes tag selection up to
> the maintainers. Anup? Paolo?

Lets add

Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")

Regards,
Anup
