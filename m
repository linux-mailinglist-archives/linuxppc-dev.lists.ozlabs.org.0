Return-Path: <linuxppc-dev+bounces-3840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E47099E6556
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2024 05:15:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4Hwm1G2Xz2ygY;
	Fri,  6 Dec 2024 15:15:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733458520;
	cv=none; b=J86igDUFrENo3Z4IixPFEqq3hcBc0XgsmbmRESdAjXsjUtFlpaCFuFiw1+fArVUcwnfu+2zoX6Hn9QiCultLTM4KW6qTUbBRzv9noNinS/aygG34vmwvxRO1UWZPn4sM7/b/cmWkvGfYE8VR2rmvUaooUExgInUxbUbfFUGh8P4TpU0zkBsBFrXJcR7BIU5hnhbd+zBxl5CJaTjQ/rQNVO1AdFIk8tHSG2TUvMY8+T52kaMzkObwp4ar72FYPOPtwE/5awpE00QLt9jxKxHEYhY47muu/CKAw/OC6oLior2GXtKMMkhtXdZ+7CyvyaBE1Ro89Xbm3exF7yjJav83Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733458520; c=relaxed/relaxed;
	bh=IKTM5AdEoR8uRDMF8ABzN+U1XZ/WbBUENZ95GQIpAIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXS27kcqtAHdkSYQkwI4/Bs55IfIwqg1n+kih10+ZnfKacjgpOsufRp809sTvEyNKQz84SL26J+TJ0/25O+oASTjvldjTn8zzMl9i5/YNhCXc1dOvTaSYr3gsrTxuFo48eirTF7+p+x+oSKUfOn6ziGnKwuR6N8ED8tJc33uasTDnU6KGEMWSBaGNOyudMYbzgxIX6Ix6jmfl8TXFQWuK5ouvd/ljFlEeCG6+XFf4pZWkL6IV80ceFjeOYzBkZzzM9k1UKjTNWSX/BBdRiwaG8Jki5rtk4vrDdjy8YeHIeiVZusnmxrDx8feIsw/vkEarbs29lmBNKCT+xvuTysSXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m0KAta9D; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m0KAta9D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4Hwl22Rwz2y8n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 15:15:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0D635C7124;
	Fri,  6 Dec 2024 04:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F92C4CED1;
	Fri,  6 Dec 2024 04:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733458515;
	bh=jyZygs4PtekuSAYjjYdnwJp1CvMvMHamuwdIrETXvjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0KAta9DmxO/95gtyc85ZtnoajDQ222at1FzRkXfT32Jf9Fbhf+RqEVcb9NjGPEM+
	 Bgg1AQqDP+jkjB5S8x1vLYAxOljEjpMTSrAn/JLbVK9g2D1qR9C7am1iEc1fXkYu7U
	 6fwUyX5/wSKLv13jzrzIfUG2Re7oOD/uUxiv8r3ssy8jGkf6Ywci2SSWx6obsePYcq
	 sjQopfwZ+TYhzlyfwx1fh8nijWNL5rdCle6eSUhc3yXaspApDz8uPQBFe4oAmXWGkj
	 Hq1ZDUgu+HD46gvI+Wp+JpuEQDDvscp4nIp8PJ7ebz4DqakOY04oojV6z25bHD5Gg2
	 e3GhbIbQuH8sA==
Date: Fri, 6 Dec 2024 09:45:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 RESEND 1/6] ALSA: compress: Add output rate and output
 format support
Message-ID: <Z1J6ThMuT6IW87gr@vaman>
References: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
 <20241204053346.1865723-2-shengjiu.wang@nxp.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204053346.1865723-2-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 04-12-24, 13:33, Shengjiu Wang wrote:
> Add 'pcm_format' for struct snd_codec, add 'pcm_formats' for
> struct snd_codec_desc, these are used for accelerator usage.
> 
> Current accelerator example is sample rate converter (SRC).
> Define struct snd_codec_desc_src for descript minmum and maxmum
> sample rates. And add 'src_d' in union snd_codec_options
> structure. These are mainly used for capbility query.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Jaroslav Kysela <perex@perex.cz>

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

