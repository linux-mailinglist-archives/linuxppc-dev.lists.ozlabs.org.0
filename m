Return-Path: <linuxppc-dev+bounces-16992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH4ZL5temGnzHAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 14:16:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B54167BCA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 14:16:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHW3B5tXKz30Lv;
	Sat, 21 Feb 2026 00:16:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771593366;
	cv=none; b=J9l6evolRhDh12ezimInBKX4ViYEvmGCTPFE/YT24+0ct14oTSoJRtvT1F5cYu2h1zir3p20lrE4JZ4sFqXCk5ZluslvVNmQSmgrqjVwwzU+4pZHIvEfKmtLDFOpXlLqJ3saYEEqCBpIMFIFgxyTDQVJr+yQVnxfJ4Na9g4CMdAsxCpU9QInojZ2K1BTx5XLzv62ElAqr8XQHdCXI03YnkiNdSEEeWG5eEr9Y52sm1sgE39A7P210oA0dVaKDUOX5Rwb/i/6ES1NTK6Kw4AnpAkpXgTzHz1oT8Cfg5j4/wKnpHNUqlaAF+Zqs9IREwm/0bpdVdW6F7Qylm7fw3ieMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771593366; c=relaxed/relaxed;
	bh=mOkNCk6azFD4Se56SNgIay6/ojZdDJ39xzBXTJXthIE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dq6idY4SQ+11ha9AmcC+auSty7RQ1/KkptyDpnZIT+KoWnWAg3zebtofjpRS+B244rN2ZvxnJBRNE+LPcTz6ENMCv3d+fKMBelOqDIWa+Kyjt8yBmZbpgI+hmd9tUDFOgIrpEOR+wxtwsFp1QNqKC/k5yIbMg9qzQM2765T7B0fczAF+s+tip55ED3E6e/kAdCHtCufrAhpGPNjO/aWfU8xT3VFoBhu0y31V+t2Jxur6CFXvDSOUmQLfUactm8cFURgA4iA7m+mt1CnKzopDLRJxtTa6rWW9UgFqc7siUO9neMHMug0M5X4HMcLrBsIpzj6tjOqjCrRREEj/cj8zUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=lyEnyuQk; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=lyEnyuQk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHW354vNnz2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Feb 2026 00:15:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=mOkNCk6azFD4Se56SNgIay6/ojZdDJ39xzBXTJXthIE=; t=1771593361;
	x=1772198161; b=lyEnyuQk1BEjbMkbwG4vtQ3E+VSQowr7bT14756JzCjGikCW5nHzNtln1ALNb
	l3AJFaAhgtlYD/vZmZxzEssJ0qPGVlo+7gkbrqcJQSGIa7DMcsm9d0IcjhKfHItBCemI5qZ/7RiO9
	3KGsneixmrBoej2E9kEZAMzVFzGh9EiA03useNUn6BjKK2PmXYJ95KTYqN5sL7t6xiBvo2vPU6xA1
	k1qFzUiKlxdVo7oVrqT8T3UPJA6WviTBykxI+eM6uPDbu/Ts2EclomIElg0IwstFgil+cW864GDXb
	gsRuIiSvuvUFDM/NtC+NO2LzKGjIEGHMfF1gNjRAHtVqYtdH4w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vtQMI-00000000Zex-35F1; Fri, 20 Feb 2026 14:15:50 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vtQMI-00000002ANB-1yr4; Fri, 20 Feb 2026 14:15:50 +0100
Message-ID: <8aa6c538d4a49084f6464772f8dd1bd2b642c54b.camel@physik.fu-berlin.de>
Subject: Re: [PATCHv2 0/2] pci: fix msi_addr_mask on powerpc and sparc
 systems
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Vivian Wang <wangruikang@iscas.ac.cn>, Nilay Shroff
 <nilay@linux.ibm.com>, 	linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, 	sparclinux@vger.kernel.org
Cc: tglx@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, 	chleroy@kernel.org, gjoyce@ibm.com, helgaas@kernel.org,
 davem@davemloft.net, 	andreas@gaisler.com
Date: Fri, 20 Feb 2026 14:15:49 +0100
In-Reply-To: <782eaaf6-f7e2-4c15-b4a2-52e7697dbd95@iscas.ac.cn>
References: <20260220070239.1693303-1-nilay@linux.ibm.com>
	 <782eaaf6-f7e2-4c15-b4a2-52e7697dbd95@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
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
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.95.41
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16992-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wangruikang@iscas.ac.cn,m:nilay@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:sparclinux@vger.kernel.org,m:tglx@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,m:helgaas@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[glaubitz@physik.fu-berlin.de,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com,davemloft.net,gaisler.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,physik.fu-berlin.de:mid,fu-berlin.de:dkim]
X-Rspamd-Queue-Id: 24B54167BCA
X-Rspamd-Action: no action

Hi,

On Fri, 2026-02-20 at 18:14 +0800, Vivian Wang wrote:
> Hi Nilay,
>=20
> On 2/20/26 15:02, Nilay Shroff wrote:
>=20
> > Hi,
> >=20
> > Recent changes [1] which replaced pci_dev::no_64bit_msi with pci_dev::
> > msi_addr_mask inadvertently missed to initialize the pci_dev::msi_addr_=
mask
> > to the DMA_BIT_MASK(64) on powerpc platform. Due to this, later the=20
> > validation the programmed MSI address against the msi_addr_mask fails.
> > This causes pci device probe method failures on powerpc platform. We al=
so
> > realized that similar issue could potentially happen on sparc system as
> > well. So this series initializes pci_dev::msi_addr_mask to DMA_BIT_MASK=
(64)
> > when pci_dev is instantiated for both powerpc and sparc platforms.
> >=20
> > The first patch in the series fixes this on powerpc platform. The secon=
d
> > patch fixes this issue on sparc platform. Please note that as I don't h=
ave
> > access to the sparc platform, this patch was only compile tested on the
> > sparc system. Anyone from the community is welcome to test it who has
> > access to the sparc machine.
> >=20
> > [1] https://lore.kernel.org/all/20260129-pci-msi-addr-mask-v4-0-70da998=
f2750@iscas.ac.cn/
> >=20
> > Changes since v1:
> >   - Initialize the pci_dev:msi_addr_mask on sparc platform (Vivian Wang=
)
> >   - Some minor cosmetic fixes (Bjorn Helgaas)
> >=20
> > Nilay Shroff (2):
> >   powerpc/pci: Initialize msi_addr_mask for OF-created PCI devices
> >   sparc/pci: Initialize msi_addr_mask for OF-created PCI devices
> >=20
> >  arch/powerpc/kernel/pci_of_scan.c | 7 +++++++
> >  arch/sparc/kernel/pci.c           | 7 +++++++
> >  2 files changed, 14 insertions(+)
>=20
> This series is:
>=20
> Reviewed-by: Vivian Wang <wangruikang@iscas.ac.cn>
>=20
> With the caveat that I have neither powerpc nor sparc machines to test,
> so it really is only reviewed.

Then please make sure that the changes have been tested on actual hardware.
We've seen some regressions with changes on SPARC that went in without test=
ing.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

