Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABABD3A66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 09:53:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qKvK6BNVzDqZQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 18:53:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qKqX4pRWzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 18:50:00 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id 60so7203793otu.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 00:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9x3/cDB6PwQR0s+Phj11ZK3bUY2nRE9yOnXorXSrffA=;
 b=OSHvw8/8IrXdkVL90Nb8m4LgHHtGXhCc4O6Qw/jSmnjRO2+drHh/qjRlLNJNn4EsAc
 e7htXQZXdPr8d+MrRo3h6rDBMJd+8GPlIwh2cnqXQI3449m5iIh4ii9kSC9iv9hs6MVI
 N/FQVUaEmLzi5SMgD4KlR81GEZ4KJ/1u8XM4/3jo6M6mluB91waElvB3twlIcIALyUDz
 WUWV2ZnnYKAAZMy0Z9oMpWwx6nVfY0shMDmqoPMc2y+jAvKbdzpmh4AMmpma24zTQq1n
 rQ+tX06am+u2z8ya0acIhoVkA6d6xTCDBoYNlH/vOND8/AZrvHlBYaaaVoOvw8Y2w35C
 POKw==
X-Gm-Message-State: APjAAAV0e9dMSYBIsO7+gj3qNrTrxb6hIfKVcjgTlO6ipIGudprEUBje
 /uKhzmAqEx8Gg0v4E2DRYQ1rLuhq7MAa08TLJJA=
X-Google-Smtp-Source: APXvYqzJCUSr68IdNnXRm+PcuWp7xfU4DRvosjpGQ70mELArtPXAo+zUfEKqQC0cweLEsachiHT5ajqOtTTMdIKhbv4=
X-Received: by 2002:a05:6830:1685:: with SMTP id
 k5mr11303222otr.250.1570780198260; 
 Fri, 11 Oct 2019 00:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-13-keescook@chromium.org>
In-Reply-To: <20191011000609.29728-13-keescook@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2019 09:49:47 +0200
Message-ID: <CAMuHMdW24azYFyoYwsYZKG685KS+a1H6L3v96BVcG2uBJoqnLw@mail.gmail.com>
Subject: Re: [PATCH v2 12/29] vmlinux.lds.h: Replace RO_DATA_SECTION with
 RO_DATA
To: Kees Cook <keescook@chromium.org>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Simek <monstr@monstr.eu>,
 the arch/x86 maintainers <x86@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Borislav Petkov <bp@alien8.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 11, 2019 at 2:07 AM Kees Cook <keescook@chromium.org> wrote:
> Finish renaming RO_DATA_SECTION to RO_DATA. (Calling this a "section"
> is a lie, since it's multiple sections and section flags cannot be
> applied to the macro.)
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

>  arch/m68k/kernel/vmlinux-nommu.lds  | 2 +-

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
