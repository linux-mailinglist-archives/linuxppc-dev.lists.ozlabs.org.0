Return-Path: <linuxppc-dev+bounces-1679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838F9895FA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2024 16:37:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XGmyG2KjLz2xl6;
	Mon, 30 Sep 2024 00:37:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.164 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727620659;
	cv=pass; b=Ic4zkTmENmdybafeEJbYLNubvQisxu2BGmpKdy8EnhJ0lhDqEhj5AkaF69O54C/wrJu3rEUtOnj1+Q5eNErWZrUxZhyIRxVqhaolY8TVmWvm2ccra29qbW7vxJbdS6UrwQLDIkztxkvv2c8TfPfsT0UXwFV/lTSSow7bLbAz54ah1Yep9jsuxkKvzhThSOKHIDTYZak60hmk1MQHrTynu03jDCnVg55WMJxyFGF+rocTq8oTacJ1CkZT44wEuIxNW59rJGcblAkGVghf6CrzpcmCmr43Ej98cKrvs1VxlqNxvyVzOuCaf2Jbe3mQZulE0nGTFOaKmUjOWjLz6Y8aRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727620659; c=relaxed/relaxed;
	bh=xTlmt9OtlFYXrF7MkQW27hTuUMeHPuXE1OIEGFh/DEA=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=FmJ71IMVF7ptsrdShjVo6Z5I8v9X5fm/Y7tJF859kG7LMGbaZU/55H+q01scbv9rdsXjnPAQ9V++rzIH7iBUccAzCTvV8Z9MJZaRjeC7PgXty/1LI8ZKotM6el/Dy/XCnhasu170Ybw3bTfZm+deJ+U2hqHM2Fw2g+YdejEykC6ZDzha8WoXa4dPrSlqrijFgJDRJy3NwXIkq3OjUgKzJCcPF8ZXPXVc57IDkw8KhUa6pSQ1RRRlZYQBn0AozKD/s669EeodDVUoxLqfmy7/A90Xxwvt1PYIsle8gJJY1aIPN7dR+fSkgm+kT8nSDf1qTQeskvd5UwecqMbUaYwu+w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AN3J/NuF; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=G693hetU; dkim-atps=neutral; spf=pass (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AN3J/NuF;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=G693hetU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XGmy84LZMz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 00:37:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1727620643; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=o50ap7lkTl42EXSBZ+uouQJocsZdNj+Qy7Nis+xJiRwu0AheVGXXJOgH2va9eTz8CF
    msFhOkaoeUYZjD17A64zYoVR1hz4wLG3DwrDLUSNBO3npAUiuyP9cYsDsRZPfmd18yvG
    imkNauUaVl/rmum5vMQXZNu5Ezi6dDfZr1p4D69F7p/HUEi5S+2HLMf0F4gXuKIZtfsw
    F1NO9s0fwMOLYG8AW3NLBSAEPrri5C2hFpOn6KrECCp8VcyqYxIlM2beHa6ZYmDsPPuV
    thKTW2WeZ+qtXBczfrGE2l/FuirunGyRzI+pSRWOKP7s0dTbWERQ744Mj/CYuFjzitPx
    f4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727620643;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=xTlmt9OtlFYXrF7MkQW27hTuUMeHPuXE1OIEGFh/DEA=;
    b=k/qsHbCJrpiTIphRZJzr9ORnMDrB6h3HgSMdpcKJsIEnBmjf6icGvDZHhjyqmcPJ2i
    V5dx7T31pb6sHX1XYv4gskdvlpsG4kUbkvszDj0lI1tLDobdazjiJSe2FgcY8g1u2+VL
    BYqxIqz6/EnHrHAZwKgkAjQmWp3hThehrzglYgawwMepWW06L/1mYrBfOruVhmdm861/
    msVqtvxfbu8ZLmfZ2Ftxwpw6hRbuBgyzPd+MNp92suG+3a2pY/gGrMpnacqxdTMFyG+B
    Lavfy9Ot8GWg6RzeCujLuN16J9YAuwwlKIZi29ew5bteodUfHXytgTsP6f9ZxwKRxnor
    yFSA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727620643;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=xTlmt9OtlFYXrF7MkQW27hTuUMeHPuXE1OIEGFh/DEA=;
    b=AN3J/NuFeBU8Giva0DXSDBXYP4oWSUg23TrUrgei0anJrbrrZD+fBL9wHFQfVqc8b+
    zq1ySJ/wqPN6iBiDVNEArhKAVINBQXL/0LcWK819wwx6Ehb9Xd1B8LeyIKmW2hodOncS
    1tkiUAcH24DT8jx35V8cKqqWGkQ4NAa9jTU+76UrDuTu43jWAqM8NaXjFvxzBb0bNq4G
    vuECAz9qeb9HumSd1MiUvct5vnCL8cdWc2YC5eRBozYgZWqmabNKsmcm/iAQDhFIK4mo
    xge0t2xWxUBaIGdkTSMe1wDEV4bBbG3QIvQhgewnKFeFu/ubL2oRbFd7J8OtmuRdKNqc
    2QjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727620643;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=xTlmt9OtlFYXrF7MkQW27hTuUMeHPuXE1OIEGFh/DEA=;
    b=G693hetUE2cguG+2twHVyVufo25xyytGjjexf+w6xZ2dFQDnpUOeV8Ec6BXd6+dxn7
    2pNlc0P8rpIQCIxx0oAQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7VpixsyiSXHvOldBC3Q4gRH8qR5blLZ9VChEUEN0="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a08TEbNOnS
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 29 Sep 2024 16:37:23 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: FSL P5040 board doesn't boot after DRM updates (drm-next-2024-09-19)
Date: Sun, 29 Sep 2024 16:37:12 +0200
Message-Id: <37D93804-DC55-4B2D-A82F-85BD45D9E131@xenosoft.de>
References: <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
Cc: developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alex Deucher <alexander.deucher@amd.com>
X-Mailer: iPhone Mail (22A3354)
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

I tested the latest Git kernel with my VAPOR-X Radeon HD5870 1GB GDDR5 PCI-E=
 DUAL DVI-I/HDMI/DP on my PASEMI Nemo board today.
Unfortunately it has the same issue like my FSL P5040 board.

I think it depends on which graphics card is used.

It could be, that FSL P5020 boards are also affected.

dmesg (via null modem RS-232 serial cable): https://www.xenosoft.de/PuTTY_P5=
040_U-Boot.log

Please check the drm-next-2024-09-19 updates: https://git.kernel.org/pub/scm=
/linux/kernel/git/torvalds/linux.git/commit/?id=3Dde848da12f752170c2ebe11480=
4a985314fd5a6a

Thanks,
Christian=


