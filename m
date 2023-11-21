Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4619B7F2897
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 10:21:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=OrgQS5jO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZJlL6mCCz3dBK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 20:21:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=OrgQS5jO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloudflare.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ignat@cloudflare.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZGq36DTvz3by8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 18:54:06 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28396255b81so2874418a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 23:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1700553239; x=1701158039; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n94+xDIkUOqQeszLqyF1GvL8Xx0iP7KzdJ36tDGQoLY=;
        b=OrgQS5jOoHCgXZJz+z//IXTj9AoWRZWOOMXU32Ecj6XQrZ+Z9TEOC+0EF0E5v9re3a
         ug/pH13UVp18oashLAxlXXaiZuLKbu23mPSIaF6rQjX6eRhHAD6Jeo9e7XFH+FqHL2aJ
         1kzL31nh9pV2UZksn/dcpkrlFB9ahGQ6OSaKy0tvPrGxEaas46R/7MdC2XbfLU9hnMnm
         ucH9MXtMUXbPAlVshc3nY7y19AAyq9wQs9zmS8tV+kXyq1xGzNIOqcE7DTMm6/4CjS2B
         WcSLWZ0w8vtssCG9seeIoOXnDUaZ+Wlz9HMt1DWcWZyZzm9jfJN8s/bXt+Hfh98lS12+
         fjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700553239; x=1701158039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n94+xDIkUOqQeszLqyF1GvL8Xx0iP7KzdJ36tDGQoLY=;
        b=oBvtdWb8zUjtn5DIynBcOAeIc317SXdmPPqBdNafrIGhsHcwSrLla30fSLLoBdoYTA
         fxmCj+mX/Mlgxe48KsfEWV/iVRCtGz8CBk+yv+esyxfwyO9Rfu7SARLoPdYAMtK93lQ2
         zvg2iMWDKUk3AwtLbGmcWgUD1ljAMqqncPcocS4VrAVI0lP0hmQEljrSBFcsG032z98F
         pjBkIgT4KGDn7iWAJZqAWt/lrYZLZaM1c+tDWX7BFh2f5V78AHdeZF7nNG/r8jm3vCc+
         yt+FMXmewFQHwJ8MV2gwY5NmpkeKtwSSfpwUBlOFsDlivX8NnvzUPMqs1iSkwAZd8qCg
         wdnw==
X-Gm-Message-State: AOJu0Yz7GRyZlrP9dBNWTTpuNZLeSOi/7tD7oVpKz8gZ2Kmqa/c+xeNx
	hspSUejvB6SHBLtYkoWw+PeYiogoaIub0mie7+OeJA==
X-Google-Smtp-Source: AGHT+IFEH3g7IKb8uSXGkQLcfDFQGeKgdMM5+Twg24L86I2m/VOT+I8Lea+NYKy/4gFSwZ3WTdUJVHHh1PwvYjXVr94=
X-Received: by 2002:a17:90a:8b01:b0:280:f534:6b9c with SMTP id
 y1-20020a17090a8b0100b00280f5346b9cmr7974497pjn.21.1700553238477; Mon, 20 Nov
 2023 23:53:58 -0800 (PST)
MIME-Version: 1.0
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv>
In-Reply-To: <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 21 Nov 2023 07:53:47 +0000
Message-ID: <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
To: Baoquan He <bhe@redhat.com>, eric_devolder@yahoo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 Nov 2023 20:20:18 +1100
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, kernel-team <kernel-team@cloudflare.com>, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, Ingo Molnar <mingo@redhat.com>, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, Ard Biesheuvel <ardb@kernel.org>, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, go
 r@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, Thomas Gleixner <tglx@linutronix.de>, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel <linux-kernel@vger.kernel.org>, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 1:50=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
>
> Eric DeVolder's Oracle mail address is not available anymore, add his
> current mail address he told me.

Thank you!

> On 11/20/23 at 10:52pm, Ignat Korchagin wrote:
> > Good day!
> >
> > We have recently started to evaluate Linux 6.6 and noticed that we
> > cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
> > enabled. It seems to be related to commit 89cde455 ("kexec:
> > consolidate kexec and crash options into kernel/Kconfig.kexec"), where
> > a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.
> >
> > In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FILE
> > with enforced signature check to support the kernel crash dumping
> > functionality and would like to keep CONFIG_KEXEC disabled for
> > security reasons [1].
> >
> > I was reading the long commit message, but the reason for adding
> > CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And I
> > believe from the implementation perspective CONFIG_KEXEC_FILE should
> > suffice here (as we successfully used it for crashdumps on Linux 6.1).
> >
> > Is there a reason for adding this dependency or is it just an
> > oversight? Would some solution of requiring either CONFIG_KEXEC or
> > CONFIG_KEXEC_FILE work here?
>
> I searched the patch history, found Eric didn't add the dependency on
> CONFIG_KEXEC at the beginning. Later a linux-next building failure with
> randconfig was reported, in there CONFIG_CRASH_DUMP enabled, while
> CONFIG_KEXEC is disabled. Finally Eric added the KEXEC dependency for
> CRASH_DUMP. Please see below link for more details:
>
> https://lore.kernel.org/all/3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle.c=
om/T/#u

Thank you for digging this up. However I'm still confused, because
this is exactly how we configure Linux 6.1 (although we do have
CONFIG_KEXEC_FILE enabled) and we don't have any problems. I believe
we did not investigate this issue properly.

> And besides, the newly added CONFIG_CRASH_HOTPLUG also needs
> CONFIG_KEXEC if the elfcorehdr is allowed to be manipulated when
> cpu/memory hotplug hapened.

This still feels like a regression to me: any crash dump support
should be independent of KEXEC syscalls being present. While probably
the common case (including us) that the crashing kernel and recovery
kernel are the same, they don't have to be. We need kexec syscall in
the crashing kernel, but crashdump support in the recovery kernel (but
the recovery kernel not having the kexec syscalls should be totally
fine). If we do require some code definitions from kexec - at most we
should put them under CONFIG_KEXEC_CORE.

> Thanks
> Baoquan
>
