Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 883047F553D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 01:22:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NrtdkBBs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbJjW2b9Rz3dLZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:22:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NrtdkBBs;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbJhf1ztSz3cZr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 11:22:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700698930;
	bh=M5GDyE4zSQHOMo2VmEGb9eJcwSsa+CIf5IyoPYCZygg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NrtdkBBs015WyelROXUBRNgCnLIY6y49tPIx5poCTLUzO6lSBg0XPb09wKF0e9ls8
	 3HRRMFU+c496ylfCFx8L0CsJ0Bqw8zQvgEdN7LAYDlyvX7lcYoilEDVIX+ZKWKG+BD
	 9lobJYHa2i9iecS6QXHAf0rOhx4mqUjyrlb0Ff3evLSLFa0dM1aZ/k2dBIc+5v577Z
	 DSUXn5/q04RF7KyPazlXG3sW3EeCZTV85iBJa+SciiMYz+C4241fXmm3OnLuklz61n
	 Avp0X4UQ5uo/MejgVOB932Vz1GNvmB1TUWBca7fMR7gcSLO8EGTV/QrZbTEIbCizyj
	 0zJF4jegbfWhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbJhc08sZz4x1p;
	Thu, 23 Nov 2023 11:22:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: cs4270: Remove unused codec
In-Reply-To: <ZV3pIb1p52CFNsSl@finisterre.sirena.org.uk>
References: <20231122062712.2250426-1-mpe@ellerman.id.au>
 <20231122062712.2250426-2-mpe@ellerman.id.au>
 <ZV3pIb1p52CFNsSl@finisterre.sirena.org.uk>
Date: Thu, 23 Nov 2023 11:22:07 +1100
Message-ID: <877cm9s4i8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, david.rhodes@cirrus.com, nicoleotsuka@gmail.com, paul.gortmaker@windriver.com, rf@opensource.cirrus.com, patches@opensource.cirrus.com, perex@perex.cz, james.schulman@cirrus.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark Brown <broonie@kernel.org> writes:
> On Wed, Nov 22, 2023 at 05:27:12PM +1100, Michael Ellerman wrote:
>> The only driver to enable SND_SOC_CS4270 was SND_SOC_MPC8610_HPCD, which
>> was dropped in the preceding commit. Remove the codec as unused.
>
> There's no real overhead from having extra drivers and we do have
> generic drivers that people can attach CODECs to.

OK. I have no idea how sound works, I was just cleaning things up. So
whatever you think is best.

cheers
