Return-Path: <linuxppc-dev+bounces-4078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D99F03D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 05:31:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8byH0pn7z30gK;
	Fri, 13 Dec 2024 15:31:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.32.83.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734062328;
	cv=none; b=DTvg4z6Ls+aohOgFcbDqYds/uNe96j7M9SfTO2mw7OXdCU7lmu1vwQccfBIDAhWa8CVemOhuyLeT4Sk9sIbzRUVt7yQMr7BeowxR7q+BupYMRrflaA4UFo+XSJDIxDM+adToLyMvOPROY5FO4RcLau180iMy4h+98yMzBfn01Jq/HPoiALqrlk12wOUQQpoDoN575zPY7BxrM6wBWIV7zmSVjfiWj0VN6DwS8KWAThYZ86CU7bXSUk62STuee/lqfX9tlebs8A0w6Eo7f6gXcz+AGEwoYbQDpJDcrdLR5WCxZOzBlNuDMy8HnAokj5yismPZ8MOMjjIzkO1OC8rLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734062328; c=relaxed/relaxed;
	bh=MfXnNaxXo9bM0QcMD6ZpSsjFvTntzgzUZ5mMxeDY8GE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=T/Ri0uN9CB2Gu49T5yrkA1nrbSAWfv1sADXkFzGb9+/5nyfhyZf4HAJY+eZBXJJ25/KAgGY0DptInh5oV599+knCmgArJL16+7yENm80j68LUk5fnQ8+3c49GIyTV1bomEMY1VmF781n799bSzynYavzJvRNGJnwsU4cI2lpBV8Gz/n18H9m2WDaFPyp05UGEvEAbGYcUtMness70w4ebYCvAYKpNJ13glTRMoMyCCpLug2UW+zU6pSPKhP519yzpjqjN6s7eDuog1OM17ImsT4fBY+ICwuWcsp4rZL60qwXI7lpygkec5QJr8C1w1P4HCnn9GS6cusTNFqksqa8EA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=Wilcox-Tech.com; spf=pass (client-ip=45.32.83.9; helo=mail.wilcox-tech.com; envelope-from=awilcox@wilcox-tech.com; receiver=lists.ozlabs.org) smtp.mailfrom=wilcox-tech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=Wilcox-Tech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wilcox-tech.com (client-ip=45.32.83.9; helo=mail.wilcox-tech.com; envelope-from=awilcox@wilcox-tech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 374 seconds by postgrey-1.37 at boromir; Fri, 13 Dec 2024 14:58:47 AEDT
Received: from mail.wilcox-tech.com (mail.wilcox-tech.com [45.32.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8bDR2SLLz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 14:58:47 +1100 (AEDT)
Received: (qmail 15664 invoked from network); 13 Dec 2024 03:51:32 -0000
Received: from ip98-184-130-195.tu.ok.cox.net (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@98.184.130.195)
  by mail.wilcox-tech.com with ESMTPA; 13 Dec 2024 03:51:32 -0000
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC 0/5] KVM: drop 32-bit host support on all architectures
From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
In-Reply-To: <20241212125516.467123-1-arnd@kernel.org>
Date: Thu, 12 Dec 2024 21:51:26 -0600
Cc: kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>,
 Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
References: <20241212125516.467123-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Dec 12, 2024, at 6:55=E2=80=AFAM, Arnd Bergmann <arnd@kernel.org> =
wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> I submitted a patch to remove KVM support for x86-32 hosts earlier
> this month, but there were still concerns that this might be useful =
for
> testing 32-bit host in general, as that remains supported on three =
other
> architectures. I have gone through those three now and prepared =
similar
> patches, as all of them seem to be equally obsolete.
>=20
> Support for 32-bit KVM host on Arm hardware was dropped back in 2020
> because of lack of users, despite Cortex-A7/A15/A17 based SoCs being
> much more widely deployed than the other virtualization capable 32-bit
> CPUs (Intel Core Duo/Silverthorne, PowerPC e300/e500/e600, MIPS P5600)
> combined.


I do use 32-bit KVM on a Core Duo =E2=80=9CYonah=E2=80=9D and a Power =
Mac G4 (MDD), for
purposes of bisecting kernel issues without having to reboot the host
machine (when it can be duplicated in a KVM environment).

I suppose it would still be possible to run the hosts on 6.12 LTS for
some time with newer guests, but it would be unfortunate.

Best,
-arw


>=20
> It probably makes sense to drop all of these at the same time, =
provided
> there are no actual users remaining (not counting regression testing
> that developers might be doing). Please let me know if you are still
> using any of these machines, or think there needs to be deprecation
> phase first.
>=20
>      Arnd

--
Anna Wilcox (she/her)
SW Engineering: C++/Rust, DevOps, POSIX, Py/Ruby
Wilcox Technologies Inc.  |  Ad=C3=A9lie Linux=

