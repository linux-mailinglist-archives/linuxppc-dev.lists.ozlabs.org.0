Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52318178CF4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 09:57:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XSSg4hHVzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 19:57:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.52.203; helo=3.mo69.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 944 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Mar 2020 19:50:56 AEDT
Received: from 3.mo69.mail-out.ovh.net (3.mo69.mail-out.ovh.net
 [188.165.52.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XSJw3VNwzDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 19:50:54 +1100 (AEDT)
Received: from player779.ha.ovh.net (unknown [10.108.42.196])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id E8E4787417
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 09:35:03 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id CA07E100026BE;
 Wed,  4 Mar 2020 08:34:46 +0000 (UTC)
Date: Wed, 4 Mar 2020 09:34:44 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [EXTERNAL] Re: [RFC PATCH v1] powerpc/prom_init: disable XIVE
 in Secure VM.
Message-ID: <20200304093444.5e524ef6@bahia.home>
In-Reply-To: <a1570b0d-c443-3140-31f0-bddd9f31f54b@kaod.org>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
 <20200302233240.GB35885@umbus.fritz.box>
 <8f0c3d41-d1f9-7e6d-276b-b95238715979@fr.ibm.com>
 <20200303170205.GA5416@oc0525413822.ibm.com>
 <20200303184520.632be270@bahia.home>
 <a1570b0d-c443-3140-31f0-bddd9f31f54b@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 7509189430614727051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Mar 2020 20:18:18 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> >> **** BTW: I figured, I dont need this intermin patch to disable xive f=
or
> >> secure VM.  Just doing "svm=3Don xive=3Doff" on the kernel command lin=
e is
> >> sufficient for now. *****
> >>
> >=20
> > No it is not. If the hypervisor doesn't propose XIVE (ie. ic-mode=3Dxive
> > on the QEMU command line), the kernel simply ignores "xive=3Doff".
>=20

Ah... sorry for the typo... "doesn't propose XICS" of course :)

> If I am correct, with the option ic-mode=3Dxive, the hypervisor will=20
> propose only 'xive' in OV5 and not both 'xive' and 'xics'. But the
> result is the same because xive can not be turned off and "xive=3Doff"=20
> is ignored.
>=20
> Anyway, it's not the most common case of usage of the QEMU command
> like. I think it's OK to use "xive=3Doff" on the kernel command line=20
> for now.
>=20

Sure, I just wanted to make things clear. Like you said it's a chicken
switch introduced for distro testing. I think it should not be used
to do anything else. If "svm=3D1" needs to enforce supported.xive =3D=3D fa=
lse
as a temporary workaround, it should do it explicitly.

> C.

