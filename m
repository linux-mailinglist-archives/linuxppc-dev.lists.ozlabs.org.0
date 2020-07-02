Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307D212C7F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:46:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yRrN18sMzDr2w
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 04:46:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r6HE+0mZ; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yRn60090zDr30
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 04:43:21 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u185so10865283pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T8AFzNr8FTwNK1ymuDjuXty3ke3mxQ2LEmj5APqSzAs=;
 b=r6HE+0mZ02w7MurOAipYo+NhP+BXB+/ZheXD3JdoLZTRukq/OOKHZJHm/5DpdUZVYV
 8e/d2StblsM1xLyj0G+WXd+YBpY0tZb8VuZBdzesAbY6aSS+GE/d+e/sbyw/EV8BQo5u
 4iUQr7tSE53nEj3vSDrahVbtJ/01g6PsWhbPO4KueXaZQGbrsL0CLnr0OBKaRa5zHoCs
 By7G26zmROIR5XQMzCloUCTxr10YGwbOBWaHqPGt3a+WLIvc7mUwbeaoqET6HC0il/ML
 cJ9pHCUydheBLoq7TX8aCQQj6/ZKoe2uN0S7WfZ3NP5kx7e8RfVDUQJuWMQlG1JXWTLZ
 xZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T8AFzNr8FTwNK1ymuDjuXty3ke3mxQ2LEmj5APqSzAs=;
 b=EmsAu+mQ2ZVdF7IIZWGtnEQ0Mry9ucGXOGp2I6DLEQ7P5ggmaqU9NFfSf94vP1EAYF
 JEo+bS/MsCJRQ0yUDnGoX01PMyK13dVqUsdtmMinPqAMQsAiRdBPiFrMCMMl1LYSxWpU
 9WRQ9N2GW1IYZuhFhbIHHvEZjivfBbUrO1QrRzzH+WK6BpLfeKlZKuvTooRBetnYFyCg
 3HIoVoBA0cBy4Be5CDPI2pAC0E6myujfJJm7LFjF/Z8+NA7mA/OjYk665ISc6sIehO4u
 74X+WfeMXTcdrmxcbsQSaazxYaz2LP9GPBsDq1GLLnrdKTTWWZ1AC1GZOxnsfXhRXfHD
 ADaQ==
X-Gm-Message-State: AOAM532UGdwOgmTtbP1lahJ6GqnWsIO5MK0i8sy4VIBphZ06n2jBrjQ1
 U8nZ5gF2A/yKjne6m4uiBrg=
X-Google-Smtp-Source: ABdhPJyf9rPXrraJ4zNdrCsJxDRxl6SVVSEajMec5OJdQ6AmrIx6KJJeJD6+gb4cN2DXsLXo3syu9Q==
X-Received: by 2002:a62:5e83:: with SMTP id
 s125mr27945470pfb.315.1593715398982; 
 Thu, 02 Jul 2020 11:43:18 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n2sm9335901pgv.37.2020.07.02.11.43.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:43:18 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:43:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/6] ASoC: fsl: fsl_ssi_dbg: remove spurious kernel-doc
 comment start
Message-ID: <20200702184313.GB23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-2-pierre-louis.bossart@linux.intel.com>
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

On Thu, Jul 02, 2020 at 12:22:22PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. There is no kernel-doc here.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
