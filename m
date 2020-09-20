Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA76271188
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 02:16:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bv7RC3NQVzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 10:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=puNMNVSI; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bv7PG3bfmzDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 10:14:58 +1000 (AEST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD40820DD4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 00:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600560895;
 bh=hFlNFuPTeOm0L/kdCL4zZ1r5D8O6dPLmjujTGrKOlYM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=puNMNVSIh3nOcXZR2bsSX89mx7JsoFWoBEe7Ak/z+DHmLOhb+Kh9sSU8Baw2xkYcL
 D2jd4AOn8hF0K/zn41LjhaaVl7xocGLJmOT8gdJrwj7qZg0ejYTZECwuJzlzHWv+kO
 OFRT3p90VCBE1oiQrCZZUJZydIgvG/SANufNNLCU=
Received: by mail-wr1-f51.google.com with SMTP id m6so9190710wrn.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 17:14:54 -0700 (PDT)
X-Gm-Message-State: AOAM533RbvL0uPGfyBUT6v6Tg9X3LK1Wi/rupNhCxR+57zgMLWwLMc4T
 RZP0QXfsGlmKE/k9tfiThIs18jF2rpzty5l+Lp6M0Q==
X-Google-Smtp-Source: ABdhPJwNa+g9tI1uon0gRHcB2mOJvq7bEiosz+i+17dS26MXBg9h+I1xFom2CJCFuIf/wJaqwzsOPjK0guk9bG2/Zms=
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr251480wrb.70.1600560893353;
 Sat, 19 Sep 2020 17:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200919224122.GJ3421308@ZenIV.linux.org.uk>
 <36CF3DE7-7B4B-41FD-9818-FDF8A5B440FB@amacapital.net>
 <20200919232411.GK3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200919232411.GK3421308@ZenIV.linux.org.uk>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 19 Sep 2020 17:14:41 -0700
X-Gmail-Original-Message-ID: <CALCETrViwOdFia_aX4p4riE8aqop1zoOqVfiQtSAZEzheC+Ozg@mail.gmail.com>
Message-ID: <CALCETrViwOdFia_aX4p4riE8aqop1zoOqVfiQtSAZEzheC+Ozg@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To: Al Viro <viro@zeniv.linux.org.uk>
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
Cc: linux-aio@kvack.org, "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-block <linux-block@vger.kernel.org>,
 io-uring@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 4:24 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sat, Sep 19, 2020 at 03:53:40PM -0700, Andy Lutomirski wrote:
>
> > > It would not be a win - most of the syscalls don't give a damn
> > > about 32bit vs. 64bit...
> >
> > Any reasonable implementation would optimize it out for syscalls that d=
on=E2=80=99t care.  Or it could be explicit:
> >
> > DEFINE_MULTIARCH_SYSCALL(...)
>
> 1) what would that look like?

In effect, it would work like this:

/* Arch-specific, but there's a generic case for sane architectures. */
enum syscall_arch {
  SYSCALL_NATIVE,
  SYSCALL_COMPAT,
  SYSCALL_X32,
};

DEFINE_MULTIARCH_SYSCALLn(args, arch)
{
  args are the args here, and arch is the arch.
}

> 2) have you counted the syscalls that do and do not need that?

No.

> 3) how many of those realistically *can* be unified with their
> compat counterparts?  [hint: ioctl(2) cannot]

There would be no requirement to unify anything.  The idea is that
we'd get rid of all the global state flags.

For ioctl, we'd have a new file_operation:

long ioctl(struct file *, unsigned int, unsigned long, enum syscall_arch);

I'm not saying this is easy, but I think it's possible and the result
would be more obviously correct than what we have now.
