Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E163ADABD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 17:51:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6gJT1Bfkz3c5G
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 01:51:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=koNOmC8D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=koNOmC8D; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6gHz6jN2z3022
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 01:51:11 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8EA760FE8;
 Sat, 19 Jun 2021 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624117867;
 bh=NAbdzRAxcLKnTWnhI0W9HCrw+I7jQyfR52LsWZAQDCM=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=koNOmC8DK+nVeBie7FTITAV5irnEs6QvMWvpYt58CqYuN+5lQ8bBssZz4hUGCRfGy
 +yo+U86Q6yEQx+JS+nBD2LlvcqkPAGdxokDgzyJzsgQiwa9UH2uNjewPeWnxf/U3z6
 d4ZQHid83QonJZyCXs4FkAV+xG6Z2NbkyEcqXMXRo1ad1es1joqpg8cCTG9dHRxDJu
 4fkbSeJilnQVpzywdzqcjlVgxH8e4/0uWmj6PpMOM9UebrwhphfiqeP1Ac5kUlObK8
 l/UTMIAKmTTDJk1RvwKLt9wGavIpjlnYHKgfAa475NuftH35nCqUzfJEE66WzDD5Ko
 oYMZQBuAjiJzA==
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailauth.nyi.internal (Postfix) with ESMTP id E90E827C0060;
 Sat, 19 Jun 2021 11:51:04 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute2.internal (MEProxy); Sat, 19 Jun 2021 11:51:04 -0400
X-ME-Sender: <xms:ZRLOYMGbYGYK3_wLvC9YlzEDFAIsyn_M1plocPRdcFEBlDXhGlBh8w>
 <xme:ZRLOYFXT855Ee_pqATnu3Kpt_54OxPyoZ3DPQCeYhhMrgoqPPrDK0c8ANcDruMW9L
 mbxsaj0HG1eh_RVOSM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefhedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ugihucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecugg
 ftrfgrthhtvghrnhepvdelheejjeevhfdutdeggefftdejtdffgeevteehvdfgjeeiveei
 ueefveeuvdetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudek
 heeifedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuh
 igrdhluhhtohdruhhs
X-ME-Proxy: <xmx:ZRLOYGKxaz3BiAIbFWNbey2D8b308yFzK7krhsqDYCfdwIVh_LJpKQ>
 <xmx:ZRLOYOH-c6-2Wm9xnbyMwV6VxVRqTFdwnv6eZ5a8YFPOCuFLcg8Ysg>
 <xmx:ZRLOYCVwET137Ns_s8sYP3qy2ClqBj0DgvI73UVoSId_-uRu-5DBUA>
 <xmx:aBLOYLWJRTR6L1OXw5odD-dqYPdDukO1ftL9XTs1WCQZ1uxKJaE4GFXrpoU>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BB74651C0060; Sat, 19 Jun 2021 11:51:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-526-gf020ecf851-fm-20210616.001-gf020ecf8
Mime-Version: 1.0
Message-Id: <2f9e52eb-0105-4bc6-a903-f4ecbfc9b999@www.fastmail.com>
In-Reply-To: <1624080924.z61zvzi4cq.astroid@bobo.none>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <827549827.10547.1623941277868.JavaMail.zimbra@efficios.com>
 <26196903-4aee-33c4-bed8-8bf8c7b46793@kernel.org>
 <593983567.12619.1624033908849.JavaMail.zimbra@efficios.com>
 <1d617df2-57fa-4953-9c75-6de3909a6f14@www.fastmail.com>
 <639092151.13266.1624046981084.JavaMail.zimbra@efficios.com>
 <1624080924.z61zvzi4cq.astroid@bobo.none>
Date: Sat, 19 Jun 2021 08:50:41 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Nicholas Piggin" <npiggin@gmail.com>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>
Subject: =?UTF-8?Q?Re:_[PATCH_8/8]_membarrier:_Rewrite_sync=5Fcore=5Fbefore=5Fuse?=
 =?UTF-8?Q?rmode()_and_improve_documentation?=
