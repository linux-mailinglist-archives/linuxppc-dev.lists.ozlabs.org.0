Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAB08B7B33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 17:10:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=f0+gfas+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTNtG1fJSz3cTh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 01:10:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=f0+gfas+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perex.cz (client-ip=77.48.224.245; helo=mail1.perex.cz; envelope-from=perex@perex.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 355 seconds by postgrey-1.37 at boromir; Wed, 01 May 2024 01:09:50 AEST
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTNsV17lSz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 01:09:50 +1000 (AEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7771E11FD;
	Tue, 30 Apr 2024 17:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7771E11FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1714489428; bh=tfwEdotKFhHtxy67tu8o4kix/SP/ziAv/Bxku/BiYns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f0+gfas+M7I2y1QsjdNFKJlAS6e550mEaQcY7J1U3J+TTc7QSds1QH985OjXPSt4N
	 iYZNwl05tLTRfpvlyAuEd/eJT0C7Xo5DpFnsh2w8sy9Q6GtH3+63I7eMAwBlspQSrI
	 v++pRdoEfWz0pKXNfZONsjhhBZUJ4uZnWCXSdVfU=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 30 Apr 2024 17:03:30 +0200 (CEST)
Message-ID: <394d35bd-f58d-4b13-8790-4d7db2f7d14e@perex.cz>
Date: Tue, 30 Apr 2024 17:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, festevam@gmail.com, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30. 04. 24 16:46, Mark Brown wrote:

>> So instead of hammering a driver into the wrong destination, I would
>> suggest bundling our forces and implementing a general memory-to-memory
>> framework that both the media and the audio subsystem can use, that
>> addresses the current shortcomings of the implementation and allows you
>> to upload the driver where it is supposed to be.
> 
> That doesn't sound like an immediate solution to maintainer overload
> issues...  if something like this is going to happen the DRM solution
> does seem more general but I'm not sure the amount of stop energy is
> proportionate.

The "do what you want" ALSA's hwdep device / interface can be used to transfer 
data in/out from SRC using custom read/write/ioctl/mmap syscalls. The question 
is, if the changes cannot be more simpler for the first implementation keeping 
the hardware enumeration in one subsystem where is the driver code placed. I 
also see the benefit to reuse the already existing framework (but is v4l2 the 
right one?).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

