Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 985399183A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 16:07:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BHXz1c3U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8Nmx0dwtz3cV5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 00:07:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BHXz1c3U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8NmD1D8Hz30VM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 00:06:35 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-425624255f3so1026985e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 07:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719410787; x=1720015587; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TCJWO8pYy1pCV+fI3h1hz9BtW0SdkaQWYmwWRyrttJs=;
        b=BHXz1c3Uc+dEWAOP51uh+x+SsT1J/htAFiKaWmUTp5MeR0ZLNfFwbKC0cWebEcnVyL
         SS9iuuTr8H+6J25rjfCFmhkWRiesMeb0pB7ivUNjYXo+Ooag0NVfOM4AeSm9MNeLPVYR
         lpF5VqmIc5+XmuOGZ/tiU6u9WeJ6ZEkTklMTFTR5suooI707WbWkvsrdQqhC65QfMaPu
         s/WwyfPRGOjObuP7CSHmGS8/9dlFSvAqCkgB2yRFaidwAnwxw+uJn67aIccRuQxenfH4
         gPsmdBLQpJI++fl4YRP+N18ibxRqpLkTPjrDE9CpWJuNvARtCIkKqvnfBXQT6xOY488x
         BVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410787; x=1720015587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCJWO8pYy1pCV+fI3h1hz9BtW0SdkaQWYmwWRyrttJs=;
        b=mm+A4be4EDkQYUcO5xXqF94khGfv2zt9H6kdJ0+JkA8HGQKhWTUQT1Ow4UcFL0emyj
         dDPoI2Sh5zBAbShKmupCfG6MkNecOOE1u2AJgC4x81WSF7apaQMwd27wi8+Jsy0jui5S
         E3LwT9meywsIASwyj5q98bXdQI/40jvw2l9oqhmOvdEgl0c1hIctzGxy4mkh2L9IGegh
         NU3JRCB/VGI4tJGuMj1+uIu70iptM1GTgKpJH56/f5aE8GrpddRv3rB8eBiX7zM2q8wX
         JSfbyivj6I/Iu8MNv4n3Ff39R9sru7XcFmHTX2+6mb4rEp3d5x0WlrWVoQ/aebaxGEFQ
         rsZw==
X-Forwarded-Encrypted: i=1; AJvYcCUI182yg5LBoPRPm0F4NfTWIhghGzzphVM8esN+uH+i9Mt90wQcriZV+zDIJ+hXSAzJnbBrjwRotTdimdPkO2SHZrVBuCzFGGU+PqrRuw==
X-Gm-Message-State: AOJu0YzfZCVR3qQ4htxboePd5rFC6sSAwMXlt+VvkgMdtBJk5It21/Kx
	kES++W98Gkxa8TioE18xDnUd2Kxl+KqKQHArWRJJai5hS90yz80g
X-Google-Smtp-Source: AGHT+IF3ry4rO2+gkoziIvVV6PiJ5Arx0ZGpxYJD3SVWw7rDf/IM1AqIgI7RKDFMBugpghsAwV+89Q==
X-Received: by 2002:a05:600c:3583:b0:424:ade3:c6b7 with SMTP id 5b1f17b1804b1-424ade3c894mr19285775e9.2.1719410786647;
        Wed, 26 Jun 2024 07:06:26 -0700 (PDT)
Received: from skbuf ([79.115.210.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c82519bdsm27908795e9.13.2024.06.26.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:06:26 -0700 (PDT)
Date: Wed, 26 Jun 2024 17:06:23 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <20240626140623.7ebsspddqwc24ne4@skbuf>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406261920.l5pzM1rj-lkp@intel.com>
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

On Wed, Jun 26, 2024 at 08:09:53PM +0800, kernel test robot wrote:
> Hi Breno,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on herbert-cryptodev-2.6/master]
> [also build test WARNING on soc/for-next linus/master v6.10-rc5 next-20240625]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/crypto-caam-Depend-on-COMPILE_TEST-also/20240625-223834
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
> patch link:    https://lore.kernel.org/r/20240624162128.1665620-1-leitao%40debian.org
> patch subject: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240626/202406261920.l5pzM1rj-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261920.l5pzM1rj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406261920.l5pzM1rj-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning: stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]
>     3280 | static int dpaa_eth_probe(struct platform_device *pdev)
>          |            ^
>    1 warning generated.
> --
> >> drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c:454:12: warning: stack frame size (8264) exceeds limit (2048) in 'dpaa_set_coalesce' [-Wframe-larger-than]
>      454 | static int dpaa_set_coalesce(struct net_device *dev,
>          |            ^
>    1 warning generated.

Arrays of NR_CPUS elements are what it probably doesn't like?
In the attached Kconfig, CONFIG_NR_CPUS is 8192, which is clearly
excessive compared to the SoCs that the driver is written for and
expects to run on (1-24 cores).

static int dpaa_set_coalesce(struct net_device *dev,
			     struct ethtool_coalesce *c,
			     struct kernel_ethtool_coalesce *kernel_coal,
			     struct netlink_ext_ack *extack)
{
	const cpumask_t *cpus = qman_affine_cpus();
	bool needs_revert[NR_CPUS] = {false};
	...
}

static void dpaa_fq_setup(struct dpaa_priv *priv,
			  const struct dpaa_fq_cbs *fq_cbs,
			  struct fman_port *tx_port)
{
	int egress_cnt = 0, conf_cnt = 0, num_portals = 0, portal_cnt = 0, cpu;
	const cpumask_t *affine_cpus = qman_affine_cpus();
	u16 channels[NR_CPUS];
	...
}

While 'needs_revert' can probably easily be converted to a bitmask which
consumes 8 times less space, I don't know what to say about the "channels"
array. It could probably be rewritten to use dynamic allocation for the
array. I don't have any better idea...
