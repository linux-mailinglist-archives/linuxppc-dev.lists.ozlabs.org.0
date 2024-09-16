Return-Path: <linuxppc-dev+bounces-1410-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D412A97A470
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 16:49:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6nqq5hbpz2y72;
	Tue, 17 Sep 2024 00:49:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726498167;
	cv=none; b=NtrOLSMELJg2sdv0qY9vi2/wSWI0335UVdAZlcDEgCOJyemuy4mjR585ZOpMS5kFx+n6qn0XevIb+rI27TeU4RpbxCWjR+58GqbBryMRHqQg3ZL9K0bxsROryD3t9cC/Hxh8281gBKY2K58mOdcBAQuwQpQZaDcvuhX7fCrZRmS50Xf9OxxSAIHvocMIZfdPvsx0LyYnGXmgxXLaLvZhzq5LpQaSGCktSArSltHBqz3UzvMK/+VYL0naSA46jpqXgHAFvVlBkhcKviudQPxl8Sq02SKTErkOYA4EKK42r58CPtlEtPz2AKbamoDAuAyKUT+sv5Q39axKHL2Gz6q7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726498167; c=relaxed/relaxed;
	bh=EMelMzTkoJmecj8Ec280QAFHRxkxEeMzZsfbZtByo7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QufOc5QMIP2K6CY8ie4VHVqt06UUHcm2psl6vxZmBLkqhHpKavoAEP41WGu7eCYcBTr0XjlJk9FieJu9y0U2QuNXIDNlfOdcxYsigQpcWbo0cl/IslXOqRaeR6rLRnEwONr7M2DRIU1yCBc3UrfZgUfac4AL31A1JUDEBQtitqi4a4zmvijFoq3kK4bPTPSjAuPZuTzBeAXRE2qBQQvEoOsqpRfB5xSCaOyRjRGYdmerhbtizS1mpPYjiNDUiydPq9//uPST9H/JU1jLCv+nDEHjKaCC7QhrtsIess5bN+OTemxLgOd8490zSQaVZrWdqNhBg9oBeTCn8nqadoyrOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Q+3b5uki; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Q+3b5uki;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6nqq03k7z2y71
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 00:49:25 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4582b71df40so609711cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726498161; x=1727102961; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMelMzTkoJmecj8Ec280QAFHRxkxEeMzZsfbZtByo7k=;
        b=Q+3b5uki2cr3J3YFLsZjyouY0/pxrYTve8gq3jCOQuxjr/eDHOSUQMULEoS3hlWs8o
         jWPBO7P90rq2yshCI/DW/MUTTODe6s/Y9cWKYXFffpc0zigFr7T6uBrZnitfkpIlnaI+
         EvvXVIMjgT9JVAENL0bbuhtjLjuwRTuYo1Y+zkMOLBSWVgOuMBv2NWb9Q7v/w+Bxvytp
         pgdqsy0fHTB+G2IE+hIqQnqiSaUOw35/zWB/jHFXViMMrGowMGbFuBs4B9kNOdzFN9b2
         pEy/DnAI29d5P2hLSfXMb7TOYRev1Y4F0VslW51Io/8q6xRhgrAOmYDsdES+i0XUa9I7
         3flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726498161; x=1727102961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMelMzTkoJmecj8Ec280QAFHRxkxEeMzZsfbZtByo7k=;
        b=Z5Fx2NAqB+d3EZiE0l4c1NWZ0epVK326Wd3ikvpu0LLaOo7sXtfKqYZL//nqQ1PVc1
         nx/8OpvNbjjrAc/nr4AD5BqhfR4PQAKw5z9aZmxIuvfWNgU13qPYOETyxOUCEEljEJVU
         9h3kVaIhsUewB5oS2c1rovDb6pXXY52n/kTiJlaAdjvV31JreOGE0lh1uWah4aK3UAIY
         hgBSB28V6oIrkusrUeyz1XiQfIlhTQowjauixH1ZsA6WjdT+ZJuZJkmNWZEG8891Y7lk
         Zl/YG+wa1UPEPyO6v+5VyuVKovLH6zESOCLqB5wvia851GZJFAPDea2SUj153UZ7LxcI
         4BOg==
X-Gm-Message-State: AOJu0YwYEcuNF5A7+0blUbXxJNg6Wa7QSDoPv0E0Nhq2/MRaI2ohCtbS
	jJjD3xG2AOynkabiwy3jmt+ZKBE/z0J/6xYr1m3WaH3eSGr0A+ZbdjU5a+XaRnftyOkRy4rG+y2
	7gEp24mTprpAn2cdjp+58Qlda0L58U0FjfyGo
X-Google-Smtp-Source: AGHT+IGG1zTJv0c5bKWcBL6ppyd+R0pFs7s6AY9gInCgYJM1VZD4gWzAvaBlLTTRQ29SZSznByKAx07pm4J3HlYVrNA=
X-Received: by 2002:a05:622a:413:b0:456:77a8:ea2d with SMTP id
 d75a77b69052e-458644f9fd7mr12223071cf.17.1726498160849; Mon, 16 Sep 2024
 07:49:20 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240916120510.2017749-1-mpe@ellerman.id.au>
In-Reply-To: <20240916120510.2017749-1-mpe@ellerman.id.au>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Sep 2024 07:49:09 -0700
Message-ID: <CAHS8izM-3DSw+hvFasu=xge5st9cE9MrwJ3FOOHpYHsj5r0Ydg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/atomic: Use YZ constraints for DS-form instructions
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu, 
	segher@kernel.crashing.org, sfr@canb.auug.org.au, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 5:05=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> The 'ld' and 'std' instructions require a 4-byte aligned displacement
> because they are DS-form instructions. But the "m" asm constraint
> doesn't enforce that.
>
> That can lead to build errors if the compiler chooses a non-aligned
> displacement, as seen with GCC 14:
>
>   /tmp/ccuSzwiR.s: Assembler messages:
>   /tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is not a multipl=
e of 4)
>   make[5]: *** [scripts/Makefile.build:229: net/core/page_pool.o] Error 1
>
> Dumping the generated assembler shows:
>
>   ld 8,39(8)       # MEM[(const struct atomic64_t *)_29].counter, t
>
> Use the YZ constraints to tell the compiler either to generate a DS-form
> displacement, or use an X-form instruction, either of which prevents the
> build error.
>
> See commit 2d43cc701b96 ("powerpc/uaccess: Fix build errors seen with
> GCC 13/14") for more details on the constraint letters.
>
> Fixes: 9f0cbea0d8cc ("[POWERPC] Implement atomic{, 64}_{read, write}() wi=
thout volatile")
> Cc: stable@vger.kernel.org # v2.6.24+
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20240913125302.0a06b4c7@canb.auug.org=
.au
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

I'm not familiar enough with the code around the changes, but I have
been able to confirm cherry-picking this resolves the build issue I'm
seeing on net-next, so, FWIW,

Tested-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina

