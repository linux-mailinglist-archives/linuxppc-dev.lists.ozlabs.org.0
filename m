Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64352BB6E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 15:21:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3DCq6Hlxz3cKk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 23:21:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3DCL4t6wz3bqk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 23:21:17 +1000 (AEST)
Received: from mail-yw1-f173.google.com ([209.85.128.173]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5FxN-1nhSH61Olh-011BLU for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May
 2022 15:21:13 +0200
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2f16645872fso24109297b3.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 06:21:12 -0700 (PDT)
X-Gm-Message-State: AOAM530/x3MIczREqpiwgY433+cFOuWpr+0uqsrs98RcC1544M9Mrkh7
 bMUPPUkBE7tvIYiq0+A39RiQolbXMEpVa1iJt34=
X-Google-Smtp-Source: ABdhPJwBjy4ur3XLA4K8ugyaq6ZpN4zxCDmLVI7nhrJH0342w016iDhD3WX3/lYGpyx1rpcDzpcnq5gSYG2aj9C9IIk=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr31357253ywk.209.1652880071778; Wed, 18
 May 2022 06:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220505125123.2088143-1-mpe@ellerman.id.au>
 <c6cbd41c-4cef-d4d7-324a-b4c3e2498262@csgroup.eu>
 <87fsl7nggr.fsf@mpe.ellerman.id.au>
In-Reply-To: <87fsl7nggr.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 18 May 2022 14:21:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17qq2dpyv1SzD=VmXWAs0JQiyG-AQL=Uv+N6xQzoMsQQ@mail.gmail.com>
Message-ID: <CAK8P3a17qq2dpyv1SzD=VmXWAs0JQiyG-AQL=Uv+N6xQzoMsQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc: Add generic PAGE_SIZE config symbols
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wgzAIagHr9G0JV75n8H1xkUkkAtYpF3M7Yq+OmvihI4ugSzhlh8
 d6GzPXfSk8Fhw8Xs0Mhzj3VeWanObiTEsRyzsT//yQkMUs2B90Kl34RqLDVlyGsoTiBZuAE
 IBJYuMilRXfvl0fxDvCP+Cy6a8xGN+hEyl4sWfLc/FQzCW2jABZAjYW6K5KIMsxzYNn+DdC
 gX+MBWkwbzvHSeZ0lSAbA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RkahmqynRvE=:uMcTjznJ74NLEiCIAJz19X
 SH3n9QdpJUme2dpCA23Z+8N05z0xAxt/c8JMlKU/BzVQ5BI5EasRMHIEDnBoUh1+6q5hQyI6d
 VwogTGEDkof/GFw/pdvsj9cvXC/QqstZl+7+U/p935VfwlLP7+Fd9PJthRhMjAvCdyNY6bfc1
 sMdmSBYmUJXUPdUx/0hkw3XMVOOuHpP99A4H1q88OOfRVEMxLiKZW90zZno5tLmXJFQ7TKZ/B
 Ksr7+eOrBp5Oa3dTALZrUGsp++PSG+xq8uuvvLxow/hTPTWYNnMaH9taeWK7BHEjGyKucX4Iz
 lfe9pYObfoqmsZOHOoHQiWAVbebHU43fWvOhedkfNhXAtm2KB2bJpYXFRUfKXOSTu5hWvaeld
 j087jKY8eJpzGxZOWlqdkt5drcmLIcl3QRxElpU/U7WAwTk+Z5SMrriGkYNIfytkQ7MkZAD8h
 NY66ADQpy5mev2hKezSm66SKPyjxpfykKI5hdc/Qy3VvxokXGXOSQcwXL4HcFVUinH1oVFmVJ
 FcVcYj4LG1x3eyYsJbc3CrHLp4585konb34LDeozqEnyuNc+fieu7en3zGK/i1MyXXPhGvFrt
 NDbVR1V+hG6qyNPaJbAsa5Pi7XbkFk5jeYE8RZ/ZL4m7prXjOIxGHN+CQvwoGoHJIVwYDmQwg
 gwhmrKimShb1Nd0kNX6xi4D6HskiAMi2hlfieCm80lKXq4JGv3gnVzUOksTd+MNg93Y6u+6ZS
 0rOIdB/tiZQqTvjYof/kboSuQKdLbUZihxFlXQ==
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 18, 2022 at 2:00 PM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Le 05/05/2022 =C3=A0 14:51, Michael Ellerman a =C3=A9crit :
> >> Other arches (sh, mips, hexagon) use standard names for PAGE_SIZE
> >> related config symbols.
> >>
> >> Add matching symbols for powerpc, which are enabled by default but
> >> depend on our architecture specific PAGE_SIZE symbols.
> >>
> >> This allows generic/driver code to express dependencies on the PAGE_SI=
ZE
> >> without needing to refer to architecture specific config symbols.
> >
> > I guess next step should be to get rid of powerpc specific symbols and
> > use generic symbols instead.
> >
> > We have (only) 111 occurences of it.
>
> I thought about doing that, but it's quite a bit of churn. Maybe it's
> worth it though to avoid confusion between the two symbols.

I have actually done this at some point, but for some reason never sent it =
out,
see my old patch at:

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/=
?h=3Drandconfig-5.15-next&id=3D184c7273ee367fda3626e35f0079f181075690c8

Feel free to take ideas or the entire patch from that.

      Arnd
