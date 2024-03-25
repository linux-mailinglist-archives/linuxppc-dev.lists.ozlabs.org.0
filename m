Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5088B2FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 22:41:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=bihn7DHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3RFs21J1z3ddR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 08:41:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=bihn7DHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xry111.site (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org)
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3RF73ZbJz3byl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 08:40:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1711402838;
	bh=SfhDpy1gBjb0secvYDmVDcNH0yEOBTw0RQ+3z7mvlJc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bihn7DHAYDcY37C5lrOcOftrxdZ1EPXXSiq6fBsNAcsPIyrwVsVgYHDc8fYgwn0T+
	 SzHj5CmEzoByIzE+O5BHN3D1riTfQAEsX20mZy66cJK9vEc0NUIWvduk07JG3NEoNM
	 9ve7gzfAMQbokgSDNw01wRs+EYu7IoTUG4YXlSgU=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3D21A67071;
	Mon, 25 Mar 2024 17:40:35 -0400 (EDT)
Message-ID: <70e3b9cac305d157396c99355339008e8cf97c62.camel@xry111.site>
Subject: Re: [PATCHv3 pci-next 1/2] PCI/AER: correctable error message as
 KERN_INFO
From: Xi Ruoyao <xry111@xry111.site>
To: Ethan Zhao <haifeng.zhao@linux.intel.com>, Bjorn Helgaas
	 <helgaas@kernel.org>
Date: Tue, 26 Mar 2024 05:40:34 +0800
In-Reply-To: <ba78805af8b39237b22a0ff87c4ba3c614a43910.camel@xry111.site>
References: <20230918193913.GA203601@bhelgaas>
	 <0a44fd663e93ac5b36865b0080da52d94252791a.camel@xry111.site>
	 <38601aef-b082-463f-8e41-f73a4307de21@linux.intel.com>
	 <ba78805af8b39237b22a0ff87c4ba3c614a43910.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0 
MIME-Version: 1.0
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
Cc: rajatja@chromium.org, rajat.khandelwal@linux.intel.com, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2024-03-25 at 18:15 +0800, Xi Ruoyao wrote:
> On Mon, 2024-03-25 at 16:45 +0800, Ethan Zhao wrote:
> > On 3/25/2024 1:19 AM, Xi Ruoyao wrote:
> > > On Mon, 2023-09-18 at 14:39 -0500, Bjorn Helgaas wrote:
> > > > On Mon, Sep 18, 2023 at 07:42:30PM +0800, Xi Ruoyao wrote:
> > > > > ...
> > > > > My workstation suffers from too much correctable AER reporting as=
 well
> > > > > (related to Intel's errata "RPL013: Incorrectly Formed PCIe Packe=
ts May
> > > > > Generate Correctable Errors" and/or the motherboard design, I gue=
ss).
> > > > We should rate-limit correctable error reporting so it's not
> > > > overwhelming.
> > > >=20
> > > > At the same time, I'm *also* interested in the cause of these error=
s,
> > > > in case there's a Linux defect or a hardware erratum that we can wo=
rk
> > > > around.=C2=A0 Do you have a bug report with any more details, e.g.,=
 a dmesg
> > > > log and "sudo lspci -vv" output?
> > > Hi Bjorn,
> > >=20
> > > Sorry for the *very* late reply (somehow I didn't see the reply at al=
l
> > > before it was removed by my cron job, and now I just savaged it from
> > > lore.kernel.org...)
> > >=20
> > > The dmesg is like:
> > >=20
> > > [=C2=A0 882.456994] pcieport 0000:00:1c.1: AER: Multiple Correctable =
error message received from 0000:00:1c.1
> > > [=C2=A0 882.457002] pcieport 0000:00:1c.1: AER: found no error detail=
s for 0000:00:1c.1
> > > [=C2=A0 882.457003] pcieport 0000:00:1c.1: AER: Multiple Correctable =
error message received from 0000:06:00.0
> > > [=C2=A0 883.545763] pcieport 0000:00:1c.1: AER: Multiple Correctable =
error message received from 0000:00:1c.1
> > > [=C2=A0 883.545789] pcieport 0000:00:1c.1: PCIe Bus Error: severity=
=3DCorrectable, type=3DPhysical Layer, (Receiver ID)
> > > [=C2=A0 883.545790] pcieport 0000:00:1c.1:=C2=A0=C2=A0 device [8086:7=
a39] error status/mask=3D00000001/00002000
> > > [=C2=A0 883.545792] pcieport 0000:00:1c.1:=C2=A0=C2=A0=C2=A0 [ 0] RxE=
rr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (First)
> > > [=C2=A0 883.545794] pcieport 0000:00:1c.1: AER:=C2=A0=C2=A0 Error of =
this Agent is reported first
> > > [=C2=A0 883.545798] r8169 0000:06:00.0: PCIe Bus Error: severity=3DCo=
rrectable, type=3DPhysical Layer, (Transmitter ID)
> > > [=C2=A0 883.545799] r8169 0000:06:00.0:=C2=A0=C2=A0 device [10ec:8125=
] error status/mask=3D00001101/0000e000
> > > [=C2=A0 883.545800] r8169 0000:06:00.0:=C2=A0=C2=A0=C2=A0 [ 0] RxErr=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (First)
> > > [=C2=A0 883.545801] r8169 0000:06:00.0:=C2=A0=C2=A0=C2=A0 [ 8] Rollov=
er
> > > [=C2=A0 883.545802] r8169 0000:06:00.0:=C2=A0=C2=A0=C2=A0 [12] Timeou=
t
> > > [=C2=A0 883.545815] pcieport 0000:00:1c.1: AER: Correctable error mes=
sage received from 0000:00:1c.1
> > > [=C2=A0 883.545823] pcieport 0000:00:1c.1: AER: found no error detail=
s for 0000:00:1c.1
> > > [=C2=A0 883.545824] pcieport 0000:00:1c.1: AER: Multiple Correctable =
error message received from 0000:06:00.0
> > >=20
> > > lspci output attached.
> > >=20
> > > Intel has issued an errata "RPL013" saying:
> > >=20
> > > "Under complex microarchitectural conditions, the PCIe controller may
> > > transmit an incorrectly formed Transaction Layer Packet (TLP), which
> > > will fail CRC checks.=C2=A0When this erratum occurs, the PCIe end poi=
nt may
> > > record correctable errors resulting in either a NAK or link recovery.
> > > Intel=C2=AE has not observed any functional impact due to this erratu=
m."
> > >=20
> > > But I'm really unsure if it describes my issue.
> > >=20
> > > Do you think I have some broken hardware and I should replace the CPU
> > > and/or the motherboard (where the r8169 is soldered)?=C2=A0 I've noti=
ced that
> > > my 13900K is almost impossible to overclock (despite it's a K), but I=
've
> > > not encountered any issue other than these AER reporting so far after=
 I
> > > gave up overclocking.
> >=20
> > Seems there are two r8169 nics on your board, only 0000:06:00.0 reports
> > aer errors, how about another one the 0000:07:00.0 nic ?
>=20
> It never happens to 0000:07:00.0, even if I plug the ethernet cable into
> it instead of 0000:06:00.0.
>=20
> Maybe I should just use 0000:07:00.0 and blacklist 0000:06:00.0 as I
> don't need two NICs?

Plugging the ethernet cable into 0000:07:00.0 and then
"echo 1 > /sys/bus/pci/devices/0000:00:1c.1/remove" work for me...

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
