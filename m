Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E03712F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 11:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYczw1Fbzz30F3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 19:26:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYczT0KXyz2xZF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 19:26:12 +1000 (AEST)
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MI4cT-1lopMv3QvP-00F9wB for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May
 2021 11:26:06 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 o26-20020a1c4d1a0000b0290146e1feccdaso4609884wmh.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 02:26:05 -0700 (PDT)
X-Gm-Message-State: AOAM531YipsjNHNXGzOwNDTmHlhci/Zlhono7yd4PqfthocQ+QMwybAc
 qFHqrQXoY7tqqpOq8O7/js4qrIXFpMnQjma272s=
X-Google-Smtp-Source: ABdhPJyImR0lXDOWh/rFmKSSJQOuX4SzDcgMMWQ8OtmjXS6cOp8lf5wEACKwu1MdktyqNDYlMn4UdggeZ8LLn0fAS0M=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr30642981wmj.120.1620033965603; 
 Mon, 03 May 2021 02:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
In-Reply-To: <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 May 2021 11:25:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
Message-ID: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Segher Boessenkool <segher@kernel.crashing.org>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Yt8y2oAEvHtZyOEZmHalfXHLhoY/ILWrhc1Almw/GsQZ1Ws8zJK
 fnqam3apDhj3xKlwpy6OyhfYxR0bVI7DD9xrb4Z2Yx6YcHed3krvTsHiQDiLUTlyvRXntxf
 QU8ORQdec8+2ngsZx8K7sJL0aio63+jLUSXa8NPKSCoNl5+UAW7+HLcAuClR51r8k5i9CPZ
 g5WgarmCzRotjLtFdJ+zQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KhnPSLrTO8E=:EYxMAhVcTAdKnY6AZrLXjw
 YOZ2RwftwvJDNtqAiJE6Pp2OizZzMQOxcv4IvPHZDCUqwkFkNi1tsTZaGORU2hLQY7oJqKhq4
 WSNMQPOoRI4dQLT1MvpCUUp5Gmu3+Qp/L71ctBGHpRxCcfihYXlfuiZfaChn5jWnaUjxFNCDd
 lUwdjrieU0cerEBCoMs9SQ2lMlgk7201uKg69c+jqOMd1V3UED7x/hEquVvqwj4jv+9mcH+xk
 hQ4SbQURL6Q5/lQClbEkfwXguvxMZ1V3PedyL4G9ZBCm1jomlLj7clqrw05kByXWR/X49Mp1l
 6+fGvUhKcDk+uqiiv70eWpWRGuR3ejje8LpRYCSLtBe3kpBOMhgL4MzuttSC5ViScWfUvoUKW
 LSrK3WqoxximBnPM7RcbdAotXrfdvA9SbK9Ip4PvpKFyF7nmjBfFqsh9kjwP2fEQRf0fZfJ8+
 lEf3m5bndTREUwUipzKo6sKVk9c+bxJ+RGIlGUQXcG1IP4jeOpn5lBPZ0F6U7a5z6/L47Jxyr
 6za/qBrRusrjYM+F8xBN5Q=
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
>
> Desktops and servers are all nice, however I just want to make you
> aware, there are embedded users forced to stick to older cross
> toolchains for different reasons as well, e.g. in industrial
> environment. :-)
>
> This is no show stopper for us, I just wanted to let you be aware.

Can you be more specific about what scenarios you are thinking of,
what the motivations are for using an old compiler with a new kernel
on embedded systems, and what you think a realistic maximum
time would be between compiler updates?

One scenario that I've seen previously is where user space and
kernel are built together as a source based distribution (OE, buildroot,
openwrt, ...), and the compiler is picked to match the original sources
of the user space because that is best tested, but the same compiler
then gets used to build the kernel as well because that is the default
in the build environment.

There are two problems I see with this logic:

- Running the latest kernel to avoid security problems is of course
  a good idea, but if one runs that with ten year old user space that
  is never updated, the system is likely to end up just as insecure.
  Not all bugs are in the kernel.

- The same logic that applies to ancient user space staying with
  an ancient compiler (it's better tested in this combination) also
  applies to the kernel: running the latest kernel on an old compiler
  is something that few people test, and tends to run into more bugs
  than using the compiler that other developers used to test that
  kernel.

       Arnd
