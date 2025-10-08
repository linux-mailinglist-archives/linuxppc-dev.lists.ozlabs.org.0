Return-Path: <linuxppc-dev+bounces-12716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D00BC60D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 18:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chdzZ5pnrz3bvd;
	Thu,  9 Oct 2025 03:40:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759941642;
	cv=none; b=BmkXnGE1auQCtERbQyU2XDe2eI5yK0wdXGlg7blAcNT4+NQL1DaToD84hjDlaEFl6YKT+pHTkGq07w/9x/XR2Cz7dXouw+r7vQPvjT8rKVxwUdu2jPMIO5fc24kfBYUvH+1yfnxL/i33suwzA8Q11GgpVpozPGf/r6kFqOLy5eUXlCy6AWAGyEBffvhMoRTxp39adZpYBmQL+xhZKFFQxeFFaWK0mdElMvFPkB3rHZKXa8cFrN3rTJ5txaI4aytwAfFJJla6tT8wwUaNBo8RVEvQuARh5i3Jmb4RS5yEdmWqWxm4178CS3FMD75hsoy5x+Oq7SMkTMEk0tnao+DyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759941642; c=relaxed/relaxed;
	bh=58sd36tFGVnNXqqC47refmJdy2dXlmsovJ3elpdQM44=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gr3t547vncGZaIdS8eMEv2QZhKH72OmlmZsCLn2ryyCcOrQCt3fqyNOUwfHQNIq3RI5gzQptyWbO84kxbX0iMS7Rrj1z/9fL8FWb0msVrNZ+vRlIdGu1Dq4F0VLPOIara5q2hDaWC5WDGJhliJXAjHBLQylwATj2piWsMYzBB4Mx5JOdji6I/8yBcM3ARxWi8k13HHT1xukE3s2TDljdB10ced9QPpDBkbh/ixS1fHOc9jWGtV6w8tMmRxp31tyVea8KJHuZQfI4RI4xY5w/iMy9qs74EUsB23HyXjsWLN88yl3mDPhBLSdg7g5J/UcdT0EE+zhnx1jDXgomJQoOrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=KAVnlUen; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=KAVnlUen;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chdzX0F5Pz303F
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 03:40:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=58sd36tFGVnNXqqC47refmJdy2dXlmsovJ3elpdQM44=; t=1759941640;
	x=1760546440; b=KAVnlUenjukI3RfbEXPnDDAxM1q3Xj04z15zckplx1OsHqRftZfVGDEzxumfS
	XsWSeQFGtnxlNT59qI8IBufYOZ9OjHWUBH9Zm73v7r+8b4JOgQcCOyR4MPvhdIavytu4q0pXWBD4z
	YR3L9zCBBajZjFTwko7nQpFfQdjMx6ltIgZJE0YA2o7Y6ShZDiQ5rcZ502TKOcH+9wi3N/PBfCsP7
	mM8jsithJ3VN8TMGFimIuQ/u0hOtQLRMIjm1fS0GRgAiWz1XL/qM+M1FhCLx0TqYaGBMysn8xKDLn
	T62rqb23r2pW5fkILPWk8pRs5aHXDBZHWEgN3w1NBC0OPK4wkA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1v6XDN-00000002lpi-2vfv; Wed, 08 Oct 2025 18:40:33 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1v6XDN-00000002XNX-1uAx; Wed, 08 Oct 2025 18:40:33 +0200
Message-ID: <3574beaa3ae41167f8a7f3f32b862288e7410d1f.camel@physik.fu-berlin.de>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Bjorn Helgaas	
 <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Cc: mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
  Christian Zigotzky	 <info@xenosoft.de>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, 	hypexed@yahoo.com.au, Darren Stevens
 <darren@stevens-zone.net>,  "debian-powerpc@lists.debian.org"	
 <debian-powerpc@lists.debian.org>
Date: Wed, 08 Oct 2025 18:40:32 +0200
In-Reply-To: <db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
	 <15731ad7-83ff-c7ef-e4a1-8b11814572c2@xenosoft.de>
	 <17e37b22-5839-0e3a-0dbf-9c676adb0dec@xenosoft.de>
	 <3b210c92-4be6-ce49-7512-bb194475eeab@xenosoft.de>
	 <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
	 <87mtma8udh.wl-maz@kernel.org>
	 <c95c9b58-347e-d159-3a82-bf5f9dbf91ac@xenosoft.de>
	 <87lf1t8pab.wl-maz@kernel.org>
	 <a02c370d-1356-daac-25c4-02d222c91364@xenosoft.de>
	 <87ilwx8ma5.wl-maz@kernel.org>
	 <d044e62f-c7f8-4ec7-dbc6-ce61767e295f@xenosoft.de>
	 <0baf0f26-ab82-ca19-ea9f-7f461ce32aa5@xenosoft.de>
	 <db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
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
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christian,

On Wed, 2025-10-08 at 18:35 +0200, Christian Zigotzky wrote:
> Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
>=20
> Without the pci-v6.18-changes, the PPC boards boot without any problems.
>=20
> Boot log with error messages:=20
> https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_c=
hanges.log
>=20
> Further information: https://github.com/chzigotzky/kernels/issues/17
>=20
> Please check the pci-v6.18-changes. [2]

Can you try bisecting this issue? The commit you are referring to is a merg=
e
commit and contains a lot of changes, so tracking down the problem is not
easy unless we know the exact commit that has introduced the problem.

Thanks for testing!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

