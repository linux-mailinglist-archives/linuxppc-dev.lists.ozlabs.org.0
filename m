Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB77745CEC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:13:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvmZh1JTLz3c4T
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 23:13:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=zcdc=cv=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvmZ752Zhz2xqd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 23:13:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DF8F60F19;
	Mon,  3 Jul 2023 13:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9EAC433C9;
	Mon,  3 Jul 2023 13:12:56 +0000 (UTC)
Message-ID: <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
Date: Mon, 3 Jul 2023 15:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
 <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de>
 <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Jacopo Mondi <jacopo@jmondi.org>, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, Sakari Ailus <sakari.ailus@iki.fi>, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/07/2023 14:53, Mark Brown wrote:
> On Mon, Jul 03, 2023 at 02:07:10PM +0200, Takashi Iwai wrote:
>> Shengjiu Wang wrote:
> 
>>> There is no such memory to memory interface defined in ALSA.  Seems
>>> ALSA is not designed for M2M cases.
> 
>> There is no restriction to implement memory-to-memory capture in ALSA
>> framework.  It'd be a matter of the setup of PCM capture source, and
>> you can create a corresponding kcontrol element to switch the mode or
>> assign a dedicated PCM substream, for example.  It's just that there
>> was little demand for that.
> 
> Yeah, it's not a terrible idea.  We might use it more if we ever get
> better support for DSP audio, routing between the DSP and external
> devices if driven from the CPU would be a memory to memory thing.
> 
>> I'm not much against adding the audio capture feature to V4L2,
>> though, if it really makes sense.  But creating a crafted /dev/audio*
>> doesn't look like a great idea to me, at least.
> 
> I've still not looked at the code at all.

My main concern is that these cross-subsystem drivers are a pain to
maintain. So there have to be good reasons to do this.

Also it is kind of weird to have to use the V4L2 API in userspace to
deal with a specific audio conversion. Quite unexpected.

But in the end, that's a decision I can't make.

So I wait for that feedback. Note that if the decision is made that this
can use V4L2, then there is quite a lot more that needs to be done:
documentation, new compliance tests, etc. It's adding a new API, and that
comes with additional work...

Regards,

	Hans
