Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A43427A15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 12:13:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458lh96FRCzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 20:13:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ib+KgVqL"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458lfr016HzDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 20:12:19 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id f12so2548390plt.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 03:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U26hfEnzujUkh3KTuHOe5UmmcDFgXF3e4TaLMOxdmfM=;
 b=Ib+KgVqLDpT8MvHzygIpqSSllS0TetYaVrP7XgrFpZ4tAShr0RURzzglj6REWk93xQ
 WFFRiSJWx59+AH7KQcksdZE8FgH+kZ4UVcuDsg2fotamDs7PGww2jKz9UEuHZR4Ksluv
 BOuS0Q8pCI9SVeiK7/cYpZjkjBdon2Ib5kZ+pHSwkWt0y3CT9dSzcH2kXMpaKwjh90RK
 FG72cyNM327E21YkXcnhGrF3rgDAXbxiawmFFgR4JG3D0Qb8/Oc+O/0XxvPYKZkxu/9l
 VcXp5xzH2rgeygra1FJvVKVIVPaEJNrZMrr7BEDNsPl+9ZZaPDHjsFKtOn/guPNa5maa
 vuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U26hfEnzujUkh3KTuHOe5UmmcDFgXF3e4TaLMOxdmfM=;
 b=KOObEURPCwrQnwBjuf2Zsuk2TAwtujvj0lciBIUUUV2PgZxuzaPZrXINPOMN8LDSBx
 oL522jn8J+WAZSX+tynHVpFZaNjtKPxer+Gj448zheEkeZ0BlVqUVHf2WrIwFfk4nL6f
 u147jr/Cs5dYMPffzW+tPPLxtau2H/y2I2WFGSamdVFhMZXeiPfVSIe0ttRioWuHcTM6
 gmG93V9TSV3NNJrp1B/qcNqIbqhxKPPYM7EM7kWqLSiNHCHOIldTEB6qO6nTt1ahUS3u
 kS8jLYoBiLdyu0baeWhBx31FDNB79leXjoEYzRtTCB0kkrkfpdlB7ucb9tTyPFT69I6b
 Kvug==
X-Gm-Message-State: APjAAAU93+lE9yanpWhcTRM+26LYY0M8mal+9yW2utRbWH4WlwCBrfI4
 77ywpO54Ab3bhVRNOVLv+b4=
X-Google-Smtp-Source: APXvYqySDuPT7a7gghksq1od9CJZ2r1xxtVRGBUJt3XvoOYsZJiD4Eloj5sq2wLjCZ4i0lkxTdmMPQ==
X-Received: by 2002:a17:902:7044:: with SMTP id
 h4mr14867003plt.219.1558606335864; 
 Thu, 23 May 2019 03:12:15 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id c185sm32062477pfc.64.2019.05.23.03.12.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 03:12:15 -0700 (PDT)
Date: Thu, 23 May 2019 03:10:56 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "broonie@kernel.org" <broonie@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: fix the channel swap issue after xrun
Message-ID: <20190523101055.GA28470@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB647934199C3AA60759BED888E3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB647934199C3AA60759BED888E3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Shengjiu,

On Thu, May 23, 2019 at 09:53:42AM +0000, S.j. Wang wrote:
> > > +     /*
> > > +      * Add fifo reset here, because the regcache_sync will
> > > +      * write one more data to ETDR.
> > > +      * Which will cause channel shift.
> > 
> > Sounds like a bug to me...should fix it first by marking the data registers as
> > volatile.
> > 
> The ETDR is a writable register, it is not volatile. Even we change it to
> Volatile, I don't think we can't avoid this issue. for the regcache_sync
> Just to write this register, it is correct behavior.

Is that so? Quoting the comments of regcache_sync():
"* regcache_sync - Sync the register cache with the hardware.
 *
 * @map: map to configure.
 *
 * Any registers that should not be synced should be marked as
 * volatile."

If regcache_sync() does sync volatile registers too as you said,
I don't mind having this FIFO reset WAR for now, though I think
this mismatch between the comments and the actual behavior then
should get people's attention.

Thank you
