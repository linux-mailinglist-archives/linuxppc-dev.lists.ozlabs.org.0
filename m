Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4CF7DF54A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 15:49:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iMztjmTY;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=k7U8ubAc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLmxZ2J2hz3d9g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 01:49:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iMztjmTY;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=k7U8ubAc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 171 seconds by postgrey-1.37 at boromir; Fri, 03 Nov 2023 01:49:05 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLmwd63FBz2xdT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 01:49:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698936359; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=RP7qF55grm6E+/IZejlk7Tc+GbC/09azxoCcbWF3AP7idyz+6RSkuOITDX77eCWqPM
    WK87pCXstjXcwWuuY54IIOGYqemy5hELXNfuyfBInvxAziuMroNqhL5E9dZXsTPDve+Z
    430FE3ZC5PFhwh1xqeV5BazTRg9Z0U7vkZOdIjkgtFKsaKAAZDUQEHH6MNwyJSV4lVsu
    SgIMJ9ZC7m+qnL/U7/28a2VGBS13SqSk4Z/+1DwFzgAb0+Ct2T4OYi56nCpnzUVuw/wZ
    Pq9lmOjwQkwT3VLsxOvtpGvPK8zpVIXlPAWYCyyz3Z7A0BGktwxftdxNFuEVZT4ds2DD
    Yw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1698936359;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=qtPFIfgVAkjEIk8Kp4nDjcvuBALChWXRANLp0TFLX/8=;
    b=MLPkEeoFXLVo2IXy4HZDluyQOXL386QAA4c/u6rAOL/eSBs18Y6cyxYYwJ3jw5MC7l
    Q+PjjBx/D3FMNBYlEpNGF/j/6714IEuvQafyXuNPoT0NxqNqZpEoYSWals+6X8Xd92+N
    R0XjkShFEKBQDWxXukIw44GCmkdRFTTRkE5VM9wmoywo6k3uKutMuWyB0IqnKef5WotX
    rGe4oqCDi0WgLmu/jQ58l8jdM8WJ4v9oQWrpPXWfljWjDnThPVpRR1lNtINBoVBnEBKQ
    A3MOFCChEjr1PQbNIMXp+yPIq4kp1E9ONLH7cNpQ3Hk+gesInopcWwLSE9xX3QnlZFcn
    kb9A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1698936359;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=qtPFIfgVAkjEIk8Kp4nDjcvuBALChWXRANLp0TFLX/8=;
    b=iMztjmTYsx5UkYPaulqZHLsXpVn2xeTqD4txWKNPBGs0Tv+02LwL5/jAxRVem2chSa
    8fHHo2k0TZRajj/5guP5k5WEOtrr9z5urVvGKgSSvbcrW6b4if58qPrntcKF6phUG5Le
    AoefrW/180/vPUtVM3JklenZ0//TUvANLQD3Uq4Jer8YZ68HgIcVxYEV76OOYOXVCv5E
    mLQ/U6EGLPE2nZD2VZGNHI9QlgfHe/x4N+SFmXiUXvAXh2vMQUj/16jR6VsNLUGrZACD
    VqPUvCpfYDz6bvuVDzyQECbiQMPffUH+KdIvzoSggRE9hhJHwEQCBiz3qzvpopPLY+BS
    UtXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1698936359;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=qtPFIfgVAkjEIk8Kp4nDjcvuBALChWXRANLp0TFLX/8=;
    b=k7U8ubAcuz1t6//aPG7e8FbPz3BcWWLIKYsyF+Tnd0MSjp75gSIkalaSg+bn2DKt5i
    dLinFuZgUiFbCtaB20BA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY0hzUZlL7nnJJC35Rs6bya78Fhg"
Received: from [IPV6:2a02:8109:8984:5d00:bdcf:160a:a05:bd18]
    by smtp.strato.de (RZmta 49.9.1 AUTH)
    with ESMTPSA id m61756zA2EjwcjA
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 2 Nov 2023 15:45:58 +0100 (CET)
Message-ID: <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de>
Date: Thu, 2 Nov 2023 15:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fbdev issue after the drm updates 'drm-next-2023-10-31-1'
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, airlied@gmail.com
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
 <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

There is a fbdev issue with the virtio-gpu-pci and virtio-vga. (The 
penguins are not displayed at boot time)

Error message:  [    0.889302] virtio-pci 0000:00:02.0: [drm] *ERROR* 
fbdev: Failed to setup generic emulation (ret=-2)

The kernel 6.6 final doesn't have this issue.

Please check the fbdev changes in the drm updates 'drm-next-2023-10-31-1'.

Thanks,
Christian
