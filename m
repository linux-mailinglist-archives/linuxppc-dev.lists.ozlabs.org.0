Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C6FF466
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 18:38:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Fj9v6SSFzF3Hf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2019 04:38:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=romain.dolbeau@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dolbeau.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FgmC1fr1zF44h
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 03:34:34 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id b17so13811791wmj.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 08:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fDjqvE3RfwBMIzQihc3O0Op0t/0gZE2z7xuAVT+tIYY=;
 b=FiZebV0zNRnn40K9rqXN11M63SXrA5mkoriaWJCOl/W0Q1tRvYrY80/+GXELREC1qC
 MCE+vXoP90SOdM68PsN2KrUY8gaBJpPuLvJc0AOy3DgATXirGEuBlkxJjbdUbkXoK1BB
 IbV5lnvU7GwRKTsRtXH3N8MXB2pMNrm1TQweeDltTEXB496e8b6KTCNZTDeubzMhpYI2
 QLHqmUCH9vDqiK3MKzcyCBok5qBEFhqQQt8h41R2PAnbZcztg/F4OwveGa1dRrz3UvDJ
 qFvOkcyP4g5BtfCM2in1WS22wAhQpKFKth0dK/QW5e3WRqBWIoDUDXEs9DfnOvZQj+Lu
 FFQg==
X-Gm-Message-State: APjAAAXygYRzCfKzlZOOBUu0YmA6/+NoW0i6L2cqZ8d46sxFil+v82ei
 002fWTnCpwKnjxSd/FKdUjBj6CAOhWJl1WeP6QY=
X-Google-Smtp-Source: APXvYqyyMjMQ3Lm9EAcK91cJNWnv5QoAiwsLv/hrVXsxSpuDkK0kkTytm6djh4JQs/7JsEuF0mjgQN2U2QpIa8ebOss=
X-Received: by 2002:a1c:6588:: with SMTP id z130mr19050470wmb.87.1573922070714; 
 Sat, 16 Nov 2019 08:34:30 -0800 (PST)
MIME-Version: 1.0
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
 <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
In-Reply-To: <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Sat, 16 Nov 2019 17:34:19 +0100
Message-ID: <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
Subject: Found the commit for: 5.3.7 64-bits kernel doesn't boot on G5 Quad
To: PowerPC List Debian <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
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
Cc: Mathieu Malaterre <malat@debian.org>,
 Christian Marillat <marillat@debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le dim. 10 nov. 2019 =C3=A0 11:45, Romain Dolbeau <romain@dolbeau.org> a =
=C3=A9crit :
> Any suggestion, advice, or patch to try welcome :-)

From my bisect, I figured that
0034d395f89d9c092bb15adbabdca5283e258b41 was the likely culprit, but
that the bug was masked by the printk() issues that were fixed later:
commit 2ac5a3bf7042a1c4abbcce1b6f0ec61e5d3786c2 mentions "Report on
Power: Kernel crashes very early during boot". Once that was merged,
the current bug appears instead of the early crash.

So what I did was:

1) checkout 0034d395f89d9c092bb15adbabdca5283e258b41
2) merge printk-for-5.2 & printk-for-5.2-fixes from pmladek/printk,
hoping to remove the printk issue ; there was only fairly trivial
conflicts

-> the resulting kernel displays the same bug as Debian's and vanilla
5.3 and HEAD, which is what I hoped for.

However, the merges did pick up quite a few commits, so I then:

3) did a revert of only 0034d395f89d9c092bb15adbabdca5283e258b41 ;
that did not cause conflicts (on HEAD, this causes a lot of conflicts
I don't know how to resolve).

-> the resulting kernel works fine ! :-)

So it seems to me that 0034d395f89d9c092bb15adbabdca5283e258b41
introduced the bug that crashes the PowerMac G5 (as/could anyone
tried/try on some other PPC970-based system, like a JS20 ? to see if
it's PowerMac-specific or not).

If anyone has an idea on how to fix this, that would be very welcome,
as I'm way out of my depth in the PPC64 MMU code.

Cordially,

--=20
Romain Dolbeau
