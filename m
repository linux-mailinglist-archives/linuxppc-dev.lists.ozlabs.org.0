Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF059CFD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 14:50:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HBfx2nQBzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 22:50:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.194; helo=mail-oi1-f194.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HBcL4Z8wzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 22:47:44 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id y8so11957733oih.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 05:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2lOXZ8wFRW/YuaXxzTqaFqe/74prYF5RHRz56ehVnGE=;
 b=h0vFeQ6wzTvXt1p2xnE/9WPzysxYX5h/1kyYpE1eIjdA9HIHhgbwPv6QOFvKmpEuyN
 Vmrjsi12mq021yBhaDMM4igWmn462cY4oW64idSmAmbv2Aa/nsobwvIqp+7AByH1xWQa
 1oep8VAkTUpzxbHbk1pidRpSZ8VHjbNZ12E6qoBAUS0rLv/OwS13ZGmKbFZXKGtF9k5N
 URpx1yBX9KPNM4NIBXnZP2icxZiSotSNW0nvESVtO0u1F4Y2xtkQ5jdWRxrlkF/Otf25
 tUQB6dW/n4KoCtwI61CKIqaDSUwTqtYyn44BIQJHujbVl5VnEF3ARZOj3LgY2JKHeIOX
 huGQ==
X-Gm-Message-State: APjAAAVMCePyGSy0hFhRK0Dix1xzINrRbxfHerKIMDPYiGLpWYYkEQfM
 Zz5Nizhn9ZefnA+ChOyfKlgbaPY5YBORZ/lwzEc=
X-Google-Smtp-Source: APXvYqwQsnWsz/uUt3lKfonI6Y7AJ0n1GRj3J3qaJWXf5hQldprWVAhc5qe2LLw8A+wikNSRbxl2eIRuhJwLN2u1DJk=
X-Received: by 2002:aca:fd41:: with SMTP id b62mr12547417oii.96.1566823662073; 
 Mon, 26 Aug 2019 05:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <87mugdtf08.fsf@christian.marillat.net>
 <CA+7wUsw5eTdwJG3UytWr9CajVhpUkyOGufmvUvqQJoEWq4nWhQ@mail.gmail.com>
 <a84c86b3-4c6c-f7a2-ad3f-6e075e6ebe25@c-s.fr>
 <87a7cal3pd.fsf@christian.marillat.net>
 <e582fcf0-a311-07f7-5445-c3471ec5c783@c-s.fr>
 <87zhk9tgdb.fsf__22033.2117214397$1565960670$gmane$org@christian.marillat.net>
 <87ef1ljjct.fsf@igel.home> <87o90ptb6q.fsf@christian.marillat.net>
In-Reply-To: <87o90ptb6q.fsf@christian.marillat.net>
From: Mathieu Malaterre <malat@debian.org>
Date: Mon, 26 Aug 2019 14:47:30 +0200
Message-ID: <CA+7wUsx4y4ZQKzsuvFAKob9t4Mo299CpsM3m82bfL+63WLJJGg@mail.gmail.com>
Subject: Re: 5.2.7 kernel doesn't boot on G5
To: Christian Marillat <marillat@debian.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andreas Schwab <schwab@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian,

On Fri, Aug 16, 2019 at 4:52 PM Christian Marillat <marillat@debian.org> wr=
ote:
>
> On 16 ao=C3=BBt 2019 16:05, Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> > On Aug 16 2019, Christian Marillat <marillat@debian.org> wrote:
> >
> >> On 15 ao=C3=BBt 2019 19:50, christophe leroy <christophe.leroy@c-s.fr>=
 wrote:
> >>
> >> [...]
> >>
> >>> Can you test with latest stable version, ie 5.2.8 ?
> >>
> >> Built from my G5 with make-kpkg and still doesn't boot :
> >
> > FWIW, 5.2.0 is working fine on my G5 (PowerMac7,3).
>
> Mine is a PowerMac11,2 "Quadcore" and / is on a RAID0
>
> As 4.19.5 boot I don't think is a hardware problem.

Since no wild guess seems to be possible. Can you do a git bisect on
your side. Using a git clone of the linux kernel, I usually do from my
amd64 box:

When doing git bisect I compile from my amd64 machine using:

$ make O=3Dg4 ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnu- my_defconfi=
g
$ make -j8 O=3Dg4 ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnu- bindeb-=
pkg
$ scp *image*.deb macminig4:

The bindeb-pkg target is handy to generate a deb package. You may need
to adapt this for your g5.
