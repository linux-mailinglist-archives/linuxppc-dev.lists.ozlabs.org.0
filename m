Return-Path: <linuxppc-dev+bounces-9608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA79AE29B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jun 2025 17:05:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPd1v4SPTz2xs7;
	Sun, 22 Jun 2025 01:05:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750518323;
	cv=none; b=nlMuFn4nmPDudy4De6EIIxqieqIV952C1dZlmW0/9Ewo9sN4y0KoMsYZsEpoxiDfYhIx4qU5ey2ArerRE2xlkBuK18xACRf8oO9CDEgbUskLlDVrTRpLEyPu+sp9GMa57LtS3sR8P1cHiqXLcyKslAm6QeFnX8Jou3DVwVEfgZ0nnJODnt/njq3c8RBBfAqwIpcaF5NXh1nNuV6Jmc2RxMV9bpaEpmHiYUl4wBcqcdnGDaSKgELMZaH1PnpXoqOsika0bEdxXAvG+AaBfa25s49KbQeDQKTolKobQCV06BVsgIysSUexXAyu9S2fgxVeUU8WGpXbMGAHaStCNW0iCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750518323; c=relaxed/relaxed;
	bh=HYZ+NqE6OBDqR8iDEfP9ISs9p8wVm8TSv+HtVaxKSWg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=OPuyQHexW9tstua8kUCtgRV7AnU3A4pFvbBIXnViiUPF5yhloI0a1g0UewnjoQikkH9ZEnwJdwxAK8a5fkaSSoifFyfx02BQD/qVcQEBn7jz4zzBXARzwsIUP3Lj4Wj83bUT2VKKpsQsZU1dVKUTMaeYPFY9Eah2CkBEIs2mq3eousAZ77utDd6zKwzhvKyh1kbVGoWmDArYUQad4ODdkloYAP2aXavzgo//tDE5z/t95f+xC82zhyP4z4N2g8YXvEvGpFfD4oGPfLU58xANIrv3tfRhdKd7dOtCi/JDWJLPW5ESotCbV4JJUtmHyqcKY5XeL7rxneLycAa4dxhwcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=XF2v23KB; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=XF2v23KB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bPd1r6KsWz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 01:05:20 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A870B8287AD8;
	Sat, 21 Jun 2025 10:05:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id pm7WeEmnPRNZ; Sat, 21 Jun 2025 10:05:15 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0068A82882BC;
	Sat, 21 Jun 2025 10:05:14 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0068A82882BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750518315; bh=HYZ+NqE6OBDqR8iDEfP9ISs9p8wVm8TSv+HtVaxKSWg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=XF2v23KBkLAn39sxVuZa94p44PJeQIPf8ia+xr4VzgLMiZ1rOpQCyTrq0hFphfvOY
	 jdetPM37pIWVAz6WlB5myZ3hgTXlsebYtRd1HABUHYMRZ8SvE1W1npMyXEsfE8ibZ9
	 MX8wKYg0/38s7D2JA8peoblZthir5QaD9S58CXaw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hyx5gDYuB5Ie; Sat, 21 Jun 2025 10:05:14 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A36268287AD8;
	Sat, 21 Jun 2025 10:05:14 -0500 (CDT)
Date: Sat, 21 Jun 2025 10:05:11 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Krishna Kumar <krishnak@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>
Message-ID: <1675876510.1317449.1750518311479.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <19689b53-ac23-4b48-97c7-b26f360a7b75@linux.ibm.com>
References: <20250618190146.GA1213349@bhelgaas> <1469323476.1312174.1750293474949.JavaMail.zimbra@raptorengineeringinc.com> <19689b53-ac23-4b48-97c7-b26f360a7b75@linux.ibm.com>
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Topic: pci/hotplug/pnv_php: Enable third attention indicator
Thread-Index: ReXpJu9bkUcrDA+kcjYlT6x5JGsGaw==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Krishna Kumar" <krishnak@linux.ibm.com>
> To: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "Timothy Pearson" <tp=
earson@raptorengineering.com>, "Shawn
> Anastasio" <sanastasio@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux=
-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>,=
 "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@=
kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.co=
m>
> Sent: Friday, June 20, 2025 4:26:51 AM
> Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention i=
ndicator

> Shawn, Timothy:
>=20
> Thanks for posting the series of patch. Few things I wanted to do better
> understand Raptor problem -
>=20
>=20
> 1. Last time my two patches solved all the hotunplug operation and Kernel=
 crash
> issue except nvme case. It did not work with
>=20
>=C2=A0 =C2=A0 NVME since dpc support was not there. I was not able to do t=
hat due to being
>=C2=A0 =C2=A0 =C2=A0 occupied in some other work.

