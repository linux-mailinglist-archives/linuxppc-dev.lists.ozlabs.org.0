Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4086224A0F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 11:16:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B82R55T72zDqtK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 19:16:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B82P54hbzzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 19:14:16 +1000 (AEST)
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MpUIW-1kdQ3o2KdA-00puaL for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul
 2020 11:14:08 +0200
Received: by mail-qk1-f181.google.com with SMTP id b4so10958060qkn.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 02:14:07 -0700 (PDT)
X-Gm-Message-State: AOAM531nRrJ397T3mRUK2Dbvh9KdmOKviBD90XSw3nMgddg/iXT8YBeJ
 eSHQ5RUjYoU6+NXAEbkuL7p4zpaoHkRn1eJ71j4=
X-Google-Smtp-Source: ABdhPJxwe+rAXwuvo5qNMMmdZVywOMqejAp891L6qgqpIBl7oiKJsK6nUyLJwXrhbK4R1O2B1G5OJHYrTQLcWCrrZmc=
X-Received: by 2002:a05:620a:1654:: with SMTP id
 c20mr12589219qko.138.1595063646520; 
 Sat, 18 Jul 2020 02:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200624035920.835571-1-natechancellor@gmail.com>
 <1bbb6956-d9de-e0c8-5b45-20b6fecc2189@infradead.org>
 <CAKwvOd=5nE6fkwp8iw0JqwQFp5KcUaC7RyEf2L6+tkbp9smsvg@mail.gmail.com>
In-Reply-To: <CAKwvOd=5nE6fkwp8iw0JqwQFp5KcUaC7RyEf2L6+tkbp9smsvg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 18 Jul 2020 11:13:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1JjQCB9HdRE6chvA5ekOGWUVpSDdPkgqQ+RGz=y06ong@mail.gmail.com>
Message-ID: <CAK8P3a1JjQCB9HdRE6chvA5ekOGWUVpSDdPkgqQ+RGz=y06ong@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
To: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:5iF5zAqDQoxf85XtgXp0azAgX66QtODvMMUyaQ2ibm32r3bYC7H
 3qROpXxidN6WHr6fzlcSB0RbV1bFNmMLdOcXH0e7GzLyzkKWdfi2d6AshsWHR6GLEheXkeK
 FZXs3OonzbMH2c/30C/dfo5e+s+Ih3K64YfHd5AuvDFaH2fP73UsydZKOXALYRz2smOqGnG
 2EFEsKe5RTl5ilI8kaX2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8eh+aPHA6Ww=:P5weejW61uILCskLPoTdGK
 oFrblaHj+G7R5nUqRyY+bzMUiHnqI8eGIeN0+7R9puB4BQoIc8sgeICXmyz5SR5zEYa0rIw4M
 c4N+VBJz4W4JjkjNzuNO2eitJQwiImc3Gg9g0Oi65NlfMPHBuubiRMdYJi0mQ3LdKLdebqaZc
 h/OdQHpQkaFQKkPcgpnci1SW8CXTAGNTgbJWfEAoexWnsvppIzguete96UYjr+WX7BN+JTOi6
 8bklSQCUpkBdDWGRlDTsh2SwnpPElRhtgujYogTssRo1FuRGWmK+WE4ZJ7n3LgdFWSBpuxV+a
 ld+TsxIvcdyqvN3uwvXYuCzI5Pa65UxtwBcisGWGUTN1qiHpoLC4upTeIPYBFDNHZzJmrTP2A
 a17vfPReoc5xqU1u5tpB7h7n2pO9RmO1LNry7dwTF+8bPEoAzvFLlXPbwIWVQJJBZZbTZkkBm
 GQazvLGkiD2D77w3DKHi2rTynmxzcfkkFg9hERzgC7cr2eAOS2THDxqQrbgWCyQWDneS4rzc3
 fkLRSftUKBlb5tisxKCmRaFTlq+Yoq23GT7lg6StFdhX5wUhBwKBAK5e7l1WiWMvWxOtScN1o
 QEj+9f3UqVDRe/8n1qzhqr0JIpryUv1m6pUURUl3hQfRHlgpxMdtboEWwmQAutCvre1JpYy8B
 gG/MLJdbW52Da8EBLg2ieTKdCuZREpzTJNXqRfKf2usgeKlkWUDT7u7Z5lTOAJ4CAlntNmruw
 i3dVrbxH8+e5mDuZONbMg9sW6FqImxHzugIkSZly2v18ZyAd4n8uFqRaagV38SaNm2AXMCWWh
 WghOuyLbPqKZnsR5DNRwlZ9Ur2+XhBJk2EwJ7EKqdIlx6lFZeXEmXlCrM/ivms2juU8vgB0
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
Cc: Geoff Levand <geoff@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 25, 2020 at 6:32 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Wed, Jun 24, 2020 at 6:19 PM Geoff Levand <geoff@infradead.org> wrote:
> >
> > Hi Nathan,
> >
> > On 6/23/20 8:59 PM, Nathan Chancellor wrote:
> > > These are not true arrays, they are linker defined symbols, which are
> > > just addresses.  Using the address of operator silences the warning
> > > and does not change the resulting assembly with either clang/ld.lld
> > > or gcc/ld (tested with diff + objdump -Dr).
> >
> > Thanks for your patch.  I tested this patch applied to v5.8-rc2 on a
> > PS3 and it seems OK.
>
> PS3?  Folks still have ones that can boot Linux?  Those ****ers took
> my Yellow Dog Linux away from me; I enjoyed depositing that settlement
> check!  Hopefully by now, folks have figured out how to roll back the
> system firmware?

I still have the PS3 from Hong Kong with original 1.5 (IIRC) firmware
that I demoed at LCA2006. Haven't booted it in at least 12 years, and
never used it for games or movies other than the free "Casino Royale"
they sent everyone.

      Arnd
