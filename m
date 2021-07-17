Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052C33CC44D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jul 2021 17:55:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRt3X6CvGz3bXv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 01:55:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Hd7cFMGq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hd7cFMGq; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRt351MRwz2yNm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jul 2021 01:54:40 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id a10so5855218qvj.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jul 2021 08:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/AmEWCj5cXsx6W4oaKZsoab5w8JmJ+9MssIjB5+swwA=;
 b=Hd7cFMGqcK3734ZSRwBdBTBnPszJUkSaEgKGOSuTyf/9CVvvNfXluFBSaLkqh+vhUh
 QcrT26qOCpfZc1WiHF4mKDD77VaNcYLaA4X7EeCUnD599C/30/hYg2crk7JwD7LWYouM
 QOihc6TRUO3to8f8fESP33q4Y62wfeI36gXgoSU4oyvnNfExtwIvT+orPuGfx8DmHazn
 aiD+1sObT9TkpJVcTQyr+UmDLRLttJ+AV6/s1Qp++DeDte7qcMlwc05Jp5E2l9tnTn0i
 z/HU8M7Kh1ZgxSwCGUKkPA1Uhyo59wcJ9cyEWR9+YBPFTcnFad3dmDkblvyYHWAWCPeu
 ZbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/AmEWCj5cXsx6W4oaKZsoab5w8JmJ+9MssIjB5+swwA=;
 b=QR4/5Iz7t/hKH94ztV6HodhHcSUXQUbgBHFl/typQ1HsoVLw51+efyfBtfeYwEpvJT
 hOhXPmBvXoiJ4Xh+fI258SxkCnECW1JS/CgpIATHaIS+jlw4igX2RdZmJmKwkBHLhWzr
 f0n3v5UzJCoEp9ZuEnn4hc2NxQ1/FUVoTPl92QU2JU2va+XAT6SfGibQYz9PxBldGOyc
 Qu8KWFs4+kWSm6eQ25jUBqBp3RmUWnDqaNJdpDBGIVQky4FzwnOh0ZxwcsBs8mVeqc43
 mV+Rd/HmxSA5Ja10l3CIVBf2apgRN8Z1q6+JYO4uVtRe6rO7l2ukIVSJGmsVA2/3iuei
 ZPNg==
X-Gm-Message-State: AOAM533oxIuuv36z37OzhzWZ5rILZeI++V8xoLaPtub32jzyfLf0qLda
 12KetW8TjJMjaaYkU8K5GoqAEsFzavYEplhruJQ=
X-Google-Smtp-Source: ABdhPJx6da7bNxrbahuQ1ZMmUEUmGz/s4AMwe9r3af+DEfFlkKfncSOREj83WikQRIBmu7VH6T14DsqX92XdK+L9ZyA=
X-Received: by 2002:a05:6214:1cb:: with SMTP id
 c11mr16338918qvt.47.1626537274819; 
 Sat, 17 Jul 2021 08:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210716221159.3587039-1-linux@roeck-us.net>
In-Reply-To: <20210716221159.3587039-1-linux@roeck-us.net>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Sun, 18 Jul 2021 01:54:23 +1000
Message-ID: <CAOSf1CHuLhYO1rXiAhPz6xyQ-GgrjE-dj=Af6v7CWSH6QroEtQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/chrp: Revert "Move PHB discovery" and "Make
 hydra_init() static"
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 17, 2021 at 8:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> This patch reverts commit 407d418f2fd4 ("powerpc/chrp: Move PHB
> discovery") and commit 9634afa67bfd ("powerpc/chrp: Make hydra_init()
> static").
>
> Running the upstream kernel on Qemu's brand new "pegasos2" emulation
> results in a variety of backtraces such as

...and actually using it appears to require both manually enabling it
in the qemu config and finding a random bios blob that is no longer
distributed by the manufacturer. Cool.

> Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
> ------------[ cut here ]------------
> Bug: Write fault blocked by KUAP!
> WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:230 do_page_fault+0x4f4/0x920
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.2 #40
> NIP:  c0021824 LR: c0021824 CTR: 00000000
> REGS: c1085d50 TRAP: 0700   Not tainted  (5.13.2)
> MSR:  00021032 <ME,IR,DR,RI>  CR: 24042254  XER: 00000000
>
> GPR00: c0021824 c1085e10 c0f8c520 00000021 3fffefff c1085c60 c1085c58 00000000
> GPR08: 00001032 00000000 00000000 c0ffb3ec 44042254 00000000 00000000 00000004
> GPR16: 00000000 ffffffff 000000c4 000000d0 0188c6e0 01006000 00000001 40b14000
> GPR24: c0ec000c 00000300 02000000 00000000 42000000 000000a1 00000000 c1085e60
> NIP [c0021824] do_page_fault+0x4f4/0x920
> LR [c0021824] do_page_fault+0x4f4/0x920
> Call Trace:
> [c1085e10] [c0021824] do_page_fault+0x4f4/0x920 (unreliable)
> [c1085e50] [c0004254] DataAccess_virt+0xd4/0xe4
>
> and the system fails to boot. Bisect points to commit 407d418f2fd4
> ("powerpc/chrp: Move PHB discovery"). Reverting this patch together with
> commit 9634afa67bfd ("powerpc/chrp: Make hydra_init() static") fixes
> the problem.

The rationale for adding ppc_md.discover_phbs() and shifting all the
platforms over to using it is in commit 5537fcb319d0 ("powerpc/pci:
Add ppc_md.discover_phbs()"). I'd rather not go back to having random
platforms doing their PCI init before the kernel has setup the page
allocator. You need to either debug the problem fully, or provide
enough replication details so that someone who isn't invested in
emulating ancient hardware (i.e. me) with enough information to
actually replicate the problem.

Oliver
