Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E60E8446691
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 16:57:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm4s50g6Zz3c7R
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 02:57:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm4rY5KH0z2ymy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 02:57:00 +1100 (AEDT)
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MuVOM-1mS2xu0pOc-00rUce for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov
 2021 16:56:56 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so9859634wmj.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 08:56:55 -0700 (PDT)
X-Gm-Message-State: AOAM530ED9MDazUXaEAGyjY080oue+e0O85VfMQ45Eb6yHGvjLTwchvA
 9aSDhzYfP4YYi97EuDZB5r/OU6F+uDSG+wYT2do=
X-Google-Smtp-Source: ABdhPJxk4OCRMtLkil/Eyj8Bt7IiEC6cv8x2wWvEo25EBDjZmSRZavU4Cmw8YwQkdpld9oVGpzqUDybBNFF63jz+S4E=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr20339339wmj.35.1636127805532; 
 Fri, 05 Nov 2021 08:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
In-Reply-To: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 5 Nov 2021 16:56:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
Message-ID: <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Cleanup after removal of configs
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UzqQb44A3teG2MIJ8bwO8z7Wu5nlhjN0gFP23Qf1+ekiHIAP1F7
 16AnZTlmhi99jaXtc9vKwVJDXMQJurRfs97VoVznU69l547J7UqM/TWNahG5ONvTZpx/vQN
 RJAJ1mhw7fINtGKRkjUdWKICnzOQjKGFbEgDI34NZf3Fwvp3CwqEPjajO/jA/kpxr5FjRgo
 3Js1GNfKxAfQGJApLf/fA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Qq26743S7A=:kyX6X5nhFiG4mPVWULQq83
 o92yJGgrwBofi+qgOHHjfJBWKV4fOAVP/HQS2VPw0IvI4gfwW5X8CGU6+/ptoO5PVSXgViWD9
 8rjMzXafWKKINZpCj21zvr36KwtJrB0Dz03lCPclwFUygTpfHbIn1HYaRLRq9qvGfvzwRgP6r
 eluslMn+IqHf+MqfEhxjcm0bq4ZAGU4/N8asF1/npglasRkNIs4bK2ctMCatK8V0KsGngoSUv
 O002V4H4mDkhl+KvMqKaN8OZ5vs/tlbbZ0wMu2+lsS5scrD+pYExWFd7lRER39fJfK5QKdhbR
 +46m/+N6VZCZKeizVq4uvRwM+YoKrjuJNhmCV/P27qzxMMBnsgeLgUSTQyos+N0c5+6kqCb8x
 VqmTqYDF23SIDcnFhDq/YSoV2t0hSw6IoY3piezTK2DbfoXDSkqpWT9yydy3eGMnje1eSyYRj
 LU+otdZs763HVqR6MvhA82hBI3b9OBVQFe+FcrpBmhh2qTbh1eeIJ5Uc1Yf2tJnlUtg4z8V1h
 UYSbI75RwX2Wp/z4I5V0BbM2l0ngJUAj4OQNg+PLkHWvHs7ISvzqmncD/zd3Tfl5FEs8yCqLh
 4XIrWx171483xKMWAgD0ebW+19AWeFEoD0zpgRhsygpxYCEYKTC3ax23T/3AcQO9Jf2KgJHnc
 pQg98EDCP6lh5Dt3pRqjE+poYZCCirD8AQJIBFiBP++q/iEEuU+Gl0rZUxGRrKY95AO37v86m
 Gf/utxwuiL6t/5CZcnhdSURgjBsv/zp/NRWVDj+VWGu0CWKhSpaMw4/u76jZlxZjPIaBIqNrk
 ebEhKbD/OptyVcVt+u8rCRGf0GcHi/EMBZLFvG05H3TSfrQjtc=
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 samba-technical@lists.samba.org, Lee Jones <lee.jones@linaro.org>,
 linux-cifs@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>, Linux-sh list <linux-sh@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-cachefs@redhat.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Arnd Bergmann <arnd@arndb.de>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Kalle Valo <kvalo@codeaurora.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-power@fi.rohmeurope.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 5, 2021 at 4:43 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> While bumping from 5.13 to 5.15, I found that a few deleted configs had
> left some pieces here and there: this patchset cleans that.
>
> Alexandre Ghiti (7):
>   Documentation, arch: Remove leftovers from fscache/cachefiles
>     histograms
>   Documentation, arch: Remove leftovers from raw device
>   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
>   arch: Remove leftovers from mandatory file locking
>   Documentation, arch, fs: Remove leftovers from fscache object list
>   include: mfd: Remove leftovers from bd70528 watchdog
>   arch: Remove leftovers from prism54 wireless driver

Looks all good to me, thanks a lot for the cleanup!

For arch/arm/configs:

Acked-by: Arnd Bergmann <arnd@arndb.de>

assuming this goes through someone else's tree. Let me know if you need me
to pick up the patches in the asm-generic tree for cross-architecture work.

         Arnd
