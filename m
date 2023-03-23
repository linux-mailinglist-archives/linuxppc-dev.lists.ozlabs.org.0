Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 338FD6C63D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 10:40:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj0h70f8Wz3fS4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 20:40:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pCQdPrCY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pCQdPrCY;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj0g91Y0qz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 20:39:48 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id w4so13685237plg.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679564386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zx1cWbW8skW+J91S4nIUH2+PrWy6/cJUo3hRxlmG+G4=;
        b=pCQdPrCYjY2EZyqDFB6ur/y+zD7pfxrqPKXJ6qROgn8YzstnagOQ80gua0e1yJf5be
         Iio59oXde7Wup+LLoxrsV6D9TeOXDdjIwSR0uzeN8xXXiJrpqDFsl3PPA9Bn/1zF3BIo
         YLwOlu/RQCnP/HzzbsPc80+gLMzoDTJiFBHeGDoqzkTbPeTcgvhX6vrX/IYCDMIOQ+lF
         oU3W9kqDe16PxbF7PpEZ1wobldylApgBPHSg1aCrJv/TSvboroNCYTId4WKXpZR8qvGg
         BPHyb212ZPe8k9S2ggTMwGgiVnV72nO1xLe9xzULnDLsdD1LalTMpJY686VYZd+oZ85l
         A86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679564386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zx1cWbW8skW+J91S4nIUH2+PrWy6/cJUo3hRxlmG+G4=;
        b=llBvNGIrjTSh113a62tpHtzm51s4kZxCkgvubBIHDuOMJMfYhHYT/GG6uArisR32Ry
         t1zQ/XwMrXeMjnnh6K0G/8oCAIfsnIILlhlLPKdCTuyhnWHLLx2v+kQwcKhKYaDEmuVY
         sMO4caoWNH2plZDoazN8U09VbAiTcO1Q5rTPkcU5j00fb0gITB9ZQry9JbAHKqA+h2WT
         7xx4rlNpqztcUEY/eLGVPxqP8wCPtdetX8zAt3JRFZw257uaQFwimyJ3b6lpylzDJg7L
         yWH+K9B/d+XFOVj4lziIVJyUmZ3EMdcCqDeJlR6Ck9F/AqFcdbxYEiQkSd1WEciafO44
         6BFw==
X-Gm-Message-State: AAQBX9e6wb4KD6efQVP7Jm+AJ/SQ2l0oNuznjigq8GU6Qu+2Sy+XMtOI
	Sw2B+zhyvFvBw8Bmbt0LhV8B9bjPu4vVd2P/4qQ=
X-Google-Smtp-Source: AKy350bCAexRMlOcrYwrCk12cMPtsoPYJWZ/XiHrtIhAZ4B6tk5Hhx8gC4VdgE3XYHEjClHtI+16JTGrwgF9+BfNLfM=
X-Received: by 2002:a17:902:b687:b0:1a1:ffc5:1e8d with SMTP id
 c7-20020a170902b68700b001a1ffc51e8dmr942230pls.3.1679564386271; Thu, 23 Mar
 2023 02:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230323092156.2545741-1-rppt@kernel.org> <20230323092156.2545741-15-rppt@kernel.org>
In-Reply-To: <20230323092156.2545741-15-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 23 Mar 2023 02:39:34 -0700
Message-ID: <CAMo8BfJtCgak4mbeZ2R61EEWz+HYYhK-KOz+XJ+fhLY+zFgajA@mail.gmail.com>
Subject: Re: [PATCH 14/14] xtensa: reword ARCH_FORCE_MAX_ORDER prompt and help text
To: Mike Rapoport <rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 23, 2023 at 2:24=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> The prompt and help text of ARCH_FORCE_MAX_ORDER are not even close to
> describe this configuration option.
>
> Update both to actually describe what this option does.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/xtensa/Kconfig | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
