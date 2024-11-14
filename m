Return-Path: <linuxppc-dev+bounces-3213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 777F39C8CE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:33:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq2hh2WFqz304N;
	Fri, 15 Nov 2024 01:33:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731594836;
	cv=none; b=JwanjhbRcrgCu/MGDjqyb7lPsLVRoj4BljUCbjG6E+Xs/ODlv6TBhguRsrO6J5gv3r32i2O8weNjDFd8nj/yOlaNHkpe4LLUg1QC5/9hDf0hQ7TZEto7fImjqkUd2ZkmJzAbtszpwxzZwgUDr1HmRXaR8s1kwmVDajA9l9BTsqJnJizuMLHQ6VGUtDyCTHqUVBOi/bJ4s1MxE5A3q1NcvUO9Q+v6S/vwTpaic32NIa606ewajE7NQUl0gSEmcFJjm+uSE0xqfY59c3SW+tUizAhIC8LGxUVqtIvp42rEDX4W7xNbbT6Hx9etfydn6bRNtK4X9and67SCQMl8IJNVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731594836; c=relaxed/relaxed;
	bh=qaBor854o0Olb/ajvUp7Qs8qyIpHiwNdHulDZm1imEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVHFaIvhya3tQdiMTF/JgcYDej11C3wSaozr74S/4lYJ5t8juO0ejZJ9RG/OXZ2BRslcF+N+PrLhaAICj9iM0sf0mLR/nFvheHJ3UpKTGXsPPAdebomwpUl/A5xZcKSYcsrmAI3gKCBYKkWG4HOvh9tM9ht0pTd2v6qw2m+8ILdnJTkLHHoYaW9GdKC8ZzWjzzCtjUO1jpoQTCMWHAukQYBrAh0mdPqyg7LbaHGrWon/IKhXxgl2RDcpR+l348TxySBkWapiiaghiLp8tbvM8Mbr1kAzSV3X5SE1Sei92BP15I9KbLBURG2QVxtGWxBGJ/IWPLTibyDOys4phhkgHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.128.175; helo=mail-yw1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.175; helo=mail-yw1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq2hg2lB1z304B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:33:55 +1100 (AEDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea15a72087so6624717b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731594832; x=1732199632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaBor854o0Olb/ajvUp7Qs8qyIpHiwNdHulDZm1imEc=;
        b=b8LXXpe2GgtlENyOGFz/oJIXkRPGfTWzGSjU5klnrr7dz6k2FIoc2NcK8hqJUSjzDc
         8y9LQY/fpM6pDmeHS/PSbJxmhImx7yKECIRsVB/+N/IZt0zNcBW1QKguiwa/Mxo7D3eH
         MhRCxeqp3VZVb7x8voi1szisbQ4WtYCgaXYqCKsnVKRin2xmE7IqPdyjK0WbdaVM34ty
         kolH1is3IKQ77560KVBx0An8ekmYduZYyvgQsK1xJaIIWj3yJDB8pehbofN/dYuUfLcx
         aFI00NEc5BQflXr88kOIU/WzLmTStyKzrenIP/Op348avUUOWHaDoqfGI+1nNJsx7Hdw
         71qQ==
X-Gm-Message-State: AOJu0YzmjHqpa5GcNsld8mlY6JW/xRJiSZDfRkGGFKPSCAJsuHiIBwJF
	BNfGqCIFXw4ZsCiAykV/OIw79XYsKPzU0moWn+DFl7XIkkTtdvU24lQ060gq
X-Google-Smtp-Source: AGHT+IHbWEVtALTV5SX6AygKhoBoICkO3yy7dZaRf/+8iCiWFijPRPAvwrZzwr753HVGTwccUk4gMg==
X-Received: by 2002:a05:690c:fc3:b0:6e7:f940:fe81 with SMTP id 00721157ae682-6ecb32af32emr87890217b3.6.1731594832300;
        Thu, 14 Nov 2024 06:33:52 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee44495380sm2523327b3.129.2024.11.14.06.33.52
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 06:33:52 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e5e5c43497so6277517b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:33:52 -0800 (PST)
X-Received: by 2002:a05:690c:e20:b0:6ee:4d01:b9df with SMTP id
 00721157ae682-6ee4d01bb58mr10698597b3.37.1731594831784; Thu, 14 Nov 2024
 06:33:51 -0800 (PST)
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
References: <20241114131114.602234-1-mpe@ellerman.id.au> <20241114131114.602234-6-mpe@ellerman.id.au>
In-Reply-To: <20241114131114.602234-6-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 15:33:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUV=Rrrg=zJcvS7LNTKJYy6jAa80C+dtehquz7Wt8L0w@mail.gmail.com>
Message-ID: <CAMuHMdUUV=Rrrg=zJcvS7LNTKJYy6jAa80C+dtehquz7Wt8L0w@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] powerpc: Remove prom_init longtrail work arounds
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
> Although these work arounds aren't guarded by PPC_CHRP, they should only
> ever have taken effect on CHRP Long Trail machines due to the firmware
> version check. With CHRP support removed they are no longer needed,
> remove them.
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

