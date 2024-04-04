Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242B5898FF3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 23:13:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=crDZxFZ9;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Z7oyc+WI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9Z9Y6bShz3cML
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 08:13:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=crDZxFZ9;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Z7oyc+WI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9TWq4GDWz3cN6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 04:44:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712252653; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sC/LAVqaAmmcB5nieFK+07yi9D6YN70yOlpWc9rocM9xK+ncuEaRZks7rRr553+r4Y
    X1YrgFfcT7qDVKsQni+EkmauqbToy5+m8lNDZqzl/IalXfoXb5LUINA+aHA2mbJTm+0H
    uVv3i24wj+Cp3v5PEFxZA6NbjkKxPH7cqYvJxg6fz+pXVTh7BAPf2Eeng83JsFDqGjSn
    0Jmy8N2+V1ALVPo1dbIuHIlTZaxOH1e2fPAOcHlUTi/YrEtrIoF+QO8dbVdR9zsqESIY
    Jc4qXNdfxep1eN2RgrwB8wdNgUJxfpqETZWmaDsFFE8k8ZN62KLHUEPAKp5CJOpkO34s
    EN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1712252653;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=1r+Ow+lnHzuDPv/orfcq3PTpl9FkIAuhLcm3NafM+Tw=;
    b=i4F1eCNbZthh3dnp3gsK90nWeU9cErCjk1vPMODS22EWlA9G8DVFCrz4FZVVC6PELi
    2t3hVXUjx7MY9UUPGt96AvLlQk+gMj2MfOo/r4epPr399EnA0xXLZnkkYmVmelCfjFdn
    Jl8+BLk3UICPFk/8tQ3KzEh/tYWA1ZzxE0d6Tnz8jFecB8Mn5ZUXVanji+fIS0HKwhWV
    29oI+knX1Ei1l+KMh6/LXaRyCifi3HV/CvxeS8a/WiP1lWNn9LJhfmBZ7yBO9F9+FpB5
    WbUODvTXNK+tyjKDmVwP66CChEzaSpVhkyWGsIpEa3EreZq9KD75CLOq+KQkqdo/Cf9g
    mraA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1712252653;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=1r+Ow+lnHzuDPv/orfcq3PTpl9FkIAuhLcm3NafM+Tw=;
    b=crDZxFZ9vuyAoputW3IcwpX/xi8NYLIDho+b3nECxQ+zAZBZZn8iIRh0ocbRlJKAYB
    te98HydeiU8ioyIazKGewANqtOOwtkwxRdk6Tnl/UvHE+Tf7K+MLkFTjOz6N4xYNTEuq
    eLgxHQ3DqRHYa+rXzgVMgi79TrlcW4GqygKLftN1Egl/BojbDLQL2RPibK6obOnLE08d
    B0Rwa6TNeGFKyGjN33KHir6n/BxgJlKpMcvTxZUZzTpma20NvNSi33kkYdm9jGtJKkfH
    F8/M7leeDmXGAUd4ZB4GtyTGLxmNytOHysnnPbqEQRN8wPp6/uOkSEANIMs7j3AdTfSU
    redg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1712252653;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=1r+Ow+lnHzuDPv/orfcq3PTpl9FkIAuhLcm3NafM+Tw=;
    b=Z7oyc+WI61Bio4BtXyASc4qKuR3Bf4PiAVtbyHIBDjUjlE++5AQkgtOtI77Eh6gy4B
    d5mKU3ls+TktPbhPMLAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5nhs33DDS0UMcjoC7RB5Q0vSpFRg/OHxUcfB8c="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 50.3.2 AUTH)
    with ESMTPSA id eaf61b034HiCa8k
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 4 Apr 2024 19:44:12 +0200 (CEST)
Content-Type: multipart/alternative; boundary=Apple-Mail-D590ED33-1A30-41E4-886F-6BA30E91E75C
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [FSL P50x0] Kernel 6.9-rc1 compiling issue
Date: Thu, 4 Apr 2024 19:44:01 +0200
Message-Id: <3FDFD539-844A-44B7-BEA7-BE4F3BE4EAEE@xenosoft.de>
References: <a4320985-f585-4033-8229-63937a49aa84@xenosoft.de>
In-Reply-To: <a4320985-f585-4033-8229-63937a49aa84@xenosoft.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>, hbathini@linux.ibm.com
X-Mailer: iPhone Mail (21E236)
X-Mailman-Approved-At: Fri, 05 Apr 2024 08:13:16 +1100
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd@a-eon.com>, Matthew Leaman <matthew@a-eon.biz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-D590ED33-1A30-41E4-886F-6BA30E91E75C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Shall we use CONFIG_CRASH_DUMP to get int crashing_cpu =3D -1;?

Further information: https://lists.ozlabs.org/pipermail/linuxppc-dev/2024-Ma=
rch/269985.html

=E2=80=94 Christian=

--Apple-Mail-D590ED33-1A30-41E4-886F-6BA30E91E75C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">Shall we use CONFIG_CRASH_=
DUMP to get int crashing_cpu =3D -1;?</div><div dir=3D"ltr"><br></div><div d=
ir=3D"ltr">Further information:&nbsp;<a href=3D"https://lists.ozlabs.org/pip=
ermail/linuxppc-dev/2024-March/269985.html">https://lists.ozlabs.org/piperma=
il/linuxppc-dev/2024-March/269985.html</a></div><div dir=3D"ltr"><br></div><=
div dir=3D"ltr">=E2=80=94 Christian</div></body></html>=

--Apple-Mail-D590ED33-1A30-41E4-886F-6BA30E91E75C--
