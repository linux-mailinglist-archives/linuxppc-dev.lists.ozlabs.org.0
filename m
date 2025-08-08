Return-Path: <linuxppc-dev+bounces-10772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF3DB1EEEF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 21:35:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bzDlp420Yz3bn8;
	Sat,  9 Aug 2025 05:35:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754681750;
	cv=pass; b=Hn0pFfvPP+3aZi3p2ARVs1jcWf5ANhrspX7NSYHgd2qkdk0JDVaVXvpOZ6O26F8+JoUhAoBdFtonnMh2s1ddCK9lkpbveBe8mFKbys+WwDcDaADYptFi8FMChugK8gwKbEF5MV0a7zFTA+KAdTkfBUWwC/C8LJiVc0J7ZGP1750eIgMOboZG19pOAKXSHVEUJ6JSxfftCWIey0z/WCpazZltfmJOsIWdbWcYrdQZJAiqOEKgh6g7eNAZBgZJQz2t9SSaNj8CZaWZbqFz959lbfSqJduVLDWJ/FvKYFhb6ZXdKyyCj7CBY44TZokpkVCnwqH+sVjpvZbNy55Fs2oDag==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754681750; c=relaxed/relaxed;
	bh=FuB74Lz56YvahQ6QzPBql1iyXkEpCYCdoAlKAXgnLOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYdDyOLbXPYUU9NntJZRYmrHtRZxDkBpShQA4+A4Z+rhvSkpyd9MoTHIrzEbFPTVndKCEhMH7HBPkk2JeamerfKNe1xZAkIQehVJlMD65lFAZe6D9rUspQ1jw9r6QKjsqYIIYOjjgcjL8JY2FgQSERMBc4t1Eo1ZR2SgfwpeBVCp+THeMkRon5Rp/oPLA2EHAVsnc34C+2wFHGBeNB7McSUft4UFKQdRUHMutBek5llL2S8YZrB5F0UqPEmCtkxfSScQ3GKOjTWZcN5/BFcKvWZK2O/gY5n24+sgKkyr78jNs9WFnLlUyCHqBkwrV7fvkOmZsyYGpOCX+ly7v64Esw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rXEUVnZX; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=L7bf7ZgV; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rXEUVnZX;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=L7bf7ZgV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bzDll155Vz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 05:35:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754681719; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Em/tOlRn3neXSiKx7JzypFHPBdcqWvW5f9uTuGubZ/1teKbaT/vbaXYlOMoN0sW+Y+
    M+f1U9bWI/LuKdoU5lEKEPAKRxWEIZgb5dImjZrq7zD+PqhJOT+Z+5VestjThe5Vg0qj
    VtEm9Qra2SI7e0rQcVvPbLD3MaLOA8t+IIRswpl3soC1sIUBZvUHUdsWhn+W8+PVff/I
    O12QnDWq0M6DP/g2433wBo4iP+D3aFfuRB6ijJZBlthjvtr2mnm+L6ZTELgGqLRR8YhQ
    CW+3U+ijWcgSDIujZ9nZt8yBbVVhnxQ7cojQfkm9UI2sEF4SBgasdcQ5Qxa+GHF2YO1y
    D/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754681719;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=FuB74Lz56YvahQ6QzPBql1iyXkEpCYCdoAlKAXgnLOE=;
    b=VG8JehbC+uTxOziuiB/ljATZvMI+noI+rDdNR5utjJbCYjLMVvo1UBz9zyquSJjmyR
    4v0s1zuqyS9Yf8gZQlezRYFDS1UZqEAXLyav+2mf8u8a+9HZ6c535oiFKr7CxQOFg+xn
    n0w7QYkAoN8tQIGnzh7JQHT1cEhvtzU7/4wGHg/+qgZV96x+oZ9Smw9BUHhM1nmYjC65
    nSKz9Nz2fQKXw4+KoX+1gegSQG3nNc0Vurftdxotp+2tRignLThhdT2ECxoKdPAt83Lk
    1g03S3pkVvD7+GlLz+WHQ4XlNN1Jfj79QUTKfGXsiE9OK/Sp6UpxMryCeuWJgCFFPMtg
    9TlQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754681719;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=FuB74Lz56YvahQ6QzPBql1iyXkEpCYCdoAlKAXgnLOE=;
    b=rXEUVnZX/kxdUDYH7yZpwwLDFOHfiuEEwRpC84qb2VSbcKnf/AIywf02drxTxJNn72
    9esMpnuc4x1Ka9FdyBDEZFBEqnXsk0hUQ42O12aExFt+zaAcURNdLrHV/5NxHsFjHNOu
    63fjqEXUNHP+IwYwfVymOT+FCf4gJAUB9ux3b8NeQInE0c+F1RqKsbzMQ5MtsqwBglqQ
    58ohMHaUuQtGzMJ3Sq4tC88U6nz1Z4fJe53HgJyyjUaZcBuamyS5Zup1gP5zxn9JplTr
    6QQAquMKjNsioL9xI+DVYmdAjENWDVOZEsngv+s61gxUDPS0AotwVn+Rnp0MdfXtTWuG
    Gp4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754681719;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=FuB74Lz56YvahQ6QzPBql1iyXkEpCYCdoAlKAXgnLOE=;
    b=L7bf7ZgVWXTi25wucNloXI3n+pbKcP3W0izDmhoQG5CVLjlSkbeqO85wWuf+PPvvXh
    wS4vYy7TtRMOxn8Q6nDg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErqkemEbq79cbXtVWCxg7cN+9zD89Zv+intOJE/PA=="
Received: from [IPV6:2001:16b8:5014:2500:4e12:bd2f:a193:bf30]
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c178JZH7lV
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 8 Aug 2025 21:35:17 +0200 (CEST)
Message-ID: <0ea5105b-f96f-4330-a82b-c0c1f35f7b38@xenosoft.de>
Date: Fri, 8 Aug 2025 21:38:00 +0200
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
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulation
To: Damien Stewart <hypexed@yahoo.com.au>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: ville.syrjala@linux.intel.com, Jeff Johnson <quic_jjohnson@quicinc.com>,
 mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>,
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
 <48b61c14-f83d-4e4a-b5d3-857099058eda@xenosoft.de>
 <4bab7915-9739-4aea-be67-5ea122de1f5c@yahoo.com.au>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <4bab7915-9739-4aea-be67-5ea122de1f5c@yahoo.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08 August 2025 at 06:01 pm, Damien Stewart wrote:
> On 5/8/25 2:05 am, Christian Zigotzky wrote:
>>
>> @Hypex
>> Could you please attach your full dmesg output? 
> 
> Hi. Sorry just found this. Do you still need a dmesg? I collected a few 
> and can provide one for any broken version.
> 
> 

Hi Damien,

Never mind. There is a patch [1]. The issue is solved. (Thanks to Alex)

Cheers,
Christian

[1] 
https://github.com/chzigotzky/kernels/blob/main/patches/v2-3-3-drm-radeon-Pass-along-the-format-info-from-.fb_create-to-drm_helper_mode_fill_fb_struct.diff

