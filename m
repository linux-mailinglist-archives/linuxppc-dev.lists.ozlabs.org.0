Return-Path: <linuxppc-dev+bounces-9167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7752AACEF01
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 14:13:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCjzP0Pwzz2yYJ;
	Thu,  5 Jun 2025 22:13:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749119118;
	cv=none; b=OPnsS1E6083O7kHmb6kRYXqHhKwmygobD+rs+tt5QOY9wdRKxsnW5WQ790so9Vo+/Ug22bh0Wr86dhkI/AsXfPnW/xvoC/wR0MVA/2/4kzdn0Of4XSbxME06pdUu+aS6jjrbnQUzcJZA34unoGSK2dDn7gO7NuHjkNeQwR1eqNVZz7ZFG95Eni2FR0CckN2z6ghgrJk9ytH7sZUOIa84hnWFZ8kp681zQgC6YKGO7tytLhPLBUAR9HXBC83JTGEZJlM7zk91wI9rO0lIbuV3eDF8+FAJpzzsJXTchWlfaJO1fly4PV4EJpHMz/OzIixuenOXqJSVLedfniN4YDnz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749119118; c=relaxed/relaxed;
	bh=22nzGWHZvbYaZQRZMdCHmym8UvnMl7KxB4uEGF5YMj8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gko+ubTwyD8GRAYC0xXfA82cLq89aJnVuwHhsyYbLArjPNQMkW8hMoBxK+g916Nm7HWE0Ncxf4zgydCF5NKn29t1tm0VRJmF41tw+N7OWuKWZMsicSGdSXziHIwh5q9NLEK7oCHZ/h8DZABzvmVcF0wkQR8WyRzArTKSE1qJspSzhrBvPPb2EGV74Z09GQEvZPwYStO7Pyg2SyrgnGwFT6royHhWtscfPwS0VarrjBfZpbcBakuX76KvV7OUekjdLR8ywy7HPPXorml62xazOvK9H44JouHMwb3ju1UZiCATfoBMEAnkXrEeAR8oJ4vqUJr5/gS3rs3rzGBwFn75GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f4PPodmG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sven@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f4PPodmG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sven@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCgZ53tQwz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 20:25:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD85F5C5753;
	Thu,  5 Jun 2025 10:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA39C4CEE7;
	Thu,  5 Jun 2025 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749119114;
	bh=YdJvMMxNeJZ4ws+mkLoEmNugy4D3YfkKWs3ds4JIL/4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=f4PPodmGDavBEPsrZH6CTP09Oz6VdO24835qnpwrQF7qR5Ng57NXXpxvd9Fe6yCJ9
	 ZWQs9LT6MR03KUhBwDM+qyCAhlW/qA9J50X9SLcQs4lViFsNGn8mbG7/ExG/rpwBvF
	 HetZqNnqNbBtJYhDcKMwRW5OX0z+RL+shCvGmS6oFnEJpeivlSVd5GGzTMRj/wbffB
	 CNU3TYc10Nm6vaNPxFg7B03NQ9Jx816OJyV79UqJ14fSJ1ef36k/DxAvFNmruTRIuV
	 f696TTLTlqadTX1aCP2YtcxX3zueLEj39X9pXWt/9ttLekYbtlJqC2HjFb8K4Y7JTj
	 98dbQqEkzkQ4w==
Message-ID: <dafd58ae-0a08-4fe6-b94d-c8c6c8c1fa97@kernel.org>
Date: Thu, 5 Jun 2025 12:25:09 +0200
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
From: Sven Peter <sven@kernel.org>
Subject: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
To: =?UTF-8?B?56iL5YeM6aOe?= <chenglingfei22s@ict.ac.cn>, j@jannau.net,
 alyssa@rosenzweig.io, neal@gompa.dev
Cc: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
Content-Language: en-US
In-Reply-To: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 05.06.25 05:02, 程凌飞 wrote:
> Hi, all!
> 
> We’ve encountered a kernel crash when running rmmod i2c-pasemi-platform on a Mac Mini M1 (T8103) running Asahi Arch Linux.
> 
> The bug was first found on the Linux v6.6, which is built manually with the Asahi given config to run our services.
> At that time, the i2c-pasemi-platform was i2c-apple.
> 
> We noticed in the Linux v6.7, the pasemi is splitted into two separate modules, one of which is i2c-pasemi-platform.
> Therefore, we built Linux v6.14.6 and tried to rmmod i2c-pasemi-platform again, the crash still exists. Moreover, we fetched
> the latest i2c-pasemi-platform on linux-next(911483b25612c8bc32a706ba940738cc43299496) and asahi, built them and
> tested again with Linux v6.14.6, but the crash remains.
> 
> Because kexec is not supported and will never be fully supported on Apple Silicon platforms due to hardware and firmware
> design constraints, we can not record the panic logs through kdump.

Do you have UART connected to a device under test which you could use to 
grab the panic log from the kernel? Alternatively you can also run the 
kernel under m1n1's hypervisor and grab the log that way. It'll emulate 
the serial port and redirect its output via USB.

> 
> Thus we tried to find the root cause of the issue manually. When we perform rmmod, the kernel performs device releasing on
> the i2c bus, then calls the remove function in snd-soc-cs42l83-i2c, which calls the cs42l42_common_remove in cs42l42,
> because cs42l42-&gt;init_done is true, it performs regmap_write, and finally calls into pasemi_smb_waitready in i2c-pasemi
> -core.c. We noticed that smbus-&gt;use_irq is true, and after it calls into wait_for_completion_timeout, the system crashs!>
> We found that wait_for_completion_timeout is one of the core scheduler APIs used by tens of thousands of other drivers,
> it is unlikely causing the crash. So we tried to remove the call to wait_for_completion_timeout, then the system seems to
> run well.
> 
> However, because we have little knowledge about i2c devices and specifications, we are not sure whether this change will
> cause other potential harms for the system and device. Is this call to wait necesary here? Or can you give a more
> sophisticated fix?

Yes, that call is necessary. It waits for the "transfer completed" 
interrupt from the hardware. Without it the driver will try to read data 
before it's available and you'll see corruption. I'm surprised hardware 
attached to i2c (usb pd controller and audio I think) works at all with 
that change.


Sven


