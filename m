Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D8522A0B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 22:24:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBn4P4fHWzDr2q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 06:24:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBn2d5yhfzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 06:22:48 +1000 (AEST)
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N6bsM-1ksuzt3hl8-0183zV for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul
 2020 22:22:44 +0200
Received: by mail-qt1-f176.google.com with SMTP id s16so2831941qtn.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 13:22:42 -0700 (PDT)
X-Gm-Message-State: AOAM530ZlSDw6aiaiROrieCWRGhIWr6QRL2noeW4igTSqSnrisvuKRSp
 CqFq6vZ9gT0s9O6a7qrxPmL5hIHCgvIHqz7/Dzo=
X-Google-Smtp-Source: ABdhPJzomOuvyv87HLrmnRqLMg+xagc+vFRLOHIlCjUhIO6Ps1D+MblDa1Ac6NHH61/GfVpqpoR58oXKvv+qOpTZNZk=
X-Received: by 2002:ac8:6743:: with SMTP id n3mr1132159qtp.7.1595449361849;
 Wed, 22 Jul 2020 13:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
 <mhng-820ebe55-b4a3-4ab3-b848-6d3551b43091@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-820ebe55-b4a3-4ab3-b848-6d3551b43091@palmerdabbelt-glaptop1>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Jul 2020 22:22:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
Message-ID: <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:igSlMCHB8qHw5Fcfti+sLl7kHvxbFweWd/QG3taVeuXAXJUf+JQ
 XoZ7a86ZOFYmJubi5TYCcsF2Yjv2+MXzMnZHxc30LEuvQN760T0l11l775YMnAjlfQX69p/
 ClWiBvEXoKNC95nwJ8fFLXd3geqSZOSWIvn1O8sCwXcjGNhEQr1tRchyxgvkTVPETpibDtF
 s2qRgYQSPYWR77fwHdT6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NI5uOhR3Xjk=:r9rqVHc9+px0ggzsSkg12t
 LvnqoJgTdYJ6hkdNbAc8xyzY6hpmwSyhYHy12f+Sa4VtjevxWXznoZQsf94CApRsvLnGFO0TZ
 x/c0WMCeGORs4+eXB+96kOMuxUKC5njAmx1pIsroMCquBZjXqhXUGAajhRRCYkX0XGeDCu1Dy
 Q+urR/h2JDGp8ZH+n/PO+/dBrYFtA+EFJkZz+/BlhOh3gHqSbAyD+RzMrIQ3FX7ixGD5dvTNT
 stR2fqwZPC5lV1dgR8ONb5kPcQnbJrhy/9Cq+sprGjGjstOvs+LFyCJt0z+xgmhvtGLdW/w3T
 oEXfmEmsjGqCf6t1tK1XScx83x3YZnT0rhUNL3QiRLHYXAjdZK8l7up4fiD1J62wvEMordJIK
 HubxIj8anvKaVfr9MUFAQb7WIpOeIYi4ttc6Iob+DkbYsDOFGe7FY0bqsB0piXjlL6J5dYSva
 geolKG+R7Gc0OUn1oldUEzQiswTZYRroD+s7Gh2sMyr0rQB4KgCIm70utoV7oM0M2YszQiXX1
 ZBmpPaXtlaoBdLWZg0mZw7srocflgaKIhyPdKF+dBb+WHq+hfHJauVdp0sHouvKkgJ76kp6CM
 yhCApCJTEzH1hqi3axQ1+A9fy5Hup7m6fQug3oibp4DqA+be0zCaDxLFEcN3oIKmDNAuXSE1v
 223ABt8qAeJG1F5BowfjQqp7xzMKFURYO/fZT6G3Uy8TrC+gmNUEnAM7EmimmckUA4bDFkdgk
 2aTjsug4i2218ifFLGaQU/Y8ttlGGHAroijp7baGGJTLkgpSbq6ATNTlyPM+6C1yholq0ryY9
 gbPOLTzqwjEktzI3z0EkgrJXIx/SpkS+YfM2u/ubppPrFKEQWVnIog2g7cF5KNolEfTjSxK
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Zong Li <zong.li@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 22, 2020 at 9:52 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Wed, 22 Jul 2020 02:43:50 PDT (-0700), Arnd Bergmann wrote:
> > On Tue, Jul 21, 2020 at 9:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > The eventual goal is to have a split of 3840MB for either user or linear map
> > plus and 256MB for vmalloc, including the kernel. Switching between linear
> > and user has a noticeable runtime overhead, but it relaxes both the limits
> > for user memory and lowmem, and it provides a somewhat stronger
> > address space isolation.
>
> Ya, I think we decided not to do that, at least for now.  I guess the right
> answer there will depend on what 32-bit systems look like, and since we don't
> have any I'm inclined to just stick to the fast option.

Makes sense. Actually on 32-bit Arm we see fewer large-memory
configurations in new machines than we had in the past before 64-bit
machines were widely available at low cost, so I expect not to see a
lot new hardware with more than 1GB of DDR3 (two 256Mbit x16 chips)
for cost reasons, and rv32 is likely going to be similar, so you may never
really see a need for highmem or the above hack to increase the
size of the linear mapping.

I just noticed that rv32 allows 2GB of lowmem rather than just the usual
768MB or 1GB, at the expense of addressable user memory. This seems
like an unusual choice, but I also don't see any reason to change this
or make it more flexible unless actual users appear.

       Arnd
