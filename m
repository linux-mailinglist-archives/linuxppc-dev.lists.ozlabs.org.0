Return-Path: <linuxppc-dev+bounces-14725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F4ACB65F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Dec 2025 16:46:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRxkt2lH2z2xQr;
	Fri, 12 Dec 2025 02:45:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765467958;
	cv=none; b=nXa6yyatIV1zZG5xdAu53FaccPoo+sOWmnNwAZq0MMcwC7RDRqlLduXB3QTr6eelj2sSqcMD8iR/osU+Ae1L6QEAewpfeZqrHgXUFfYqCX8XtQMra4ZPPceSoeABgB8E1LAJHJp/t8rBN1PU+dwBm6hNNDL7OK1vRmEkWS/Sl0EFEM2mcbCncyKae/uzqC89xy4B345REXl5A80qzRf0G+zSiWh90Lo08I0PsJUIgNn+nJrmvGYxq+UXBOMZQaUtvynycf8DfQ3K80byCD4fEwPe+cSQ/eKkRkW4hqBrKUgXEetwFBvKwW+EzRAwRUqQUQxrOKERBK0cddYoZ7paIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765467958; c=relaxed/relaxed;
	bh=YVj/tVG/Ny2P9i0KPrZNdm9ETStme89+Qf5/a9iQ8VE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ERfdRucp54ibZ43AbpEt4sweck0VI7Cu0RwXAREq3xMVJyUBu+RpaP4UNUuUhJnxvC216582x1yYhDVbm2os3gMCtriBA6PWRttQqZr+g04MQd5fbd6npevseZZ7m9uwECrF/BrXbm5Fvx2uyjNe07QzXoLDryr6Hm6xaJEX1SMXskJAJfH2wBm63fKOVSPAxzSQ+kQqNajpbFfIPXjW1Pv+kzYIC4V2OYGpVoOZ1ty1rTaboEzf0X7smTDOpmDJFiiN1FKmAXATEPiV7KS4L+d2J11OCLdJ+qdGFilljDdrZNTjoPKqYWONpiA62gJcijcMejfuza4kBfYi2SawpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=UJr+U7Ul; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=UJr+U7Ul;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRxkq31xpz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 02:45:54 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 504E27790B9F;
	Thu, 11 Dec 2025 09:45:52 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id l--XkjLSVDbC; Thu, 11 Dec 2025 09:45:48 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 911007790ECC;
	Thu, 11 Dec 2025 09:45:48 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 911007790ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1765467948; bh=YVj/tVG/Ny2P9i0KPrZNdm9ETStme89+Qf5/a9iQ8VE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=UJr+U7UlYOHwZgTm3eB1LIVeHJaUyophCrCxoxCzPVe8PE/neCTeJwilFIjTi0nbJ
	 /tt2PmGyjcMLnSjs4Bi/KgrR6/2K7zihBFc+qrfn7IzGJ1JoH8vty1TK2gYmXP96zJ
	 cxSe9Edlc5lxgbdQl+v0gZhPVvjorP5pzIj6BwWA=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IFdpd6rWcFwT; Thu, 11 Dec 2025 09:45:48 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 497207790B9F;
	Thu, 11 Dec 2025 09:45:48 -0600 (CST)
Date: Thu, 11 Dec 2025 09:45:44 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: mahesh <mahesh@linux.ibm.com>, Oliver <oohall@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Timothy Pearson <tpearson@raptorengineering.com>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	vaibhav <vaibhav@linux.ibm.com>, 
	Shivaprasad G Bhat <sbhat@linux.ibm.com>, ganeshgr@linux.ibm.com
Message-ID: <1869613445.153778.1765467944808.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20251210142559.8874-1-nnmlinux@linux.ibm.com>
References: <20251210142559.8874-1-nnmlinux@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] powerpc/eeh: fix recursive
 pci_lock_rescan_remove locking in EEH event handling
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
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC143 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
Thread-Index: C2GPHp36/gzbyX7Qf9oUG0b1Lq+I5Q==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Narayana Murty N" <nnmlinux@linux.ibm.com>
> To: "mahesh" <mahesh@linux.ibm.com>, "Oliver" <oohall@gmail.com>, "Madhav=
an Srinivasan" <maddy@linux.ibm.com>, "Michael
> Ellerman" <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>, "christoph=
e leroy" <christophe.leroy@csgroup.eu>
> Cc: "Bjorn Helgaas" <bhelgaas@google.com>, "Timothy Pearson" <tpearson@ra=
ptorengineering.com>, "linuxppc-dev"
> <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel=
.org>, "vaibhav" <vaibhav@linux.ibm.com>,
> "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, ganeshgr@linux.ibm.com
> Sent: Wednesday, December 10, 2025 8:25:59 AM
> Subject: [PATCH v2 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove=
 locking in EEH event handling

> The recent commit 1010b4c012b0 ("powerpc/eeh: Make EEH driver device
> hotplug safe") restructured the EEH driver to improve synchronization
> with the PCI hotplug layer.
>=20
> However, it inadvertently moved pci_lock_rescan_remove() outside its
> intended scope in eeh_handle_normal_event(), leading to broken PCI
> error reporting and improper EEH event triggering. Specifically,
> eeh_handle_normal_event() acquired pci_lock_rescan_remove() before
> calling eeh_pe_bus_get(), but eeh_pe_bus_get() itself attempts to
> acquire the same lock internally, causing nested locking and disrupting
> normal EEH event handling paths.
>=20
> This patch adds a boolean parameter do_lock to _eeh_pe_bus_get(),
> with two public wrappers:
>    eeh_pe_bus_get() with locking enabled.
>    eeh_pe_bus_get_nolock() that skips locking.
>=20
> Callers that already hold pci_lock_rescan_remove() now use
> eeh_pe_bus_get_nolock() to avoid recursive lock acquisition.
>=20
> Additionally, pci_lock_rescan_remove() calls are restored to the correct
> position=E2=80=94after eeh_pe_bus_get() and immediately before iterating =
affected
> PEs and devices. This ensures EEH-triggered PCI removes occur under prope=
r
> bus rescan locking without recursive lock contention.
>=20
> The eeh_pe_loc_get() function has been split into two functions:
>    eeh_pe_loc_get(struct eeh_pe *pe) which retrieves the loc for given PE=
.
>    eeh_pe_loc_get_bus(struct pci_bus *bus) which retrieves the location
>    code for given bus.

Conceptually the patch sounds OK, but given the complexity of these subsyst=
ems it's difficult to forsee all interactions.  Was the patch verified not =
to break NVMe hotplug on PowerNV systems using actual hardware?  If not, I =
will need to do so before sending an ack.  Thanks!

