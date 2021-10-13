Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D242BF01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 13:35:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTr7J4JF9z3c4w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 22:35:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTr6n4Jh9z2yY0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 22:34:56 +1100 (AEDT)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MFKX3-1mYkzL2khd-00FiRX for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct
 2021 13:34:50 +0200
Received: by mail-wr1-f50.google.com with SMTP id r7so7236319wrc.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 04:34:50 -0700 (PDT)
X-Gm-Message-State: AOAM531rL7rjjF1UvxotiRlbn1QQp9HMeagF1DOqgTj5hv1Eu7VO/HID
 OYYwEYRG/8bMrH9KXrpJyGWRqnrsC1gelvrP9eM=
X-Google-Smtp-Source: ABdhPJz/tQxa5v4qhwFE3sQu9avl5eu7/EDdEmltQMqmVp+Zjg8+ZW0kGehN4p6hG6cHdJWighfCnt4BmNvUupzN+ls=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr38988320wrc.71.1634124890085; 
 Wed, 13 Oct 2021 04:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <c215b244a19a07327ec81bf99f3c5f89c68af7b4.1633964380.git.christophe.leroy@csgroup.eu>
 <202110130002.A7C0A86@keescook>
 <c2904a2e-c112-f2bc-04a0-52b08b46c1ce@csgroup.eu>
In-Reply-To: <c2904a2e-c112-f2bc-04a0-52b08b46c1ce@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Oct 2021 13:34:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0G8zOD-DJVOxWWwHgGUWQC2yxgMMKYrBQTgVLAicC7pw@mail.gmail.com>
Message-ID: <CAK8P3a0G8zOD-DJVOxWWwHgGUWQC2yxgMMKYrBQTgVLAicC7pw@mail.gmail.com>
Subject: Re: [PATCH v1 06/10] asm-generic: Refactor
 dereference_[kernel]_function_descriptor()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OicWiOauZw9HiSh4c3UZrllal+9Qjp01x8k6+ommYUcav0gxcy6
 JbxgkXaWvYTUsE9gVj/48Z3wwn/j5mqPmhWu+ysCk4RKl0aCm/YF59q8+dV3KVYb2D4ZLHw
 LFPRgOF3RflHSvSQawjCUJmpXVX8K5hb2GHv5mVUpEQ/UQXE4ILup64iBZxL+Os1oQlxkeK
 15+KB/ejavW+pyE8xU2DA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qZQsG1DuuiM=:aVXChb7jd5GKT6AP0b9VK8
 ONaBdcElsLxTdwFl29XocJDcowr2OtEMQQvCSWXwixjmws9KBAyIO1cmZ3oeatJ+BwuowW611
 1VI4+mlXU74QQFpqKBaf5R7GjZ0fdD87r9lI2Hhto30D152+IbaBIRaI8EhxlfoVGBV7CeUuW
 LYI/vx0h0JJAvb2nT6/A6vHQUJQoT6O2CFplsp7aaJUKd96BrEnB+WEbU7zH3zOBYxc0fZ1cn
 B9ubLyk6p8CFvJkpzmb4dHdNyftwELYZnkpH5LLv4Uchzg7KjmUGQQXNTAiBK1a7u1w8zz03G
 Gwikw7EutC2CpdOwsXsgZL4RrNEZSPKKBEz5BF1jWmmiazDzbU2AJgSnBA3DTRpsspxyN6gfI
 z2f0ABrMltYyktAc2LNJSDnOypObrXztookL9ghzQK2vK0bhl3qbRAasHuYULgxvzQWBjZ2FS
 mIoM4NGrnaRTOytfb1YySApl2nhvr72Zg8ooZ+t092JVW2wmneOEMMPfsKWiGovZeDXpzF2eq
 IZLi3sObWbfqqoYC5he3/VTqN+znuz85uTK7w+hTPP8BeuWB1Dq6NKpBF7Ulv2mH/GqGzY4ah
 ZyfHXUDp8jtdxsgwwnCw3c7E26mh+lRx5ngvp6ogjDe6xvMPPiLnEehLz96j8fGwWr8u0MFEk
 QJZ7ZBiAOO9VlBBWzyzT3ynTX1k8rE2lP/6O/iq/PKIIEmOp9o6U7GfKC/rkpDvxA67tAUzX2
 xSuIfVKG1RMlKxUa5i/y2qxX7ORD+Zja6Wx2fw==
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 13, 2021 at 1:20 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 13/10/2021 =C3=A0 09:02, Kees Cook a =C3=A9crit :
> > On Mon, Oct 11, 2021 at 05:25:33PM +0200, Christophe Leroy wrote:
> >> dereference_function_descriptor() and
> >> dereference_kernel_function_descriptor() are identical on the
> >> three architectures implementing them.
> >>
> >> Make it common.
> >>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> ---
> >>   arch/ia64/include/asm/sections.h    | 19 -------------------
> >>   arch/parisc/include/asm/sections.h  |  9 ---------
> >>   arch/parisc/kernel/process.c        | 21 ---------------------
> >>   arch/powerpc/include/asm/sections.h | 23 -----------------------
> >>   include/asm-generic/sections.h      | 18 ++++++++++++++++++
> >>   5 files changed, 18 insertions(+), 72 deletions(-)
> >
> > A diffstat to love. :)
> >
> > Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> Unless somebody minds, I will make them out of line as
> suggested by Helge in he's comment to patch 4.
>
> Allthough there is no spectacular size reduction, the functions
> are not worth being inlined as they are not used in critical pathes.

Sounds good to me.

      Arnd
