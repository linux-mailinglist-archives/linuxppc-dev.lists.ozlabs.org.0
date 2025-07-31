Return-Path: <linuxppc-dev+bounces-10482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2944EB16C90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 09:17:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bt0l91p0Fz305v;
	Thu, 31 Jul 2025 17:17:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.21 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753946229;
	cv=pass; b=cMdKRyEvQ/L/ugT0ockaq0tzF5BqZW64mEwunay0FTU0a94FAwUCbYTQvgzcxS5Gpau/6e3SIi5q/WPC//ZBARVE/qcwZpwV4qAi6i5uuNMEKm0SXdxddTq5QnJlQ8I9d+jK06jvpa8IaopZz6/2LOyKoos7EH1hudYnDnuN4dkMrxlweDjjsC2X3zVP1diJEouOdwuP85aDBNmsy+U5FGrR5JmJ/nitGX88xL3WOrWS7mr+ceN5ag5wwGataFjA06JXaSLsBuCxg75q+KTiooXcpaeSdck0eiiJxem6XDQpmbk8JdZ0yH/N2xzvj+tUqBxMAvtgLB7d/RTPpJxLNA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753946229; c=relaxed/relaxed;
	bh=tBDx+9UC6WEm9gwwpPzWfHeLKUjU0zmv01xkFgYmYcY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 In-Reply-To:To; b=NJrBq7CladYz8hYr24VskkIid/EePqo1kLSG8xwB9FgqA9V4+pruww91wr2ujPVW74uiIr9GOGwNIWEYbVuXPdT4ngpZZivRTQ9xNXhv1fM9wxz/ILEF9+QjKVllyunFg6e92t6rU/PcpWjThf7O9e+IJe8F0AD7XmQeSxONOB1EbBd1toPhPlJCc7KjlM/8n5s17cezNmxWO+pf5U8YVyu0+wqxugGM4psEToZW+NY14MWnGSPXXLir+YQQsgnpRHxaaZtZ9ucr3DvR28kJuWMEvAl/aaZEksuHgDtPk8uwooNKnsXYz0lG8n6g4WEjf8h3oVhg++U6TvT6SLdJ8Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=qnxrqadR; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=NtTuECCi; dkim-atps=neutral; spf=pass (client-ip=85.215.255.21; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=qnxrqadR;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=NtTuECCi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.21; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 183 seconds by postgrey-1.37 at boromir; Thu, 31 Jul 2025 17:17:05 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bt0l56jtqz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 17:17:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1753946036; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cEYzBVHjP5FeO0UmsdWFNk+N9AkL2I2jJzShUHRfaPFnSJSTlWfSEijdqSsd7+60qc
    LCedDAAsxpxB6PiIDOGS0AvGNtobBKxYZ2gUDQhIP5P3xhdTam7Oqo5yiBsHFhEy/uBs
    lkctxv9FRJRcQXXnekaKk1nYJrylRX0NZlaPuuxF94jxYb8sgTqPPk6xLFrHjkEDVS5p
    s5XS4RNLyTW4rFjtcol7nym4RPUPH3W2aKJL3sHyDKAlYx+xSRN+xG2AzoszlBuHRBR1
    tEERwkCin2xrQ2NWiEzZNGSoN/8JZjEn3wmX/E9A4S694IRq+KYNCQyEiqUlIjWzk2jC
    Jwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1753946036;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:References:Message-Id:Date:Subject:From:Cc:Date:From:
    Subject:Sender;
    bh=tBDx+9UC6WEm9gwwpPzWfHeLKUjU0zmv01xkFgYmYcY=;
    b=hdHymX5dEAyvCU+eEXAqmwdxwQXqXgxqKThTtAdJzl6zQWuw66OQrmSL1rgd5RXV60
    6F1Zh4gDO4SiaST3fNFhhsdR69jbPtbkmGLvuxcSQlWC24TFv7PyVtmuOcMQGkVbgCdo
    YG8v7mFuSUZpzkl1l0V3dbUEzRvw9Rz/O5VFThBokK6iifxk6Rvcv4/aHSWPHqjhV4NB
    SQOPmdhM6diW4Quxikozq0Kcx6fDMIGqdr9bUV9GuiVW3JrCk5opECV/NdjlCDOaYOkX
    XfOz7UwywHUMfgx7bjgI/pvIkwBYzTfIT4EWJLNt6ytiqYrt9x7oYzb3/iJCU4Qqjuen
    UnHw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1753946036;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:References:Message-Id:Date:Subject:From:Cc:Date:From:
    Subject:Sender;
    bh=tBDx+9UC6WEm9gwwpPzWfHeLKUjU0zmv01xkFgYmYcY=;
    b=qnxrqadR+mJi7HsItOf+6Bi0oQRqsspMAiRWw2YiCQZ29Q0NuwjTXb7MNyq+Niuc9U
    HIMgVpRRyS6L3NCSy9vWFiYtFNUp2zw/DxnQEmH7TqQY8k7w3ZYI4/3Bb/YynjQ1EKcH
    rhgkLiyZn9Jo1w9B8QCEgqCEkI/7eApCEw6SxpGKUpMGPDmbu57TfPL2Cx4lCPuA0IHc
    tbVhqlvxTAarE851i9ojs1ZTC2LU7uKsHx7B8IVq16VEygenca0a/tBz/LHHZZRNmziF
    iz2Ze7Eb4EErpYpF+mLLsy8G7AuwRKzpo4pnkExTMcyEh9l80EvtemDkWaZvOpoyIk8s
    RVzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1753946036;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:References:Message-Id:Date:Subject:From:Cc:Date:From:
    Subject:Sender;
    bh=tBDx+9UC6WEm9gwwpPzWfHeLKUjU0zmv01xkFgYmYcY=;
    b=NtTuECCiPWmKmETLyvcpX3yJaVJrebgHnc4MSCehFHXB1y/4f6oC5piUNjzQp6Cfzy
    0UBru5Y6ymXfUUrEoKAA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mzs3zHCHUPVA3N/gJLdDvXsmHsmXN/cif88k0="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c16V7DueEj
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate)
    for <linuxppc-dev@lists.ozlabs.org>;
    Thu, 31 Jul 2025 09:13:56 +0200 (CEST)
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
Subject: Re: PowerPC updates 6.17-1: Switching VT failed
Date: Thu, 31 Jul 2025 09:13:45 +0200
Message-Id: <2ECC65F5-18CF-4330-8E5C-9FD863BDA4CD@xenosoft.de>
References: <D8BCBAE7-8D8B-4A71-9616-ACEDB1281E8F@xenosoft.de>
In-Reply-To: <D8BCBAE7-8D8B-4A71-9616-ACEDB1281E8F@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: iPhone Mail (22G86)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

The PowerPC updates 6.17-1 aren=E2=80=99t responsible for this issue.
I reverted the PowerPC updates 6.17-1 but Xorg doesn=E2=80=99t start.

Cheers,
Christian

> On 30 July 2025 at 03:13 pm, Christian Zigotzky <chzigotzky@xenosoft.de> w=
rote:
>=20
> =EF=BB=BFHi All,
>=20
> Could you please test Xorg with the latest Git kernel including the new Po=
werPC updates 6.17-1?
> Xorg doesn=E2=80=99t start anymore.
>=20
> Error message:
>=20
> xf86OpenConsole: Switching VT failed.
>=20
> I tested it with QEMU with virtio-gpu-pci and VGA,vgamem_mb=3D256 with som=
e Linux distributions today.
>=20
> Unfortunately I can=E2=80=99t bisect because of the lack of time.
>=20
> Thanks,
> Christian


