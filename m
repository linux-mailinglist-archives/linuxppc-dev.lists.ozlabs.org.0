Return-Path: <linuxppc-dev+bounces-10596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F2B1A6FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:04:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwhFD5mkQz3bpG;
	Tue,  5 Aug 2025 02:04:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.53 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754323440;
	cv=pass; b=ZnPKKDa5xDV34Dzu5RFFgLGeE4YbQyIwwG0IerVp6cuUiM4E/K8aq7DkN8QivIaeNOabcvjly0RwUb7a6uxTATvFbFPNE2GLQB33iffeaQvpe2XR1M0tpYnicfVzcoGoHxxft/NiAPXbCgqih+Foa5lnO47co5YduRwhxwWGVu7kMlYmcShQ8gRe2RncGg3MLROGEVjMFHFtsNwULo+KCfO3wW5XSmzT5jjUrpfw183xHcDuJ3LLYCfCAJ5xY9gYpw9Bubrz4FqcI8OU2ygmSQcEa7LjzL3nw9Sgn837GN8JmMaEZdZyBoOvHwLFDWH+NJdjfi863BfmMj366APe3A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754323440; c=relaxed/relaxed;
	bh=M56Whp0iiDJxqyvQ/vFIYTMbOneXnKVIV6eIN4usUKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=co4qp4RN5toy2Lj7c2fzVVXK63q4bAEocwjnultcjVlDXm830iWfjHd/RBg5TmpAJAIazeDouSHx5zUBY+OSg9qQ3OTtgPFDqODVCuwiplLQNmORLf09tDNdsFEhZph1iZHO9Mu9c/c8ckBrscJBDaDVPjr4sKhFCuvPQu/Tbte6XvhscOENRtUFAk+4vjhbA6khUX0btBNYKVz2uDcQp1g4a1WvbXkmS72h9ydsAKrf4dM6J6jhAScorpz3TLBz8NRNp9DbZodnq7cJVEVi3fPhdZKF6o8pKIj7lDlWnt7zhLbu+kssNQEJNbxw9HXwa/RucBAqLlzzWgslcyg3mw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jzSmbHar; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=aEX1VtAO; dkim-atps=neutral; spf=pass (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jzSmbHar;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=aEX1VtAO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwhF91gj9z3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:03:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754323385; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Mt5zmzsWKj7fxEHIt9QWfdDLcPDxN8An5wK6gex5ajSPfSrmmphu8PQoDzIVBpeSw4
    oS82h2PIQ7ucf4fq1u+NfrU9v3OKAAzgGEbLJlD2REo7eapRKikYyJHiGRBwd8EnkL/H
    wuXPPBCz4U2UY8jrOz4lU2E4e1+K1xc4iR6LsXJ6je6Zbyuh6ub2eqnbN81w3hSwgdaO
    NMsewAuRaB4yp2ZcWViwfwOoqbLP19u6iMvzzi/C0l6tTm1l0p0DMcJBUxHwjP7re//M
    IxDsB5GJNxahYYhJzoMSQ99eRj0/BFiivRM4fhUzlG8KDDHrRXie3BgqeNh8QWQsqPLD
    2CLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754323385;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=M56Whp0iiDJxqyvQ/vFIYTMbOneXnKVIV6eIN4usUKY=;
    b=VIEqkqOVSEYf2S7LNKL9yWpnWAu5Ylf381bfQU0vfhnPwoSsSkiGiTPuNRQIKmmxv9
    P2veAcSopU3+keozb8ef2XrVSlHr12C22lTJq49ahUsx1e0FkpS2J3q+aWJpbbj3JQq9
    61vo+0H0BOSMwnPAXK58zn2y4Wt992fEB6NL1F36loRxBz+xVtLaIRCRN4kzwed+KNha
    6ettixeMTSkFqXmz/L/Nll8NzdjgnZsuhKn9M5goD3OD4inQVRI8dfIXJinLECiYQLuU
    J7+tujicx7kRRDL9CgD8QFSusx4UwzM7/pOUbbkf2UnwYhVslzVGdllx1FPWN10eY4U6
    y+/g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754323385;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=M56Whp0iiDJxqyvQ/vFIYTMbOneXnKVIV6eIN4usUKY=;
    b=jzSmbHarlJQf0Kjkum37/nYUBTJ4+E/vgOO0TSw6+n6cxfiXtV+J4G0273k6n/qkZR
    M7fitdr1labaUenQx5VZ08EXDE6g/+ktLGP2aci19TQ0woREE+whoOoJwAJqEAjbyhhu
    WdXG87255WHNxy6XOpyyuPHhz3WX5W5MBIRbfOKBA7Niitk+tzsWodzdcd4TiztPtflL
    rzdskf+2OqrtKGf889B+TYpUdEgjroQVWjNzoTEX1o19u0mJo6d63C1Wzs84FnZktJU9
    RdYZ19MU0NhrWxVvk0HzDV5mLvSWjL7n3KJjVybUgO+rGc5eI+EdKzmaFpfNUYodpVpM
    q/Zg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754323385;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=M56Whp0iiDJxqyvQ/vFIYTMbOneXnKVIV6eIN4usUKY=;
    b=aEX1VtAOCCqPqeh39irZzABAhoFmyHVEzT5A9OFuK6Q7jS+bFJhUiQxiMUccLbEDVb
    JBJtOIModOfmW67Wu4Bg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErqxeyEb6mwJICPXWVIboBgAwJC8PHVKCftd3qfPg=="
Received: from [IPV6:2001:16b8:50e1:3200:c3cb:9020:d3e9:5d1d]
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c174G34t59
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 4 Aug 2025 18:03:04 +0200 (CEST)
Message-ID: <48b61c14-f83d-4e4a-b5d3-857099058eda@xenosoft.de>
Date: Mon, 4 Aug 2025 18:05:44 +0200
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
 emulation
To: Alex Deucher <alexdeucher@gmail.com>
Cc: ville.syrjala@linux.intel.com, Jeff Johnson <quic_jjohnson@quicinc.com>,
 mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
References: <CADnq5_PUi_2+kDYX8R_eanNF4iYN79MdXJ_PLcQbZKi6e4S8tg@mail.gmail.com>
 <87F47F04-EBAC-48D6-AD0A-4BBE39DF43CE@xenosoft.de>
 <1115cce7-cfdc-4c5b-b017-69cd32425650@xenosoft.de>
 <6ba8d730-52f9-421f-8d8a-887545f0ceac@xenosoft.de>
 <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
 <CADnq5_OpJdbc4YKtV-9+5JyeKyqd4+irhT6OtFq_K9KJF24VSQ@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CADnq5_OpJdbc4YKtV-9+5JyeKyqd4+irhT6OtFq_K9KJF24VSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NORMAL_HTTP_TO_IP,
	NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 04 August 2025 at 04:42 pm, Alex Deucher wrote:
> On Sun, Aug 3, 2025 at 11:28 AM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>>
>> Hello,
>>
>> I have the same issue on another machine either. Blank screen during the
>> boot. The Radeon graphics framebuffer device doesn't work anymore.
>>
>> Here is the modifed code from the DRM updates (drm-next-2025-07-30):
>>
>> -
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/radeon/radeon_fbdev.c?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
>> -
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/radeon/radeon_drv.c?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
> 
> This change just bumps the driver version it shouldn't affect the fbdev.
> 
>> -
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/radeon/radeon_display.c?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
>> -
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/radeon/evergreen_cs.c?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
> 
> This only affects acceleration, it should not affect fbdev.
> 
> What chip are you using?  Can you attach your full dmesg output?  Can
> you bisect?  This cultrit could be a core drm change.
> 
> Alex
> 
>>
>> Do you have a patch for reverting these modifications? I would like to
>> revert these modifications for testing.
>>
>> Thanks in advance,
>> Christian
>>
>> On 03 August 2025 at 1:35 pm, Christian Zigotzky wrote:
>>> Hello,
>>>
>>> Xorg doesn't work after the DRM updates drm-next-2025-07-30.
>>>
>>> Error messages:
>>>
>>> [dr:.radeon_fbdev_river_fbdev_proe] *ERROR* failed to initialize
>>> framebuffer -22
>>> radeon 0000:01:0.0: [drm] *ERRO* fbdev: Failedto setup emulaton (ret=-22)
>>> brd module loadedm
>>> lop: module loadd
>>> mpt3ss version 52.10.00.00 loaded
>>> nve nvme0: pci fuction 0002:04:0.0
>>> fsl-sata ffe20000.sata: SataFSL Platform/CS Driver init
>>> scs host0: sata_fs
>>> ta1: SATA max DMA/133 irq 68 pm-pol 0
>>> ;21;39mfsl-sat ffe221000.sata Sata FSL Platfrm/CSB Driver iit
>>> ata1: Signatue Update detectd @ 0 msecs
>>> scsihost1: sata_fsl[0m
>>> ta2: SATA max UMA/133 irq 69 lm-pol 0
>>> nvme nvm0: 4/0/0 defaul/read/poll queus
>>> nvme0n1: p1 p p3 p4 p5 p6 p7[0m
>>> drm:.radeon_fbdv_driver_fbdev_robe] *ERROR* filed to initialze
>>> framebuffer 22
>>> fsl_dpaa_mac fe4e6000.ethernt: of_get_mac_adress(/soc@ffe00000/
>>> fman@40000/ethernet@e6000 failed
>>> radeon 000:01:00.0: [dr] *ERROR* fbdev Failed to setu emulation (ret-22)
>>> fsl_dpaa_ma ffe4e6000.ethenet: FMan MEMAC[0m
>>> sl_dpaa_mac ffee6000.ethernet:Using random MA address: 0e
>>>
>>> Could you please check the latest DRM updates?
>>>
>>> Thanks,
>>> Christian
>>>
>>

Hello Alex,

Thanks for your answer.

I use a BARTS chip (Radeon HD6870). I would like to bisect but I don't 
have time for it currently. Sorry

There are some other user reports:

- https://forum.hyperion-entertainment.com/viewtopic.php?p=60606#p60606
- https://forum.hyperion-entertainment.com/viewtopic.php?p=60595#p60595

They use other Radeon graphics chips.

Bug report: https://github.com/chzigotzky/kernels/issues/15

What do you think about the following commit?

Link: 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0e7d5874fb6b80c44be3cfbcf1cf356e81d91232

@Hypex
Could you please attach your full dmesg output?

Thanks,
Christian

