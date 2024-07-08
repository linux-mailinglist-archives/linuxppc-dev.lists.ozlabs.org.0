Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12D92A997
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 21:08:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHtv62YQXz3dBb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 05:08:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.42; helo=mail-ed1-f42.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHttk3YDdz30Wl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 05:08:13 +1000 (AEST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-58b447c513aso5078313a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2024 12:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720465689; x=1721070489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5VCdX60NWwfC1nVwekLYgNiGy5kNm96Cosdiq19/GM=;
        b=HtbvIGhOYGNCJ5+AuuutVlXfdQ+hfhsRg83PKvMYrq2QosQHGLiA/k6mHpOiMvEEip
         TnvdR1CNnfHrxsmZmaet88zcPMT6zHl2etUDB0yPj//fHJ7mqPtnZTgsKQiDIP1GtFjm
         JwK1Paw/b8pdPultJJVCu/sENDJ8KMWHDwkJH11SILvqTBB+PJZeWsMdoC/mJ9F/VWox
         eYnDSKdKwdeFS/JgpvXNvkMWK15zlCYs8nRP0d/ddVquIPGfXFMTlE+3eIi2Gt+XNtTB
         3I6QpRs+NJ8xqB6Ei6IcNOBf6ilbYJm8qZKSVWikLuqyrkFR6V6TpCcncWHe00xDZC5C
         kC3w==
X-Forwarded-Encrypted: i=1; AJvYcCUu8qO83PfNQasx5vYO7wR2SmZGD/o+ySS7gHfT9r6jZsWRnLPmui/GFF7GGH7wDLabjCAPl2SIRtnBfqHGnCANUiv44kagC+3Zbtb3IQ==
X-Gm-Message-State: AOJu0Yw5BGvvJ4M66pKzdspm8V+8qtWnp6LtxBMh4V02AZJW2m7I3nos
	wgOVP8Pnwlft2YMieMQiZL+dexWB1fvLiioCorRBbyrCy8Fb5EufGzimoQ==
X-Google-Smtp-Source: AGHT+IHe2bAuF3QoVgM+CiLRff4u7OuOz5mDHUAISjnBCInvO4afmYAsw4m/dW4O/4hmNTBdmgEXYA==
X-Received: by 2002:a05:6402:84d:b0:57d:12c3:eca6 with SMTP id 4fb4d7f45d1cf-594ba0ced20mr293140a12.18.1720465688385;
        Mon, 08 Jul 2024 12:08:08 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-001.fbsv.net. [2a03:2880:30ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bda30f76sm146037a12.97.2024.07.08.12.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 12:08:08 -0700 (PDT)
Date: Mon, 8 Jul 2024 12:08:05 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <Zow5FUmOADrqUpM9@gmail.com>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
 <Zn2yGBuwiW/BYvQ7@gmail.com>
 <20240708133746.ea62kkeq2inzcos5@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708133746.ea62kkeq2inzcos5@skbuf>
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
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org, Roy.Pledge@nxp.com, llvm@lists.linux.dev, open list <linux-kernel@vger.kernel.org>, horms@kernel.org, oe-kbuild-all@lists.linux.dev, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Vladimir,

On Mon, Jul 08, 2024 at 04:37:46PM +0300, Vladimir Oltean wrote:
> On Thu, Jun 27, 2024 at 11:40:24AM -0700, Breno Leitao wrote:

> > > >      454 | static int dpaa_set_coalesce(struct net_device *dev,
> > > >          |            ^
> > > >    1 warning generated.
> > > 
> > > Arrays of NR_CPUS elements are what it probably doesn't like?

> > Can it use the number of online CPUs instead of NR_CPUS?

> I don't see how, given that variable length arrays are something which
> should be avoided in the kernel?

I thought about a patch like the following (compile tested only). What
do you think?

	Author: Breno Leitao <leitao@debian.org>
	Date:   Mon Jul 8 11:57:33 2024 -0700

	    net: dpaa: Allocate only for online CPUs in dpaa_set_coalesce
	    
	    Currently, dpaa_set_coalesce allocates a boolean for every possible CPU
	    (NR_CPUS). This approach is suboptimal and causes failures in COMPILE_TEST.
	    For reference, see:
	    https://lore.kernel.org/all/202406261920.l5pzM1rj-lkp@intel.com/
	    
	    Modify the allocation to consider only online CPUs instead of
	    NR_CPUs. This change reduces the function's memory footprint and resolves
	    the COMPILE_TEST issues.
	    
	    Signed-off-by: Breno Leitao <leitao@debian.org>

	diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
	index 5bd0b36d1feb..7202a5310045 100644
	--- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
	+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
	@@ -457,7 +457,7 @@ static int dpaa_set_coalesce(struct net_device *dev,
				     struct netlink_ext_ack *extack)
	 {
		const cpumask_t *cpus = qman_affine_cpus();
	-	bool needs_revert[NR_CPUS] = {false};
	+	bool *needs_revert;
		struct qman_portal *portal;
		u32 period, prev_period;
		u8 thresh, prev_thresh;
	@@ -466,6 +466,11 @@ static int dpaa_set_coalesce(struct net_device *dev,
		period = c->rx_coalesce_usecs;
		thresh = c->rx_max_coalesced_frames;
	 
	+	needs_revert = kmalloc_array(num_possible_cpus(), sizeof(bool), GFP_KERNEL);
	+	if (!needs_revert)
	+		return -ENOMEM;
	+	memset(needs_revert, 0, num_online_cpus() * sizeof(bool));
	+
		/* save previous values */
		portal = qman_get_affine_portal(smp_processor_id());
		qman_portal_get_iperiod(portal, &prev_period);
	@@ -498,6 +503,7 @@ static int dpaa_set_coalesce(struct net_device *dev,
			qman_dqrr_set_ithresh(portal, prev_thresh);
		}
	 
	+	kfree(needs_revert);
		return res;
	 }
	 
