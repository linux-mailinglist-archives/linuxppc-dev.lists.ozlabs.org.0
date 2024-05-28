Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290C38D556F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:33:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=bK0TBYfG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1H232qNz3fmN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:33:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=default2211 header.b=bK0TBYfG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=geanix.com (client-ip=188.40.30.78; helo=www530.your-server.de; envelope-from=esben@geanix.com; receiver=lists.ozlabs.org)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpYcc6TWzz3vbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 23:43:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vrlJg+gvxce4qVnPpoGhK+rjv8ov8o6eVLj/sB5TAi0=; b=bK0TBYfG69Gq6mE4Z1ATMxRxh5
	cD1jn5Ebio45blOl+cszvxPDr8Mr0I1fYUM3T942NiVkYED/yNwm0/0NpAgih4y/fOAURV+/Ze0ly
	kp6r6zMtOWZbovRQVdAiYU/44dk0suMbg4gzamSTaeajiuAlRF04iGOq6q4dAJzgh4Ed8jaxY8fuw
	OFp8Lk+6xZ0dSqututm9mXSOE8YR5iPDaLNoIwpOiciYpzSca6cN2R6QcK72hGXv/dTfk8rMQswhn
	Lq5Q1d0J8mDmK6GtAJ/fj20GvfI1HMTT0kWqHjr9JERhhFOx2npeUMmsiB8dpTQ7fw69sN8zxX4Go
	OyPktYHQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sBx6b-0003Op-4c; Tue, 28 May 2024 15:43:09 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sBx6a-000KRY-1q;
	Tue, 28 May 2024 15:43:08 +0200
From: Esben Haabendal <esben@geanix.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/2] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
In-Reply-To: <56f19120-7ddb-4006-99f6-e1b043ed88e1@kernel.org> (Krzysztof
	Kozlowski's message of "Tue, 28 May 2024 15:32:12 +0200")
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
	<20240528-fsl-ifc-config-v2-1-5fd7be76650d@geanix.com>
	<eb911c50-2f66-43dd-a1ff-398a3e7c56a2@csgroup.eu>
	<56f19120-7ddb-4006-99f6-e1b043ed88e1@kernel.org>
Date: Tue, 28 May 2024 15:43:07 +0200
Message-ID: <87jzjevyqc.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27289/Tue May 28 10:30:59 2024)
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: Michael Walle <mwalle@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "Aneesh Kumar
 K.V" <aneesh.kumar@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 28/05/2024 15:15, Christophe Leroy wrote:
>> Le 28/05/2024 =C3=A0 14:28, Esben Haabendal a =C3=A9crit=C2=A0:
>>> [Vous ne recevez pas souvent de courriers de esben@geanix.com. D=C3=A9c=
ouvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutSenderId=
entification ]
>>>
>>> While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
>>> driver selects FSL_IFC automatically, we need the CONFIG_FSL_IFC option=
 to
>>> be selectable for platforms using fsl_ifc with NOR flash.
>>=20
>> I don't understand.
>>=20
>> Shall I understand :
>>=20
>> While use of fsl_ifc driver with NAND flash is fine as the fsl_ifc_nand=
=20
>> driver selects FSL_IFC automatically, ....
>>=20
>> or
>>=20
>> ..., as the fsl_ifc_nand driver selects FSL_IFC automatically we need=20
>> the CONFIG_FSL_IFC option to be selectable for platforms using fsl_ifc=20
>> with NOR flash
>>=20
>>=20
>>=20
>> I'm fine with the fact that you want to be able to select it when you=20
>> use NOR flashes,=20
>
> But users are not fine... their memory won't work if they cannot choose
> it (if you meant select=3Dchoose).

Exactly. The IFC controller supports both NAND and NOR flashes. Since
commit ea0c0ad6b6eb ("memory: Enable compile testing for most of the driver=
s"),
it has not been possible to use IFC controller for NOR flashes without
selecting the IFC NAND driver (CONFIG_MTD_NAND_FSL_IFC), which is
obviously not how it is supposed to be.

/Esben
