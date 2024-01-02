Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C48821B16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 12:38:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=HfBx0L9S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T49pb3mPkz3cRq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 22:38:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=HfBx0L9S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T49nl1V2nz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jan 2024 22:37:45 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DFB4E9C0888;
	Tue,  2 Jan 2024 06:37:40 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id oH47By21Q_s9; Tue,  2 Jan 2024 06:37:40 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 50F959C0957;
	Tue,  2 Jan 2024 06:37:40 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 50F959C0957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1704195460; bh=bAsNfTDPGcy9UE/qR8q9C/MYhrYIBcUMKG2G3Oi4VLE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=HfBx0L9SYhFxNTXnatyaVVD/0MKoxKv1DkFPwS4FhP21ZdGhZFAP2Yw2hgXG5W1+t
	 DG22L6dYlNdqI/yA4nolhiQbAYRMk3Yvd1vhj35YZTZ1keQ1XC+emTImMoQmjgdIjh
	 alA58hoYPXIYl8/8523fTVCfrQVCNMBqb6qPyKUQ1uoRLrwWFtxWeVm73HyoV71weA
	 Vcvll8Fbldw/DCB9WQCaUVbMMf9+FXj0uatTbgq9RGC183UtRM5ockSfi6AD3jQlfV
	 NlAXW2vSrvxzA0K2KrHkaWWkgrrQsn+4DCiJZlStF1JhWW5TYl6ACLELjZgkVicaEV
	 5OCMfpqr9RX7g==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 20Ly5X62OB9G; Tue,  2 Jan 2024 06:37:40 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1AD139C0888;
	Tue,  2 Jan 2024 06:37:40 -0500 (EST)
Date: Tue, 2 Jan 2024 06:37:39 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <1300509761.24764.1704195459987.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <20231220222550.GA1232936-robh@kernel.org>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com> <20231218124058.2047167-11-elinor.montmasson@savoirfairelinux.com> <20231220222550.GA1232936-robh@kernel.org>
Subject: Re: [PATCHv3 RESEND 10/10] ASoC: dt-bindings: fsl-asoc-card: add
 compatible for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: fsl-asoc-card: add compatible for generic codec
Thread-Index: r/qDupTL/n3XOuEH8yE+GIqg/zABBQ==
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
Cc: devicetree <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, alsa-devel <alsa-devel@alsa-project.org>, Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound <linux-sound@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, shengjiu wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wednesday, 20 December, 2023 23:25:50, Rob Herring wrote:
> On Mon, Dec 18, 2023 at 01:40:58PM +0100, Elinor Montmasson wrote: 
> > +Optional, relevant only with the "fsl,imx-audio-generic" compatible: 
> > + 
> > + - cpu-slot-width : Indicates a specific TDM slot width in bits. 
> > + - cpu-slot-num : Indicates a specific number of TDM slots per frame. 
> 
> Pretty sure I've seen other bindings with TDM slot properties. A sign we 
> need something common if we don't already have something. 

That's right, "tdm-slot.txt" already defines TDM bindings, I will
use them with the utility function snd_soc_of_parse_tdm_slot().

> > + - cpu-sysclk-freq-rx : Frequency of the CPU DAI sys clock for Rx. 
> > + - cpu-sysclk-freq-tx : Frequency of the CPU DAI sys clock for Tx. 
> > + 
> > + - cpu-sysclk-dir-rx-out : Boolean property. Specifies sys clock direction 
> > + as 'out' on initialization for Rx. 
> > + If not set, default direction is 'in'. 
> > + - cpu-sysclk-dir-tx-out : Boolean property. Specifies sys clock direction 
> > + as 'out' on initialization for Tx. 
> > + If not set, default direction is 'in'. 
> 
> Looks like clock stuff. Use the clock binding. 

simple-card defines similar properties at the dai level:
"system-clock-frequency" and "system-clock-direction-out".
The first is used if no "clocks" binding is specified for the dai node.

Maybe I could use a similar logic with fsl-asoc-card ?
* adding a "clock-cpu" phandle property which should be the cpu clock.
It will be used to retreive the frequency for both RX and TX.
* keeping "cpu-sysclk-freq-rx"/"cpu-sysclk-freq-tx", which are used if
no clock is provided, like "system-clock-frequency" in simple-card.
* keep using "cpu-sysclk-dir-rx-out"/"cpu-sysclk-dir-tx-out", like
"system-clock-direction-out" in simple card.

Also, maybe I could rename my new properties:
cpu-system-clock-frequency-tx, cpu-system-clock-direction-out-rx, ...
It would better match those in simple-card as they do the same thing.

Best regards,
Elinor Montmasson
