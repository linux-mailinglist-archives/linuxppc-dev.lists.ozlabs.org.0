Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B19748B0E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 16:34:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYF9M3Y41z3c9c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 02:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYF8w5xWsz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 02:33:51 +1100 (AEDT)
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MHWzP-1nBPlC3IGX-00DVqD for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan
 2022 16:33:47 +0100
Received: by mail-wm1-f48.google.com with SMTP id e5so11335874wmq.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 07:33:47 -0800 (PST)
X-Gm-Message-State: AOAM532ElSaNikFVXLnroT3FwRQj6+iDkzClszw4l6pXI4xxgtCZP8ZX
 BZOfdeeUZOxp2eds78DLdgR4M1E+FPsw1o43yn0=
X-Google-Smtp-Source: ABdhPJyFFinYnz2sZBS9mJMA0LPDw6WfY7Va14XdJpsCQCV44OO8uJYaRTfqzAgePL4Snx4fHkOYLxmTt0Ze2tTLQxc=
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr2989838wmk.98.1641915227093; 
 Tue, 11 Jan 2022 07:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20220111083515.502308-1-hch@lst.de>
 <20220111083515.502308-5-hch@lst.de>
In-Reply-To: <20220111083515.502308-5-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 11 Jan 2022 16:33:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0mHC5=OOGV=sGnC9JqZWxzsJyZbTefnCtryQU3o3PY_g@mail.gmail.com>
Message-ID: <CAK8P3a0mHC5=OOGV=sGnC9JqZWxzsJyZbTefnCtryQU3o3PY_g@mail.gmail.com>
Subject: Re: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in
 fcntl.h
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fZAcgO713htNF3qjDU1EGqI/ytJTK66Jkc5BMcXlD4rkwlfr/2j
 dA8dP7kHCP1Wcc9WyMmoUFgo4srsxTafeuIUi1OBPSJ0k4T3d8pMqZM80Yhcj33mrsjzb5C
 UcXf+5gpvapTsuVaBtUUygZNAEIKtWdp5MeTlCF+Xo4GzyTEqOUxNgGBy1T+VKvvrIWeVkE
 u8V7cX5LnLa91GNL3I2eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xdsvraOqju4=:NC87LBsHyTM/1nzUwNR0m8
 UkP7a7hstrld/WQEwgFtAe5WIV0IOR9n8tV0DDd8cl85FYog9khPNGRQA7ZzolqITmYtZTCOP
 dQ1O9oOYvJdPtnhgBg5KTqwEDcFH+zjDFpplq1naUvNLXtXKlvrbGVEF48Av9V7BR61MkszM0
 2d3xOyMptWUhv7O4AVrgFjLV5vgSv7i2YvMrYKuon1f0FVc1Qqt0dOqfZYEC923ZnBDwQgeSC
 cyV9nZH16uw/1kYfDe6cUXiq92v/0SZTUBxzPwVJvu3A0TSGyaro+o32Rfe4elZpKjvXatYrC
 fF0ZqJ7cLTz7+d8MAMCFmVaAYZzRAj6F+heK31MOaBv8o4h+URFo2QZAVNVh1w5TD3BbrVd7i
 DuoXjnazzlsB5WCQgyzfKWLWlLlBlzK+1V75fXfiBy263FCHZSu5+zZkpW+b71YyNly1ySzvI
 ONIPAu0PoaIosavhF3CYogvd7jHwNrCRo1k0hDY0gzWeTW1Z4shuLkKsSYkQo8ceAEXHiTGjG
 3TOtU4WxqjKvx0ux4TnOiYKmKQz3AYzU2A7vPlraUuuoXZ39gtbdU01mR6OkzR6cseyTkCHQc
 Wddi0l71OpUCWj4+J/ETILZskpkCSlMojqO2QivmC9rUKgpIBMsD056LInMXL1/HupyPsgwJi
 WzXARJtnzuFEJYizlHH7AA+/M3wDq03tyjXqWQowVpjeeG1urMLgcmsIOgh/Zet1SJqM=
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 the arch/x86 maintainers <x86@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 11, 2022 at 9:35 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The fcntl F_GETLK64/F_SETLK64/F_SETLKW64 are only implemented for the
> 32-bit syscall APIs, but we also need them for compat handling on 64-bit
> builds.  Redefining them is error prone (as shown by the example that
> parisc gets it wrong currently), so we should use the same defines for
> both case.  In theory we could try to hide them from userspace, but
> given that only MIPS actually gets that right, while the asm-generic
> version used by most architectures relies on a Kconfig symbol that can't
> be relied on to be set properly by userspace is a clear indicator to not
> bother.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

> diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
> index 98f4ff165b776..43d7c44031be0 100644
> --- a/include/uapi/asm-generic/fcntl.h
> +++ b/include/uapi/asm-generic/fcntl.h
> @@ -116,13 +116,11 @@
>  #define F_GETSIG       11      /* for sockets. */
>  #endif
>
> -#ifndef CONFIG_64BIT
>  #ifndef F_GETLK64
>  #define F_GETLK64      12      /*  using 'struct flock64' */
>  #define F_SETLK64      13
>  #define F_SETLKW64     14
>  #endif
> -#endif
>
>  #ifndef F_SETOWN_EX
>  #define F_SETOWN_EX    15

This is a very subtle change to the exported UAPI header contents:
On 64-bit architectures, the three unusable numbers are now always
shown, rather than depending on a user-controlled symbol.

This is probably what we want here for compatibility reasons, but I think
it should be explained in the changelog text, and I'd like Jeff or Bruce
to comment on it as well: the alternative here would be to make the
uapi definition depend on __BITS_PER_LONG==32, which is
technically the right thing to do but more a of a change.

       Arnd
