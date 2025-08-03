Return-Path: <linuxppc-dev+bounces-10532-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6210B193DC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 13:33:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bvyH360tdz3blF;
	Sun,  3 Aug 2025 21:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.167 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754220783;
	cv=pass; b=opQt0w5nk5exWFEEgbo4Y3BtXyonAUzk5mPv7HyUuDW0YanUNcuDw1kOcWPIDo801YuvDAiGvNWdsmQfcjWDjCP4L6+rgd0lAZkxIa9UsAiS7DLZe58ZgQCrC+JdJh4o/4B6/PjR2ths4DEPRMEHRyt8BqjNF+sUj8734PQ1BLqzgPDjS65S3u7ydcuGk/aoxRvES53GVR3XcJcJ91ZYjFlbPed8udZ1/Hf4yZ4+UWeUBB/s2djhZ1Q4j2a/r/QKIABMDsOaM6SAihsc/7YRK42V/oT37PNzlPXKmGvxGDK1+bVMs15yjutMYDl4YOwCrX/knlxH6LBbDlM+i4eoWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754220783; c=relaxed/relaxed;
	bh=SNEoyn7T9Jf3eY4s0gy6qI079kIQlXQ2LEXIgvF5lX0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RJhDGEIy+oW5bYlAuL2A6XDgLTeU31Tk9L+vxYDd8YtL9uaIUbsN1FhusA5lSnGKiitetJ5k2NenAyf6fqjRx4NukMjS/Msb5BeM4qK2vN/Bmj5wlmwWl9xKOzOowbBsYND7222uUYBjzt3Owb5p4koxLouIe7nCQoVO9jEaMJFkMxPNGy4EIfGQYd7hUV6CLY/JKLu2nAZICz2ljeDxKPxsJphmt+gTtGBXx5kUToFqeylHqlgzOKK2jH1JBAan1DJ0GhIyxAtcudhsmzrfsCuA/GOw12RTIjtOZtjRQRSfwpRxmjrFwTKlTRteQpYk59we8JrwQFx1wBm06P8ZLw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ccy9CSRv; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=S9UHsKiX; dkim-atps=neutral; spf=pass (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ccy9CSRv;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=S9UHsKiX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bvyGz5V7Kz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Aug 2025 21:32:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754220760; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=coGiJ2glh+WFSDRY2Rz4qXmCrRMeU1StWuSyTYpuL2liePIHN6PAkg//hzJU4JRc59
    AghTVr0QvAtDX6MvT3fNr4it1DoQBRnGnOgpZL80Gv+b7/iyYYklBqTBcok1SO7zKQLu
    EOL306SDqjHrTENu7RJNH63M74he4M96bxc8pAKrhGoLEt5pWWARnxCaIyd1CZee0uA0
    cv9168n4+2jBZrSmHyqvpjFSKbCbZSg+K+B2CSlGDEbudk7VDEnnpzVd0uCQHd6r70QZ
    rFkrtXxXLMOLSzP+wegpQcb+bYM4oxDwqTdiyBQTe3/ki5eG1q3ImyQziOK7VY/x23e6
    yY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754220760;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=SNEoyn7T9Jf3eY4s0gy6qI079kIQlXQ2LEXIgvF5lX0=;
    b=URDBeuBUOXe3gbCBtKXLTvZ91lfCGaP4iYZOgVuU2n2mO7hNXagdaDechonOnatK1g
    D1AuiU74N1Q+B37AZYXFlfFDFaCvXpL2hCjsIQFd45ZjFrIutfcsJiArMaRCXn5lIeCY
    BMx5sFKqcoXBTS0UWyl/YIR+vfvCJUwhH6hXvuRsjOylmZVFK6p9zBI7e8PdilMZ8Gbo
    okeL8U4pWKeCovgaBd7BR9iQ1JMRj0CShdPVIddGpQeeuMpJzgSJgU2ltI3/QloKvJgu
    jq26V8k+FvhlMSMOjv4bA2T3WtyZpSh3fap6Av4mm3j1xgidVVflzEvoMtvUTJzbTFvn
    gxBA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754220760;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=SNEoyn7T9Jf3eY4s0gy6qI079kIQlXQ2LEXIgvF5lX0=;
    b=ccy9CSRvcwfsag+0pITwPYYGpp6vVQ9Kx1Kej905OLWneUOI6Q2nu0WdWB1ag0ci6G
    SCVcofRfa4AJ6teMPpBLpBlhNnS2EXqgWntNiw0SCizeP49sINy83xrremtlzSdVD0Ir
    0yu1MjkeH8YmZ+HVIoU+VKTSVIcNY91UTgQXSy3qbTCI5IaUaIKda3npL9BHXcno21gT
    xU9evMe6lJEll7w6e4++0Dz2kHXjbF1KU/WG/lLIeFYNO41smf84KXB/DhcxX2uVnlOG
    nhxbKikovko0qN3MjvjG73E6jte+rPpgA1eJxYZtLuZiBHLjw/JGV7dqaZVyvpTqbFzW
    DwhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754220760;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=SNEoyn7T9Jf3eY4s0gy6qI079kIQlXQ2LEXIgvF5lX0=;
    b=S9UHsKiXOIs7LMgGBI9lHMLzpYD7+0vw6ZKc1re/8nQbdt/uWvBpWcu7nhRkhesgDb
    fr5ehCMPaFEuEa8Bm2CQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErqxOiEafo+kdhkEpPpx41Heyt0x3tq7WaTEcs/"
Received: from [IPV6:2001:16b8:50d5:5a00:c7b:b07e:8953:b246]
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c173BWcoUF
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 3 Aug 2025 13:32:38 +0200 (CEST)
Message-ID: <6ba8d730-52f9-421f-8d8a-887545f0ceac@xenosoft.de>
Date: Sun, 3 Aug 2025 13:35:18 +0200
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
User-Agent: Mozilla Thunderbird
Subject: radeon_fbdev_river_fbdev: failed to initialize framebuffer and setup
 emulaton
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Alex Deucher <alexdeucher@gmail.com>, ville.syrjala@linux.intel.com
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, "R.T.Dickinson"
 <rtd@a-eon.com>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
References: <CADnq5_PUi_2+kDYX8R_eanNF4iYN79MdXJ_PLcQbZKi6e4S8tg@mail.gmail.com>
 <87F47F04-EBAC-48D6-AD0A-4BBE39DF43CE@xenosoft.de>
 <1115cce7-cfdc-4c5b-b017-69cd32425650@xenosoft.de>
In-Reply-To: <1115cce7-cfdc-4c5b-b017-69cd32425650@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

Xorg doesn't work after the DRM updates drm-next-2025-07-30.

Error messages:

[dr:.radeon_fbdev_river_fbdev_proe] *ERROR* failed to initialize 
framebuffer -22
radeon 0000:01:0.0: [drm] *ERRO* fbdev: Failedto setup emulaton (ret=-22)
brd module loadedm
lop: module loadd
mpt3ss version 52.10.00.00 loaded
nve nvme0: pci fuction 0002:04:0.0
fsl-sata ffe20000.sata: SataFSL Platform/CS Driver init
scs host0: sata_fs
ta1: SATA max DMA/133 irq 68 pm-pol 0
;21;39mfsl-sat ffe221000.sata Sata FSL Platfrm/CSB Driver iit
ata1: Signatue Update detectd @ 0 msecs
scsihost1: sata_fsl[0m
ta2: SATA max UMA/133 irq 69 lm-pol 0
nvme nvm0: 4/0/0 defaul/read/poll queus
nvme0n1: p1 p p3 p4 p5 p6 p7[0m
drm:.radeon_fbdv_driver_fbdev_robe] *ERROR* filed to initialze 
framebuffer 22
fsl_dpaa_mac fe4e6000.ethernt: 
of_get_mac_adress(/soc@ffe00000/fman@40000/ethernet@e6000 failed
radeon 000:01:00.0: [dr] *ERROR* fbdev Failed to setu emulation (ret-22)
fsl_dpaa_ma ffe4e6000.ethenet: FMan MEMAC[0m
sl_dpaa_mac ffee6000.ethernet:Using random MA address: 0e

Could you please check the latest DRM updates?

Thanks,
Christian


