Return-Path: <linuxppc-dev+bounces-284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0B9599D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 13:29:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpkcb0nP6z2yQn;
	Wed, 21 Aug 2024 21:29:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpkcY2w3Pz2yPj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 21:28:56 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WpkXm5yH7z6D9Bh;
	Wed, 21 Aug 2024 19:25:44 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id A576D140B18;
	Wed, 21 Aug 2024 19:28:50 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 12:28:49 +0100
Date: Wed, 21 Aug 2024 12:28:48 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Tong Tiangen <tongtiangen@huawei.com>
CC: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, "Robin
 Murphy" <robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
Subject: Re: [PATCH v12 4/6] arm64: support copy_mc_[user]_highpage()
Message-ID: <20240821122848.00004047@Huawei.com>
In-Reply-To: <8257d76b-c700-89a6-0e29-f194d2e1cd61@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
	<20240528085915.1955987-5-tongtiangen@huawei.com>
	<20240819125601.0000687b@Huawei.com>
	<8257d76b-c700-89a6-0e29-f194d2e1cd61@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Tue, 20 Aug 2024 11:02:05 +0800
Tong Tiangen <tongtiangen@huawei.com> wrote:

> =E5=9C=A8 2024/8/19 19:56, Jonathan Cameron =E5=86=99=E9=81=93:
> > On Tue, 28 May 2024 16:59:13 +0800
> > Tong Tiangen <tongtiangen@huawei.com> wrote:
> >  =20
> >> Currently, many scenarios that can tolerate memory errors when copying=
 page
> >> have been supported in the kernel[1~5], all of which are implemented by
> >> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
> >>
> >> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> >> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> >> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
> >>
> >> Add new helper copy_mc_page() which provide a page copy implementation=
 with
> >> hardware memory error safe. The code logic of copy_mc_page() is the sa=
me as
> >> copy_page(), the main difference is that the ldp insn of copy_mc_page()
> >> contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE, therefore, t=
he
> >> main logic is extracted to copy_page_template.S.
> >>
> >> [1] commit d302c2398ba2 ("mm, hwpoison: when copy-on-write hits poison=
, take page offline")
> >> [2] commit 1cb9dc4b475c ("mm: hwpoison: support recovery from HugePage=
 copy-on-write faults")
> >> [3] commit 6b970599e807 ("mm: hwpoison: support recovery from ksm_migh=
t_need_to_copy()")
> >> [4] commit 98c76c9f1ef7 ("mm/khugepaged: recover from poisoned anonymo=
us memory")
> >> [5] commit 12904d953364 ("mm/khugepaged: recover from poisoned file-ba=
cked memory")
> >>
> >> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com> =20
> > Trivial stuff inline.
> >=20
> > Jonathan =20
>=20
> I'm sorry, I may not have understood what you meant. Where is the better
> place to do inline? :)
Oops. All I meant was:

My comments are inline - as in within the patch later in the email.




