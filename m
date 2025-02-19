Return-Path: <linuxppc-dev+bounces-6352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4813A3C214
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 15:26:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YydxQ4cryz2ykZ;
	Thu, 20 Feb 2025 01:26:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739975194;
	cv=none; b=nGeNtWgC1nesd4BUMjnxDLmQ+O8Davdp4h874LFFJVR79aCeodoS8wqcmOfOQFtB6Em2x0lCbrbSD+ydo3Ph7nYf/W9lmtRyZYqp//OYsidVEQwNeB85lS8qsrOsRvARFGi3Km+eGGAshL1XbmGH65xQSoLaWuAeulqvT66zIGAZoBqNs+Xg9o/0yp+VAQowfhXFYZTdOsQH+qUQ9WUQMQCzsggcf4CLMV+y610xZTSot0f/ye/+BucE16FVsOj+7S7OVeUuUl5078L0Ah9ibmHmonAEtEdmeoulWOUGNSttLRR9Lx2vlwt0yyIg86eOy424WGAAr/zZzV/JFh/hew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739975194; c=relaxed/relaxed;
	bh=s4yhCNhUGPCcd5Tw/szBBHBjKZ5YnOzqe/Gd4cj1U8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ie/l0gpFgBjKRIczyR9scOKYwGnqdOrgQU1T/lDCcSpec3cMFGYGoYhSRABTuNUK45lH4IDXZ2o643YSt2+BYG8zsoHyf9g/1m+17axbKfKsCFMz/Ri3Uto5nnKcBGLT6NFkdd5QzBo2tCdHtROVYDF8uxYR+efXEcAlDjnaMGOqF3o4Sns4qQx1zRrNGrhnlkcR1vgOt2Nu3J/BhkNO7MygbReYaD97gyAEnGV6dV0XQypXl9IrkBoGdGR600FV3wEldGt2nSGYGqwLfg8vWVVsstJs1Y2E0/+0jMU3svr9oKF3yEUV1mNdqQ0kedz+yBKldJSqQM1eWqmsYYHMfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.222.50; helo=mail-ua1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.50; helo=mail-ua1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YydxP1hpMz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 01:26:32 +1100 (AEDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-868e986092cso2045453241.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 06:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739975187; x=1740579987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4yhCNhUGPCcd5Tw/szBBHBjKZ5YnOzqe/Gd4cj1U8Y=;
        b=CAz6cpZ45ZXWblZqAfnON6q2S+aJHRD08qKRQ105w0piZa0D10LBcYtG/gRKsJ7iTq
         S+o7A4s8voEEKwtBiaFVNJrZTZaBzoOIGoTwiUMeoZytpgpV5BDpFq+e+qmTHG8v9QC9
         2oA9fRYcCYLde9V2+zaOOfVkFJZrGBg85LGwOlZlVYRMT1yk1f1beY8l269f8H2uvB07
         9LqHzUUadmFWiULgYolIyErPgaAMjN6/Zhf6j61FANj8xPI9TB7MOH28OwOJ6ac0z7d5
         V2Ir9tAiYs+w7fp7yknrpXC3nq3jtIwxwP7RLhHJN4WrC7Dg3RMXzE8GsjLkeAOD1oWQ
         mUgw==
X-Forwarded-Encrypted: i=1; AJvYcCWrBze6wVvnKxjAmIZwKIrd3+6FoixrXIZGgYxUS4nWad8ctHKXNhyga4t4JGGxaOHLVJn3YX/0IEvJ/N0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7mt+QmPzcHDtaCmBc594gew3yRHO5CMXQRoOYQN/UQh3iCCj7
	Y3zFnG2hMc2Ef14Pdi45d7dy9qKY8ANu8CUCE0tHbt8UDlF3nzLM8EfstnsT
X-Gm-Gg: ASbGncv2EfCXg8xPP3SDezRd1mRR94PZd6osX567nuuxfDitnfZ9ImEXPDvcwDPWWgz
	Z2OJPAUhqKJ8emrhaYDmKbj+Ewyx2pGAz0Q8IZ3R+jx51UxXyNZ8E9rYZ4/MEjTt7agu7bDd9m8
	qjl3CRSiy1jo+n0ELgiOBictT26kF2kIrQFB4xL1n+MkHALynGWL2hBPYsSE5E5+h9bEGJP4DcF
	XKcaI3nmmBnbs8Wr7bYp8fQCLGcuXbEpUErYYe1J0JLYVLP+SVg/UyI8hytO5oId0YNifL0xBzX
	WMb1n9B4jrhaSFXFWn4T97qOsaOmLEExTL+Xi/11tXZB0m+E0HZNag==
X-Google-Smtp-Source: AGHT+IHQcnu665B86rgGFIQgthRosxhHDwkghiPSqFzQ3A8kxatdiJ5fmbwiIoXIq23TnpZczBn94Q==
X-Received: by 2002:a05:6122:a19:b0:520:4c93:d9a7 with SMTP id 71dfb90a1353d-521c466809emr2103313e0c.9.1739975187446;
        Wed, 19 Feb 2025 06:26:27 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52098c98d26sm2651386e0c.8.2025.02.19.06.26.26
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 06:26:26 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86712bc0508so2073246241.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 06:26:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5OeZ3To1m56UK8S12jzHximbOIxCI2mj2RLDx+zFATOvgTR+5z8udBEkIUmKM4BJgmhlfJChIBLPD5wc=@lists.ozlabs.org
X-Received: by 2002:a05:6122:4f9d:b0:520:8911:df12 with SMTP id
 71dfb90a1353d-521c46a1fd0mr1816456e0c.10.1739975186522; Wed, 19 Feb 2025
 06:26:26 -0800 (PST)
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
References: <20250219111445.2875-2-thorsten.blum@linux.dev>
In-Reply-To: <20250219111445.2875-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2025 15:26:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWcDw0E4Hwx-h8AffKnHbvmWFARY1hCBc8Eoew0QwOWQw@mail.gmail.com>
X-Gm-Features: AWEUYZlPk9uUTLgJ8RmktcmMksJ2NIHrHmUhnGZCLlfyQvp90kK3BHGZUFgC9r4
Message-ID: <CAMuHMdWcDw0E4Hwx-h8AffKnHbvmWFARY1hCBc8Eoew0QwOWQw@mail.gmail.com>
Subject: Re: [RESEND PATCH] powerpc/ps3: Use str_write_read() in ps3_notification_read_write()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Geoff Levand <geoff@infradead.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 19 Feb 2025 at 12:15, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Remove hard-coded strings by using the str_write_read() helper function.
>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

