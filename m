Return-Path: <linuxppc-dev+bounces-16355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMbdEQX3eWkE1QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 12:46:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F0A0C27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 12:46:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1L814Zk0z2xm3;
	Wed, 28 Jan 2026 22:46:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769600769;
	cv=none; b=GEZBhnOLDTWUH/PspV6/8wMme8XcXA7r9TqirfcQ5gQP6jQ45SsU+kBt0pBKePAu0x6LfUddTYv/LXmDN/wFbN8lmW/kX2+PqwCq6ZM9MJpHUbtiXwdsOyFzmq+mXxp5uV84oU8K1jRWC0SF2RVCw5hqN6he3XHAnprqT/hPgTQ3p2n11JqkiGIEb0Aom5DzpXwwjUV5JeAiyZb596iJUCu+X+uX/BRrHQXftopAAjHABIVN9IzkRh2PmvYYzZ0amNwTpWHPl9/N+EkqkGkkdhAG4uxS2GfQJMqkkTvECS1E8XuAs7Hp1cBJmRcKEnw8HDpfLa3O5g7JAzP05d/54A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769600769; c=relaxed/relaxed;
	bh=gkOEXyC/0gCse7bBNhfu8r/cAT6OuOtpOsSIyHaDmlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6PUYR9u/ZNRmvVSYcxKW6IAJf57+JYAMZMe1vCJI2bRTpw+aEuXfR7XI4IC2fF3nONii2qD2PSELXZ3g0DD6pGhS+Yt7LEigD3Gho3wdVuJyDAjl4LwQHYRDBO4tBX05EnSM0t0whtUO6JVXNFbN8mjESVXs5OmXxV+FAP0HVMc7/1grNJru5r+LK+jN8MzA0PF9Bl0GZuMuX3YhdJ37KzdfcRnZ+q0hoWPUzAa5xkTa6hiVYJpF5pKIV+V7Cx8P33/HcVreVfsk3ejUXyXpjqLTCUx+/frcm5VKWqv6msWsO496AacunKFP9aPwj8ln+LeEYSebXWjLERC+9CBkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DewNZW4x; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DewNZW4x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1L806b62z2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 22:46:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47968600AD;
	Wed, 28 Jan 2026 11:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B48BC4CEF1;
	Wed, 28 Jan 2026 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769600766;
	bh=gkOEXyC/0gCse7bBNhfu8r/cAT6OuOtpOsSIyHaDmlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DewNZW4xe/HsC2IwNbH7ZHZuQK/jdLOGAoXLQmB7DAVHUIz7pWjSYl0TsDcNtU892
	 iaTLLo762MtsBUd8L4iVtF1NF4/KXtzmt5M7jf4jG6Awnm/o+sDNOxXWuL19S3VFNI
	 CKohONU8IJXABxx4UkdUxEh1lBVRh6pFYZeV5XVJI5td0nYaAqbjATZI4Q0uNowdGL
	 iYkS8pMD6pJU4QyAen/oTp6p5vndkJMf+p3PsoCVSx34y/DplORAoxjNyIhwAuCDyt
	 hQKwPjYmCp4eLKzbtqy2UykO8DIBrwgVqYA/JIdHnXzUw9Rzxvx8RrHshpIdH2ekL6
	 srqp/vndJGnQQ==
Date: Wed, 28 Jan 2026 12:46:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
Message-ID: <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-2-shengjiu.wang@nxp.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128071853.2602784-2-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16355-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 422F0A0C27
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:18:51PM +0800, Shengjiu Wang wrote:
> Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform

We see this from the diff. Say something useful.

Also, why power domains are not required?


Best regards,
Krzysztof


