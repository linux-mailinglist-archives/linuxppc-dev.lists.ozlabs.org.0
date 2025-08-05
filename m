Return-Path: <linuxppc-dev+bounces-10665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E7B1B788
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 17:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxHWS5fchz3blg;
	Wed,  6 Aug 2025 01:33:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.168 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754408004;
	cv=pass; b=IkkBY+bO8OWVE8ks7qpI+myzWRawwNtyQnyp0TYosgmktdRZZMZnS+P9V56xLUZSqyHGbhrg9L+q+63uVFu16tqX/flF5myeKFL+bWgzDRXh24hkHua2RzzqmjwY3fmSgBIJl8ZleaOB1AgZDGGxAk4dYpClOzxlGq6iXZQapS+BmE3NZHlNLzYdHfTw/qxHsQCFTZD/o/gjVCQxTe56ktzDx/PVbs+6MUh2o6z5aqju1dRHMGal3UdMrk3rU/XxQHxSSxDKWI8BLsODtYBFRmcxTCLTkQdDZeDRXu+Ad8eEdgMPCx/qOvhPb/FqN8/15WCw4NkSkzKXaYPHKbnbFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754408004; c=relaxed/relaxed;
	bh=IqzbW0bVaN5Qic6Q627tbDjP+Ulc5486yfbca1WVBJo=;
	h=Subject:From:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GkQ2j11Yyhaf8yhXHiA58uXjZ3GNZ8i5XY2+6AC2HliVZiyPGypnyG4BKceTtmF/aSTZ9W03QUCSHOubg3oUTukDoAzoSyefnsKcIRbyShSI5vGpPkCTLKQmannpdcfk5niFky8YVGyYRSQjhmZzoIFnt491zwopKFmJrFGIUqa8ooADp5qKruRCPAxKQ5Ifm9hQa9gnUKZvwIHHHuuE4mDJw8TxHWNxsSRg6Vr0j2wqNg2CPYJSAlJQKK/54j2povGX4FuZneCGgVcy2w8/CxirkaBDBXZv3R13vKLrSF8m+i+2ct8m+Etf/4iRZNqrhmbCE0QytNx4eaSWgRCsVg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WtQZIQha; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4niWqeKr; dkim-atps=neutral; spf=pass (client-ip=81.169.146.168; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WtQZIQha;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4niWqeKr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=81.169.146.168; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxHWP5bGhz3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 01:33:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754407907; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aEDRsie7BDVTyeDQQpy83PtWfAsBvkoGwqqpLwHyWGvzZ45u7KxPCMQMBoVqRFi4GV
    Q4fnh3MjjaW4FvJ11uKCAhunSUR3EfehLs3Wyeqrj4n40Zn4+KdvSLX2qNNL8LLg0Rcl
    ueIgr1osr6FR5PsyeALsGVehsva6pIulcZleITaA2risQs/18Y3ZMIMoXjkp7ub3pzd/
    q7WLcxminkY/eb1iMrKuV3bRdEE1qOQW7IQM1xUXYpkcKDeYWkLQdGSrnrwOM9GdAPbJ
    hwuKkyj0NImZECEJu28FQZMXc9ClFMdgKgfk8LkzKkq3da+nq++LHqGNGuTvPHrKHOH3
    9wCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754407907;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=IqzbW0bVaN5Qic6Q627tbDjP+Ulc5486yfbca1WVBJo=;
    b=B3bpWTru9AFoPfXlk0jyJbp0W9E3cOrYf3ngVfp+VqSry5ouWs6xqIEv6hxebatAc0
    tPhsMH2GaxsAyrThr8wY7RYWnMPU5g3oxBBsTz/p1aSjlegaRibdHHWs0IHUsQyiF734
    9CCFrUYjHlwtV71pC0E/9ekx9z3QY21twV6DrlobEcKNEeQOLXAq4e7hqzHG3Y0TPBiQ
    rXlncArJN72EkMO9R6KN4S9oeZvtepcGQJiCEwoj4fiuyxEcKv17f48/qD8qlapj54G2
    Tg0PVfZLfILaARx+j+2F5ADMdsWUDIvZJtoe9ShPpnxOjOzIOQ87H3ieNr/cQAUglZKp
    K7VA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754407907;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=IqzbW0bVaN5Qic6Q627tbDjP+Ulc5486yfbca1WVBJo=;
    b=WtQZIQha08VXAW+iqDSnOmhMP3VfG2ivILA5gg6K8mWkVYMRWeqckY2I/KeNEJL3pe
    BcbY7bNvjN8KOvuRFuLvLOjW5u7Y35ldLwJQpX0HiRp90OWjKo5rCcDEQuqqbQvnIkyH
    lUcKxNXSJdois+3zkBvU7pNd5nSkd7VhLdfKLDfI+3muRKmP8oFZ3kmON2/72rlfz/zl
    Q7A6FozF4See3WBPM4JDh+ZA5hzhO5YNpbvZ6do8vR8AxRKtYd9nMgWBhZayCfvUNZ3i
    Sciv59hNkUe4hKMI1COeEEGC07Twetk78KkIgVl1J0i3W0hdPOmY1MkGcaTgUSYSjPFt
    tgew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754407907;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=IqzbW0bVaN5Qic6Q627tbDjP+Ulc5486yfbca1WVBJo=;
    b=4niWqeKrcCGRFmQGufMm29ZAC46HwQZJs9lDw2n9uOc+TMsU2JHhjLTUMjCBD7zeP7
    ycOux6nDQOurh+1wQVAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErqxu2Eb6sxKV3/YxiaQ02jtbYNVUhhB5DTrFOLgA=="
Received: from [IPv6:2001:16b8:50f0:3000:cf5c:728c:e924:df58]
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c175FVkx0d
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 5 Aug 2025 17:31:46 +0200 (CEST)
Subject: [Linux PPC] [X1000] [e5500] Kernel 6.17 testing and DRM issue
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Jamie Krueger <jamie@bitbybitsoftwaregroup.com>,
 =?UTF-8?Q?G=c3=bcrkan_Sinan?= <sinan.amigaone@gmail.com>,
 Julian Margetson <runaway@candw.ms>, Darren Stevens
 <darren@stevens-zone.net>, Steven Jeffery <sajeffer@gmail.com>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Lyle Hazelwood <lylehaze@gmail.com>, Steve-David Marguet <steve@esdeem.ch>,
 George Sokianos <walkero@gmail.com>, TJ Ferreira <macsociety1@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>, pjs@pjsa.net,
 Ben Cato Malkenes <ben.cato@gmail.com>, Kenneth Lester <ken@five-star.com>,
 madskateman@gmail.com, Allan Cairns <acefnq@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Daniel Reimann <halle_saale@arcor.de>,
 hypexed@yahoo.com.au, Alex Deucher <alexander.deucher@amd.com>,
 developers DRI <dri-devel@lists.freedesktop.org>,
 linuxppc-dev@lists.ozlabs.org, airlied@gmail.com
References: <3D84DBE3-1A8B-4BBD-8663-B7B5D1B36B27@xenosoft.de>
 <29E89652-6101-46CD-850B-846BB4EC59A0@xenosoft.de>
 <d5225281-5a90-7e3b-840e-bb5c3d7eda7a@xenosoft.de>
Organization: A-EON
Message-ID: <8620ee13-bc7d-33a0-290a-b27c430804f5@xenosoft.de>
Date: Tue, 5 Aug 2025 17:34:26 +0200
X-Mailer: BrassMonkey/33.7.2
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
In-Reply-To: <d5225281-5a90-7e3b-840e-bb5c3d7eda7a@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05.08.2025 17:08, Christian Zigotzky wrote:
> On 05.08.2025 15:12, Christian Zigotzky wrote:
>> Hi All,
>>
>> Here is the alpha5 of kernel 6.17 for X1000 and e5500 machines 
>> (X5000/20, X5000/40, Mirari, and QEMU VMs).
>>
>> I created kernels with and without the drm-next-2025-07-30 updates 
>> [1] because of the issue with the Radeon graphics framebuffer device 
>> #15. [2]
>>
>> Download and further information: 
>> https://github.com/chzigotzky/kernels/releases/tag/v6.17.0-alpha5
>>
>> Please test both kernels.
>>
>> Thanks,
>> Christian
>>
>> [1] 
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
>> [2] https://github.com/chzigotzky/kernels/issues/15
> I tested both kernels on my X1000 today and I can definitely confirm, 
> that the issue is somewhere in the commit drm-next-2025-07-30 updates 
> [1].
>
> The Radeon graphics framebuffer doesn't work with the kernel with the 
> drm-next-2025-07-30 updates [1]. Without these updates, the 
> framebuffer works.
>
> -- Christian
>
>
> [1] 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
>
There are some other user reports:

- https://forum.hyperion-entertainment.com/viewtopic.php?p=60606#p60606
- https://forum.hyperion-entertainment.com/viewtopic.php?p=60595#p60595

They use other Radeon graphics chips.

+ Dave Airlie


-- 
Sent with BrassMonkey 33.7.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.7.2)


