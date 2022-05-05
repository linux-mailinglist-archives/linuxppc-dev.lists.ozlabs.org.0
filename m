Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DAD51C155
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 15:51:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvFTY6rYMz3c7y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 23:50:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=WCAi+X3i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91;
 helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=WCAi+X3i; 
 dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvFSs683Lz3bXg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 23:50:21 +1000 (AEST)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 245Do2Nj015266
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 May 2022 22:50:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 245Do2Nj015266
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651758603;
 bh=9oRpkNgyXXtV+zgGcTivzSiWJg6PL7lzsKUtb+il+xA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WCAi+X3iW2LWnS+cyU6Xwt+mVMFWGKNgvm1N4fQyjnqbm5kc3n8AZNfmfQahJf44C
 8baCi4AzET7HA49g1FxlljYCIcyH27XetjJU5oHET938gKf0mwwJvz2T8HhpMNLCrz
 P9Pn3Km3/Y/vQeek7U0RGRx1wEMV/zynJog1koCSG/7blY0+bz+o/+V+nd0dhDVIgT
 ObLR1jGvcZqTTJusj3s304q3S0HOyD8i5NlnZKlgrayMMnTlwQhkOi3xewdpgkQ2UG
 FMtXR+0Z3J9CI9yvcXTbq4t0xxUsKdPB9BdEjyOOS3D5O8xVFTCPswe5Ah2kSLCHdl
 WLmJgONxSW2YA==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id j14so4454820plx.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 May 2022 06:50:03 -0700 (PDT)
X-Gm-Message-State: AOAM532vcbo+uMd0blOlrGWAOzKYVqC5W1t2t3dB8T0Lq4Tlb9dOX2+q
 x38ymv2Nyv0dCA+43IbZBIFaXEp2Kvon01gd11c=
X-Google-Smtp-Source: ABdhPJwUvU2dd6I2MVotZAWGiD+mCtj6djZTY+lh8nRnnAK5x12OI9taA02MBGobfNqjKVY/3aiklbcYcNl4MlrBSIM=
X-Received: by 2002:a17:90a:8405:b0:1bc:d521:b2c9 with SMTP id
 j5-20020a17090a840500b001bcd521b2c9mr6301241pjn.119.1651758602352; Thu, 05
 May 2022 06:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220505072244.1155033-1-masahiroy@kernel.org>
 <20220505072244.1155033-3-masahiroy@kernel.org>
In-Reply-To: <20220505072244.1155033-3-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 May 2022 22:48:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAREQt5rPGK8zsti_UA-dGFKfqHsVWbSgMLw-yLoeNkJeA@mail.gmail.com>
Message-ID: <CAK7LNAREQt5rPGK8zsti_UA-dGFKfqHsVWbSgMLw-yLoeNkJeA@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] modpost: change the license of EXPORT_SYMBOL to
 bool type
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Nicolas Schier a <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-um@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 5, 2022 at 4:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, enum export is tristate, but export_unknown does not make
> sense in any way.
>
> If the symbol name starts with "__ksymtab_", but the section name
> does not start with "___ksymtab+" or "___ksymtab_gpl+", it is not
> an exported symbol. The variable name just happens to start with
> "__ksymtab_". Do not call sym_add_exported() in this case.
>
> __ksymtab_* is internally by EXPORT_SYMBOL(_GPL) but somebody may

I mean
"... is internally used by ..."




-- 
Best Regards
Masahiro Yamada
