Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9059F160546
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 19:18:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LFjP4vBSzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 05:18:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 308 seconds by postgrey-1.36 at bilbo;
 Mon, 17 Feb 2020 05:16:29 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LFgK5C2zzDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 05:16:28 +1100 (AEDT)
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N6szR-1jXLws1YAJ-018GHR for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb
 2020 19:11:13 +0100
Received: by mail-qv1-f46.google.com with SMTP id u10so6639121qvi.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 10:11:12 -0800 (PST)
X-Gm-Message-State: APjAAAVamEJqdLl08Xb+FiLUfubXc71x5P0APRRGCWL0spaQwoHIcOuM
 wvCy+qRm7U9GyubhFn3BgmHZnBpARrOoJtx5JjA=
X-Google-Smtp-Source: APXvYqzvtOyO80NGJ0NQzbdKQvJf1lkKW8T220YClkzb69MFsE4nIeROks8Hz90TjXKc5YYn+5v58NnqAVTN3OLIhHE=
X-Received: by 2002:a05:6214:524:: with SMTP id
 x4mr10124633qvw.4.1581876671327; 
 Sun, 16 Feb 2020 10:11:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
 <20200109200733.GS3191@gate.crashing.org>
 <77a8bf25-6615-6c0a-56d4-eae7aa8a8f09@c-s.fr>
 <20200111113328.GX3191@gate.crashing.org>
In-Reply-To: <20200111113328.GX3191@gate.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 16 Feb 2020 19:10:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com>
Message-ID: <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com>
Subject: Re: Surprising code generated for vdso_read_begin()
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dN68M7Rx9/jpw44e9e9mkIkj7fC/wf0g6lC8tMiJxkZ7KbaRIJ2
 JqEyiKbZiRl8w5pco38K4uw8UeRawNrG833rU+C/yyVFAEaejJBZ1bO+bNrWNPT3PNDCg9d
 Wi0ZNpbftALzC/KC6YXoq691adEu64GA5GbiiWkcye+nrY2kPvdQIIhoXMSDtfETJxaS++Q
 JC4q3Y2fnKz33x6J6hO2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M2t794Vvnas=:ebgcCPANGlVnqxVPLJmaoK
 dd9NHiRNfBy5/iljs0Mj7MacHfm8jtVlQtjmcW8GVfjdxyLVHy0UbDT4r7ch0yQb2L32Ki6UG
 q+NsZaheWb9pi5qpXWQ9dojGWeQSMKUIgVUPkRimY6F6uuTxgqyc7qAgztF/Z8XcDaC3VNHgJ
 7w4N0qLVNb24YWlQP/G+rCVi2v4P68UtdajejoHUIEuKH6IwUsW20iVCO8nHNNqfLwlsm+1gD
 EB3y/hNuaPzsqtwzAjTritCoPhuc8whMzTM+STRcrP3SHhGiZraD7L5tt974d0utAGmvguB0y
 Gb2ER0WmZxQKPb6pi6JrAyLdZV/5EGKlnTFVg7tVD1EMsYdsxUwKz1U8H6WUlybeRQgX8wzKP
 j9/pOgPKKA8193FRPbzlDx3cIBn4wVdXWj5RNX6m6rV5oENKmtIqxBtfs+h3yxHTmiAd4iCu1
 3d/DAt2v9ywTGUmBx/aiIX101XZvm2jq0b5U8FDpEaHzjaEiLyuA5wEV/IhNHC8XMceMkyiti
 p+ZoeBAr8gnegfLp2dlUVi59GAFssXkA62NxyDUc33GaWFIVKjDHw8OVz/n8/EK8WUOmsK9H6
 kbrya5oXonmYSvcylzT5n6A5sj6exnodtcq5Jm0tYu+Vurmb2ZGbZMWu8oc84nhIW+B3/SdPf
 VBdD7BEmfmrT2g7kobr7pD7nj7RPC7wLLJ2TBhb+Ka7CcQuIWph/qdJSm9pG6zq4JXZawdcZR
 OVcft5UKs+P0UkPZ7TWYcWf5QaaLJngPQWq75xe75Lmf39+wHwUC9IU2El1ul7Y4r82DDPs8o
 1dGV8xOMiefDgKzAG4ONMXZoWei2fB/Qdb5znJcXuSKygnqaL4=
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 11, 2020 at 12:33 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Fri, Jan 10, 2020 at 07:45:44AM +0100, Christophe Leroy wrote:
> > Le 09/01/2020 =C3=A0 21:07, Segher Boessenkool a =C3=A9crit :
> > >It looks like the compiler did loop peeling.  What GCC version is this=
?
> > >Please try current trunk (to become GCC 10), or at least GCC 9?
> >
> > It is with GCC 5.5
> >
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/ doesn't have more
> > recent than 8.1
>
> Arnd, can you update the tools?  We are at 8.3 and 9.2 now :-)  Or is
> this hard and/or painful to do?

To follow up on this older thread, I have now uploaded 6.5, 7.5, 8.3 and 9.=
2
binaries, as well as a recent 10.0 snapshot.

I hope these work, let me know if there are problems.

       Arnd
