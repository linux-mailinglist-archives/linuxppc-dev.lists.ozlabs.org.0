Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AFE51BD75
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 12:47:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv9Pf6plyz3c9m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 20:47:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv9P86kT0z3bp5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 20:46:51 +1000 (AEST)
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M1q4e-1nokrj2DvM-002JSN for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 May
 2022 12:46:43 +0200
Received: by mail-wm1-f54.google.com with SMTP id m62so2386272wme.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 May 2022 03:46:42 -0700 (PDT)
X-Gm-Message-State: AOAM533cpOkuaTTbjUwxysPIJgTNtVKEvnhDhdleNisGL6wUgBvAgsEY
 UZVcxme6XTlF+9GHB480fCN3zeUZie7y8wmnGnk=
X-Google-Smtp-Source: ABdhPJyFwBY33nx8Flpk/PWMnjLEt5creYwEvl9Kax8NgZPjrsYAYPMUU9wJqfenypJSNx98Enu2cPCLEOTeKZBJGw0=
X-Received: by 2002:a7b:cc93:0:b0:394:2622:fcd9 with SMTP id
 p19-20020a7bcc93000000b003942622fcd9mr4145550wma.20.1651747602669; Thu, 05
 May 2022 03:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
 <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA@mail.gmail.com>
 <ca39c741-8d15-33c0-7bd6-635778cc436@linux.intel.com>
 <CAK8P3a33b4KvsGayDV7fXte0+1FzCJp_J60d8LuZO3P+i1NUEg@mail.gmail.com>
 <386eed36-94f7-8acb-926f-99c74d55915f@linux.intel.com>
In-Reply-To: <386eed36-94f7-8acb-926f-99c74d55915f@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 May 2022 12:46:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a06wdDC-c6V9kO6q3j_TB7HE7f1tdTUvC5yi7ekaHw1YQ@mail.gmail.com>
Message-ID: <CAK8P3a06wdDC-c6V9kO6q3j_TB7HE7f1tdTUvC5yi7ekaHw1YQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u1meAbPyxV3XoHDcnHeV6/daeP6PjVmnu9XcccJhk8CO3YwKFN/
 HASDnhKLs04zTBubaEXVcL/BqomkjB5Z0c3X+/8AjNoDpJP0Tp/84nDgQrhb11/OJnQE+f3
 fH7mbBlKIVlI9pFlwlv83dBeBMjrG+ByzY5reghc+ZgApfLeZGV5fFIQaKAg3jq90IyUVEw
 ZRrg9WtLfqcP0zQAWp80Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zlXjLf1bW4w=:QAz1GdWvFx0iAPvB3Mn1BN
 kKOgoSeRIwrMhforjV8XZrGwqxSHahy42D04Iaefn0UAeXZXc0gy4rJ6L9dr78nFfzk++kuUi
 iu6iVWGQEoqteGZgTmNVFZ9Sctdj9CvC+50M9776Y2SUprrXIjDSF2aJ8Wrd8csddZ8/Oz0uN
 5RSKhBWox3pZ5/SqCYRewn/XV8ZsDgxnDrBDi9HPqNb+LpkvDCFTM2sJ4wumvy6LgyL6bjdFO
 NeukmQ+LCOgDel+vVOxDIvL3qCIiItm08k+iOc05LoTaE0HsdgSsc0Xh0VQ2nQtBo6TPqCPF5
 q3ctzlxWQ1NDj2djN0i1FOgzauIMU+a6eqMT8vGtXS0ZDFz4w3A6bo874qyYGkFc8+KQLnA7Y
 6OB716ougR25HoUtZi+muu29L+KEPW2GCJ5nJg7vR4KTarOWOenHHTTfT4pqOlsPZgYj+73Ip
 P9hA0/UVL7uaGpRsrypeNNvE6sVF/nEdwS7EVvfHcOY6apVefdJGJkBspjeAAaFn1sVA1uWVs
 Cx1QhfdcmSyDtCmjDX9WebN0AcKSmnXggWZNX7O8FkVrtJOLdGDdwMYf19bQyNXXVTUKhWXfG
 5SmYB2Yo3K40ls84YendAX4q3BuscjftkCdTt32pSilaubvUtwKq+TZt8Dev923j/WTAbEiJT
 n0/Oj0+t4ORU7tvJ6fS/0HcwEvPWcJrcHXEbYOUzw2fhG56o6gb9gcuzuuJkyfDWRpSc=
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 alpha <linux-alpha@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-serial <linux-serial@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Matt Turner <mattst88@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 5, 2022 at 10:56 AM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Wed, 4 May 2022, Arnd Bergmann wrote:
> > On Wed, May 4, 2022 at 10:33 AM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > > On Wed, 4 May 2022, Arnd Bergmann wrote:
> > > > On Wed, May 4, 2022 at 9:20 AM Ilpo J=C3=A4rvinen <ilpo.jarvinen@li=
nux.intel.com> wrote:
> > > > >
> > > > After applying the patch locally, I still see a bunch of whitespace
> > > > differences in the
> > > > changed lines if I run
> > > >
> > > > vimdiff arch/*/include/uapi/asm/termbits.h include/uapi/asm-generic=
/termbits.h
> > > >
> > > > I think this mostly because you left the sparc version alone (it al=
ready
> > > > uses hex constants), but it may be nice to edit this a little more =
to
> > > > make the actual differences stick out more.
> > >
> > > I took a look on further harmonizing, however, it turned out to be no=
t
> > > that simple. This is basically the pipeline I use to further cleanup =
the
> > > differences and remove comments if you want to play yourself, just re=
move
> > > stages from the tail to get the intermediate datas (gawk is required =
for
> > > --non-decimal-data):
> >
> > I've played around with it some more to adjust the number of leading
> > zeroes and the type of whitespace. This is what I ended up with on top
> > of your patch: https://pastebin.com/raw/pkDPaKN1
> >
> > Feel free to fold it into yours.
>
> Ok thanks. With that it seems to go a bit beyond octal to hex conversion
> so I'll make a series out of it. The series will also introduce
> include/uapi/asm-generic/termbits-common.h for the most obvious
> intersection.

Ok, sounds good. Here's a retroactive

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

for my changes so you can put them into a separate patch. I assume
you will change it some more in the process, so maybe retain
your ownership and just mark the bits a 'Co-developed-by: Arnd...'.

        Arnd
