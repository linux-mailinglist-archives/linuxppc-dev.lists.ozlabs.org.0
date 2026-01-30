Return-Path: <linuxppc-dev+bounces-16422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN2jErxbfGkYMAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:20:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A75B7D9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:20:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2S8R6zfBz30M0;
	Fri, 30 Jan 2026 18:20:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769757623;
	cv=pass; b=Fc1u6/RSLrtXh47U/p8Ik3FYXJx6R7aQdpjJBchkmOQ6hvyk4KZMmlWQJ7JaeDeeeiZt+BOMnvwOFqM0EKlZeSXcnMMMIkwaRT6XnSI8gGSZ9GBCwYmkZzaBGJz1TOluTxChW0AViaWfJg2+0wkMHiaSODjF4RK1qCWfObxF/yAeWSsPpHF+9gVlnXAkv7t3bva4jQylvWOLgx+Bj4Vca4YWdjI0xVyhyFW30QYzzv+1xUXJfJqWwVzUg9zHxXkAlFUZuiYpcgBz+se9xYVnTOnhVpuPK1+aMise1FpRN0vA38ug17WJljPpwt1e0UeclDXcjG5QYh527OcJWXIasg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769757623; c=relaxed/relaxed;
	bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/KN2WoZ2Du9/EgBDI/2cgnFdLPRV0rLERhYJf0sHDThURR1hx05mOmaxaEuU3Ve1duqh95VWAzawIijWH4UZr3l53LNJtn4g4hVSOREuLHVCNkhCWFVCdlxWZdYG7mQ4iHjCEOiNVA7AU0C8gI7kFtFE05S7DSu/ObA2jjBOAi3V+UQzoLEEUy049YKq3z3avOayMyD3KVhsJl3/gBPkeG/SXqDFRRuwVRqb/OTCndPEQwG2YAwVJSk+BROTuAV6GyHOP/EXm+ogjLuxCFK3cJxI+E4K+CZ+07peIZkbWSuHEwHGyTMH295sN4Gh6vLlqU10Yd4moyJwRovkQ3r7A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ffO15Ghb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122b; helo=mail-dl1-x122b.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ffO15Ghb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122b; helo=mail-dl1-x122b.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122b.google.com (mail-dl1-x122b.google.com [IPv6:2607:f8b0:4864:20::122b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2S8Q1HXvz30FF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 18:20:21 +1100 (AEDT)
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-124afd03fd1so2789271c88.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 23:20:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769757614; cv=none;
        d=google.com; s=arc-20240605;
        b=lOizwf3KTMfhwpltA5TeSk8PctiWgampNOYu2F19if5L2PtnUQ5bMM5n5Tm/k7omJ2
         ZIfDa0AJA+HK6q9f6wBl/62a4JHQUfNpsKshgMRgtw+SxBbUGDyVh/GxVLhXiJ0g9oIl
         9x8LNnQ7r1hJv8JdQyuzWkTTMOsc2QNhewhLPAyzKPkwQlFpgSZGpl5nvdxOoiGy9f3l
         tVqDVeFMGuNzR8J4d59ajzk8LkWuZ2bGZk311Xl0MZpAECXWkRkzRd7AUo96poAy36F2
         Qhcnn6KWQl7IjMUMcxBNKHp9OaCZNeLg2r6+hu6+RsuBmvirBHEnFdPrfiblvlMzQFyA
         cdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        fh=J2VvihtnvH65RNRk0CllUBMbwcECnJHOnYtdiVIKvHs=;
        b=On9i3kNNvU3xN4fM9aZBpWB2N/Gg7O4ndDptWfnykFiEvf8R9BHdPfE2ZHryuKYE5x
         2LEqVAIMWqiGXgAVm9I7/34Z4bidsAe37PYQRRbs6nSOgeg3t6Rq8zAPskeYQWrvhOhN
         YZN0wFLb+7Q86VyOt02anJbQafxkf3DBWuILPxoh5pW+92sT4nnqjBr2oM90l1aEUGwy
         I49umtqzbW8z/Cluf+UjON5cyNEbJr31jAHZFsSQqv9Xh/3bjhv80JbGdh1VmeljhkNX
         cRq6sh2/yjtfqeRoBgEgs+lso9pBwnMYZ/H8FOd3qiQKoo7rdOZ+FiiwI1dCrznpYy0N
         Uqsw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769757614; x=1770362414; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        b=ffO15GhbDUyiqB1YSmwrqhjn0MTvTIrFHjvaR+X3zl6cNbC/Re/h1HJEID6pY1RoJJ
         r7ElkmAJ3VTCYVl7c9h9JxfSBaN0MZdwBCOTppgNNR9aYGBWPXeYArUlP9N/65lt0Pzi
         IU+KfqJ1jdPh1mr0qK53Egh4ruov2y/yAF8BxRUOdwbfudEgrCIMxeeU60FJvFPscgwn
         /r6KcjngPldWOcQiyYmnA3BhFbtCw9RATTYNElp6lezn9PlBHfY/PYaCihkf01UQn3eu
         ExVgttuxQacrkBKvXU979m+Ncdiv1E7R4+WLnhG8uFzX3xYf8gOn1eAjNVBznI8i/Hhy
         SAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757614; x=1770362414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        b=iA0f10Hwl7AHBjLmH1pyRkKJYlVoe0Rwe7jztplkYSGocFN5UhxQ/Knc4g31V9y5kV
         2xYHfZNqplgL9PrgioYC62bc0Ai1078y+scMC/8HckhhA77RNeXv4TLi3aMOqh5uh8Yp
         dU1fNjCLX8eXvtltlcUWWiLgswkdXgC3PAu19KDVon5RLAoXYWnAczVDy9/NMPl8WQq1
         UhBX3HV93YFzzDUIxjO3IluOIugHlD0yod3w16SPubex8cA/HZpXQNOb9YRgPFGsr+ve
         N/hzX8JPjgky5XqZCbQxUocMKUWWJ0z9EKN1Zy/GjHw8m5vXyNwAJSDHXYOjfqa/fnKa
         6R2g==
X-Forwarded-Encrypted: i=1; AJvYcCWqKVav/xSarrY8so+/WglxaS2ItX3J9N/fpKs3ObKErEhV8EI+8GlpKfb0mZmsBtPycqIvNgAGivgp7es=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJJgsQm3YNmEPERul9Yl24IVVLyPzfAY9iC9DWAjnJnenOaORw
	Ow+EEOnM8ZFK/RtAzEoBrwKoX0nDn51fdqq4rVyZ9PQz+5e48GPZFtK2O5Y19vC54r01bCMrdoa
	NFCTM/lcT4/1XW19eZZBe8pMc/UeFgiw=
X-Gm-Gg: AZuq6aI9rh9ilNo8rCssYnf9rFqOtwklXhCdTCVec6NnokjHRUjHZn+IFaZaoJt655H
	8ALuaLqjzj+O3jOQLSY1NhVpKWDXZJ0rtkdKuG6WyGWo8z1+PHTBWL3uwoYhyTBCThrIos+HXwW
	/yX/LRCWt8Vu+BMQcyidk2ewwwKBnq+QBXsknGuKIoEUpMdn/18uoL5x/9mDovqXbcQh4OlDxg/
	cy/6XRRUdZCVk/fK8IUcd5TvAntT2SJa6Vy7vL3hXSMccpabAhgKh8CCjrEt0TAZX0PKQkGNH4D
	CQFvcQQcmSVZNd3R1/jDkFOhj4hP/mMGs092V/8OdWNuNsg/MydjM3G2mSgXRc1btUFFLt6bhsM
	D09mSs3zy+GhcuQ==
X-Received: by 2002:a05:7022:207:b0:123:35a4:e8be with SMTP id
 a92af1059eb24-125c0f8d01fmr955848c88.13.1769757613717; Thu, 29 Jan 2026
 23:20:13 -0800 (PST)
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
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com> <20260130054330.3462544-2-shengjiu.wang@nxp.com>
In-Reply-To: <20260130054330.3462544-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 09:20:01 +0200
X-Gm-Features: AZwV_QhrTfQ-UYZ4PfDVoCm6fliDdKe2PvVXhTLbJKtRrXqH5MmZHe0lNlu_Efo
Message-ID: <CAEnQRZC5umZYoxemGO_yc5xT328uQxUG8Sg8yZvgDowhLP6UPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16422-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[danielbaluta@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielbaluta@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A5A75B7D9A
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform,
> below are the differences that make this ASRC not fallback compatible
> with other platforms.
>
> 1) There is a power domain on i.MX952 for the wakeupmix system where
> ASRC is in. But it is enabled by default, ASRC device don't need
> to enable it, so it is optional for i.MX952.
> 2) The clock sources of ASRC are different on i.MX952.
> 3) There is a limitation on i.MX952 that DMA request is not cleared at th=
e
> end of conversion with dma slave mode. Which causes sample is dropped fro=
m
> the input fifo on the second time if DMA is triggered before the client
> device and DMA may copy wrong data from output fifo as the output fifo is
> not ready in the beginning. So there is specially handling in the driver.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

