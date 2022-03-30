Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC374EC863
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 17:38:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT9Yn5T2mz3c3G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 02:38:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT9YH1ksXz2xst
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 02:37:37 +1100 (AEDT)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M27Bp-1nc3E40YET-002aR6 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar
 2022 17:37:33 +0200
Received: by mail-wm1-f53.google.com with SMTP id p189so12513866wmp.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 08:37:32 -0700 (PDT)
X-Gm-Message-State: AOAM5324PJKkrT40Ewo6xe4VbbA5pc7ZBCW/sMofslQ/t/lrKNFKcRV3
 i1AoFGiftvn6jpy/kWbx/5PaFSuqa0bPQFCc3iQ=
X-Google-Smtp-Source: ABdhPJyFDtDMU88yCYrJWs8ilBs1qgSlTrY/zkuVFBVQD5a2e8HtDgObtvJMsCBEA8avtDQ005+YpydEfjPyDUO36sQ=
X-Received: by 2002:a7b:cd13:0:b0:38b:f39c:1181 with SMTP id
 f19-20020a7bcd13000000b0038bf39c1181mr4752181wmj.20.1648647915002; Wed, 30
 Mar 2022 06:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <87zglefhxd.fsf@mpe.ellerman.id.au>
 <CAHk-=whk4jihDM+zkhZPYRyNO0-YA1_-K9_NyC3EDsX+gkxC-w@mail.gmail.com>
 <87wngefnsu.fsf@mpe.ellerman.id.au> <20220330112733.GG163591@kunlun.suse.cz>
 <87k0cbfuf4.fsf@mpe.ellerman.id.au>
In-Reply-To: <87k0cbfuf4.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 30 Mar 2022 15:44:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2GCQd4SNpUvZrrEOgJ5OtOgj0PXtORnfe208n7tapzNQ@mail.gmail.com>
Message-ID: <CAK8P3a2GCQd4SNpUvZrrEOgJ5OtOgj0PXtORnfe208n7tapzNQ@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-1 tag
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fud2kzSHnUNyFzaDadKbGd0BQkFeSAfGaLZcnjXa5wmBVczO9p+
 8PIxkUSCE6NX/lVPeWejo//qhHKx3PNIcFmP4DpHADb3UyTtZC09Du7Y8/9gQQqeZGbTyjb
 Ls/puDBD17ySQ46yp4lu7/nlvV32wXeq8iZFJ3ryj4eFuuy95nfvb4rBM3STXo7o/dCwDwT
 ++nr8fo8D42wzPkrfjEWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aK/KE9TVxZo=:llnxgLOfjMHsFh2K/EXAbe
 Yri/7V0+GCKart5kZM3HDVSxBYkvMcLgK5udr6SXnqwSOQwsJlRgEMJ7fVpnmHc43BZI2TrbJ
 DQSe0o0gYh5r+0CXINBw8h3HoYKTveGBzjdO40L1uah+dha3OgrCxRifyWM/He7d3LEF9Q3Xs
 w5pLaa9bkHqgUQT6EzaF9chFTTZMuI/Xq/AfOwmCor/aiHlnl+yzPdJBMIfX0wgjATp+wTZff
 x9/UlM4xa/fg+ZTz+cDp8W+ompsOu62M2u7MLZ7eem5oomLwvLZGK8Q0RpR/Uqy2ypImW76Q0
 CQ1AHpachWAZQ8UAR87KNnkdUltyLL4ivYVQoyWYHqwoJ/2E47J3gpxygsDwG24g3LaLSv/Fs
 6TfP4LMWODQthBoFFWc9QsZ0vxl3zPdcoADVt+Nu7oUjQyHwsXdeCfDcXGv239lCNrZehP0To
 6MPqprX0G/jLIqEeeOKviHoi14m4j3rpguI08o1SqXpohzWdwkmQnqNQXaVkZsmRD0wNFGK4n
 L8Vtv+ODpFv+hc24H5cWWck04BWOw4/oIfprZpkIyYDIxkT6aDWWewzPgby+++9atQRX0xuJ+
 Nco+MF54hPI0z1USs68SbUvLj5W8G6d9k/InhAXWYQy4uGnFMQ53kbNAEe5fcHFS8IvPPEU8I
 QVX1RgbF+IsFqgqe6giMxcre49Je3nsnkywR6ZHPZubLQX2LgnMmgzjlDrgttMJAteLs=
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, jniethe5@gmail.com,
 ganeshgr@linux.ibm.com, Jason Wang <wangborong@cdjrlc.com>,
 Jakob Koschel <jakobkoschel@gmail.com>, Miroslav Benes <mbenes@suse.cz>,
 hbh25y@gmail.com, Michael Neuling <mikey@neuling.org>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 danielhb413@gmail.com, haren@linux.ibm.com,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Corentin Labbe <clabbe@baylibre.com>, mamatha4@linux.vnet.ibm.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Thierry Reding <treding@nvidia.com>, kernel.noureddine@gmail.com,
 Nathan Lynch <nathanl@linux.ibm.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 YueHaibing <yuehaibing@huawei.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, guozhengkui@vivo.com, kjain@linux.ibm.com,
 chenjingwen6@huawei.com, Nick Piggin <npiggin@gmail.com>,
 Scott Wood <oss@buserror.net>, rmclure@linux.ibm.com, maddy@linux.ibm.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, psampat@linux.ibm.com,
 sachinp@linux.ibm.com, bigunclemax@gmail.com, ldufour@linux.ibm.com,
 Hari Bathini <hbathini@linux.ibm.com>,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, farosas@linux.ibm.com,
 Geoff Levand <geoff@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sourabhjain@linux.ibm.com, Julia Lawall <Julia.Lawall@inria.fr>,
 Ritesh Harjani <riteshh@linux.ibm.com>, cgel.zte@gmail.com,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tobias@waldekranz.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 30, 2022 at 3:21 PM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> > On Mon, Mar 28, 2022 at 08:07:13PM +1100, Michael Ellerman wrote:
> >> No you're right, we have moved away from them, but not entirely.
> >>
> >> Functions descriptors are still used for 64-bit big endian, but they'r=
e
> >> not used for 64-bit little endian, or 32-bit.
> >
> > There was a patch to use ABIv2 for ppc64 big endian. I suppose that
> > would rid usof the gunction descriptors for good.
>
> It would be nice.
>
> The hesitation in the past was that the GNU toolchain developers don't
> officially support BE+ELFv2, though it is in use so it does work.

It clearly made sense to wait while BE+ELFv1 was commonly used and
well tested, but as that is getting less common each year, getting ELFv1
out of the picture would appear to make the setup less obscure, not more.

       Arnd
