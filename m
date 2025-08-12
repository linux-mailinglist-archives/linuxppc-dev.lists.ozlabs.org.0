Return-Path: <linuxppc-dev+bounces-10853-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE98B21E0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 08:14:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1Lnb5Tw1z3dL3;
	Tue, 12 Aug 2025 16:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.104.207.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754979283;
	cv=none; b=mQk6sFLJdnESseT1e/YRSW864WNjxMHy+UWdp2FyI/hkyaLPExe6AWx7M4/35FFTeHDMZIKp2+yAlws5X1IjyUzPnvQp8SKOBB3Zl1u87GZvQdHLK7oxjSu3q49Bf9dm73hBScMKbDj9P4NxeqE0L3NryGR6NBbwp9f/c6kYqdlBd2ThBFxASpZsN65/93WA9Kdn101K7/LV6QVwB1iQuJB9j9NR6772OnhdFP7qYTeG1GF0eSpKRPLQ9pWKVopWLfS6AO15ZWTH5OqRG4qFZhzs9wD4fh0WEixQqzXx0yrFR39QtgKYvJvb0mY9Di0fpKKhO8334E3odmTK3AXaxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754979283; c=relaxed/relaxed;
	bh=7kDMXkiqwspte3OFxiCO5uJIctYbcK6fSwBNuY8L+04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=du3+ITyENY3kJXU8u7wIjCQlHtKqXCPxLZcIOrITqaQVARMMebP/6GOf8jnbj7w6BYMCVBF01hFqG1+VWqM7jhMUgeU58sqJXrXR6bA5SsmmuJQ50Jh5V0ilX5tyS85MFBn3oeTFmDWvL3qomqXCDnR4HWodzB+C/RUMt9XXwq8VSYTo9CoAjabZqPK70z/BSjtvHbzTM9OEcVJugISMSFd/gUj4qXcnNxZnAYuyFKH3U0M6nbOCtvcPERBGjR8PR1Vum4kmF6CCF91OgXLjggLcHEJsaAb9b2H/lVBWtnyQiKE/ESyzrb/sI7zNXvYC75xzMApK9c5wtRWHWZoVHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Os6o45Pb; dkim=fail header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=VOm5I74O reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Os6o45Pb;
	dkim=fail reason="key not found in DNS" header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=VOm5I74O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1LnW6dLDz3cfL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 16:14:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1754979280; x=1786515280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kDMXkiqwspte3OFxiCO5uJIctYbcK6fSwBNuY8L+04=;
  b=Os6o45PbtRiYkw4CNH7WS3IMW5SHiCDyvz2k0DcLxsVFMpc3Md32j6fB
   3PjoHI0Up6FnS5ZAd/w4SRDJQ8S0j3tLcn3Pc0eaynAjqoJoI2aYChtNo
   yiX42GLgg7vVVfCkRBqbt9MjDNR/h5j3pFKCVpy9lflqZYynxF+N3KbDc
   rlJLd2l+HeEaRpqok4rTSXMYn1OPO+wCXKF4SJYwKRIgWXUDDt/oxxp3X
   X5mDvVM1y1CGhMicDyjZjcO2L7/OPkjUrFyXqGBDEGP1ZwLwYN9jvVCUt
   rt/Px347NC89HBn0EzXrCHCbViV0mxpSPX7Ch6P1q4FdIVZDLm+7Oo4ME
   g==;
X-CSE-ConnectionGUID: B4ffp1ALSjKWb0uJfw2sUg==
X-CSE-MsgGUID: 0MqoVO07Ql6hiYkpsM+9JA==
X-IronPort-AV: E=Sophos;i="6.17,284,1747692000"; 
   d="scan'208";a="45692356"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Aug 2025 08:14:30 +0200
X-CheckPoint: {689ADBC6-33-AD8F5F64-F0EACAA5}
X-MAIL-CPID: 742ED08D02BE758A2A1B26C8759E02E3_1
X-Control-Analysis: str=0001.0A002104.689ADBC7.002A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AFFA16835C;
	Tue, 12 Aug 2025 08:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1754979266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7kDMXkiqwspte3OFxiCO5uJIctYbcK6fSwBNuY8L+04=;
	b=VOm5I74Oo5znWlaXmN6u8OJRm5q/YOa+tu/QK1DPY5JPD+J7KZGpK5JP+DU17ptUV0Hb3E
	zH0KCm5pUcm6jc+JsrDLMmMdfbkLdqmuDZgGcNI/xvacXZt35YOmrj5rS/9qA01yQEkhMJ
	qehK313US2ohYsMtXl+5cbLNmpe9CNMuB0qhy/HsC7aaAqu2XMQP6PVnkDcsIvmCJYaCfC
	WjOI/fho5sWWLpFhNWOR9IAwC/vgZ4/7MJ2OQsWnx0gS9ILCSyIHS9ec+va7ZwIFDbnqM0
	D2KA/TaS1pwf8V1K4T/3Ax/ptch+2mCRXDQ/5g5cJwC/31mROSUCp/lNkZNCXQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: fsl: fsl,
 rcpm: Add #power-domain-cells
Date: Tue, 12 Aug 2025 08:14:24 +0200
Message-ID: <2799138.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aIv+CgkePusUoT6Q@lizhi-Precision-Tower-5810>
References:
 <20250731055806.2265628-1-alexander.stein@ew.tq-group.com>
 <20250731-funky-crab-of-defense-7cd658@kuoka>
 <aIv+CgkePusUoT6Q@lizhi-Precision-Tower-5810>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Frank,

Am Freitag, 1. August 2025, 01:36:42 CEST schrieb Frank Li:
> On Thu, Jul 31, 2025 at 08:32:57AM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Jul 31, 2025 at 07:58:04AM +0200, Alexander Stein wrote:
> > > dtbs_check for ls1021.dtsi warns about unsupported property:
> > >  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' d=
oes not match any of the regexes: '^pinctrl-[0-9]+$'
> > >
> > > But if removed the check warns about missing property:
> > >  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' i=
s a required property
> >
> >
> > And if any other warning says something, are you going to do that as
> > well?
> >
> > >
> > > Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cel=
ls
> > > for power-controller node") explicitly added that property, add it
> > > to the expected property list as well.
> >
> > No, commit does not explain why! It's one of this NXP commits without
> > explanation, doing random things.
> >
> > No, explain why do you think this is a power domain provider - fast
> > look told me that it is NOT.
>=20
> It is not power controller. rcpm controller enable wakeup source.
>=20
> In arm64, use below patch to fix warning
>=20
> commit e39f567e1c38c29629962ab327f0ad1a288dcab2
> Author: Frank Li <Frank.Li@nxp.com>
> Date:   Mon Jul 29 14:59:24 2024 -0400
>=20
>     arm64: dts: layerscape: rename rcpm as wakeup-control from power-cont=
rol
>=20
>     Invoke power-domain.yaml if node name as 'power-control'.
>=20
>     Rcpm actually are not power domain controller. It just control wakeup
>     capability. So rename it as wakeup-control. Fix below CHECK_DTBS warn=
ing.
>=20
>     power-controller@1ee2140: '#power-domain-cells' is a required property
>             from schema $id: http://devicetree.org/schemas/power/power-do=
main.yaml#
>=20
>     Signed-off-by: Frank Li <Frank.Li@nxp.com>
>     Signed-off-by: Shawn Guo <shawnguo@kernel.org>
>=20

Thanks for the link. I've applied a similar change to ls1021 instead of thi=
s patch.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



