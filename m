Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8573A14AE6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 04:36:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486C2Q32HwzDqJ8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 14:36:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=KHS74x6y; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Bz05BDYzDqBH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 14:33:15 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id d9so9198081qte.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 19:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hiF0rDs1H28qeAvw6niA1Fht63msxN8o6VOgzZRc4ZY=;
 b=KHS74x6yTx0RnN7ss0tz6JoIoUgSasIumDJZMZv93DPcof2L1ji3yecx4t+Jd3Mi0y
 nhP8AaMOJYfgwoZgDGCzvhuxs8L6/lFaOrIjyGg1+fn0M6Prx395HWnXkClydRQjs2gB
 ZEqWD0BAtPz9E0JKcr5erVXORB3D6kYVfb446oJmbSSMZHoltRCqLv3TEWCS4VyXgokl
 WClhm57Fzz9bDqlopLexq8FZKIpGq/nVddaadFBm4izkl0CzG3z0MPs0d9OlsUrBNBF7
 zQx4OBLh8MEjxjAFj5bePuEIU17leN8ASXF0lVZd6mLs8j+gGhYOl4HcWbf4FJsYsWKc
 zOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hiF0rDs1H28qeAvw6niA1Fht63msxN8o6VOgzZRc4ZY=;
 b=POViCpOoWPrZ6+VUz2Ox7/8l/ZAnF11ql5/Y4FsBxaB3XnPzeVSJ4jSjm5ReKSccwG
 1xSf8qAVp7Xmc833E1bQmOlVB0yKiZ3hu8E+DSTiCRhzjBBnWMBhl60cmb0HP4fFal52
 NU+NmJt8t0gT9D5lpVJPn8ZD9IpPmJrUhcIIAEQ6gdr5sojZr/cqudSjKtQy4M4myI8A
 4n3vUvUmUgXBF5LLqss2ZYb01AjMjPvIjux+uCH38CiaDuoOwsBoP8+q8QzoseUgdt04
 8XxJ/IHaM7zas6+g6yXjnbI88Y1I8GXraJ0gCc7TrkpAAVlDzJ3fLPudlla28tuhveXJ
 rAqA==
X-Gm-Message-State: APjAAAUrJwjSCbFkVY03SllP3Wpsk3YI4Im58JwcydU7eL7xdOEpWS3Q
 P2j7DwgVNS2EgCWWsXySiQpxaA==
X-Google-Smtp-Source: APXvYqwv8G+QCXSGBnR3Z9NxxxYOPT18bysSnp4r4ypjfj9SFKtIHbtOKzlHQY2Zr1dmADEVne6QFQ==
X-Received: by 2002:aed:25a4:: with SMTP id x33mr19760654qtc.165.1580182391598; 
 Mon, 27 Jan 2020 19:33:11 -0800 (PST)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id z126sm11409542qka.34.2020.01.27.19.33.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jan 2020 19:33:11 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
In-Reply-To: <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
Date: Mon, 27 Jan 2020 22:33:08 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
 <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 27, 2020, at 10:06 PM, Anshuman Khandual =
<anshuman.khandual@arm.com> wrote:
>=20
>=20
>=20
> On 01/28/2020 07:41 AM, Qian Cai wrote:
>>=20
>>=20
>>> On Jan 27, 2020, at 8:28 PM, Anshuman Khandual =
<Anshuman.Khandual@arm.com> wrote:
>>>=20
>>> This adds tests which will validate architecture page table helpers =
and
>>> other accessors in their compliance with expected generic MM =
semantics.
>>> This will help various architectures in validating changes to =
existing
>>> page table helpers or addition of new ones.
>>>=20
>>> This test covers basic page table entry transformations including =
but not
>>> limited to old, young, dirty, clean, write, write protect etc at =
various
>>> level along with populating intermediate entries with next page =
table page
>>> and validating them.
>>>=20
>>> Test page table pages are allocated from system memory with required =
size
>>> and alignments. The mapped pfns at page table levels are derived =
from a
>>> real pfn representing a valid kernel text symbol. This test gets =
called
>>> right after page_alloc_init_late().
>>>=20
>>> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected =
along with
>>> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also =
need to
>>> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to =
x86 and
>>> arm64. Going forward, other architectures too can enable this after =
fixing
>>> build or runtime problems (if any) with their page table helpers.
>=20
> Hello Qian,
>=20
>>=20
>> What=E2=80=99s the value of this block of new code? It only supports =
x86 and arm64
>> which are supposed to be good now.
>=20
> We have been over the usefulness of this code many times before as the =
patch is
> already in it's V12. Currently it is enabled on arm64, x86 (except =
PAE), arc and
> ppc32. There are build time or runtime problems with other archs which =
prevent

I am not sure if I care too much about arc and ppc32 which are pretty =
much legacy
platforms.

> enablement of this test (for the moment) but then the goal is to =
integrate all
> of them going forward. The test not only validates platform's =
adherence to the
> expected semantics from generic MM but also helps in keeping it that =
way during
> code changes in future as well.

Another option maybe to get some decent arches on board first before =
merging this
thing, so it have more changes to catch regressions for developers who =
might run this.=20

>=20
>> Did those tests ever find any regression or this is almost only =
useful for new
>=20
> The test has already found problems with s390 page table helpers.

Hmm, that is pretty weak where s390 is not even official supported with =
this version.

>=20
>> architectures which only happened once in a few years?
>=20
> Again, not only it validates what exist today but its also a tool to =
make
> sure that all platforms continue adhere to a common agreed upon =
semantics
> as reflected through the tests here.
>=20
>> The worry if not many people will use this config and code those that =
much in
>=20
> Debug features or tests in the kernel are used when required. These =
are never or
> should not be enabled by default. AFAICT this is true even for entire =
DEBUG_VM
> packaged tests. Do you have any particular data or precedence to =
substantiate
> the fact that this test will be used any less often than the other =
similar ones
> in the tree ? I can only speak for arm64 platform but the very idea =
for this
> test came from Catalin when we were trying to understand the semantics =
for THP
> helpers while enabling THP migration without split. Apart from going =
over the
> commit messages from the past, there were no other way to figure out =
how any
> particular page table helper is suppose to change given page table =
entry. This
> test tries to formalize those semantics.

I am thinking about how we made so many mistakes before by merging too =
many of
those debugging options that many of them have been broken for many =
releases
proving that nobody actually used them regularly. We don=E2=80=99t need =
to repeat the same
mistake again. I am actually thinking about to remove things like  =
page_poisoning often
which is almost are never found any bug recently and only cause pains =
when interacting
with other new features that almost nobody will test them together to =
begin with.
We even have some SLUB debugging code sit there for almost 15 years that =
almost
nobody used it and maintainers refused to remove it.

>=20
>> the future because it is inefficient to find bugs, it will simply be =
rotten
> Could you be more specific here ? What parts of the test are =
inefficient ? I
> am happy to improve upon the test. Do let me know you if you have =
suggestions.
>=20
>> like a few other debugging options out there we have in the mainline =
that
> will be a pain to remove later on.
>>=20
>=20
> Even though I am not agreeing to your assessment about the usefulness =
of the
> test without any substantial data backing up the claims, the test case =
in
> itself is very much compartmentalized, staying clear from generic MM =
and
> debug_vm_pgtable() is only function executing the test which is =
getting
> called from kernel_init_freeable() path.

I am thinking exactly the other way around. You are proposing to merge =
this tests
without proving how useful it will be able to find regressions for =
future developers
to make sure it will actually get used.

