Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 288493D9C7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 06:06:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZxlv0lHxz3cWB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 14:06:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=8bop=mv=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZxlV3dRzz3035
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 14:05:42 +1000 (AEST)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBE976101C;
 Thu, 29 Jul 2021 04:05:37 +0000 (UTC)
Date: Thu, 29 Jul 2021 00:05:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 5/7] kallsyms: Rename is_kernel() and is_kernel_text()
Message-ID: <20210729000531.7c4da1f1@oasis.local.home>
In-Reply-To: <1551f9cc-eaf8-efef-0590-e2549eebe4ae@huawei.com>
References: <20210728081320.20394-1-wangkefeng.wang@huawei.com>
 <20210728081320.20394-6-wangkefeng.wang@huawei.com>
 <20210728112836.289865f5@oasis.local.home>
 <1551f9cc-eaf8-efef-0590-e2549eebe4ae@huawei.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, ryabinin.a.a@gmail.com,
 Daniel Borkmann <daniel@iogearbox.net>, arnd@arndb.de,
 linux-kernel@vger.kernel.org, ast@kernel.org,
 Nathan Chancellor <nathan@kernel.org>, mingo@redhat.com, paulus@samba.org,
 Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Jul 2021 10:00:51 +0800
Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> On 2021/7/28 23:28, Steven Rostedt wrote:
> > On Wed, 28 Jul 2021 16:13:18 +0800
> > Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> > =20
> >> The is_kernel[_text]() function check the address whether or not
> >> in kernel[_text] ranges, also they will check the address whether
> >> or not in gate area, so use better name. =20
> > Do you know what a gate area is?
> >
> > Because I believe gate area is kernel text, so the rename just makes it
> > redundant and more confusing. =20
>=20
> Yes, the gate area(eg, vectors part on ARM32, similar on x86/ia64) is=20
> kernel text.
>=20
> I want to keep the 'basic' section boundaries check, which only check=20
> the start/end
>=20
> of sections, all in section.h,=C2=A0 could we use 'generic' or 'basic' or=
=20
> 'core' in the naming?
>=20
>   * is_kernel_generic_data()	--- come from core_kernel_data() in kernel.h
>   * is_kernel_generic_text()
>=20
> The old helper could remain unchanged, any suggestion, thanks.

Because it looks like the check of just being in the range of "_stext"
to "_end" is just an internal helper, why not do what we do all over
the kernel, and just prefix the function with a couple of underscores,
that denote that it's internal?

  __is_kernel_text()

Then you have:

 static inline int is_kernel_text(unsigned long addr)
 {
	if (__is_kernel_text(addr))
 		return 1;
 	return in_gate_area_no_mm(addr);
 }

-- Steve
