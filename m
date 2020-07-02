Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 168DC212CA4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:57:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yS5j1yxbzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 04:57:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A3G4MtAN; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yS3m5MsgzDq7h
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 04:56:04 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w19so971341ply.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qBFSIEqb3Ng7/lC0JUelHpDcsFXn4/YiY3KJn+e0D5Y=;
 b=A3G4MtANzT6glf9L54RU8hc1oacj7n2KB3QD7g0+kHEo/8S28CgBxelB4vKRcvhnc3
 RSnK4atX1dx5Qih53uU7m0JQvP9hx1zMxNvFzp7+kEavqGXpPcfBUUXibPw5AEBVkSUW
 CpQ82qvhwyIsH9H84QtLcbpcR5C0Xe9EKZhqpVrvMckIzbA8EvZNHDCRzqpqWXVmOo6u
 2b25n3RkYBpMCZnTiTlNwEQDAhnVecoxMzHzgobV4ZxLWKRAqqPFu5bcBygECag2dI2x
 IT9Nf76Z1P0cPoKdTmSIC3Y+fSJeUwVLG1Z0Jj2dgYvKb9bZ3p8Wq1jYn9xzLe1y6b1T
 D9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qBFSIEqb3Ng7/lC0JUelHpDcsFXn4/YiY3KJn+e0D5Y=;
 b=liocY/GWOyIU+Ra75Mb3ZFLp0UxNwu5L+3c2JhNiSerRm4kHKr5LYp9vIiKO3iRueE
 7ceYD8aaHJgURwtkhFaU6nWEAfAVXIiPN5dU3K7pxKVF42k9R5dRm8JDyRcjR1Ebpr6M
 42UZ8pxE9bf51ElwtEKlB+cSehVv0o6iMJnnr969PeIGtYlsGvsfqi/Cdvri12c45+IY
 +q4A9ASjWwuDB81GF9m/wTzqcgpRpfh+6riHfkVgo/l3sfyjJKDM6b+Ub/fWozeDNf96
 7eFKlWmkkAg30NAMeroizWR2DIWDQJsq5y6ut7cyBwMc2DQRnSmkKPomUvPPo2qEyYRn
 ynYg==
X-Gm-Message-State: AOAM533TrmSV7knqUvzC1ucaC4Ad3z+Tr+KqMhSTSmnc3KvVJ/GPi6+g
 S6idxj1K6MLcGjnONzgS3ZBrsce2ubE0Mw==
X-Google-Smtp-Source: ABdhPJzmLnrOT4bL83BOEWHbMjWQcuvAWjX4ZOEdS5WteN03EusTe1EhtKuJZhn9XxejD3G2LQnkxw==
X-Received: by 2002:a17:90a:2465:: with SMTP id
 h92mr3998120pje.26.1593716161116; 
 Thu, 02 Jul 2020 11:56:01 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id m92sm8863055pje.13.2020.07.02.11.56.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:56:00 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:55:56 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 6/6] ASoC: fsl: fsl_esai: fix kernel-doc
Message-ID: <20200702185556.GG23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-7-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, broonie@kernel.org,
 Fabio Estevam <festevam@gmail.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 02, 2020 at 12:22:27PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. Fix kernel-doc syntax and add missing parameters.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> + * fsl_esai_set_dai_sysclk - This function mainly configures the clock frequency of MCLK (HCKT/HCKR)

Can drop "This function mainly"

>  /**
> - * This function configures the related dividers according to the bclk rate
> + * fsl_esai_set_bclk - This function configures the related dividers according to the bclk rate

Here too -- dropping "This function"

Otherwise,
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks!
