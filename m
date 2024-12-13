Return-Path: <linuxppc-dev+bounces-4097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1539F06DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 09:46:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8jct5mc2z3bN9;
	Fri, 13 Dec 2024 19:46:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.32.83.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734079435;
	cv=none; b=mlQpXQHn4DhvKuAlKRMwkLBA6J5djNDypQ8hjE0WHi2ptBJGVw2sJ6Uig1JUCbJ475TWS5ZH0xNQ8TZmcoIoBQ8faGzGJ3FGU/qaqix6A7HdovYPKnN/evvZjP5YP6T+jfTLD6yuG+znuFbMgcvCUCO+i4MrrCNsApmAxwWAdpFYAo6/8ABrAx7GyAdSCRhom1VfWPd9FJaFCA0mr7SfAtKwQTyonR70gnHQMXoYjY8W/fSys1/08N2e0lQrBtfzRhl5T8mMVvhWXoW2uJq6kXSnXQywYD+QPx0TbA4fRXnbkGRuhqtfkaR/VF8fT7dPjX3gnq2GQAIkHU7URDfACw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734079435; c=relaxed/relaxed;
	bh=dnkC4VfiQB1mjBKfu5g6i5HbdV61AExM15thfCBHh4c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QPuT1o7pFF55YlUekukjmN0cTyfbYxkVcqlwWh2r483VB2Gyq1tQXS57TX9ietzyikvuKZMUTwD3hcOwHgZyDBVd4VF8TePt6jYpiWLDtvPC2oyHJ9vIk5MqhWpNuJlqQt1WrYG62tqqd4kmGORWxatlelQg/C1MCirgJ0+0z8ZU1NQ8BTJQxuPsdXUGcPbE2MRJrxOXpvPNm5eDYu7jvto6jF37pzM3K5G7p9HZdsNtOUfwkfyCCpWV9q4bXvIRMq/OOak+DSi4DJ+jAsa9kS/7shco/S7IFU7TSJQpR9/NEPrNOdEaDIAVKZmSkFHXyqXmlBaWn58ebPORt0mh+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=Wilcox-Tech.com; spf=pass (client-ip=45.32.83.9; helo=mail.wilcox-tech.com; envelope-from=awilcox@wilcox-tech.com; receiver=lists.ozlabs.org) smtp.mailfrom=wilcox-tech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=Wilcox-Tech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wilcox-tech.com (client-ip=45.32.83.9; helo=mail.wilcox-tech.com; envelope-from=awilcox@wilcox-tech.com; receiver=lists.ozlabs.org)
Received: from mail.wilcox-tech.com (mail.wilcox-tech.com [45.32.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8jYP0s9Hz30jZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 19:43:52 +1100 (AEDT)
Received: (qmail 23536 invoked from network); 13 Dec 2024 08:42:53 -0000
Received: from ip98-184-130-195.tu.ok.cox.net (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@98.184.130.195)
  by mail.wilcox-tech.com with ESMTPA; 13 Dec 2024 08:42:53 -0000
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
In-Reply-To: <79b9abfe-cfb8-4ef0-8a4b-7b87787e6549@redhat.com>
Date: Fri, 13 Dec 2024 02:42:41 -0600
Cc: Arnd Bergmann <arnd@arndb.de>,
 Arnd Bergmann <arnd@kernel.org>,
 kvm@vger.kernel.org,
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
Message-Id: <CE1F96B2-7213-4352-B80F-6E669F5EED97@Wilcox-Tech.com>
References: <20241212125516.467123-1-arnd@kernel.org>
 <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
 <6e971322-8b21-4d73-922c-a6032c6fe9bd@app.fastmail.com>
 <79b9abfe-cfb8-4ef0-8a4b-7b87787e6549@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Dec 13, 2024, at 2:20=E2=80=AFAM, Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>=20
> On 12/13/24 09:03, Arnd Bergmann wrote:
>> On Fri, Dec 13, 2024, at 04:51, A. Wilcox wrote:
>>> On Dec 12, 2024, at 6:55=E2=80=AFAM, Arnd Bergmann <arnd@kernel.org> =
wrote:
>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>=20
>>>> I submitted a patch to remove KVM support for x86-32 hosts earlier
>>>> this month, but there were still concerns that this might be useful =
for
>>>> testing 32-bit host in general, as that remains supported on three =
other
>>>> architectures. I have gone through those three now and prepared =
similar
>>>> patches, as all of them seem to be equally obsolete.
>>>>=20
>>>> Support for 32-bit KVM host on Arm hardware was dropped back in =
2020
>>>> because of lack of users, despite Cortex-A7/A15/A17 based SoCs =
being
>>>> much more widely deployed than the other virtualization capable =
32-bit
>>>> CPUs (Intel Core Duo/Silverthorne, PowerPC e300/e500/e600, MIPS =
P5600)
>>>> combined.
>>>=20
>>>=20
>>> I do use 32-bit KVM on a Core Duo =E2=80=9CYonah=E2=80=9D and a =
Power Mac G4 (MDD), for
>>> purposes of bisecting kernel issues without having to reboot the =
host
>>> machine (when it can be duplicated in a KVM environment).
>>>=20
>>> I suppose it would still be possible to run the hosts on 6.12 LTS =
for
>>> some time with newer guests, but it would be unfortunate.
>> Would it be an option for you to just test those kernels on 64-bit
>> machines? I assume you prefer to do native builds on 32-bit hardware
>> because that fits your workflow, but once you get into debugging
>> in a virtual machine, the results should generally be the same when
>> building and running on a 64-bit host for both x86-32 and =
ppc32-classic,
>> right?
>=20
> Certainly for x86-32; ppc32 should be able to use PR-state (aka
> trap and emulate) KVM on a 64-bit host but it's a bit more picky.
> Another possibility for ppc32 is just emulation with QEMU.
>=20
> Paolo


Most of the reason I use KVM instead of emulation is because I don=E2=80=99=
t
trust QEMU emulation at all.  There was even a kernel bug that was
introduced affecting 32-bit x86 in the 4.0 cycle that only happened
because QEMU wasn=E2=80=99t emulating writes to %cr4 properly[1].  And =
PPC32
emulation is far worse than x86_32.  However, I probably could end
up doing x86_32 testing on a combination of bare metal machines and
KVM on x86_64, sure.

As for Power: I will admit I haven=E2=80=99t tested lately, but well =
into
the 5 series (5.4, at least), you couldn=E2=80=99t boot a ppc32 Linux =
kernel
on any 64-bit capable hardware.  It would throw what I believe was an
alignment error while quiescing OpenFirmware and toss you back to an
=E2=80=98ok >=E2=80=99 prompt.  Unfortunately I can=E2=80=99t find any =
of the bug reports
or ML threads from the time - it was a known bug in the 2.6 days - but
the answer was always =E2=80=9Cwhy are you booting a ppc32 kernel on =
that
hardware anyway?  It=E2=80=99s a ppc64 machine!=E2=80=9D  Is this a case =
where
that would be accepted as a legitimate bug now?  It would be lovely
to use my largely-SMT 3.0 GHz Power9 box for more of my kernel testing
(where possible) instead of relying on a 933 MHz single-thread G4.

-arw

[1]: =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3Da833581e372a;
It had some form of security impact on Pentium-class machines, too,
as RDPMC became available to non-root even when /sys/devices/cpu/rdpmc
was 0.=

