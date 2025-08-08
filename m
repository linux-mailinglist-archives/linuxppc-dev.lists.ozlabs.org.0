Return-Path: <linuxppc-dev+bounces-10773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C9B1F092
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Aug 2025 00:00:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bzHz35Sf7z2xS9;
	Sat,  9 Aug 2025 08:00:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754659113;
	cv=none; b=PseEOZ+UyVvrBXNYl+D/8CA8LX/8ieC/kgznmlHjKOmQGQx70TBo3QiUFG0y3aeZzRkC4jDDU4ITvFm9wn475oqwoiKotYE10emldmtFbFfkBJaC5z0Cnf6DAm+cZg4/H1ak+UmH4EWRQV5fNssMEfgNxdSkbUiiMgjZLP3tbtPryD2Yg7dRq+eLcrIwuPYPK3At07ccDD3n8ST4QFc8rltXWE2b7OLM9K/t8spsWdBab1GyHXov4H3vVmey+5uHQ5bTp2vMUdWPWmyD/kzSID7A76WqcoR5ArxwJhEdsaT3L94lXlsX03rHQSdx9h8pcARzwk4vJMV5MCTAk0QOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754659113; c=relaxed/relaxed;
	bh=ZNktU6hBBVJvECy/Eqt+bnJrm2fwrwiaTQvtsDm2dhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hwd8+usBSxnPhUmK0kqW9xDZYlfOyx0c/JKg1cGrM2AlXNvdKS3uVeyWdU4r150KmKShbdzx9czuV7U2NyenmGy6r2EHFTukw/JlItBiNNG8/Fd1V0V7Qt77xvjCONPyHmtO9IA4kj7sJ4ZXAlLQzUDzsWrktX7xlSAgyorid1M27hvu0hy+4u8ML8u3qFvbWS64wlmwfoMmrrRX8uRJvu59BZfv92kFMQZwEJ7X5GMZdfZjFKS6Ubhb9Ho56b4rdDwaEStpyzQfG/UK/PraWCVJl2iHmghjSgmf/eU03nDxrmHs2Xs/3NezGf8Es+Z74To+H8Es2uaAn4okm0sZcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H0kWHa28; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=superm1@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H0kWHa28;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=superm1@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz4NS0Sl2z2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 23:18:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FAAB440FF;
	Fri,  8 Aug 2025 12:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7316AC4CEED;
	Fri,  8 Aug 2025 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754654597;
	bh=VyLVjvFvcueI6+wKwx97PRnYKMkUL7Nt3qh+EPNEz6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H0kWHa28Srgbxe0k8U7Fqj8yGciW9s0dkbgVcYfh4SCREaV1qcUnnKAd4fML7bjl1
	 WQCg4M9XU5Gk15B1kpHd7ntWG2OAHfk//VTI/TS/uygJZo1rUYxv+9tvV6nG00WdqR
	 lOFv0Ej4+SU7l+GowjAEKJbyQB/84P/UTiAdMDFgNrhqCcVtZzgG/jyATTX06tMrL1
	 9BgWlmuUNz9Ep+VbSCwaNc/XXSYUVXalm0iKKwXVBjHjtFKqX2ngCL8ZNF96Q4Qtsi
	 1rbSxwbUwBNVgeNhd66PnLQWRtyjO5F8GnNCgM3OWlDKxFEyFCNVT1YvwLN7DaXUuj
	 b5jf6mXJJOjwg==
Message-ID: <069d1243-5d4e-4594-89a3-63278d63681d@kernel.org>
Date: Fri, 8 Aug 2025 07:03:14 -0500
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
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: mad skateman <madskateman@gmail.com>, Alex Deucher
 <alexdeucher@gmail.com>, ville.syrjala@linux.intel.com,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alexander Deucher
 <Alexander.Deucher@amd.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 bhelgaas@google.com, benato.denis96@gmail.com, Yijun_Shen@dell.com,
 David Perry <David.Perry@amd.com>, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
