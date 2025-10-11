Return-Path: <linuxppc-dev+bounces-12777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94900BCFB66
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Oct 2025 21:35:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ckYjl2Nfwz2yhX;
	Sun, 12 Oct 2025 06:35:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.164 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760211323;
	cv=pass; b=Icyevg0CWVwsYo6yBTOPTZupgNobuFXfY+oe53pWNUmr7Gmc8xsKvDImomlR/TBZyLInYC+Neo3F6pydMXNWCCip2my03KMMXzEmj8lz0w3WnuYjOwPy25wMHBbLmoUZeG/9Yoi+cC0wQrNhpZkbdUwYk22lP6u4UpUsrPqQYlODV+O/PhIaU6035LzDmCZQIHQfuyr+848ceEXesdsST4OgafSiQJjBIjRwzJn4ATNVfx7QV3/mVdX10PENPi1P71FBW8qG0xmfrwSuFQ/Pok1LdtGmkuUTM/MlccDVHGVu1i5IMAlOGTXovDGgQkG5qV6HHKKH0/C3TResaPnsFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760211323; c=relaxed/relaxed;
	bh=nNNzvGymUgpkTLqMXCbw33PLf4NbEnWrMjuFoCQsc/4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=HlBA5bKlBdZRHTKyKstsuTjvfSv4z2lBLtfVHnuBiV3L2gNupFtrATVXnRR/Ojnd18cThdCwTuIGDvXydkG0loE8dRmuCbRqlQbMJ/7DxWXiBGU/m/S3xJYUBVBrcPWEQjiLJAZxaOY6Nfk03JMBxnNTyBubY5oxhe2JmYTmLpBa9EtaTTcSsW9DF2nKr7IvhPGu5cfCTNMf4mY1AT+kPaoU9IJ5naMzPV5SrpvP6+oA7+JRNOyQ3IivB16mDSvQr4AqNyI7m/fZOdwDlk9C9FrnC+ir23lnb8gVmne4BKcqX9OGQ6918ML4jE5qiNtaI+0hZr4Wu/9nKTN6J4q/5A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fxb7nKp+; dkim-atps=neutral; spf=pass (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fxb7nKp+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ckYjh15Zrz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Oct 2025 06:35:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760211278; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lgYA8lnrYtrmWdmT4OJZNikzxIzrBM2oPmGuHHHdSjrYIRMFMGYEbFF6CYvveKe9KC
    rw5ZBzt7hCjq/+PWF/ZPsnWjOL9+Ra7GxnPLvsyJ+Oy03ONrWPLeuNC6ynyQJIxmgUDm
    1ffql/jlfhELGO1e++wtWhu/iPIFrcGitEkdAb4hj7iD3Ak/d44AWk9FbVmZveMlWZ+a
    UsKMDecht9c6BjaEhAknUXbDf+OvqcQUsJ3ec8+yoSiZkW0tuPKJfS7nKCj8nj5tMJxM
    y79QoLnEHpO4uYVoo5njJbDBBc5YrhLUgV3EKo1qUxBY3Q2DNjXdwaSdc98z9GmR93hs
    CM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760211278;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=nNNzvGymUgpkTLqMXCbw33PLf4NbEnWrMjuFoCQsc/4=;
    b=AgxgZA7egXgHuAzYC5oak0svuiYxixPvPVMqEcV0SnfmvdYFzixbF8CyRNXG4mcV6Y
    dllPv0Uo8YtV3lpABvTk9mDkMJFTZlZU1N2o7t8QxVlDmPSmeED86PTBOj2kijj2HYaO
    BmH4B+bygbzCPIZXAjm/fE4JZR1EsHUZwhTmeIoJfXgFAuq8CR6Tw9ZYnCFVtQu9xOXi
    BYKAaJUVWlX34ODHxaUWAYBGwmJjAwHoEq4dw5Euqslg9mtJqA8U+gL2pjz/n9IHPmId
    mtdIX2/9NAnPw9dXrBrvy6CxzBbcFzOtXY8uAPvNJzOl9M2hMKdpEfv5+6oy7qogACHi
    EalQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760211278;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=nNNzvGymUgpkTLqMXCbw33PLf4NbEnWrMjuFoCQsc/4=;
    b=fxb7nKp+x06mqUB7s6SAbzZy6BXTqFhKI71EiWvabEB72lOTXCanc+YR7mrTF7vnsc
    8M8jbRbuSrTFeQwWgi5lrzqZEq1+T9fCgRa1+Q1y6cHJhFLnNIzhN4U66hnlcIurkEXW
    NXGaBPN//F8DXi5Cna+zhPC9lkug5k+IsFGZnA3+RxszbqWBP4vFxyZkVlfHZIOLW7tx
    g/oeWSDKRFKERNOkWF0e6feeXsl17QDNqQjWe1KFV3dW0dMOwStJ5BwGIvZXp5l1wD0W
    Ee4FZlvfPGYuqY/8AKO/v0+iLyjuoxQfcqGMk4/+V6+Hk6cVrvrFnxclxX+ipy2IwgW9
    gaeQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m3symQCXjUqyw7o0hpeQmgGSciaK9CTQrlRvQ="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619BJYbI1h
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Oct 2025 21:34:37 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Mime-Version: 1.0 (1.0)
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Date: Sat, 11 Oct 2025 21:34:27 +0200
Message-Id: <10994220-B194-4577-A04B-EBC5DF8F622F@xenosoft.de>
References: <iv63quznjowwaib5pispl47gibevmmbbhl67ow2abl6s7lziuw@23koanb5uy22>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org
In-Reply-To: <iv63quznjowwaib5pispl47gibevmmbbhl67ow2abl6s7lziuw@23koanb5uy22>
To: Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Hello Mani,

> On 11. October 2025 at 07:36 pm, Manivannan Sadhasivam <mani@kernel.org> w=
rote:
>=20
> Hi Lukas,
>=20
> Thanks for looping me in. The referenced commit forcefully enables ASPM on=
 all
> DT platforms as we decided to bite the bullet finally.
>=20
> Looks like the device (0000:01:00.0) doesn't play nice with ASPM even thou=
gh it
> advertises ASPM capability.

It=E2=80=99s the XFX AMD Radeon HD6870.

>=20
> Christian, could you please test the below change and see if it fixes the i=
ssue?

I will test it tomorrow.

Thanks,
Christian=


