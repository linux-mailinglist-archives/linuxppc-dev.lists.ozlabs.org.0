Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F9F6C6D93
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 17:31:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj9pM1xdTz3f6n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 03:31:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.53; helo=mail-oa1-f53.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj9nl5y4jz3cj9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 03:31:05 +1100 (AEDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-17aeb49429eso22940393fac.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 09:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7GNIdZ5wgfU6KCXGbmsavLHJtcjfO2exto0gDOFK7Q=;
        b=qoyy/1SRIb6/qZSkoxYffFtl4AzWUpGU3FyVrC2dQHXqgWAX9p04cScyY2oafcb9m9
         lA4zqoEiwvEY5nETVb1IAw8NJyVvTC2YNjMXWj0YTVEGb0iwsuESyYAaP1u93TkeqhO6
         s8bgt/dzi6N1KulC4s+BUH03sYt40om5ogPRJ/BHZ4Zugm4Z0t1bxzTDfrfzoDfD9iS3
         O4+Ung2UdXowCKVQ2i4PwqbvZPM7GJoeXF63o4wyh/4hrGL6WCA5Izvgd4eObpH8lIsL
         XzE2VQcT/9pO8fB6guqQeyUarM+pD0EkiiczsNS0zTz5vVMhCMFxk1PEMacYs7RS6Hx3
         g/Tw==
X-Gm-Message-State: AAQBX9cZa7GnZnQ5MS+M7AHGaqQwrpPEueoJl1Ca+IqCCRFVyT6iKO2T
	ToZNXQjWyeVof6H48r4uQWVGcnt8bGASU131
X-Google-Smtp-Source: AKy350YWb9Qp6ZZgxTkl2VY1EY9kWrGHeQjgddYEM86sdlABTE3vtQ8QAq4dDy/bD56q9sNyRonzag==
X-Received: by 2002:a05:6870:d207:b0:177:9b62:6b7e with SMTP id g7-20020a056870d20700b001779b626b7emr2887472oac.24.1679589062719;
        Thu, 23 Mar 2023 09:31:02 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id z14-20020a54458e000000b0037b6f5d6309sm646725oib.2.2023.03.23.09.31.02
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 09:31:02 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso23200607fac.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 09:31:02 -0700 (PDT)
X-Received: by 2002:a05:6902:728:b0:a09:314f:a3ef with SMTP id
 l8-20020a056902072800b00a09314fa3efmr2593946ybt.12.1679588687557; Thu, 23 Mar
 2023 09:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230323092156.2545741-1-rppt@kernel.org> <20230323092156.2545741-7-rppt@kernel.org>
In-Reply-To: <20230323092156.2545741-7-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Mar 2023 17:24:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSE1OzYQfNx=cbP+yKZLkgv=nUS-Ddqk2ORv9qdWFahw@mail.gmail.com>
Message-ID: <CAMuHMdWSE1OzYQfNx=cbP+yKZLkgv=nUS-Ddqk2ORv9qdWFahw@mail.gmail.com>
Subject: Re: [PATCH 06/14] m68k: reword ARCH_FORCE_MAX_ORDER prompt and help text
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 23, 2023 at 10:23=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> The prompt and help text of ARCH_FORCE_MAX_ORDER are not even close to
> describe this configuration option.
>
> Update both to actually describe what this option does.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

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
