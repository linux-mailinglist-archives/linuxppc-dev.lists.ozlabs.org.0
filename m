Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E782B7417D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 00:35:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45v9Cg0L3yzDqGg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 08:35:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nkBeIOGm"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45v99k5NPhzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 08:33:44 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id o13so21901569pgp.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 15:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y/x6T9kinMfPan8m7akcwnPUQ5JFdRG0gz/KSb0mcCI=;
 b=nkBeIOGm6q+oZWaL1ucDgpjPsDPDqfkbxl/mobplA0/OSCxx9bfOy3wgZHieGk4UuF
 V9blwGoM6eEl3/UJpefJ1Jwp/LLvbTNcNUw32bnxDFkbkKHJSO8W2bwDMh1Yv9w2ez7X
 Sdj7jZHap6xYPpj9fAHjMpeCZkImIcYI1iqdB3hBEpdadCnC9/dK26taxnQmhL2Ta3In
 ZuLf2khv7kwyCo1FmEP77XOXrr7xEAPq0Y1/ZUqy+HLPII4Q3y2YKgLHkxmL1uoiW3UB
 4hCXeOMbFEnhC52VlKcTN7hB6dpWyghayWkm0FYLQjutHOG/MXObHvrkFtKKAgcV90ap
 QKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y/x6T9kinMfPan8m7akcwnPUQ5JFdRG0gz/KSb0mcCI=;
 b=Gj9/dzCVejBKnnnUtGWgopmv8k4yQvAw8ez2JafaIc4BjfSOwrNfGwVyWeUZOEFoyr
 yi6wB6POIta/B1MR3XlpzFkbPdxsRKknRDWAuF5UE685SaXNRrHm+S++8nLJ2Ur8LSzE
 168cu84b+64o9TPfxGTzD1KYi+cJrum1B9g99FqInm3kNoDejUp0UQFFQ82O7BdWuZ6D
 z6T+gDvkb4gTNUb4XmwlV55vmF4r4os7o/j27gxwImmNivEcL4a0n4FYG/yZCFEMv8MG
 cNpUIAL4SBNsdBn+rYCZG/f6WrxhmTFdt+6xMVMS19R8Q7vJahQCOeRUXjG1w/uBYqgH
 VoJw==
X-Gm-Message-State: APjAAAURu5XbNm+ZyTX8NRccaapsY+5aIhxt23IPgJVBiLWaQM/3z5Mn
 4GbnQ+cGoFglmOVCAFH6Hc8=
X-Google-Smtp-Source: APXvYqz8l8S9S4kT3bBRHUZtDyZDw87gOZ6oemul7YrBcmpaj0riEqQvW2MvkMmjoQau2NA+p6bWnA==
X-Received: by 2002:a17:90a:ad89:: with SMTP id
 s9mr90574492pjq.41.1564007620473; 
 Wed, 24 Jul 2019 15:33:40 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id w14sm53942878pfn.47.2019.07.24.15.33.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 15:33:40 -0700 (PDT)
Date: Wed, 24 Jul 2019 15:34:22 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH 01/10] ASoC: fsl_sai: add of_match data
Message-ID: <20190724223422.GA6859@Asurada-Nvidia.nvidia.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-2-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722124833.28757-2-daniel.baluta@nxp.com>
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
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, perex@perex.cz, broonie@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 03:48:24PM +0300, Daniel Baluta wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> New revisions of the SAI IP block have even more differences that need
> be taken into account by the driver. To avoid sprinking compatible
> checks all over the driver move the current differences into of_match_data.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Looks like Mark has applied this already? If so, should probably
drop applied ones and rebase the remaining patches for a resend.
