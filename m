Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4A914569
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 10:53:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Lb/JDqYv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W71wC0qtxz3cWN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Lb/JDqYv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W71t53WNKz3cW1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 18:51:57 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A16229C5B37;
	Mon, 24 Jun 2024 04:51:56 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 1bgfUhXbQxyf; Mon, 24 Jun 2024 04:51:56 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 12A3E9C0760;
	Mon, 24 Jun 2024 04:51:56 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 12A3E9C0760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1719219116; bh=ywUot3rVde8QyC4XFzB69VkfFZ81TabakSY7pKOGwNI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Lb/JDqYvbCLOxwHnIAGfWllK8kIIRjuyG8PuIPzCh1ronj7Exjf3inbdEeyFSMJxT
	 M1nnT5HyczGirf+cvKnulquvAgW6pOcmEkt/VI0W3lVYe6qhNYmAH2aHuoRQViLaag
	 f21KX2A7RMc+uoZTixi1gMnHxKh+xvQ8Tme5n11IzQSxN3axsXCXOIrvM+R8OsswRI
	 t1j8EVj0Tx+x5OFtnLHH08HckNFlENjyeGYu2szqnCUBcehEIsJ+GjMMmQG2ApOnDY
	 nLgA8h7svYlxiGkAdxU3cVIsPIk88YTHxq5/RA7BmIpGEaPTDx/l2UJCuIuZfDU+OF
	 TIVWSVv01UkAw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id qeHu2LUwBW_G; Mon, 24 Jun 2024 04:51:55 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B87A49C5B37;
	Mon, 24 Jun 2024 04:51:55 -0400 (EDT)
Date: Mon, 24 Jun 2024 04:51:55 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <676829420.1714448.1719219115719.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <2c32e077-48ef-4d08-99ce-9072a339740c@kernel.org>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com> <20240620132511.4291-9-elinor.montmasson@savoirfairelinux.com> <2c32e077-48ef-4d08-99ce-9072a339740c@kernel.org>
Subject: Re: [PATCHv5 8/9] arm64: dts: imx8m: update spdif sound card node
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: arm64: dts: imx8m: update spdif sound card node properties
Thread-Index: OrrUPkiV572zhM5QFQUzINFUm+660w==
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
Cc: imx <imx@lists.linux.dev>, alsa-devel <alsa-devel@alsa-project.org>, Xiubo Lee <Xiubo.Lee@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>, shengjiu wang <shengjiu.wang@gmail.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, devicetree <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-sound <linux-sound@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Krzysztof Kozlowski" <krzk@kernel.org>
Sent: Sunday, 23 June, 2024 13:10:48
> On 20/06/2024 15:25, Elinor Montmasson wrote:
>> Following merge of imx-spdif driver into fsl-asoc-card:
>> * update properties to match those used by fsl-asoc-card.
>> * S/PDIF in/out dummy codecs must now be declared explicitly, add and
>>   use them.
>> 
>> These modifications were tested only on an imx8mn-evk board.
> 
> So new DTS will not work on old kernel... Can you at least explain why
> this is needed and what benefits this make? You change hardware
> description, so whatever you merged in drivers is not really relevant, I
> would say.


Ack, I will explain the reasons in the commit message,
which are in my answer to your review of commit 7/9.


Best regards,
Elinor Montmasson
