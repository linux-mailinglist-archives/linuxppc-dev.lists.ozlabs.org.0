Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD9E4C6D36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 13:51:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6gHp1px9z3bpP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 23:51:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6gHL3C4Bz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:51:25 +1100 (AEDT)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MRTAj-1naz9h3ieD-00NOoW for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb
 2022 13:51:20 +0100
Received: by mail-wr1-f50.google.com with SMTP id s1so15248479wrg.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 04:51:20 -0800 (PST)
X-Gm-Message-State: AOAM5337AK3yYwiKYMmCmqIyH6Zl/d/ZqzygLO8HzXPKTD2X8gmDbB1D
 rGE/0SVQnnhiA1AEBK6PyW/ZflGSHJ5O+RzsRs0=
X-Google-Smtp-Source: ABdhPJxqAXtjqyu3XGhO9l+qeiMZpUmH3VvfwpXSNlGORAG+H/kTZ6DoBe9bebMaudh7ucMT2NCbvco6L/QKSBCYl4U=
X-Received: by 2002:a5d:63c2:0:b0:1ef:840e:e139 with SMTP id
 c2-20020a5d63c2000000b001ef840ee139mr8301106wrw.192.1646052680182; Mon, 28
 Feb 2022 04:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-4-guoren@kernel.org>
 <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
 <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
 <e5ee4f6799704bd59b0c580157a05d2d@AcuMS.aculab.com>
 <CAJF2gTQhFK55z4juC7uHpWmHsEXSOkbMyXeid6KsnhfPRo7wqg@mail.gmail.com>
In-Reply-To: <CAJF2gTQhFK55z4juC7uHpWmHsEXSOkbMyXeid6KsnhfPRo7wqg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Feb 2022 13:51:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ZXuGWO+n2ghxhXmxntZAk_HPDmsk3cigdh2FBMQcKYA@mail.gmail.com>
Message-ID: <CAK8P3a0ZXuGWO+n2ghxhXmxntZAk_HPDmsk3cigdh2FBMQcKYA@mail.gmail.com>
Subject: Re: [PATCH V7 03/20] compat: consolidate the compat_flock{,
 64} definition
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:aZYHft9raqEjIrsG6mjSCzIzlN3zx5RlqpIiUxgcrIZIlHCnWYC
 C4bxeCcQz9ihtUkgxzinZh/kTzkBdrltV65adBfi2MHaLUwnpDVHMagCyVza95BLyU7iz55
 MT8IqVcCvZtbATlF6f6vrOUWDRVPHCjvVjs1EOwl++ARRU+BMY4sU6rX5WVoouLw8uosE3z
 a9zjwBubAz+nMC7Leg8DQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LDY8hiKiODI=:cdTO0xalmOfDHBb0U9n8Lm
 kInwfgfNgfwXM0ptgk8hn3Nq6UUABrM7SndaFBSuNoYEMlfqwketmOVfpNizqAnetB9NvBGUj
 7izOUejVO2BPL33nYkebQLCoLaGaWKximgVLonAhD4OsVJAaPXU32hTbgWfXLgwh2Imvh6HY0
 1dYQLp7naIr69GWyqthmRWvkGOcoWetYRpKSxOWbGndoR9aj9aNmZVYFbiFnsZyX9pv9JE96A
 vp/+RZVGk6gQ+tE6jbGyikQPOYb4xR0lgVdWyfiohTkCO10Et+Bh1Z4t3y9EE4K9Z6kzAfZtq
 Dml6BBKoKjIUYV0+1UioZJUxBxmA1hWhyYuWf/yf8Edco4S2aRdEP4g+Qfws6HaAWgda6P26U
 22B+vZq2Dz3jGXqDo5OgRBOyRwqwkdHJVUa3js3UHSK1NpUYJexqPPLPeN24d+gU17oNn59oQ
 8pIsXS1GrDnICUA7iwdrC2xDyuTA7SqcmvMrPaUgcW+dnOHa9mjdB1ZEM/bcvDbcKZR4YzMBy
 jG77KcKwF1ctpjsss5gCSUwGjBqCkequM/m1EeQXXeTCS6w6fcdKXV/QxdDmYpChiZaclzui6
 xvJMophMmeRuXAQrayBkilS1KVZ7swWkeFsQ4bXxA/qCjQHFJvvxM6HGcURIJEBCv0MhogsHq
 PQh9xL+tWyandp6vF05ExC2civxwf4A5BkNRwpqQqpXNIr/U2Inj6/7VurFaW2mEPdjc=
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "drew@beagleboard.org" <drew@beagleboard.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "wangjunqiang@iscas.ac.cn" <wangjunqiang@iscas.ac.cn>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "liush@allwinnertech.com" <liush@allwinnertech.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "wefu@redhat.com" <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 1:13 PM Guo Ren <guoren@kernel.org> wrote:
> On Mon, Feb 28, 2022 at 8:02 PM David Laight <David.Laight@aculab.com> wrote:
> > From: Guo Ren Sent: 28 February 2022 11:52
> > > On Mon, Feb 28, 2022 at 2:40 PM David Laight <David.Laight@aculab.com> wrote:
> > > > ...
> > > > > +struct compat_flock64 {
> > > > > +     short           l_type;
> > > > > +     short           l_whence;
> > > > > +     compat_loff_t   l_start;
> > > > > +     compat_loff_t   l_len;
> > > > > +     compat_pid_t    l_pid;
> > > > > +#ifdef __ARCH_COMPAT_FLOCK64_PAD
> > > > > +     __ARCH_COMPAT_FLOCK64_PAD
> > > > > +#endif
> > > > > +} __ARCH_COMPAT_FLOCK64_PACK;
> > > > > +
> > > >
> > > > Provided compat_loff_t are correctly defined with __aligned__(4)
> > > See include/asm-generic/compat.h
> > >
> > > typedef s64 compat_loff_t;
> > >
> > > Only:
> > > #ifdef CONFIG_COMPAT_FOR_U64_ALIGNMENT
> > > typedef s64 __attribute__((aligned(4))) compat_s64;
> > >
> > > So how do you think compat_loff_t could be defined with __aligned__(4)?
> >
> > compat_loff_t should be compat_s64 not s64.
> >
> > The same should be done for all 64bit 'compat' types.
> Changing
> typedef s64 compat_loff_t;
> to
> typedef compat_s64 compat_loff_t;
>
> should be another patch and it affects all architectures, I don't
> think we should involve it in this series.

Agreed, your patch (originally from Christoph) looks fine, it correctly
transforms the seven copies of the structure into a shared version.

There is always more that can be improved, but for this series,
I think you have already done enough.

> look at kernel/power/user.c:
> struct compat_resume_swap_area {
>         compat_loff_t offset;
>         u32 dev;
> } __packed;
>
> I thnk keep "typedef s64 compat_loff_t;" is a sensible choice for
> COMPAT support patchset series.

The only references to compat_loff_t that we have in the kernel
could all be simplified by defining compat_loff_t as compat_s64
instead of s64, but it has no impact on correctness here.

Let's make sure you get your series into 5.18, and then David can
follow-up with any further cleanups after that.

         Arnd
