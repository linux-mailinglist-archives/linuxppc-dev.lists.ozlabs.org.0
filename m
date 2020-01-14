Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6A413A30C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 09:37:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xkNk36vlzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 19:37:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.33.109; helo=10.mo4.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1195 seconds by postgrey-1.36 at bilbo;
 Tue, 14 Jan 2020 19:36:06 AEDT
Received: from 10.mo4.mail-out.ovh.net (10.mo4.mail-out.ovh.net
 [188.165.33.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xkLv01GqzDqJ8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 19:36:03 +1100 (AEDT)
Received: from player714.ha.ovh.net (unknown [10.108.1.161])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id BD5FD21CF50
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 08:57:15 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id D1362E1C6557;
 Tue, 14 Jan 2020 07:57:10 +0000 (UTC)
Date: Tue, 14 Jan 2020 08:57:07 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: discard ESB load value when interrupt is
 invalid
Message-ID: <20200114085707.56cb6ab2@bahia.lan>
In-Reply-To: <5918d64a-8cac-c475-1bda-c0b37d49b47c@kaod.org>
References: <20200113130118.27969-1-clg@kaod.org>
 <76f76082-81ee-4957-c45b-151f0cd6e6b6@kaod.org>
 <87r202alge.fsf@mpe.ellerman.id.au>
 <5918d64a-8cac-c475-1bda-c0b37d49b47c@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 8384295132092668299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdejuddgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jan 2020 08:44:54 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 1/14/20 2:14 AM, Michael Ellerman wrote:
> > C=C3=A9dric Le Goater <clg@kaod.org> writes:
> >> On 1/13/20 2:01 PM, C=C3=A9dric Le Goater wrote:
> >>> From: Frederic Barrat <fbarrat@linux.ibm.com>
> >>>
> >>> A load on an ESB page returning all 1's means that the underlying
> >>> device has invalidated the access to the PQ state of the interrupt
> >>> through mmio. It may happen, for example when querying a PHB interrupt
> >>> while the PHB is in an error state.
> >>>
> >>> In that case, we should consider the interrupt to be invalid when
> >>> checking its state in the irq_get_irqchip_state() handler.
> >>
> >>
> >> and we need also these tags :
> >>
> >> Fixes: da15c03b047d ("powerpc/xive: Implement get_irqchip_state method=
 for XIVE to fix shutdown race")
> >> Cc: stable@vger.kernel.org # v5.3+
> >=20
> > I added those, although it's v5.4+, as the offending commit was first
> > included in v5.4-rc1.
>=20
> Ah yes. I mistook the merge tag of the branch used for the PR (v5.3-rc2)
>=20

You might want to use 'git tag --contains':

[greg@bahia kernel-linus]$ git tag --contains da15c03b047d
for-linus
kvm-5.4-2
next-20191118
next-20191126
tags/kvm-5.4-1
tags/kvm-5.4-2
v5.4
v5.4-rc1
v5.4-rc2
v5.4-rc3
v5.4-rc4
v5.4-rc5
v5.4-rc6
v5.4-rc7
v5.4-rc8
v5.5-rc1

> Thanks,
>=20
> C.=20
>=20

