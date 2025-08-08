Return-Path: <linuxppc-dev+bounces-10774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B5B1F093
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Aug 2025 00:01:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bzHzH2HF3z2yCM;
	Sat,  9 Aug 2025 08:00:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754660942;
	cv=none; b=bI8hXaN/JSkbwB7TRdA303sPy/s3aHo7EPrAZPqtAmL28jyHepwixmp+T9+epWoClxh2whOYxj+T2XEahC/QW7b4HuESEBpsYlrwl0JmNSf/kYT+Qy4/bQxhL9v4l28PJlh6zGk/XDm9YG6T4j2tsO1BfgsduiqlRswz0auSf+FGHa9o+B4rCp78n7gwV4YzTmR8skLM7BGv4fxjoGi24qXLdwhUEL25aYRsOEx/mK4B9piRrAwe5zGqqmbEQzPLcw9vZpX4bbBDoZIo+47pBv1tn/ZtpTSNObX8pcvdTAKmPVWWkck6fUesaWwdZFZrG8nvR1NANmhIFGHztt/waA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754660942; c=relaxed/relaxed;
	bh=5Xa6FaUkK/o3iZ5LAaj3jV8cT1SY6Rco2BLzF0R36is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cs7Gy8c0v3ZIRQtFbKVjyXpTPtGI7/NhCns6Gaw/IcYPgYSRmqyeGug5SMnsZ0DDdie4lLdLN3ELN+rwdwFDLdcmwWCdw6sbHRknDhoHplXvsHbD9o8racDwsOSVW0XsaYA+yUi/JuMEirXHPSPklz21k4VA6BtB4eXhwCbI2MYoPpuWPCgaEDtBlPcUCTRQ+rnXwGjpO+TA4a29DD3N554XmxI93T2o2BarBs+vzZj6kNN5k3UoJ+9s8vb+J3c/b8KDc0GV113z96udFvu395k0XHhm2ZMJfwxi6BIMryPG5+ArqVMSNKvsrP7v+RWXlDrHxGR8BcOpom0XVdja6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LdLoZQa/; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=superm1@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LdLoZQa/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=superm1@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz53d3Bh2z2xK7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 23:49:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B90EA543F4;
	Fri,  8 Aug 2025 11:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D46C4CEED;
	Fri,  8 Aug 2025 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754652206;
	bh=GpV3W47n1bkfqRHZ3LaVYGNiCSl0JY+5MwvSCjMeAY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LdLoZQa/2802qExL1hbwzNz1rYd8wJ57VsTmbSGEUnJSCBCAFkp1CyOZrArlp1u11
	 dsB5iSjvP9U+bbHStAGf0d5g0g4kb5Mgjx1NPK38426apIMF6760299XoRTZ86Mm8q
	 1q7jTm4AH3UjGLIG8CetS1bZHrf7KTiUABhoW11lncNVy5aEgB6ESF+EzIgn7XLvH8
	 L2ViVy0RB1fxdu0YdHDIlkggB+J6UPdqcg8MpjuIn1/ChMz2lajBJTo8jQXxXH8x6W
	 41rOf7qyH2prRyK4Iu7rA+8B9WEvOmRYYZAHqMJ0PpN7JqvAO2xJZ46FTx41zgpJ8o
	 k5CH4WiPtZ85w==
Message-ID: <66083d23-e60c-4fce-bad0-81dbb9dcebde@kernel.org>
Date: Fri, 8 Aug 2025 06:23:23 -0500
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
References: <69bac1ee-4fea-4225-b222-d7f274a8ea3c@amd.com>
 <EBCB1171-0CF8-4B7A-97C9-0E7816EBA6B5@xenosoft.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <EBCB1171-0CF8-4B7A-97C9-0E7816EBA6B5@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/8/25 2:36 AM, Christian Zigotzky wrote:
> 
> On 07 August 2025 at 04:21 pm, Limonciello, Mario <Mario.Limonciello@amd.com> wrote:
> 
> Does applying
> https://github.com/torvalds/linux/commit/907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0
> help?
> 
> - - -
> 
> Hello Mario,
> 
> Thanks a lot for your patch.
> 
> I tested it today but unfortunately it doesn’t solve the issue with the Radeon framebuffer.
> 
> I have created two kernels with and without the drm-next-2025-07-30 updates [1] because of the issue with the Radeon graphics framebuffer device #15. [2]
> 
> Download and further information: https://github.com/chzigotzky/kernels/releases/tag/v6.17.0-alpha5
> 
> I have tested both kernels this week and I can definitely confirm, that the issue is somewhere in the commit drm-next-2025-07-30 updates [1].
> 
> The Radeon graphics framebuffer doesn't work with the kernel with the drm-next-2025-07-30 updates [1]. Without these updates, the framebuffer works.
> 
> I bisected yesterday. [2]
> 
> There are some other user reports:
> 
> - https://forum.hyperion-entertainment.com/viewtopic.php?p=60606#p60606
> - https://forum.hyperion-entertainment.com/viewtopic.php?p=60595#p60595
> 
> They use other Radeon graphics chips.
> 
> @All
> Please check the drm-next-2025-07-30 updates [1]
> 
> Thanks,
> Christian
> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
> 
> [2] https://github.com/chzigotzky/kernels/issues/15
> 

I think there is a mistake in your bisect, which I notice from looking 
at your other user reports.

The original commit you identified in your bisect and thus CC'ed me came 
in 6.16-rc1.

❯ git describe --contains 4d4c10f763d7808fbade28d83d237411603bca05
v6.16-rc1~50^2~19^2

There absolutely was a regression for that was raised, but this was 
fixed in 6.16-rc3.

❯ git describe --contains 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0
v6.16-rc3~13^2~1

Users in your forums posts talk about 6.16 final working fine.  So I 
think that when you bisected you ran into multiple confounding issues 
and replicated in a similar fashion.  You should check every single 
bisect step to see if 4d4c10f763d7808fbade28d83d237411603bca05 is 
applied.  If it's applied but 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0 
is not applied in that step you should apply 
907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0.

Hopefully that will get you down to the real cause.

