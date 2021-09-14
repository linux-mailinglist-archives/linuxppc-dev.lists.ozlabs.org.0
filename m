Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFB540B354
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 17:42:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H86zf0tN5z2xvf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 01:42:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BpcuMcoH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=BpcuMcoH; 
 dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H86yy4tcTz2xtY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 01:41:44 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id h9so29973768ejs.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgZDRvewpIcHvEl+aClDgx6dxTBkhTg+5FlC2P6kQVc=;
 b=BpcuMcoHH1B5L3A9rysqIc0UNfq5noiLE14zKeR1TSa0gFC85lOw2Beo8dO5honWby
 rYyCHFnHkKNi7MCpw7JrIjMcXxBeTw1cz/rDSABmNfOTKR6Ymn6YfZNGpWuykLc9dauc
 iTDBkLKWwlR9RhIlCft6lceQmUvWAku/ar3t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgZDRvewpIcHvEl+aClDgx6dxTBkhTg+5FlC2P6kQVc=;
 b=Njdrbf7Wws2K149bl/PvGOWp6+/DJNWNwPWPv5yJ+ZnNOkEPjEvWXngOt9k2QQtbUC
 NiOgOuvoeIrhFk4GeptUpPkJJaeib67N4/Qg0rhOaXQ532y72jVp+K0Luz+0cArIBi12
 uxhW1NY/KMRFbIeRbRTx1yoU91UNDAqDRKA6P5gE6q5/dss7x8ChRI7ZDhye/KsepGIO
 YTf4bY7KhmzEv/PU4b+V4WdKui3+IopRZx784/zLnb26oQMmknM2nagvD6TwBhJHM69k
 IEBfOTQBB84m/t8JbSMe5wstHHVi5QnEkVQyS5sIf2Mj9gDxm1K5rnkviRn1AsNh+2sK
 G1xQ==
X-Gm-Message-State: AOAM532Mn/58DVne1JGZFkIdRNnpv2rG1bgvwVp+YxvJC8TFu0Hua315
 FFE2ng1YSJtI5hPgY6M7+6eP9PobscUNdkNr/zg=
X-Google-Smtp-Source: ABdhPJwVfdD4m+M1wMk4bm/HHDGtbpoVYC1UCvEl5zgBULVkO95x5J4tDNLnUTGeGyvPQCcQVYr+wQ==
X-Received: by 2002:a17:906:a195:: with SMTP id
 s21mr18902959ejy.181.1631634100303; 
 Tue, 14 Sep 2021 08:41:40 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43])
 by smtp.gmail.com with ESMTPSA id gx4sm3781077ejb.116.2021.09.14.08.41.39
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:41:39 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id kt8so29907989ejb.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:41:39 -0700 (PDT)
X-Received: by 2002:a2e:a7d0:: with SMTP id x16mr15637818ljp.494.1631634089537; 
 Tue, 14 Sep 2021 08:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-2-ardb@kernel.org>
In-Reply-To: <20210914121036.3975026-2-ardb@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 08:41:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkCzP-wyZ08r9RDJRx9cbANVHy-jy=vJAGTkSbXm50iA@mail.gmail.com>
Message-ID: <CAHk-=whkCzP-wyZ08r9RDJRx9cbANVHy-jy=vJAGTkSbXm50iA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 14, 2021 at 5:10 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The CPU field will be moved back into thread_info even when
> THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
> struct thread_info.

The series looks sane to me, but it strikes me that it's inconsistent
- here for arm64, you make it unconditional, but for the other
architectures you end up putting it inside a #ifdef CONFIG_SMP.

Was there some reason for this odd behavior?

           Linus
