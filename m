Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C47652B945
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 14:03:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3BTt6Ff3z3cKb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 22:03:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3BTT4X5wz3bdF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 22:03:23 +1000 (AEST)
Received: from mail-yw1-f182.google.com ([209.85.128.182]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N95Rn-1nmPAn33X5-016AYT for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May
 2022 14:03:18 +0200
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-2fed823dd32so21321737b3.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 05:03:18 -0700 (PDT)
X-Gm-Message-State: AOAM532U/72bkSrssKg9+SXI+U3v3H/Uw0zkaGVtbwVvMshfQJCz5ZI4
 W6DwdRM46Mm2Yvu5d+2MzvJbZ0mpuMKOanauB3s=
X-Google-Smtp-Source: ABdhPJwm+9v2pV1MXXvYU4DXIEdY+fsHPbn7CrpncWDrzm1LqEwVp+KAxUQwSt1MiIRiYnZVNF8/UK+LjkeKN7zqEUs=
X-Received: by 2002:a81:456:0:b0:2fe:dee5:fbbc with SMTP id
 83-20020a810456000000b002fedee5fbbcmr20553515ywe.249.1652875397321; Wed, 18
 May 2022 05:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220510022055.67582-1-joel@jms.id.au>
 <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
 <87a6bh7h2e.fsf@mpe.ellerman.id.au>
In-Reply-To: <87a6bh7h2e.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 18 May 2022 13:03:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ebaSa4XhOLZTmL3tL203TTcMR=rhSd6C7SF=1ihM1Vw@mail.gmail.com>
Message-ID: <CAK8P3a3ebaSa4XhOLZTmL3tL203TTcMR=rhSd6C7SF=1ihM1Vw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] linux: Fix powerpc64le defconfig selection
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lbrDXYkRirv+cxePi2ACl+Y14ixFNb/gI3Ww5Bj1j7rMW9FR/1F
 NzpsK9ZRoZuRHsqTtZEigUZyj/K43fDlsjYwHvzB1lhJNq7lhI/IvnBWjyTuBdcHIKPdqHn
 J17fe39HvjPybkyy/sw+2t7onc6uKvsNGv4RW+8F5/jKl1xyVBT3CPzgpxKUkWzSsC1gHYU
 yrdTN4ec79yiA9/kI8oFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tAM0PifZsBU=:BLYLg7rupoDDaDh0fnXEtK
 jzpYhbCEmCsRtE6Kqylni/jmQEJyR2JpnDyPBPgwZiETfSIPreSpgxRl87WZaIdXmbmBAhY6p
 JKWjL90aO9Er9f21UgKn4cxKI1x9x2/8I8FCIGVy0DIOGvXNAfdL4koIyviUhX5BFr5Mc0CXJ
 /BdvcLhb3QGThymzy8GLTqtaUIXWd8QRyfvQVOR6p1FDn1XiJfPji56IiCkrg6Tn5/QY9nXGI
 FNucpWayP90B651h8gQC1918NVehCol6PvtbP7RRsmWwEW/e36KQ5SeEbb1Iq7ILUSXLNNUxc
 rOMaLx7RIXLB+ChUxzpV5l2UyCihreeVVNw5W+P+WgpdIvxX89Bs9QQSy/y6nlesMQGeEwQxj
 KtOsSAviEAEzCG4w4tydha9VVa6k/YcF+uLw7MUbGmKvt/NMTRmFEQ8MzOe0GGIb1I/vLzBQs
 WELCc2+jit+nlGLEGM6/9RXWspZAAtMWDXyN0nH0m4o8SrQWi2ybX5AdRknQDS3CcmMwNJahH
 EoLIMBqyS/p6QDhi/jF77iKFnX44Z4W+fGAtTD7z2aNkpiPG89Hr+rraDamYgj6CknN8zNSlW
 Qa8Ns8+GxXSqLlDnOOFzCxUE+VRa0fN6jklINvCanvabuDKsnzgIG/ZMOBBT1z8q+10qU5zSj
 ci6xLQsxecAuJ5aiuaizJwbRSIgEhKlVyMcO1cXNJDIZY6QzCJCDb2IhI6pyjioi5X/4Ve55H
 FlbTDDwe1BiXtTcV1q+KQuvt4FMnPIOb/RZTYA==
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
 Arnout Vandecappelle <arnout@mind.be>, Joel Stanley <joel@jms.id.au>,
 buildroot@buildroot.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 16, 2022 at 2:17 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Having said that I think we could handle this better in the powerpc
> kernel. Other arches allow specifying a different value for ARCH, which
> then is fed into the defconfig.
>
> That way you could at least pass ARCH=ppc/ppc64/ppc64le, and get an
> appropriate defconfig.
>
> I'll work on some kernel changes for that.

I would recommend against that. It's always a bit hacky, and I think this was
mainly done on x86 to avoid breaking user workflows after arch/i386
and arch/x86_64
got merged.

Since there was never an arch/ppc64le, and arch/{ppc,ppc64}/ are gone for so
long, I see no point in bringing back those interfaces, just use the right
defconfig for what you want.

        Arnd
