Return-Path: <linuxppc-dev+bounces-7336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4215A71521
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 11:54:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZN3Z6606dz2yf9;
	Wed, 26 Mar 2025 21:54:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742986446;
	cv=none; b=FaUGpPQMyd+kXxH0Uh6shN33OnilQnSZ+QMeYp1iThelg2gvXzDt5FaTNL3HdDNB61nDUjLCIKRFunsrHQyPe5UhYWChLvkzuFJ5DsuFAzkOEyUJvI4U+Q5qtgXpW7IqGNPgtjwfiWoaPpExwA23Mh8NrrFouFzjig2QOV135k5vnWs7fEe+ARt2x0bJnc2kzOqS//mRbQ5FvUgvA5vJdrPZSpdwQD3V69TRvN7USDmW+9LTfPQwstCqL1K1aZzu8zu9+0rpLQWBJ+17H/Gy8icxYOJ5G2AqCpyjzdasNmnDgBXS/cpI64j3Z1Yi40549H8qIPcsIVYv7IZwM3BTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742986446; c=relaxed/relaxed;
	bh=9o+Qa+LVHu1xbjxfpmNsVxdbPzp4GNai2Og/XLlEipc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 MIME-Version; b=fMDbNZpF0JNV+Git92QgpTmuza7BO0Mpb9g9wSXYb7fkwWii79k37N3Pn7CGBOkLAOWWMtc2LVIttvUjhKBQJDE1pAM94qCFK4D1OCnjlxT7KAv0852hJoiAGjDIJ4uRDswKUyMZz0Ev0Zj09qJGnMzqpvuJ5affYRluVxeMKdQCbfu8CxI7GFXS00ebRftsLj6i1WNQ8W3of9OXBnh0Hvv5Tg4IjwraQi6sjm4Lmqp3OXzTluy8xz7A9w9rJZXuRArevkExiwwool77mM894wtoBUDbbWmH7M6Ohec56+mreyjvUMX0OIOfuoanHn7lq9n+Az3nCv4z5Oh6i7MUuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=Y/zV40kR; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=Y/zV40kR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 222 seconds by postgrey-1.37 at boromir; Wed, 26 Mar 2025 21:54:03 AEDT
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZN3Z32wMYz2yRj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Mar 2025 21:54:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9o+Qa+LVHu1xbjxfpmNsVxdbPzp4GNai2Og/XLlEipc=; t=1742986443; x=1743591243; 
	b=Y/zV40kRRE+AvfD2rgp8sI6i3nFHIVWgd2FftCzT3MxG8/EJhUNvczjlO5rhb9Qb/oy79NyWHwL
	sHJVIPS+zxsh1uOl6coQFs8XLtmXNxYhsPzwDGmU92RfMQQfWoWiJZKz440VFCZFzSLaAXsrVNSOm
	O8jkhHCk1muZLtVwdu+EZW5jue92Mef37GJrwgGgNIGQrF7rtR18ebqOaKJiSMZ+Jvk3ItrL7D7WS
	NyMyrDRr3Qo4qNEMXoxtqAGyy7z/6V0UgBVvET/UcCkgiqWMBBzjZKUOi5Gdj9DqHZJeUts2gQTXR
	PkBT7zBO5ZkejcwUnQCx26TMLzPYFj4GZBpg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1txOKm-00000001fAg-2mwf; Wed, 26 Mar 2025 11:50:08 +0100
Received: from p5dc5515a.dip0.t-ipconnect.de ([93.197.81.90] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1txOKm-00000003xtV-1Zlb; Wed, 26 Mar 2025 11:50:08 +0100
Message-ID: <90872dd1a7f8844e313876afb74ec15aff7299b7.camel@physik.fu-berlin.de>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-1 tag
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: maddy@linux.ibm.com
Cc: adubey@linux.ibm.com, amachhiw@linux.ibm.com, arnd@arndb.de, 
	atrajeev@linux.ibm.com, avnish@linux.ibm.com, christophe.leroy@csgroup.eu, 
	gautam@linux.ibm.com, gbatra@linux.ibm.com, jk@ozlabs.org,
 kjain@linux.ibm.com, 	kuba@kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	mpe@ellerman.id.au, naveen@kernel.org,
 npiggin@gmail.com, paulus@ozlabs.org, 	robh@kernel.org,
 schwab@linux-m68k.org, segher@kernel.crashing.org, 
	sourabhjain@linux.ibm.com, tglx@linutronix.de,
 torvalds@linux-foundation.org, 	vaibhav@linux.ibm.com
Date: Wed, 26 Mar 2025 11:50:07 +0100
In-Reply-To: <2fff6b84-52af-4320-8c8e-9aca1c009127@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
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
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.81.90
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Madhavan,

does the removal of IBM Cell Blades affect the possibility to run Linux
on the PlayStation 3 in any way? I assume there are still some hobbyists
using it.

There is at least one user within the Debian community using Linux on PS3.

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

