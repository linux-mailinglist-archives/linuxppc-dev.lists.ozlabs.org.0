Return-Path: <linuxppc-dev+bounces-10558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D089EB19D63
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 10:11:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwTlw40xkz3069;
	Mon,  4 Aug 2025 18:11:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.53 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754295084;
	cv=pass; b=WpUDiMLDTqWrklWvFWS6z95eetHEHYdI0qbphBUp1T67WmHS5s1IPMUjymeFA/c7kEhj0KCFNFReef61IZcsWcCaPJ+n7jRp9bReJZWIcgQYc1gpwcXfakLeJ8XJeWNkPLdBlwaJnraDwYAy5uDVuYQQkKgiJ6q2KBJ8vgpM96hv+Q4eUFw4v/IJ2dn3bh11gDXjuENQ51iRMMO3wwaq/SctcGYx/OGxxER3N1ks9LkvpY/CtKcsJMUzxKGBkTH5fSevUdb+/tD/krJl5EiRiT1LhUOK3OzRNjyXX29/qCWkN5HXor0zITto/Ddvr+PmoVyc+Zu45ip/ehUHDWDtYA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754295084; c=relaxed/relaxed;
	bh=ra0Wt+Dxo6dN2T5DbDVBqna+6dENDlFhPnbgbCnzFiM=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=AGrIGbBP8SxdCQ0SmzCzV3kqil4ge3/JLRihaJAhcRUmPbK6gJfGp3RiqMr17Z/RvKYZ1z860s++iHkYP22w9Er2HeRbW9bt6q15dRR2cPES6uIz3WUD7u+4l7Pr36u/ligztO8H/96XB6c7lTTRQfA7dk8FbgSG26M0BvpjGmNwSNrJL0JU8uql+18E5ivklf9iUb/Dh9bYT5HNhepbnJNHI7BEEungzfsrREcKGz4MvuEllexC/vngdxY/3/zOiS5swNzQspKGkeCW/bDMUCbvP70XWn9mPd9vU/SekKZb37j5DUERvQNQn/buC+x9JJ3Qq698MTrRBu+I1swuWw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=q8bdhjPF; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=+Kw1nIp/; dkim-atps=neutral; spf=pass (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=q8bdhjPF;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=+Kw1nIp/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwTls1Dxyz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 18:11:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754295074; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pnIMpA3bf2NgT6NQFoqdEn1yIjZudPe6b6WcukNniL7uhOHX31KdJ5rIN35VsQ7LeF
    ru+B3O89gJOdk/8RJjXNZyxFTuHqbBwN/D3uhhhur3r6ayGAv7zyjKscPEwPDMlQYsvJ
    Yr7Chp1CtqzAY4kr0A1+z2aQXTdpvgFXQSdJPPYmBtecvqlwwEYWTEVKPJOIBAIxPAKb
    F2Mh4NmUjlP676/cT15lqh3OJvolc5RwTiJ5GtX5MudjCQzfHQNk+OvYtFqiZ+fzRBua
    x3GhSCQyOg1E3uVX+9DaKjix2+gZPWdAVchxgSHZHoN9HZSAAV0Mowz/hbEuJ9kqiprZ
    IZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754295074;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=ra0Wt+Dxo6dN2T5DbDVBqna+6dENDlFhPnbgbCnzFiM=;
    b=UsJpvlfiPf89m43zoCUi6DMd6D0uXp2H8LhF9vx+fWXcodqCLjOlvxKX9L4y8918wm
    pruqUyKLo93QJV3mgWDjCKoGxBwAEh6mYqKeTItN5xUscHnziZlQnPPxr8Ww7IHMbdCX
    SoxKu7jQxDSxh9VeZHZTU4BIjgz3O4nSnCwU07H/XyDy6cAZUH9xC7MP71hBiQHcNGwK
    8fkGVt2ruFiZvZoAIq+SwnWZMFNslFyAwKtHv45YDxFi9N+CVKC8qrcgfLtvpd5v7dG5
    i9k9dzLOK+04l+i6Tmqrs31i3VULLCLkkqtU7CZlwSkRnJVA2lxQ7KWox9xuptqML0l7
    bWUw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754295074;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=ra0Wt+Dxo6dN2T5DbDVBqna+6dENDlFhPnbgbCnzFiM=;
    b=q8bdhjPFrddal6FTNmmwCl4Bs5bjdTns8MuOq0dLhJWvKNf8icHDtzX4+W+RK7B6Pg
    jzawM09kD+34OoV413PMuzDxU0LiONcT70Sj+rXYz/0RZuOzitMnNn3ZFrQKw14aVvO+
    KItlkC5GhjizybUMOGR1CrgpDVUvYt1Hl8D6YNCrTZthhNiqM0LWv4yKSabMKjmMZMZK
    08dC8C0g7equdMy386GhX1H8TBiB7tHK8o2ijA6JwTpx0i6IEGoZtkq85xQSgb4i+O5/
    S/uWmervxGEDA+9P4nrhMcwOucHEPtcmhsy5Ia+E2UW2s4iWEhchpY8ni24HHqj9Bwdl
    w7TQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754295074;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=ra0Wt+Dxo6dN2T5DbDVBqna+6dENDlFhPnbgbCnzFiM=;
    b=+Kw1nIp/LKnvfyd/j4KkJntH3BWfFjJiXTYtn3UgdYqy/+LLg7rlDeJ+6o7dit+NvH
    6QUtnHi3IGP2Jk6EntAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m3s3nEDSmjAPgVOZ6aPKEsRnJgfV7XkH5ksgU="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c1748BDqkC
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 4 Aug 2025 10:11:13 +0200 (CEST)
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
Subject: radeon_fbdev_river_fbdev: failed to initialize framebuffer and setup emulation
Date: Mon, 4 Aug 2025 10:11:02 +0200
Message-Id: <146D0876-852D-4BBD-AC77-D10245AA7E70@xenosoft.de>
References: <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 "R.T.Dickinson" <rtd@a-eon.com>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
In-Reply-To: <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
To: developers DRI <dri-devel@lists.freedesktop.org>
X-Mailer: iPhone Mail (22G86)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NORMAL_HTTP_TO_IP,
	NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

FYI: We are using PowerPC machines.

+ dri-devel

> On 03 August 2025 at 05:28 pm, Christian Zigotzky <chzigotzky@xenosoft.de>=
 wrote:
>=20
> =EF=BB=BFHello,
>=20
> I have the same issue on another machine either. Blank screen during the b=
oot. The Radeon graphics framebuffer device doesn't work anymore.
>=20
> Here is the modifed code from the DRM updates (drm-next-2025-07-30):
>=20
> - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/d=
iff/drivers/gpu/drm/radeon/radeon_fbdev.c?id=3D260f6f4fda93c8485c8037865c941=
b42b9cba5d2
> - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/d=
iff/drivers/gpu/drm/radeon/radeon_drv.c?id=3D260f6f4fda93c8485c8037865c941b4=
2b9cba5d2
> - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/d=
iff/drivers/gpu/drm/radeon/radeon_display.c?id=3D260f6f4fda93c8485c8037865c9=
41b42b9cba5d2
> - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/d=
iff/drivers/gpu/drm/radeon/evergreen_cs.c?id=3D260f6f4fda93c8485c8037865c941=
b42b9cba5d2
>=20
> Do you have a patch for reverting these modifications? I would like to rev=
ert these modifications for testing.
>=20
> Thanks in advance,
> Christian
>=20
>> On 03 August 2025 at 1:35 pm, Christian Zigotzky wrote:
>> Hello,
>> Xorg doesn't work after the DRM updates drm-next-2025-07-30.
>> Error messages:
>> [dr:.radeon_fbdev_river_fbdev_proe] *ERROR* failed to initialize framebuf=
fer -22
>> radeon 0000:01:0.0: [drm] *ERRO* fbdev: Failedto setup emulaton (ret=3D-2=
2)
>> brd module loadedm
>> lop: module loadd
>> mpt3ss version 52.10.00.00 loaded
>> nve nvme0: pci fuction 0002:04:0.0
>> fsl-sata ffe20000.sata: SataFSL Platform/CS Driver init
>> scs host0: sata_fs
>> ta1: SATA max DMA/133 irq 68 pm-pol 0
>> ;21;39mfsl-sat ffe221000.sata Sata FSL Platfrm/CSB Driver iit
>> ata1: Signatue Update detectd @ 0 msecs
>> scsihost1: sata_fsl[0m
>> ta2: SATA max UMA/133 irq 69 lm-pol 0
>> nvme nvm0: 4/0/0 defaul/read/poll queus
>> nvme0n1: p1 p p3 p4 p5 p6 p7[0m
>> drm:.radeon_fbdv_driver_fbdev_robe] *ERROR* filed to initialze framebuffe=
r 22
>> fsl_dpaa_mac fe4e6000.ethernt: of_get_mac_adress(/soc@ffe00000/ fman@4000=
0/ethernet@e6000 failed
>> radeon 000:01:00.0: [dr] *ERROR* fbdev Failed to setu emulation (ret-22)
>> fsl_dpaa_ma ffe4e6000.ethenet: FMan MEMAC[0m
>> sl_dpaa_mac ffee6000.ethernet:Using random MA address: 0e
>> Could you please check the latest DRM updates?
>> Thanks,
>> Christian
>=20


