Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D5137A16
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 00:20:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vf9T2mGvzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 10:20:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=alexei.starovoitov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mSXSzvDi; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vf7b1WTlzDqj4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 10:19:06 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id u71so3778978lje.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 15:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sDCm2fAgdbf9iSd/cGIS/CChQu2q61Zn9eY7u0OfUvA=;
 b=mSXSzvDisimwy4fkPM0YoB3LyDLUDwqWRyHDDL9TbdonJkxVuiWmNym9tx/UBqT/oy
 6YyoKqxhS9fU2n/yHjkdK/4+dWFx80x6lGGx4ruh0cLAJwHoASZQo0QaqjFECG0yrNN7
 TbLzcJubxPIWx14YYb3VytxYW/tOw0lsHTOfF76XMnpFYUuZ7aZ6omUmN7D+ob09G+7B
 y306y84V1d4qg9kP6oYcVS5FmbYeB2MXPegicIZWqJK7A0kDC1wknXUtB/b6nG/TQ6vc
 v7vrI/Oh+C9/RDE3+jI5vVi9FDgAZcb51u6HuQXb7o/cR/5xo67iIdyoADeuKbQFQRYQ
 X0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sDCm2fAgdbf9iSd/cGIS/CChQu2q61Zn9eY7u0OfUvA=;
 b=Lp5DR82KkQRQVu2vHDUUKchviJbZg2sZL34LXMAc32zqvEFuV4bUkuMW6Utvo9zSJE
 CL+PJRFrGOjwSWXxYcK6imLxu9gdL6IbRqgnnFNv+dM0ghCZme/WbWf6i1u4FM4yoCMf
 Qdq6EkZUrchRutqJ+7KstJHYgEaTM6kahevabbKxY45a9coPgXNAd0NGxcbfKS6uxDe3
 uBkUU7WtjP7r3NENnv2SCpRx5S63q+erIRPYmuRwENQ3I7Zp7qYj5EeHglzYoHGx6uTd
 VJ9a98v5zVvWcmmhVQDkk8WhO0CQSL6FkMmlWkXqzMwOqPymMKem018HL1EjlxN9EoQm
 9k9g==
X-Gm-Message-State: APjAAAXFuV6YNY+eljbn+NmV9DpX/R5muPgAfAEi0ctAACOzN9wFsOeu
 RbvdSjCPi4RzETzGil11ZUGpvolNNsxdlw+wnMA=
X-Google-Smtp-Source: APXvYqyaEFKCy5sJpJYQlDZvnYhNy46CPEXRLWAVXF7WAT3sWxG5jqbHave+p4yRBIPkNC2TJa/MqW6xq+4teZD3kgY=
X-Received: by 2002:a2e:58c:: with SMTP id 134mr4241974ljf.12.1578698341335;
 Fri, 10 Jan 2020 15:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20191018105657.4584ec67@canb.auug.org.au>
 <20191028110257.6d6dba6e@canb.auug.org.au>
 <a367af4d-7267-2e94-74dc-2a2aac204080@ghiti.fr>
In-Reply-To: <a367af4d-7267-2e94-74dc-2a2aac204080@ghiti.fr>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 10 Jan 2020 15:18:50 -0800
Message-ID: <CAADnVQLo5HEjTpTTRm=BtExuKifPtCJm+Hu_WP6yeyV-Er55Qg@mail.gmail.com>
Subject: Re: Re: linux-next: build warning after merge of the bpf-next tree
To: Alexandre Ghiti <alexandre@ghiti.fr>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, zong.li@sifive.com,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 10, 2020 at 2:28 PM Alexandre Ghiti <alexandre@ghiti.fr> wrote:
>
> Hi guys,
>
> On 10/27/19 8:02 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > On Fri, 18 Oct 2019 10:56:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> Hi all,
> >>
> >> After merging the bpf-next tree, today's linux-next build (powerpc
> >> ppc64_defconfig) produced this warning:
> >>
> >> WARNING: 2 bad relocations
> >> c000000001998a48 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
> >> c000000001998a50 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end
> >>
> >> Introduced by commit
> >>
> >>    8580ac9404f6 ("bpf: Process in-kernel BTF")
> > This warning now appears in the net-next tree build.
> >
> >
> I bump that thread up because Zong also noticed that 2 new relocations for
> those symbols appeared in my riscv relocatable kernel branch following
> that commit.
>
> I also noticed 2 new relocations R_AARCH64_ABS64 appearing in arm64 kernel.
>
> Those 2 weak undefined symbols have existed since commit
> 341dfcf8d78e ("btf: expose BTF info through sysfs") but this is the fact
> to declare those symbols into btf.c that produced those relocations.
>
> I'm not sure what this all means, but this is not something I expected
> for riscv for
> a kernel linked with -shared/-fpie. Maybe should we just leave them to
> zero ?
>
> I think that deserves a deeper look if someone understands all this
> better than I do.

Are you saying there is a warning for arm64 as well?
Can ppc folks explain the above warning?
What does it mean "2 bad relocations"?
The code is doing:
extern char __weak _binary__btf_vmlinux_bin_start[];
extern char __weak _binary__btf_vmlinux_bin_end[];
Since they are weak they should be zero when not defined.
What's the issue?
