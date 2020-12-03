Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E56502CE1F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 23:41:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn9mw2R88zDrMT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 09:41:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p1gwki3o; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn9ky04WYzDr32
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 09:39:52 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id f9so1713472pfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Dec 2020 14:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qtj77dS9cHDPtLOQV8kRZMJrnqowkKFbs0Ao69ze8yo=;
 b=p1gwki3oOUo+P7PEOXQvu0gEWvu282wplUNpim3bRudNhLVadPVjh3Nx0CBqu2B2si
 2tH9peMetiV8ZLFoBtSCyttjOzm46Xp/iC8USe1djX4MQr7Dnb5fAKiuRvzC829CKSYf
 vZvcGqDgtR4MeHvDKqhfVjCsRNSHd33LVwpqdNceX/miA/4I/MPUDdCxbDWoRMBSfCiv
 ZLxzMWwOunAjPVyEudrVou3xwAcj4ypDZFOVMqQ/pSaLUmyYH3L5ej5MKHVreGIMiRNy
 LE6PYmlZKKud/KnvpcHekr/20xf9NQshmEvEL8ZJuip+Xhm6YHgc1hnkv1AjVnHBpOoq
 8qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qtj77dS9cHDPtLOQV8kRZMJrnqowkKFbs0Ao69ze8yo=;
 b=F8SCSbouaWAm8Kp3ychtyfHwiBSbdXtzWJ/SdB0rcHCQS2ZD5Ju7SnoqRuR6I7oXTz
 cPbSFGpDhOcQj3N1U6s6ckUuj2c53RU2OShhz7XH5toLw2ZPY+i6LT73wQ315I5JndGV
 S0xKJbuSOghGR+3idcmWocYb5bxZXPBbgnFm5kYv1FDW5x3uUVvVfdhU2yHA34YFcAZH
 2WWoqQt65EHaxQx8EG4rn5UlPhZ8HvGftJGgGMDual83j4KyZiP0ld7ZeqErWyjVVIeH
 Wg1UybvsUXlipqRhoDs58CvtlvrB88pej6Ii/lvKXTg4k3+kr+JQ+jJahStlMGHSIVvd
 ESvA==
X-Gm-Message-State: AOAM532heYYuSMlHmr0DHIc8+sxqaByuQxGQwTlL6KDQEoGJPH9DvYXz
 HlIV+st680XILN4t26ygoJc=
X-Google-Smtp-Source: ABdhPJyRSHJAid1qLYHP9zDmtf4HjETwpYJVHYSQGmjoPkUfJgaFvmQ4jNjlnjBiGOtzRniTkZ8HUA==
X-Received: by 2002:a63:4623:: with SMTP id t35mr4888350pga.270.1607035188896; 
 Thu, 03 Dec 2020 14:39:48 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u3sm2817244pfu.47.2020.12.03.14.39.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Dec 2020 14:39:48 -0800 (PST)
Date: Thu, 3 Dec 2020 14:36:55 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl_aud2htx: mark PM functions as __maybe_unused
Message-ID: <20201203223654.GA10130@Asurada-Nvidia>
References: <20201203222900.1042578-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203222900.1042578-1-arnd@kernel.org>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Timur Tabi <timur@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 11:28:47PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_PM is disabled, we get a warning for unused functions:
> 
> sound/soc/fsl/fsl_aud2htx.c:261:12: error: unused function 'fsl_aud2htx_runtime_suspend' [-Werror,-Wunused-function]
> static int fsl_aud2htx_runtime_suspend(struct device *dev)
> sound/soc/fsl/fsl_aud2htx.c:271:12: error: unused function 'fsl_aud2htx_runtime_resume' [-Werror,-Wunused-function]
> static int fsl_aud2htx_runtime_resume(struct device *dev)
> 
> Mark these as __maybe_unused to avoid the warning without adding
> an #ifdef.
> 
> Fixes: 8a24c834c053 ("ASoC: fsl_aud2htx: Add aud2htx module driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
