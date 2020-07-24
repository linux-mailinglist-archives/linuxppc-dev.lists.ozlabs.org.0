Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E99022C082
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 10:16:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BChqp4rWVzDvr8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 18:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BChnk5gT9zDrNk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 18:14:49 +1000 (AEST)
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Myb8P-1kkMnZ2z89-00z1Qh for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul
 2020 10:14:44 +0200
Received: by mail-qt1-f180.google.com with SMTP id b25so6346921qto.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 01:14:43 -0700 (PDT)
X-Gm-Message-State: AOAM530nWv4+7N7Ybb2BebDl56JQgpBFk2HvuMYD5Fw+2Sr18gTjLmLB
 EYb8kkXExd0LJFVy1n7voDGqQOLQMuZ1PXNJ50g=
X-Google-Smtp-Source: ABdhPJygisjtG0/T5RZOpGU5w2vxR1Ybi3XIk/oHG1gnkzduo22/qOY0PE84/zvIhSqmrnDmSiaO0gHwgOoBfMX/5hA=
X-Received: by 2002:ac8:7587:: with SMTP id s7mr8295990qtq.304.1595578483047; 
 Fri, 24 Jul 2020 01:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
 <d7e3cbb7-c12a-bce2-f1db-c336d15f74bd@ghiti.fr>
 <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
 <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
 <cade70e2-0179-2650-41c5-036679aaf30c@ghiti.fr>
 <418d5f3d3f42bbc79c5cf30e18ec89edfe2dbd26.camel@kernel.crashing.org>
In-Reply-To: <418d5f3d3f42bbc79c5cf30e18ec89edfe2dbd26.camel@kernel.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Jul 2020 10:14:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3dap8tDQVf3B9DdjQm0A_QtCwv3+tW6AUxC1Xq_VoL=A@mail.gmail.com>
Message-ID: <CAK8P3a3dap8tDQVf3B9DdjQm0A_QtCwv3+tW6AUxC1Xq_VoL=A@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+9wITevh3p85GTzMrKSyaZtkHw69m24SfgiKosKWUfF3EumwWV0
 SehbEf029mXlyuBSqX4++EHdVn3jP2g+WPwD0bDSdgNVvidPEbO2GSfLVJ6v7S32jzrdZvy
 YbLWXyXEoSbumB111E7zQk6sC7ZRnszViujVHHivvg8GPKctoU+aT7SlCFRNVuqagLA6Zh3
 InOJuJuXKYc5xQTeoQcwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8K48o2VU+5U=:DfR00JXyieYiVSxZ29VzR5
 uiM+Ez4jkLw5yN0rguzQj2X1NUg2Ijo3eNM6bB4VkRSG7qj9FtCw01gIa1HxfeeoyYLA/IXeG
 Dluhnepy1bEgvkTQJgsmFnCwJsBPCjwrErTq4GfeZoHBHP2ms+0MzSnL1kfjMu0hOoa2Ywp7F
 YIUp6c5NTVfoYTME+MtwFV7EKPWWGzAFiqFarVheZDIB3rLoeGsgJtzsxVupRQIAZG/hhn8ko
 eBrJu9TVkyKhnKqUvsbzF8dmGdaUMpsZ6zmbskBbTZmKhoqtK+/KlEzkVhk0W+i3wMRBp3EPc
 arh0CvnK1lFKZpEY7Tw8H9GQzNBdhxJb85laUSJYGzLve7IOAMM0H4HZGxXiiMLYkvF+Cyghn
 tqgjQcXY25SCIElNsw1pekwlftZixN3ubCDh8zhRw2WMIO7iTWABSBNp2yWPP5w6sIOPlUDRe
 NQ3K9YYz26QGWVNJQEGLLHroXOYKk5nCDdfwNoFJ1gFhKnmDPqfmnPjODANUu2dNxsmf+1KTw
 2IwD+ZQq4VKOk7jnJP1dFuqVKokwCInCkMAljfIYV9I8JE0JLaiYStjlboB/1mtUu6iiiJhVZ
 wJQl9E0kTLh/IvFiGL0NUWHrypAeTTjPPumqimeZE+mmhE6y0RU+FTMXsjBLpOqEoVeHBQQmT
 GpAutoihLYLFp3Ejt4yw/GqtKW03vC1u9prtDojfLXYmUOsPNA+2sSGSBg/KqcMKOqnN7AMPU
 CT5XVE2xpxrnltffUq6Cba25C2j9dRXQtRPGIx8oQRp55D7SaIC2lfEM7wEDzqYcq74NoSAml
 Z8gf36q0FRsEYA/e6IVQvRSdbPM+XO98i0I+ilVG5eOUrOiw1gEPc4+K+oTHNrH93dn2Wy4OU
 5SF0W23r8GiYVadRtKrFSIlzO+toE1mTIPBEFEj0/OIhGq3VgUop/NRcON7lS9dulmBU2Fvbe
 YhyBhGT4OXhiLr6w7+w99ZG07KKB8o8Sa4MxpV++jgAIbYiH0QtF6
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alex Ghiti <alex@ghiti.fr>,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 24, 2020 at 12:34 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Thu, 2020-07-23 at 01:21 -0400, Alex Ghiti wrote:
> > > works fine with huge pages, what is your problem there ? You rely on
> > > punching small-page size holes in there ?
> > >
> >
> > ARCH_HAS_STRICT_KERNEL_RWX prevents the use of a hugepage for the kernel
> > mapping in the direct mapping as it sets different permissions to
> > different part of the kernel (data, text..etc).
>
> Ah ok, that can be solved in a couple of ways...
>
> One is to use the linker script to ensure those sections are linked
> HUGE_PAGE_SIZE appart and moved appropriately by early boot code. One
> is to selectively degrade just those huge pages.
>
> I'm not familiar with the RiscV MMU (I should probably go have a look)
> but if it's a classic radix tree with huge pages at PUD/PMD level, then
> you could just degrade the one(s) that cross those boundaries.

That would work, but if the system can otherwise use 1GB-sized pages,
that might mean degrading the first gigabyte into a mix of 2MB pages
and 4KB pages.

If the kernel is in vmalloc space and vmap is able to use 2MB pages
for contiguous chunks of the mapping, you get a somewhat better
TLB usage.

However, this also means that a writable mapping exists in the
linear mapping for any executable part of the kernel (.text in
both vmlinux and modules). Do we have that on other architectures
as well, or is this something that ought to be prevented with
STRICT_KERNEL_RWX/STRICT_MODULE_RWX?

     Arnd
