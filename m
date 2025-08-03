Return-Path: <linuxppc-dev+bounces-10533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCC3B19461
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 17:28:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bw3Vp0qDlz2xQ6;
	Mon,  4 Aug 2025 01:28:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.165 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754234914;
	cv=pass; b=ceiDyyRLVgoyiMAFo9cErc5GnAOlJTDY5ISiLuo/6FxgUBpEwS6r3SLpj8xBcm6j1Cg074+BTcAkLjHrMx6zPOw26N5vukQh4w9ePHoA4FOiVWPNu7tIoo9SQPW4TMyWimU6lIWXRj9FehDY0qutQfTB2FprjHITYAnNpVfPmb1zeArFRTK0Jnu1kJyjqS7iiunnvDhWzN57K3rQR78ZYvrsw5mDAP4Q+eqizMtTxMX2eHEKBzQEc3wJJ9Kk2TtZt0zc7KZUL9eqUay6ycsE2I1rTgYZlVQveyCXhXK4keaePBEtkRRmu4GY0sbtm46xAjyaAOaVrE6nALu4yJBgWA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754234914; c=relaxed/relaxed;
	bh=v0fh6BDgcALF6w1H/N9nbhWtwyu3zZ1deC5YjYfAFMs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XGURG8dBeUgzCyiV2S7rkwdwtA9KeJxpoQaDCHuDTujGSD5DS5iRdjl/rsfqlg4C9jvLmK/b9wjovMGL7aazw8oKV1BJdT2QCJ8fi4FhfTDeiptYtmFQ3zQquNFYnhhtuXUw+oci8oVT8OUnTA7gkPKGpkW2wD0tc7m6xM3seqeJzS/y4AFIgCqn4qhh7AqH+xeVl2LSza0qy0KKQEvAIGm1jkT6mwD1GtvWy2Vkn9qGS7JHs+CLRlwd0On1xUmx7ckPG3X94B4Vhx2XSTRFUw7n7972+DSu35doB57nSvaYZFZSNVZ+tV+oBFADht/7jDGi2rsgjx9FjZ8fgbJ+jw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=OOcCgdEW; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=MezSJif+; dkim-atps=neutral; spf=pass (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=OOcCgdEW;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=MezSJif+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bw3Vk5zS7z2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 01:28:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754234893; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=slYZRl4yutfj3Ryf444LEzKqxtAOExk+E7wKtOZiTMQeOU3W+7HYG1BQSWGUUomXLs
    +ZmV12t76TTDl4HTI7iuXYnLYWs4UF+/fbPnGMktOvVWjmI7s1GCHPkyX6fwg67XNJXH
    mM7ptfpwuD72Dcx3zSFdh5PvzW5HCq6RXNSCTrGjddj6o+zCt5tckYHanq9mSC+kY6X6
    dLkdiPPf21BfyDjSbSNJDIJvt2d75kKXPRxGQdolAAOaaMibl0ZdEXU4PEHMZkYw4c2H
    tdJ/yEiTbI31tygOsi+2h7wx/WglICcz7RF/Nr0ZAZ9uZ+2GykoMWpMYEMibkt9KNuMF
    QG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754234893;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=v0fh6BDgcALF6w1H/N9nbhWtwyu3zZ1deC5YjYfAFMs=;
    b=nc4bH1CGEssCXjhPjS+7OattczMrEoC7DcHD5DbRLDpYKhEL+eeRtme3nJfntdNKRr
    ykI+sCJKDYDyAaFz2U2GJimNqi1LBfuFB/rPjXiU4NTLIXrsXbf83m2z+PrDeGFynLw8
    uvA/1ArVS4hj4IGb+ff50Um8Rk5iJItxtYuSkf2n2mjF1m0O2xZfcX/ZMBAztlXMi7uQ
    otdy1VE2906+Dp2HM4OkiTqW6QMjZXOO8rmjUST2V8owXoSZwVBBqnrPRtQZgA1SMq2V
    TNoTiY756qhvqXLSVOBjj8r9VBzDcO7ZTP7HnDBaTQA8yEttFj0XS+IUpuHrs6/7LcbR
    ivgw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754234893;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=v0fh6BDgcALF6w1H/N9nbhWtwyu3zZ1deC5YjYfAFMs=;
    b=OOcCgdEWCxZ/sipfQ7VG4XnXI1tMZcpbrCNXJJ7/RuuB4C6FcRvDsOJHR3s27rrIfY
    VZ36VH0niBvISXiqwXfHqKjRoMdjmmkug+KOw7w3OXUZFPtv9fe0Joe+w4rkdt7yzYhz
    E+STEK53eCS2vCAckfQSqW1uq8UutbLcedP84lS3S3fqjEFeqE7TflkqWvZ7Wrdg1BFY
    0GwxWYfuhIrUW8D9BX4oTI3OV7zmtRLgdtP28wXgv2nzXozRf0vZ5OnQ1K8/Wf0wXN9H
    tJdpFTSirUUGWYwXriv0JABuiY5bZ8VVUWEraiIBKdH1x7t1hdbVX0DKEJ51Hr0ude+O
    VuJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754234893;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=v0fh6BDgcALF6w1H/N9nbhWtwyu3zZ1deC5YjYfAFMs=;
    b=MezSJif+PzHaAfCG7yXQPBy+orAVsWfL7qBcXJnL2tO7zguPVDtArxDuOD4uEl5DB7
    aWYx/HfOsC84S0+SlkBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIy+m7R/g"
Received: from [192.168.178.20]
    by smtp.strato.de (RZmta 52.1.2 DYNA|AUTH)
    with ESMTPSA id e6066c173FSCom0
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 3 Aug 2025 17:28:12 +0200 (CEST)
Message-ID: <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
Date: Sun, 3 Aug 2025 17:30:52 +0200
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
 <6ba8d730-52f9-421f-8d8a-887545f0ceac@xenosoft.de>
In-Reply-To: <6ba8d730-52f9-421f-8d8a-887545f0ceac@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NORMAL_HTTP_TO_IP,
	NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

I have the same issue on another machine either. Blank screen during the 
boot. The Radeon graphics framebuffer device doesn't work anymore.

Here is the modifed code from the DRM updates (drm-next-2025-07-30):

- 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/radeon/radeon_fbdev.c?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
- 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/radeon/radeon_drv.c?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
- 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/radeon/radeon_display.c?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
- 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/radeon/evergreen_cs.c?id=260f6f4fda93c8485c8037865c941b42b9cba5d2

Do you have a patch for reverting these modifications? I would like to 
revert these modifications for testing.

Thanks in advance,
Christian

On 03 August 2025 at 1:35 pm, Christian Zigotzky wrote:
> Hello,
> 
> Xorg doesn't work after the DRM updates drm-next-2025-07-30.
> 
> Error messages:
> 
> [dr:.radeon_fbdev_river_fbdev_proe] *ERROR* failed to initialize 
> framebuffer -22
> radeon 0000:01:0.0: [drm] *ERRO* fbdev: Failedto setup emulaton (ret=-22)
> brd module loadedm
> lop: module loadd
> mpt3ss version 52.10.00.00 loaded
> nve nvme0: pci fuction 0002:04:0.0
> fsl-sata ffe20000.sata: SataFSL Platform/CS Driver init
> scs host0: sata_fs
> ta1: SATA max DMA/133 irq 68 pm-pol 0
> ;21;39mfsl-sat ffe221000.sata Sata FSL Platfrm/CSB Driver iit
> ata1: Signatue Update detectd @ 0 msecs
> scsihost1: sata_fsl[0m
> ta2: SATA max UMA/133 irq 69 lm-pol 0
> nvme nvm0: 4/0/0 defaul/read/poll queus
> nvme0n1: p1 p p3 p4 p5 p6 p7[0m
> drm:.radeon_fbdv_driver_fbdev_robe] *ERROR* filed to initialze 
> framebuffer 22
> fsl_dpaa_mac fe4e6000.ethernt: of_get_mac_adress(/soc@ffe00000/ 
> fman@40000/ethernet@e6000 failed
> radeon 000:01:00.0: [dr] *ERROR* fbdev Failed to setu emulation (ret-22)
> fsl_dpaa_ma ffe4e6000.ethenet: FMan MEMAC[0m
> sl_dpaa_mac ffee6000.ethernet:Using random MA address: 0e
> 
> Could you please check the latest DRM updates?
> 
> Thanks,
> Christian
> 


