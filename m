Return-Path: <linuxppc-dev+bounces-3214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE5E9C8CE9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:34:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq2jc3Z4dz304l;
	Fri, 15 Nov 2024 01:34:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731594884;
	cv=none; b=YbkcwcbRra0YZBw5nFIv0ypyEx77h+SGm3NMlACG9q9y/f31zV/B+SS1/xz3IM4uzvAXAHbCdDGYA/5Kp57i6+6Cx8MjMNIlJKRd6ifB0Jift97RcfRwffdie+xew8yyQzSNfhnNxwlpaNvEFSzuh91v3HQP5ge8/VrhwCuOsH6UaroCOFK78yR2jUsEqU2JZJmTda2H+U1AmPHllw7We7aubqooUhZrUvdvURBreHtfXJyuiSzkOToQKmPdGhHcF4FKJN6358coDDzInVohoQ2VxvfqTyAyOnTZ7tjeCt/W2pg9aGRlmZVQv9AQxt7ooFJPREYX4Wi0t0iV7H9e9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731594884; c=relaxed/relaxed;
	bh=QEAcw9uV3ZgK8E/wHybD7i94tC5TQw6FAbTmmAV3SqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnZD2pJVpjIVQSu8sTuDVKFxBfaOtd5uQajD8Mi4eDc+OGNXBrgxGjGj6RwicVZAYh+J62sK/MBKxe7KYAExcfDwdY2vtGMsgMZiHTvMQ2VD+7vTvHQHCsxZyk7h+LQkwV/q8ezs7hEFzaJT9ZmnE3TprXe+zCsZ6fB5pQ5N+WSfbhDov3279eDYClFzZsrrHDezB0AoDw5m8XQHzZ3T7UlvMcPWYT0tbTIJRj5NLkiWSyYfDUKmhDaFjeDFKa7bv9vQSftQfH3f+Ss6KeNaTRqh6zENmsn3gmhlxx4ZL1W+n7SiQ/BT6SxnkbXQUHXcSj0eaIxf0mE7XYfYJLqLTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.182; helo=mail-yb1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.182; helo=mail-yb1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq2jb3SH0z304B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:34:43 +1100 (AEDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e380e038749so644009276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731594880; x=1732199680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEAcw9uV3ZgK8E/wHybD7i94tC5TQw6FAbTmmAV3SqA=;
        b=eFFh1BMOCH1tJeupSEz4cKD1GubCFi7C6/Lf3ylyHnEXC7YgB3C8tmPBeqe/R/mKX2
         5+9I9UN9ULwRdCZpXbLfXC/gU8QVDVw/wC1EAiFV96pzFn3MooAYk+9yks2lRJWUuqoR
         8Srfzqrxx6moXkHtwjYYJCw6P9Hje4SVNEB1eMoFf52hQmyF/mMcjOrEqPRcMW8v2Ozz
         qnQvS1hG79brwrqMMzA0xI0NEtAoIWp4PrMLbVSoy5tNR3Up8TV93axF8V4UtWeCLznZ
         C4Ymi1WjVUwgArdU2DCQNHezL+p2ytOP1lcYcEBznhBdGxSyKl3KYikJVU946EhuXZdx
         iS8A==
X-Gm-Message-State: AOJu0Yz3sNQXP/xhuLQNQnP/gQqVhNn/APLO5uIF9BsHrvMqnJ/dHKCu
	6od271luqr6ZpKs8v5suvqnFzNc3Y+41vioVwnacnir6yKBa7bDpA2yyQQqj
X-Google-Smtp-Source: AGHT+IHJdtauVts5zRxJB4u+ez9HLvgZSA4HqRUW+tPVVJY34EfUaw7sFLuGS9TLZ3AWQHdAZ8ZnEA==
X-Received: by 2002:a05:6902:2d08:b0:e25:ca37:b669 with SMTP id 3f1490d57ef6-e381424b570mr1917075276.24.1731594880386;
        Thu, 14 Nov 2024 06:34:40 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38152ccce8sm316195276.22.2024.11.14.06.34.40
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 06:34:40 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ee4460fd7bso5399407b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:34:40 -0800 (PST)
X-Received: by 2002:a05:690c:6ac1:b0:6ea:7c35:e2ab with SMTP id
 00721157ae682-6ee433a2b9emr20348327b3.15.1731594879829; Thu, 14 Nov 2024
 06:34:39 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241114131114.602234-1-mpe@ellerman.id.au> <20241114131114.602234-7-mpe@ellerman.id.au>
In-Reply-To: <20241114131114.602234-7-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 15:34:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4f_6v-2ZLFxBvazPOEvF+4PG1E1f_Ye2j49y6ixmK_A@mail.gmail.com>
Message-ID: <CAMuHMdW4f_6v-2ZLFxBvazPOEvF+4PG1E1f_Ye2j49y6ixmK_A@mail.gmail.com>
Subject: Re: [RFC PATCH 07/10] powerpc: Remove CONFIG_ISA
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024 at 2:11=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> ISA support depended on PPC_CHRP which has now been removed, making
> ISA unselectable, so remove it.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

