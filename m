Return-Path: <linuxppc-dev+bounces-10757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7DB1E906
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 15:18:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz4N669GXz2xK2;
	Fri,  8 Aug 2025 23:18:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.164 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754659094;
	cv=pass; b=V412tdZQzqaPBfFp213LW1/gcMhG9p2sPTCx6kUuc9s3A6vE9wXWw7Qy87kJNEBz2FyhhBemmxFkuJwuaAauyNuOAaW4MCpA5SZBJHOBcF7nT4/5Z6IVpDXiQ8Vh3EtTgKOnrb1scrYFLTCNm6cUxX1tFCCzvIlgpHxJyT6riMJXfnY41dFQ3Q84vtHeT2a5UnH6scYyAozSI2vjV47vD9mcBW6IgEptC+0wt0ICY6QPZBRRs7deENgEH0r9y7scvMinsGixW2v9c3bqQUCJa4F+322lZ0eA59kAavvb+fR1IDOHWUpJKkK8uAr8V+RLnBnRt58JykYv2qozw4Y7tg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754659094; c=relaxed/relaxed;
	bh=p2Y45Ktt9CtkLqBn7fSn/cr8xfUX1/HkVgdCUE0axa0=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=EFseFyrXzM03HSgSQcFKwKG1c1FFzsehaDVle/MQhYPeaKn1G4M1GCXiQ0iKPDe8I4DLT8H1IQAqL3/lA3MYlEwSPrx+yJvnM/xXE+0l4ZWRBc60QAxnr2tiXq6mvUEycIPSI4tS2FTVZj9FclcK2vP2bHriYfcByXFM1JLvBVxjvHdrBGfb7P4AJB34lrNRdWuqihzP0ZgSOEXgfjrQKGtqF7WsOLA4MFDzz0sl/XRZfGYkUScGl2q5VXL4/Tsu7dVL8HDJ3Ln+Qgrn1RmzjlRSWmkGCdY0UWfY0p3wnBY/P46xLhKlS8S5LmWQTkXSggk2ESdlQQwCoRO1ciWEjQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=XROLwC2e; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Ee0zbmUK; dkim-atps=neutral; spf=pass (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=XROLwC2e;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Ee0zbmUK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz4N341RQz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 23:18:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754653682; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tWLrvsbigdmTagAoyCM142OOI2y9OaSUDlGbMFLVCrC4sTwZq0NH4ndLZiBmj2Ovzk
    cxF6lZ6dVf8USDgY26onDBNxXDM0q+KYT2TKA/5LL6d7BmuO9ocoxAVHAD/kmUC8inGB
    7pvQYTUema8eTnIpEE5JZNfVtXFQZl+T5XjskOL/TOfkhxTcqBiKhHZ7VViLVxXTDjp2
    BmT+xgJb5RoBkJNt8igA27LyJcZLy2ZEGL0gTGuqJu+KyLwE6qUVM+4dibg3mEIPaok2
    +uPIE8hag3FrmRUYaIXuRmwVPV2F8g7mF4PC30vnuKgMydeEhgezdkQ5WN7EJDdcunBL
    TPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754653682;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=p2Y45Ktt9CtkLqBn7fSn/cr8xfUX1/HkVgdCUE0axa0=;
    b=Mu4/tESiVCocc0EJ5wdA+4/WhDPoo6H5QAxFdHQlH3pgFVEjFx3TRgiMMa4zbhRXVY
    juXn8hqoNB3Zu8EvwlFh2Xem/ztMwAxCBgh8ybRL8jL9yMjr635L6fXhKUjHRFxEcF3Z
    fst6nvEOA8/819pfU/0N29F0LV8XojB4Qt/4+/1yne1rfTEC27YmE48H/Y30n71HUyDs
    bNvvnnH9q91+8059Mryv+HJSS9oriszxxgH84AlcmNUWZCEqyHNFGbVTBluwQBAdYA4Q
    PVxhKfbyryBCZyWEpF8Fqhvkaa68b8etTgiKcNSayyhQmoBgBctGgZncK7ICP2OEVZiG
    6sMw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754653682;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=p2Y45Ktt9CtkLqBn7fSn/cr8xfUX1/HkVgdCUE0axa0=;
    b=XROLwC2epE0YLSozvEGGFc1KXr15OEYz0QfG2IY46UrBx0SC+61ApROLDPYsX/XtZn
    scOKpAF8wOmMzpkxg1QPeFNyP5nWgdayXT70yY2eNLm8qeaXJZ/s/X/gxD0JCN90n5SN
    7VYCah6Kc9zrX85PJOSl1TP/i4Rj4T+qKiOLPf+pis0siKExa82Fjb8LC2utuil+RQwz
    Usxn9PGPJS1n3w0EjNq1WxZQ22qfOZnGJnUHnw3DXbpYe3qR/oaGH/ulZyl+a2KIIowZ
    bzY/v3BnhfPLe/y0mMgHAJogkyoWGyvwytRTMZ+eHf1M1+hEQTNGIFeUp63Ei+cg4OqK
    iJ7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754653682;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=p2Y45Ktt9CtkLqBn7fSn/cr8xfUX1/HkVgdCUE0axa0=;
    b=Ee0zbmUKRhPFFqgm6EWJ7dLsgMrFyK6Cn5w/bHnuKIx0Xx5BhTcP+piUFqpRbb4XcH
    6yNou6QlH+5qGv7Ye3DA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m2s3nHCn4174Rhb0mYyao0unG2oENUO6LNlA=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c178Bm16u4
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 8 Aug 2025 13:48:01 +0200 (CEST)
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
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and setup emulation
Date: Fri, 8 Aug 2025 13:47:50 +0200
Message-Id: <0B029DD9-085A-4AD2-B3A0-4C427A1540EA@xenosoft.de>
References: <66083d23-e60c-4fce-bad0-81dbb9dcebde@kernel.org>
Cc: mad skateman <madskateman@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>, ville.syrjala@linux.intel.com,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, bhelgaas@google.com,
 benato.denis96@gmail.com, Yijun_Shen@dell.com,
 David Perry <David.Perry@amd.com>, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <66083d23-e60c-4fce-bad0-81dbb9dcebde@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
X-Mailer: iPhone Mail (22G86)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 08 August 2025 um 01:23 pm, Mario Limonciello <superm1@kernel.org> wrot=
e:
>=20
> =EF=BB=BF
>=20
>> On 8/8/25 2:36 AM, Christian Zigotzky wrote:
>> On 07 August 2025 at 04:21 pm, Limonciello, Mario <Mario.Limonciello@amd.=
com> wrote:
>> Does applying
>> https://github.com/torvalds/linux/commit/907a7a2e5bf40c6a359b2f6cc53d6fdc=
a04009e0
>> help?
>> - - -
>> Hello Mario,
>> Thanks a lot for your patch.
>> I tested it today but unfortunately it doesn=E2=80=99t solve the issue wi=
th the Radeon framebuffer.
>> I have created two kernels with and without the drm-next-2025-07-30 updat=
es [1] because of the issue with the Radeon graphics framebuffer device #15.=
 [2]
>> Download and further information: https://github.com/chzigotzky/kernels/r=
eleases/tag/v6.17.0-alpha5
>> I have tested both kernels this week and I can definitely confirm, that t=
he issue is somewhere in the commit drm-next-2025-07-30 updates [1].
>> The Radeon graphics framebuffer doesn't work with the kernel with the drm=
-next-2025-07-30 updates [1]. Without these updates, the framebuffer works.
>> I bisected yesterday. [2]
>> There are some other user reports:
>> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60606#p60606=

>> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60595#p60595=

>> They use other Radeon graphics chips.
>> @All
>> Please check the drm-next-2025-07-30 updates [1]
>> Thanks,
>> Christian
>> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D260f6f4fda93c8485c8037865c941b42b9cba5d2
>> [2] https://github.com/chzigotzky/kernels/issues/15
>=20
> I think there is a mistake in your bisect, which I notice from looking at y=
our other user reports.
>=20
> The original commit you identified in your bisect and thus CC'ed me came i=
n 6.16-rc1.
>=20
> =E2=9D=AF git describe --contains 4d4c10f763d7808fbade28d83d237411603bca05=

> v6.16-rc1~50^2~19^2
>=20
> There absolutely was a regression for that was raised, but this was fixed i=
n 6.16-rc3.
>=20
> =E2=9D=AF git describe --contains 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0=

> v6.16-rc3~13^2~1
>=20
> Users in your forums posts talk about 6.16 final working fine.  So I think=
 that when you bisected you ran into multiple confounding issues and replica=
ted in a similar fashion.  You should check every single bisect step to see i=
f 4d4c10f763d7808fbade28d83d237411603bca05 is applied.  If it's applied but 9=
07a7a2e5bf40c6a359b2f6cc53d6fdca04009e0 is not applied in that step you shou=
ld apply 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0.
>=20
> Hopefully that will get you down to the real cause.

Thanks for the hint. Unfortunately I don=E2=80=99t have more time for figuri=
ng out the issue.

Two facts:

- The Radeon driver can no longer be used.
The Radeon driver is broken for us.

- The issue is somewhere in the commit drm-next-2025-07-30 updates [1].

I cannot provide any more due to time constraints.

I've already spent time that I didn't actually have.

Thanks for your help.

Christian