Content-Type: text/plain;charset=utf-8
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
Cc: Will Deacon <will@kernel.org>, linux-mm <linux-mm@kvack.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Fri, Jun 18, 2021, at 11:02 PM, Nicholas Piggin wrote:
> Excerpts from Mathieu Desnoyers's message of June 19, 2021 6:09 am:
> > ----- On Jun 18, 2021, at 3:58 PM, Andy Lutomirski luto@kernel.org w=
rote:
> >=20
> >> On Fri, Jun 18, 2021, at 9:31 AM, Mathieu Desnoyers wrote:
> >>> ----- On Jun 17, 2021, at 8:12 PM, Andy Lutomirski luto@kernel.org=
 wrote:
> >>>=20
> >>> > On 6/17/21 7:47 AM, Mathieu Desnoyers wrote:
> >>> >=20
> >>> >> Please change back this #ifndef / #else / #endif within functio=
n for
> >>> >>=20
> >>> >> if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE)) {
> >>> >>   ...
> >>> >> } else {
> >>> >>   ...
> >>> >> }
> >>> >>=20
> >>> >> I don't think mixing up preprocessor and code logic makes it mo=
re readable.
> >>> >=20
> >>> > I agree, but I don't know how to make the result work well.
> >>> > membarrier_sync_core_before_usermode() isn't defined in the !IS_=
ENABLED
> >>> > case, so either I need to fake up a definition or use #ifdef.
> >>> >=20
> >>> > If I faked up a definition, I would want to assert, at build tim=
e, that
> >>> > it isn't called.  I don't think we can do:
> >>> >=20
> >>> > static void membarrier_sync_core_before_usermode()
> >>> > {
> >>> >    BUILD_BUG_IF_REACHABLE();
> >>> > }
> >>>=20
> >>> Let's look at the context here:
> >>>=20
> >>> static void ipi_sync_core(void *info)
> >>> {
> >>>     [....]
> >>>     membarrier_sync_core_before_usermode()
> >>> }
> >>>=20
> >>> ^ this can be within #ifdef / #endif
> >>>=20
> >>> static int membarrier_private_expedited(int flags, int cpu_id)
> >>> [...]
> >>>                if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_COR=
E))
> >>>                         return -EINVAL;
> >>>                 if (!(atomic_read(&mm->membarrier_state) &
> >>>                       MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE=
_READY))
> >>>                         return -EPERM;
> >>>                 ipi_func =3D ipi_sync_core;
> >>>=20
> >>> All we need to make the line above work is to define an empty ipi_=
sync_core
> >>> function in the #else case after the ipi_sync_core() function defi=
nition.
> >>>=20
> >>> Or am I missing your point ?
> >>=20
> >> Maybe?
> >>=20
> >> My objection is that an empty ipi_sync_core is a lie =E2=80=94 it d=
oesn=E2=80=99t sync the core.
> >> I would be fine with that if I could have the compiler statically v=
erify that
> >> it=E2=80=99s not called, but I=E2=80=99m uncomfortable having it th=
ere if the implementation is
> >> actively incorrect.
> >=20
> > I see. Another approach would be to implement a "setter" function to=
 populate
> > "ipi_func". That setter function would return -EINVAL in its #ifndef=
 CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
> > implementation.
>=20
> I still don't get the problem with my suggestion. Sure the=20
> ipi is a "lie", but it doesn't get used. That's how a lot of
> ifdef folding works out. E.g.,
>=20
> diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
> index b5add64d9698..54cb32d064af 100644
> --- a/kernel/sched/membarrier.c
> +++ b/kernel/sched/membarrier.c
> @@ -5,6 +5,15 @@
>   * membarrier system call
>   */
>  #include "sched.h"
> +#ifdef CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
> +#include <asm/sync_core.h>
> +#else
> +static inline void membarrier_sync_core_before_usermode(void)
> +{
> +	compiletime_assert(0, "architecture does not implement=20
> membarrier_sync_core_before_usermode");
> +}
> +

With the assert there, I=E2=80=99m fine with this. Let me see if the res=
ult builds.

> +#endif
> =20
>  /*
>   * For documentation purposes, here are some membarrier ordering
>=20
