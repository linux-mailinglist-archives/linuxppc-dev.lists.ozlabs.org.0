Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2981FFBA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 14:46:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=po3U1yBC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1mr96cj1z3cTb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Dec 2023 00:46:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=po3U1yBC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1mqL6MCCz3Wtt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Dec 2023 00:45:49 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0A2DD9C330F;
	Fri, 29 Dec 2023 08:45:45 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id RDHQVC7hAZsW; Fri, 29 Dec 2023 08:45:44 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8E1B49C3380;
	Fri, 29 Dec 2023 08:45:44 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 8E1B49C3380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1703857544; bh=Lyk686/x2Ez5b2w7VD1NWpu9PQmISjz21nS2j3Knoo8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=po3U1yBCDfCq7u3iTDEhMpY8CICqIY+mxPesFY9awIGMWGOZBSA/zcCmtcejahKEW
	 NxEnYNdHTH3keUrQoK5VIZddX58OzHZF1Hff7Os09Z1MeHnvX14ykUwhVJpfvaEphu
	 2xtN3k4Jbr//2Z+G7Lww8H0I944uvqDPcHqGbqwVRz4rYcmOR/C+O3cMFszFNaU/BS
	 CBGXnjsKjfYSoQysu3xVtrJmDCqOSNfRojHHrAVWVqlSXpcpAkfhfViPUEzCTNjpL2
	 ynpe8QHWMOaX0o7K/AQ+KC3XVGR9c//FwgX16u/rbZpvEm9na8cOAcv0dqSrRfDxxz
	 0b26rCZdsiuaA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id sSUMGHPKYEW5; Fri, 29 Dec 2023 08:45:44 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 515039C330F;
	Fri, 29 Dec 2023 08:45:44 -0500 (EST)
Date: Fri, 29 Dec 2023 08:45:44 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <361044647.7067.1703857544284.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <347346270.284192.1702989565367.JavaMail.zimbra@savoirfairelinux.com>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com> <CAEnQRZAwk-USZqXwLOVuN3iTn7r-55BJH=Sqq5+2Od+DhrK0iw@mail.gmail.com> <347346270.284192.1702989565367.JavaMail.zimbra@savoirfairelinux.com>
Subject: Re: [PATCHv3 RESEND 00/10] ASoC: fsl-asoc-card: compatibility
 integration of a generic codec use case for use with S/PDIF controller
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: fsl-asoc-card: compatibility integration of a generic codec use case for use with S/PDIF controller
Thread-Index: lu32M+7WowvRn2WxYZZGeiz9hy0xKkRA+mdz
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
Cc: devicetree <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, alsa-devel <alsa-devel@alsa-project.org>, Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, linux-sound <linux-sound@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, shengjiu wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello

On Monday, 18 December, 2023 14:54:03, Daniel Baluta wrote 
> I know this is extra-work but we would greatly appreciate if you first 
> convert fsl-asoc-card.txt 
> to yml format and then add your new properties. 

DT schema must have at least one maintainer in the "maintainers" field.
Who should I put for fsl-asoc-card.yaml ?

Best regards, 
Elinor Montmasson 

