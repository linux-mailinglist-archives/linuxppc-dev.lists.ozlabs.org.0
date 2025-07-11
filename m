Return-Path: <linuxppc-dev+bounces-10195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F44B02377
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 20:18:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bf0MF61Vxz2ys0;
	Sat, 12 Jul 2025 04:18:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752257897;
	cv=none; b=Bq0XuML9nE0pGnw5pPbd8g60iVLNiVpQut6gK8VgYT6DNAmmMaIgVbnvzmFBhu/x8Iy5WMHt/cixxZI8YWCWAgvQkxBTeXRV+Pps+D9lmSiVeRU2Pii9KFC1h1h1St9NcGPs5YvM51aHBu7K0yxjOb2LAWOAKI62wmH2CjL6mjEEoGUjnF0Mui0bd1FUvGaKwHNCzhgNGJ14niJsTLySOx8NoXJ/bqbSgmiim91Q0CVC43z8FY/IanymsYk/AgRRg0AExOXLi/m0Qfb5vAKtgyEodXe4z2wOCfvTAUoiDOwlXRmywK2L03qBcXIhvfhf0o3xMhZurCmjHD+bb+/Ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752257897; c=relaxed/relaxed;
	bh=gDvvHLrpt3dz96vtuXPeitVvNGkl1snbkwkvTEkVWRs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=f3PQ8tWnfJRzGLUzHzQsj59/PFowyNbwfWizla3mHbvZLh4ysDSBsMNEQ0c2onVVlXUNNphMKBR2jNzPX+sFkDok72jc12ayVGW9LiVnSaxvDojK9CwK9jBbIVVLP3uigzKlVYA88NT33Nm9uEBHMAgRAe0P/a41ol6N12s0M82Egv/A/DRQUeEDe8EMzuBfk12HkTKYtXBM2ZTRoxbfnDgUR2FtV4OH4Xe5mtw07Ths+hIASp6NrTtB2PeXMYByH6z/6uCJso9wukihB7RXouZ5V/oTTJ1+ghF3FJsiBnRiXwmA8qfZnmW9ZdI/D5xKmNg1PjhExIMgfVUbJKUdSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Tx7WS/5h; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Tx7WS/5h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bf0MB1WD3z2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jul 2025 04:18:13 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 09EC68288F33;
	Fri, 11 Jul 2025 13:18:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id LAf6JLA7DNBy; Fri, 11 Jul 2025 13:18:08 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4AE358288F5B;
	Fri, 11 Jul 2025 13:18:08 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4AE358288F5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1752257888; bh=gDvvHLrpt3dz96vtuXPeitVvNGkl1snbkwkvTEkVWRs=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Tx7WS/5hHtYSqCL0ma/RGV4lSu2Vyo6m7H34ory4crMJXHc8d52/u9xIguWn4y1o9
	 5cu+EMP+ju0P3U5QlWHY9TunjkH4Deb9ZJIH08+dmrFQbM8cR2JMEqGE29yk8ejeiY
	 bTz7snrmwfnlmI/yX9G6zVessZwW1+AWCLUl4eZY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cTUq5L-Av43w; Fri, 11 Jul 2025 13:18:08 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0E4DF8288F33;
	Fri, 11 Jul 2025 13:18:08 -0500 (CDT)
Date: Fri, 11 Jul 2025 13:18:07 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Krishna Kumar <krishnak@linux.ibm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Lukas Wunner <lukas@wunner.de>
Message-ID: <1841754281.1353162.1752257887865.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <3ebe82c1-d9ae-419e-9e49-61fcb71abe34@linux.ibm.com>
References: <20250624223413.GA1550003@bhelgaas> <3ebe82c1-d9ae-419e-9e49-61fcb71abe34@linux.ibm.com>
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
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC138 (Linux)/8.5.0_GA_3042)
Thread-Topic: pci/hotplug/pnv_php: Enable third attention indicator
Thread-Index: 1THlEb9At+uVSeMvjMGLUwEw4YbY8A==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Krishna Kumar" <krishnak@linux.ibm.com>
> To: "Bjorn Helgaas" <helgaas@kernel.org>, "Timothy Pearson" <tpearson@rap=
torengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux=
-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>,=
 "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@=
kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.co=
m>, "Lukas Wunner" <lukas@wunner.de>
> Sent: Monday, July 7, 2025 3:01:00 AM
> Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention i=
ndicator

> Thanks all for the review and Thanks a bunch to Timothy for fixing the PE=
 Freeze
> issue. The hotplug issues are like you fix N issue and N+1 th issue will =
come
> with new HW.
>=20
> We had a meeting of around 1.5 -2.0 hr with demo, code review and log rev=
iew and
> we decided to let these fixes go ahead. I am consolidating what we discus=
sed -
>=20
>=20
> 1. Let these fixes go ahead as it solves wider and much needed customer i=
ssue
> and its urgently needed for time being. We have verified in live demo tha=
t
> nothing is broken from legacy flow and
>=20
> PE/PHB freeze, race condition, hung, oops etc has been solved correctly.
> Basically it fixes below issues -
>=20
> root-port(phb) -> switch(having4 port)--> 2 nvme devices
>=20
> 1st case - only removal of EP-nvme device (surprise hotplug disables msi =
at root
> port), soft removal may work
> 2nd case=C2=A0 - If we remove switch itself (surprise hotplug disable msi=
 at root
> port) .

Just a quick follow up to see if anything else is needed from my end before=
 this merge can occur?

Thanks!

