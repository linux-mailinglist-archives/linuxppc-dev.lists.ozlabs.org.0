Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489F212C88
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:50:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yRwk6D9bzDr32
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 04:49:58 +1000 (AEST)
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
 header.s=20161025 header.b=Y/eW4I1U; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yRpH5CmCzDqpL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 04:44:23 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 67so8833002pfg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FP9n0qRIXc4AGMB2Cuj6evDveqJfblRxHMETVqaiIRE=;
 b=Y/eW4I1UJ6ndSlD7IHhSytnpBWDxb+Jw8Q0hLbNMEnuoySdgmvAUxHuc3C+ftqBOpN
 Lb+W15tgmK6Ryygl4oh6VGa4phdiNK184gn15nEqRVOreI5OGZ3qhIhyRkh/C/GGOmOV
 nMKdP039o6wfud5iisiozwbW58Xg/HOEiR7ymbC+2xUG7zJVX1hYcOYFZNfwiNLge27b
 ZvOUMD8IPQkfZCkG4bN/uoD7aQGFpxE0FIPb+6Colv7RsU8COSWGAWccY3kG/JKDHV2t
 6zmz9inr5prww1u+YJZ9sKz81TMTceg1Cddydsz2YUPQEO3LBVSlVhK3qbYcsy8A2ZqW
 Pshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FP9n0qRIXc4AGMB2Cuj6evDveqJfblRxHMETVqaiIRE=;
 b=hQTK33PMYUstvNXWjuNmnhIA9Lt7HeCUe0WzH6QXF3+WoepMjNFqXd6GycUB6ehEp9
 8YCnFHBi8sFN+d3fEpX/XncX33pPZE77Ih7p0kOKhQvqYqaHowIbR5rJkbeRfuorb5mp
 +YuNzV35aBS0zjFLIwRJFMetAmheiDgZ5JbR6y/wfWNdNbeIQITCWfGAGgHwxrrx/itk
 WuQkg24qcdj/7UZqC15dQrmW8P7d5XciyA1UBR0txh85JJAsJoXX2dNERugE65WyRBbs
 RNWSmJaGsYwjgIN87OWMMK+8GmSgXz4bQtEgiMEHm7o83dRL2S1gRbzaY0z2D/7xFZ8V
 JR4g==
X-Gm-Message-State: AOAM531eSx/oNafEKP2jYaWidtiao8XUWoAL+yD9TZtbCS37F39Oz9Sb
 jeGIatPYmbgbjkK7m+qiDHs=
X-Google-Smtp-Source: ABdhPJwoL6GaAMdB9x4/AlPN6Z249mGTQ4ZjldoorgeCh7p+TR+j2RyiDDnQdqYC3t17qCULfe8YMg==
X-Received: by 2002:aa7:9630:: with SMTP id r16mr24760416pfg.144.1593715459899; 
 Thu, 02 Jul 2020 11:44:19 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n12sm9474759pgr.88.2020.07.02.11.44.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:44:19 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:44:15 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/6] ASoC: fsl: fsl_ssi: fix kernel-doc
Message-ID: <20200702184414.GC23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-3-pierre-louis.bossart@linux.intel.com>
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

On Thu, Jul 02, 2020 at 12:22:23PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. The kernel-doc support is partial, add more
> descriptions and follow proper syntax
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
