Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E19229559
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 11:46:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBVwc339TzDqPb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 19:46:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBVsr6QTZzDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 19:44:15 +1000 (AEST)
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MryGj-1kdLfL2Usv-00nvEV for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul
 2020 11:44:10 +0200
Received: by mail-qt1-f182.google.com with SMTP id 6so1370719qtt.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 02:44:08 -0700 (PDT)
X-Gm-Message-State: AOAM532Xp5sXwkuzD2OxHXWWF0ikMKzd5LsYBi4WtUf4JsemG/0U94qJ
 tKiKMgKrIa2yZc9K1lUN3yHcnkJmLEanIDgDwDk=
X-Google-Smtp-Source: ABdhPJxwkYMqqlMOkCtiDhkAnK0U1Z3J/eM92Y3pA2ZYfCjSxZxJC559Vt8UZd0LKulfbnhn81unz3J72RGNNuPEagQ=
X-Received: by 2002:ac8:7587:: with SMTP id s7mr33522432qtq.304.1595411047084; 
 Wed, 22 Jul 2020 02:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
 <mhng-08bff01a-ca15-4bbc-8454-2ca3e823fef8@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-08bff01a-ca15-4bbc-8454-2ca3e823fef8@palmerdabbelt-glaptop1>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Jul 2020 11:43:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
Message-ID: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JmWDH8h4DStRhFnReUflbxH9RPCKi+pl79JqJzZHWfZwBA+pPLj
 PkcmKf4XKcY62spg3VVP2FW9AalAUhKUygmkcVTWndpigKbvgkcLzoZ4GdJvNEpc1AXIkMC
 uNBZdzAe8YHTCWIVJSt8ziIYYFZcKbov68ruVPeD+kXwc/ZB4blktIe+embBKWDvo9RRsBc
 cvMm7Qi0EdOsI6Ritu/1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EGyg96EnxV8=:gI4DhMS1xZPcFZNMDZOd2B
 1F1UglkTsY+eqrZYq7nfI6T/GKAWgrb45i27u3w+PNeswSKPvHQNCAhUGB0+PL6AHvD2IRUin
 nDlYQeSNbUmpvUith8p6xHqwhgq6gCNysDsQbia2jnFBgCJMpGN8YrS/4IgumHTS54A+zpPdK
 LOhUVKfcVIAVPiZ07errkVIdX2ryu/LVdLsso5MsEFC2lt1Q7eyTPv5rDfmRtXLwkSphxFv+C
 B2K6MVAJpja0etcNdIS6qObuGoMMNuF0LFeAQOyk5TJWRTGWbsPiblALWswvoiRGB+L7e68nf
 uCQYWyWkfNpyR8jlBbGkt92UKxJV2qCLgzKFmdyopj/BqWbtzE3J3B5Km+xFhbCYO/NiLbMb5
 9eBC92eFOpjO1qOGGqMJQLcpHzRM57WWW/a0gD6BXy2l8hPZ1J5eFa/zNGdTkkNdwn8ShAHaL
 bWX1oHyjqNZJmTBA7rv+yyIE3ywSL8YuSg73IYLSFPmt/tUStRC+O3J6+nQyXFLrunV5mCwIf
 1OHbhcSbXzH27KwfccsrM+sXV88Ttes0M6oV0zkbQ0tjNAbsgqYuUo+RipWQWakSbfVOSwY8n
 zHEAawAZncI86iRT9j1jrbS53dvUAF+aIsii0CZJSNQM5puHqYZe1wqkh2r22Q8f/brQ8xcfX
 TQQwDGJf6iGsLQf89y0bDU+INlp6H/TGL9pXhmHbJwoW4pAE2Y5j5nF0/vjiVjHkstmETim7e
 B83faNnsfckgHwKCUgsU96Eamj09w52bDAje+eF1OcO8q+b6a7LZuCSmEQWLzMwy2iEjo2fZ6
 Txu6XqZR2toTBMknX8iflFUKXH41l2VGEC6NHXsEZQGfDVSeFec0hM3qCTZafKbrX3OXaKhix
 WrKqWrZ7BiOp9NeqRBOb0w/mtEQGoCVy1SB21W96du6znP3ibw+JTQ0a9V9IwZyZRuvLLYaId
 yTvzKPzRLdwNOL+McTc0xHEtk1WVRIpYKlI0DeKvmMbPKog23ObgJ
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

On Tue, Jul 21, 2020 at 9:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 21 Jul 2020 11:36:10 PDT (-0700), alex@ghiti.fr wrote:
> > Let's try to make progress here: I add linux-mm in CC to get feedback on
> > this patch as it blocks sv48 support too.
>
> Sorry for being slow here.  I haven't replied because I hadn't really fleshed
> out the design yet, but just so everyone's on the same page my problems with
> this are:
>
> * We waste vmalloc space on 32-bit systems, where there isn't a lot of it.

There is actually an ongoing work to make 32-bit Arm kernels move
vmlinux into the vmalloc space, as part of the move to avoid highmem.

Overall, a 32-bit system would waste about 0.1% of its virtual address space
by having the kernel be located in both the linear map and the vmalloc area.
It's not zero, but not that bad either. With the typical split of 3072 MB user,
768MB linear and 256MB vmalloc, it's also around 1.5% of the available
vmalloc area (assuming a 4MB vmlinux in a typical 32-bit kernel), but the
boundaries can be changed arbitrarily if needed.

The eventual goal is to have a split of 3840MB for either user or linear map
plus and 256MB for vmalloc, including the kernel. Switching between linear
and user has a noticeable runtime overhead, but it relaxes both the limits
for user memory and lowmem, and it provides a somewhat stronger
address space isolation.

Another potential idea would be to completely randomize the physical
addresses underneath the kernel by using a random permutation of the
pages in the kernel image. This adds even more overhead (virt_to_phys
may need to call vmalloc_to_page or similar) and may cause problems
with DMA into kernel .data across page boundaries,

> * Sort out how to maintain a linear map as the canonical hole moves around
>   between the VA widths without adding a bunch of overhead to the virt2phys and
>   friends.  This is probably going to be the trickiest part, but I think if we
>   just change the page table code to essentially lie about VAs when an sv39
>   system runs an sv48+sv39 kernel we could make it work -- there'd be some
>   logical complexity involved, but it would remain fast.

I assume you can't use the trick that x86 has where all kernel addresses
are at the top of the 64-bit address space and user addresses are at the
bottom, regardless of the size of the page tables?

      Arnd
