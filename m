Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA82DBF3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 12:11:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwsrM1jJmzDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 22:11:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S/e3+RcH; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cwskl0VkBzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 22:06:17 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id v29so17384806pgk.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JOOQpcp04fe7Ai/Scwmonj/jlQhNtKVes7u2TT8U0X4=;
 b=S/e3+RcHwRHNREai4eV3qePPu5aVF50Zv73xS38GVyJ01iu3wrbAQ5c791t/5IkcYM
 1WPdO8T0vOZqxG/6jTyKhnHhI2uOROTX3RiXlVB9SbQVUYH2gXbnBLABWzBmd+5ozCpZ
 yxT/GVm88oUEFKTpSUp9IVwXH5+3kepB5F+fYJ9ilSVWa7dDYXwEBdW96fWGC9XX9Muj
 CK36MiA+sqFVH3fEUnJ4Brul5Fn8uHNVDUhWFFJyUsUoNNm9yDI9gRoK1sttDIa116l5
 0pV9CICzrSs71tWCCUqmHKmFT6qM82MP9M4MxqnLKpbpZhqdJnzPySpObjgQg5rXk8W0
 KxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JOOQpcp04fe7Ai/Scwmonj/jlQhNtKVes7u2TT8U0X4=;
 b=tkOfZIt6wS1YhTIjkANdGrMOiaxFrlA+r7ENHarLvq3O1FXVmhaPzM1LNxfzObWeXN
 mMiZ4aUhTWRCU2rv2t5R3s6E88lcaeQgaPAvhnuatpgOOrIeNiJayAUs7JC9Lcz2ndBm
 O8ai8LvDFiF96DgqlgehWdlQssANCAnRuKClPUoynp0b+Ikfo377rD1pLa1eo0APT02p
 Lz1Ov/OABAkvoJ3zaCgVW0OYu4ffX/bEYwvEssuK4IvbQnnjdHzXdjVXdMXQVaXqejWJ
 DNrp0Lyp+PiUxJjRlmDi/07ip7HcIXX6zunqaYuIrdWhgB+05E2ndrKlt1CzMjRFbTch
 /U0A==
X-Gm-Message-State: AOAM532hPtyylGljwryPcHbBbp9X8FeP75oAwHhCq4KlI5awpODi+HgT
 KY2wyiw9cX8ADmkdLy/5DOM=
X-Google-Smtp-Source: ABdhPJzgryV5EFyPEgVKa/Ym7NmyHZP5f5iQ8HNSLMTnXY9UjxcdOzvVstG7QN5HnbmPU2WH/SttAQ==
X-Received: by 2002:aa7:8d86:0:b029:19e:cb57:2849 with SMTP id
 i6-20020aa78d860000b029019ecb572849mr26379440pfr.54.1608116773633; 
 Wed, 16 Dec 2020 03:06:13 -0800 (PST)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 fw12sm1729790pjb.43.2020.12.16.03.06.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Dec 2020 03:06:13 -0800 (PST)
Date: Wed, 16 Dec 2020 03:06:06 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: Fix warning of the uninitialized
 variable ret
Message-ID: <20201216110605.GA2156@Asurada>
References: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 16, 2020 at 06:44:24PM +0800, Shengjiu Wang wrote:
> From: shengjiu wang <shengjiu.wang@nxp.com>
> 
> When condition ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in))
> is true, then goto fail, the uninitialized variable ret will be
> returned.
> 
> Signed-off-by: shengjiu wang <shengjiu.wang@nxp.com>
> Reported-by: kernel test robot <lkp@intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