References: <66083d23-e60c-4fce-bad0-81dbb9dcebde@kernel.org>
 <0B029DD9-085A-4AD2-B3A0-4C427A1540EA@xenosoft.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <0B029DD9-085A-4AD2-B3A0-4C427A1540EA@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/8/25 6:47 AM, Christian Zigotzky wrote:
> 
> 
>> On 08 August 2025 um 01:23 pm, Mario Limonciello <superm1@kernel.org> wrote:
>>
>> ﻿
>>
>>> On 8/8/25 2:36 AM, Christian Zigotzky wrote:
>>> On 07 August 2025 at 04:21 pm, Limonciello, Mario <Mario.Limonciello@amd.com> wrote:
>>> Does applying
>>> https://github.com/torvalds/linux/commit/907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0
>>> help?
>>> - - -
>>> Hello Mario,
>>> Thanks a lot for your patch.
>>> I tested it today but unfortunately it doesn’t solve the issue with the Radeon framebuffer.
>>> I have created two kernels with and without the drm-next-2025-07-30 updates [1] because of the issue with the Radeon graphics framebuffer device #15. [2]
>>> Download and further information: https://github.com/chzigotzky/kernels/releases/tag/v6.17.0-alpha5
>>> I have tested both kernels this week and I can definitely confirm, that the issue is somewhere in the commit drm-next-2025-07-30 updates [1].
>>> The Radeon graphics framebuffer doesn't work with the kernel with the drm-next-2025-07-30 updates [1]. Without these updates, the framebuffer works.
>>> I bisected yesterday. [2]
>>> There are some other user reports:
>>> - https://forum.hyperion-entertainment.com/viewtopic.php?p=60606#p60606
>>> - https://forum.hyperion-entertainment.com/viewtopic.php?p=60595#p60595
>>> They use other Radeon graphics chips.
>>> @All
>>> Please check the drm-next-2025-07-30 updates [1]
>>> Thanks,
>>> Christian
>>> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
>>> [2] https://github.com/chzigotzky/kernels/issues/15
>>
>> I think there is a mistake in your bisect, which I notice from looking at your other user reports.
>>
>> The original commit you identified in your bisect and thus CC'ed me came in 6.16-rc1.
>>
>> ❯ git describe --contains 4d4c10f763d7808fbade28d83d237411603bca05
>> v6.16-rc1~50^2~19^2
>>
>> There absolutely was a regression for that was raised, but this was fixed in 6.16-rc3.
>>
>> ❯ git describe --contains 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0
>> v6.16-rc3~13^2~1
>>
>> Users in your forums posts talk about 6.16 final working fine.  So I think that when you bisected you ran into multiple confounding issues and replicated in a similar fashion.  You should check every single bisect step to see if 4d4c10f763d7808fbade28d83d237411603bca05 is applied.  If it's applied but 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0 is not applied in that step you should apply 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0.
>>
>> Hopefully that will get you down to the real cause.
> 
> Thanks for the hint. Unfortunately I don’t have more time for figuring out the issue.
> 
> Two facts:
> 
> - The Radeon driver can no longer be used.
> The Radeon driver is broken for us.
> 
> - The issue is somewhere in the commit drm-next-2025-07-30 updates [1].
> 
> I cannot provide any more due to time constraints.
> 
> I've already spent time that I didn't actually have.
> 
> Thanks for your help.
> 
> Christian
> 
> 

If you're sure that the issue was raised in that merge commit, I suggest 
you (or someone else affected by this issue) do the bisect using the drm 
kernel tree [1] and bisect between the problematic tag [2] and previous 
tag [3].

[1] https://gitlab.freedesktop.org/drm/kernel
[2] https://gitlab.freedesktop.org/drm/kernel/-/tags/drm-next-2025-07-30
[3] https://gitlab.freedesktop.org/drm/kernel/-/tags/drm-next-2025-06-06

