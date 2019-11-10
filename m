Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5252EF68AE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 12:27:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479sDx71ynzF4xW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 22:27:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.66; helo=mail-wr1-f66.google.com;
 envelope-from=romain.dolbeau@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dolbeau.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479rJK04Y5zF3VP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 21:45:31 +1100 (AEDT)
Received: by mail-wr1-f66.google.com with SMTP id b3so11528995wrs.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 02:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LO1XPuEvTtlrVaqKKtYuiOehC2ZIjZxMVvrEqliyZeE=;
 b=aVf80DiEOLNI0VSTODkCcExlOy7Nk02zhurdYYyIr2EQCHSfK9HuDYx6IKeTM00fSL
 JOuF0UnkepmslCF65w1bE7E4cNXI9E+alY7N1qCn5H5CPkq4cxn64RPz4FeqpfoAevEi
 RIuYT+S4q+0yBzkoOBxT8OkD4qmxF4LTnv6OqY7mrKCwqEsv8vTHZgZJR7Xz2/qKX022
 FLC/i6hpFbNWoU2SULmX2L5u8qbZ5OiA0qs6kEbZFXaqtRbNFlmoTPXzfjvfxnmgmtkj
 3YNkRel0tp8fRzDU9PR5WZBBCcLL46qDTLHxGcYHBtW9EnvU6zlUd6Im6f6Q5kUy+BCJ
 B8vQ==
X-Gm-Message-State: APjAAAVL8B2Fgbnxlcmp2UTPDuuDK8jAGx8Vyid8CLbFbukTomaCIswU
 xCGINDSxT6L+JIhejgzMsHc22PbsyNYdC3aEooI=
X-Google-Smtp-Source: APXvYqz9za8hXp9VVZIDNZzAg0EpjaG7rKihOzM0fZrRVYV+ild2dSX6Pq5A8GOgM4L+Ex8w7AYwm5ztL4Bazb8n2hM=
X-Received: by 2002:a05:6000:49:: with SMTP id
 k9mr16376274wrx.43.1573382727114; 
 Sun, 10 Nov 2019 02:45:27 -0800 (PST)
MIME-Version: 1.0
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
In-Reply-To: <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Sun, 10 Nov 2019 11:45:15 +0100
Message-ID: <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
Subject: Re: 5.3.7 64-bits kernel doesn't boot on G5 Quad
To: PowerPC List Debian <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="0000000000008bbfca0596fbb62a"
X-Mailman-Approved-At: Sun, 10 Nov 2019 22:25:17 +1100
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
Cc: Mathieu Malaterre <malat@debian.org>,
 Christian Marillat <marillat@debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000008bbfca0596fbb62a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Following my bug report on debian-powerpc and the following, I'm
adding linuxppc-dev to my answer.

Le jeu. 7 nov. 2019 =C3=A0 11:09, Mathieu Malaterre <malat@debian.org> a =
=C3=A9crit :
> On Thu, Nov 7, 2019 at 9:34 AM John Paul Adrian Glaubitz
> > The answer here would be git bisect [1]. I would first start downloadin=
g
> > the current kernel source tarball for 5.3.7 from upstream and build the
> > kernel with "make localmodconfig" to see whether it's an upstream or De=
bian
> > problem.
> I suspect this is upstream and even before 5.3.7. The original report
> by Christian has been discussed on linuxpcc-dev:
> <https://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg155248.htm=
l>

Thanks to you guys I was able to cross-build a kernel (native would
have been way to slow) and try to bisect the bug.
However, I ended up in another buggy behavior that may or may not be relate=
d :-(
I tried to localize the bug(s) as best I could.

I attach to this the result of 'git bisect log' to see if someone can
figure out what's going on. Some of the commits were hand-picked to
avoid doing too many 'skip' configurations with the bug described
below.

As I marked this:

*bad*: seems to behave the same as the Debian kernel or git HEAD, that
is, crash as reported (or very similar to, at least) by Christian.

*good*: either a full boot, or occasionally the kernel dropped me into
initramfs complaining about versioning of some symbols - I figured it
went far enough so it did not have the bug. The last one in the file
is a full boot as I remember it.

*skip*: most of them involves hanging just after cpus start (i.e.
including 3 messages about kick-up for the extra cpu and one about
bringing up being done, then nothing further). Those covers a lot of
commits :-(

(I used <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
>
and my build command was "make ARCH=3Dpowerpc
CROSS_COMPILE=3Dpowerpc64-linux-gnu- oldconfig && make ARCH=3Dpowerpc
CROSS_COMPILE=3Dpowerpc64-linux-gnu- -j56 bindeb-pkg", using default
values for oldconfig, starting with the config file from Debian at the
beginning, cross-gcc is 8.3 from buster, tested on a G5 Quad).

Any suggestion, advice, or patch to try welcome :-)

Thanks in advance& cordially,

--=20
Romain Dolbeau

--0000000000008bbfca0596fbb62a
Content-Type: application/x-gzip; name="ppc64_bisect.log.gz"
Content-Disposition: attachment; filename="ppc64_bisect.log.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_k2sv44d50>
X-Attachment-Id: f_k2sv44d50

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
--0000000000008bbfca0596fbb62a--
