Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9427A6EC948
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 11:45:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4gGT3DLDz3cCy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 19:45:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=fI/x9hKE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=fI/x9hKE;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4gFY6mGNz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 19:44:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1682329429; i=deller@gmx.de;
	bh=FHjYBg4NiAOiwz2WyLL8oych2ductNrKsA7W77JnpvY=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fI/x9hKE8J/nrtLbh0AvQAHxcyTyCKmPFoEwfLiantaRQ+lRbnj/8zSJCBiZjOUMP
	 DuRZnHHmLFiB2LXxCkDDm0lD/3SG+nzf06WObmafSFTCxTGhlSUJ9+fG3R+aQe7JRk
	 uqF4PdjS394lFaY16k7DJ9L4gMR2JnGEt80UuH7/xmHAP6jo6X5Xw8S4RdejVANwQQ
	 A0QK5p9GU3vc5rOtR8+VuKQJBN8sg67PH4dpWpfmD1gkn/P/BfHYLCd2dUXdWBEL5O
	 VBtY/MNLNWaNNv9fFW7pqSxVt/HDVdS33P36BaZ/A4a6PjITXiyOazOR+aqcPMGhkH
	 oks1hKbTwKm+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.242]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9Bu-1qboPL3G6Q-00oHvR; Mon, 24
 Apr 2023 11:43:49 +0200
Message-ID: <8027fd8f-6e99-aae7-85a1-3be4c9fac8a0@gmx.de>
Date: Mon, 24 Apr 2023 11:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] fbdev: Set missing owner fields in fb_ops
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, geert@linux-m68k.org
References: <20230424085825.18287-1-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230424085825.18287-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:43f3kKWCK86xmG24dJC4dDpRYwSwsqvLizGYnCgPkKnX1Sb4VLQ
 iMOlKOWhPrx1piaDxup49hJej0rDnfB59oa08xyxTbuxuIkoP6aJj3VQQd+p5KteZpouVOx
 3WDisypXG6Rua3Soolst+8QjhMSWXWUrM9hiplejTPf/2IUWgOgsQ7cq86sYKe7K8uUk0ce
 Ip0fwALjlYjbr5r+0F5RQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1WWx4g9Ba3M=;bwBSUAj+ZXwoKoEmLNzkH2p6dzv
 TuleNe3F64OudF81OhNYHB6wpej9TYJPm6oML7hNpoj/HaTapwkLb3AgfO6b+MLU9Kvu8s5Ev
 1J9/liOcr73nu6JD36kyMP5/GtP1omrL9FQcDjTdmD/rMGAlURV9LEMGUbKllkrYYctchG6xk
 +yNbMyLT/hBLeCsuhyvMVOYgblRzq550esbgvl4HheG8YWb78NR8FB3yP8W7ko2BNY2LG+pL1
 ai9J3mAqOTns2WLN8Oi5+24iznNZMEqVQTMydLVV+ZnfFsI/zvy+fc5QDPaq0wB7/90wB7hkP
 kNGPo2ii4XJy1BEAp5Cxb70NWbVTKveMGGVwRSJg0qdmxwZz1VXjo7o9BeNXt5AF68FnPpaXE
 4jBKrId/dcgJJ9fVQ2rYya4AWYB67GITH3vUBwfFXQouyTDJFZh8tqba7cAxADzOADP/GVMC5
 fj9iuH7E1wGlq6mZneKuQ9m2FNu3ryvzT3SSc28biaATpzK8hpzBKcTRD76H7NyavbOOQmI7s
 v628RfbstuNW9q+sB3bmEgaaFmocRQERL2o5NbnLVzoam3MXyAS9J3kF1dWH5MW60uRMVxjXo
 7N81mN5s+C5EEUi7/JRJXmB41+bW4Agz3o6q27QYQ8AZYRCZ13HYo1EdK3wsIZFsmgLRGxULE
 BjE1pj/5uJXUEd0aIRTv1pPb9j+UobcZVOt45AWTx+MoN9qpw24tOO0+L8U4ugAozGI/yTrB9
 1vuw4mbXKv/KbOiKezQwuTCL85nRwwPNcn0tmuVnrii7iS97Nq0Xcs6eVHzmv1dZ+WeEo23hm
 vNWNYqrceYDF3FzCXZL0eAgFDQhZm86ZNHTTXxAj013EBL4YDoDodnx2ugIM2v3Nrula2HOcc
 EUwwATy4V56ZssoHRLCM1Ix13+bJUk4hYujdUwoIu/GYjeebMp8Q2i4CDjlKbeh+JUSgLqSRI
 u6zsqGIztDPJNR4SRmhhZC9ZlYQ=
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/24/23 10:58, Thomas Zimmermann wrote:
> Set the owner field of various drivers' fb_ops instance. The
> setting is required by fbcon, which acquires a reference on the
> fbdev driver's module. Otherwise, users could attempt to unload
> the module while it's still in use.
>
> Thomas Zimmermann (3):
>    fbdev/68328fb: Init owner field of struct fb_ops
>    fbdev/ps3fb: Init owner field of struct fb_ops
>    fbdev/vfb: Init owner field of struct fb_ops
>
>   drivers/video/fbdev/68328fb.c | 1 +
>   drivers/video/fbdev/ps3fb.c   | 1 +
>   drivers/video/fbdev/vfb.c     | 1 +
>   3 files changed, 3 insertions(+)
>

Series applied.

Thank you!
Helge