With the current series all hotplug is working correctly, including not onl=
y NVMe on root port and bridge ports, but also suprise plug of the entire P=
CIe switch at the root port.  The lack of DPC support *might* be related to=
 the PE freeze, but in any case we prefer the hotplug driver to be able to =
recover from a PE freeze (e.g. if a bridge card is faulty and needs to be r=
eplaced) without also requiring a reboot, so I would consider DPC implement=
ation orthogonal to this patch set.

> 2. I want to understand the delta from last yr problem to this problem. I=
s the
> PHB freeze or hotunplug failure happens
>=20
>=C2=A0=C2=A0=C2=A0 only for particular Microsemi switch or it happens with=
 all the switches. When
>=C2=A0=C2=A0=C2=A0 did this problem started coming ? Till last yr

Hotplug has never worked reliably for us, if it worked at all it was always=
 rolling the dice on whether the kernel would oops and take down the host. =
 Even if the kernel didn't oops, suprise plug and auto-add / auto-remove ne=
ver worked beyond one remove operation.

>=C2=A0=C2=A0=C2=A0 it was not there. Is it specific to particular Hardware=
 ? Can I get your setup
>=C2=A0=C2=A0=C2=A0 to test this problem and your patch ?

Because you will need to be able to physically plug and unplug cards and dr=
ives this may be a bit tricky.  Do you have access to a POWER9 host system =
with a x16 PCIe slot?  If so, all you need is a Supermicro SLC-AO3G-8E2P ca=
rd and some random U.2 NVMe drives -- these cards are readily available and=
 provide relatively standardized OCuLink access to a Switchtec bridge.

If you don't have access to a POWER9 host, we can set you up with remote ac=
cess, but it won't show all of the crashing and problems that occur with su=
rprise plug unless we set up a live debug session (video call or similar).

> 3. To me, hot unplug opertaion=C2=A0 --> AER triggering --> DPC support, =
this flow
> should mask the error to reach root port/cpu and it
>=20
>=C2=A0=C2=A0=C2=A0 should solve the PHB freeze/ hot unplug failure operati=
on. If there are AER/EEH
>=C2=A0=C2=A0=C2=A0 related synchronization issue we need to solve them.
>=20
>=C2=A0=C2=A0=C2=A0 Can you pls list the issue, I will pass it to EEH/AER t=
eam. But yeah, to me if
>=C2=A0=C2=A0=C2=A0 AER implementation is correct and we add DPC support,
>=20
>=C2=A0=C2=A0=C2=A0 all the error will be contained by switch itself. The P=
HB/root port/cpu will not
>=C2=A0=C2=A0=C2=A0 be impacted by this and there should not be any freeze.

While this is a good goal to work toward, it only solves one possible fault=
 mode.  The patch series posted here will handle the general case of a PE f=
reeze without requiring a host reboot, which is great for high-reliability =
systems where there might be a desire to replace the entire switch card (th=
is has been tested with the patch series and works perfectly).

> 4. Ofcourse we can pick some of the fixes from pciehp driver if its missi=
ng in
> pnv_php.c. Also at the same time you have done
>=20
>=C2=A0=C2=A0=C2=A0 some cleanup in hot unplug path and fixed the attenuati=
on button related code.
>=C2=A0=C2=A0=C2=A0 If these works fine, we can pick it. But I want to test=
 it.
>=20
>=C2=A0=C2=A0=C2=A0=C2=A0 Pls provide me setup.
>=20
> 5. If point 3 and 4 does not solve the problem, then only we should move =
to
> pciehp.c. But AFAIK, PPC/Powernv is DT based while pciehp.c
>=20
>=C2=A0=C2=A0=C2=A0=C2=A0 may be only supporting acpi (I have to check it o=
n this).=C2=A0 We need to provide
>=C2=A0=C2=A0=C2=A0=C2=A0 PHB related information via DTB and maintain the =
related
>=20
>=C2=A0=C2=A0=C2=A0=C2=A0 topology information via dtb and then it can be d=
oable. Also , we need to do
>=C2=A0=C2=A0=C2=A0=C2=A0 thorough planning/testing if we think to choose p=
ciehp.c.
>=20
>=C2=A0=C2=A0=C2=A0=C2=A0 But yeah, lets not jump here and lets try to fix =
the current issues via point 3
>=C2=A0=C2=A0=C2=A0=C2=A0 & 4. Point 5 will be our last option.

If possible I would like to see this series merged vs. being blocked on DPC=
.  Again, from where I sit DPC is orthogonal; many events can cause a PE fr=
eeze and implementing DPC only solves one.  We do *not* want to require a h=
ost reboot in any situation whatsoever short of a complete failure of a cri=
tical element (e.g. the PHB itself or a CPU package); our use case as deplo=
yed is five nines critical infrastructure, and the broken hotplug has alrea=
dy been the sole reason we have not maintained 100% uptime on a key system.

Thanks!

