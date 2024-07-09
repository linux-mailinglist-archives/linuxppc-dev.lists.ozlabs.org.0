Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B20BC92BC42
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 15:59:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hW1moLuG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJMzS2PL3z3cgW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 23:59:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hW1moLuG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJMyk5GlLz3bt2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 23:58:20 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-36798ea618bso3387045f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2024 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720533495; x=1721138295; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TbYmgVACDAtRDSTL3B4NejRqBxXknmHxVQadZf89uHw=;
        b=hW1moLuG1W4YtItw+IAtWQOg3U3Du1/MyXrfj99mk6cK52sWR+KOc9XUPtJp9bgXMT
         f3lygCNHu8Wxr9c3h1yXyBfHdYHTk6kP1d8vuQAc7xPgRFEgswUugSmylRCe+3g42sJL
         WRDh9+o6n4ANMtXS9ArZwcYH1ociXc91O6Vich6N4O5uHByRPanFBzYh96h5hXHY54wX
         M3rTnCPGsAyaQXPATMicnbbqaI9D3f5198q0m4L899pR/IJA26IhvFLV69PydosGnnO3
         mlJiBBBcbP1fwziaLaQGB5D04JgLdIZCMrQ9Yw9XHP1r/TODL2yyMx8RIqD1faGX7YUi
         mSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720533495; x=1721138295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbYmgVACDAtRDSTL3B4NejRqBxXknmHxVQadZf89uHw=;
        b=UMa4kH3f3TAJbxZanN8867W+YPtXCabNmPs2UaQYLyP+MhQewp0YXMaLhxTC9CalSx
         HQxLfhBi8FdSexbu2icuiE+QP7aqeroYsNvOk29jnIOEYBuTVWpDF+iRzE62R8zm/ncB
         TD6mp8aL6RuByYpxc7nqoaXMaVpA31xyvj5WKtkntwAncwOU5eOoNfp+0xqL4c+HPaw+
         BNr51j6j0ZIGcfsL+0RBP9+u2AqpaVkQVHcA89yi80msUCvC3pQv9AXNZ+k9WtI60Sag
         5xrn1euDjhpz02ELaHDszWqZxrWTGzklQSOzavZOPQ70Y5ZkGookXotYZeyaZ6k1Grpj
         Ztiw==
X-Forwarded-Encrypted: i=1; AJvYcCXa77rNGSUkE/sTloLh76oV3AWP17MoiyyRSzBshzvoJ8PF8PRUsa/i0/fA+bt4EtWMnu8YKr+dFWEKDpKEvtgatNS0IQYP2vsSM2eK/w==
X-Gm-Message-State: AOJu0YwhTrW2salHzqOlkum5Zupt5jl7AW9+I40yyPdqNJ3RBW5TOOh+
	LQHyuJKPNtBlELkoeB27KcGZGMmsCOBZXqIWmOh7ShQel7+1um7N
X-Google-Smtp-Source: AGHT+IFhR6wXKYVJPy9dz+zWqOXpE2lauzhnAJp1D41g6UvLG42BZPLhgq5ODjo9utaXK51miT15Dw==
X-Received: by 2002:adf:ffcd:0:b0:367:9791:2939 with SMTP id ffacd0b85a97d-367cea6b804mr1603691f8f.21.1720533494785;
        Tue, 09 Jul 2024 06:58:14 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d16b0sm206311405e9.7.2024.07.09.06.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:58:14 -0700 (PDT)
Date: Tue, 9 Jul 2024 16:58:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <20240709135811.c7tqh3ocfumg6ctt@skbuf>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
 <Zn2yGBuwiW/BYvQ7@gmail.com>
 <20240708133746.ea62kkeq2inzcos5@skbuf>
 <Zow5FUmOADrqUpM9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="hpogfizkbgtmf2d4"
Content-Disposition: inline
In-Reply-To: <Zow5FUmOADrqUpM9@gmail.com>
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


--hpogfizkbgtmf2d4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Breno,

On Mon, Jul 08, 2024 at 12:08:05PM -0700, Breno Leitao wrote:
> I thought about a patch like the following (compile tested only). What
> do you think?

To be honest, there are several things I don't really like about this
patch.

- I really struggled with applying it in the current format. Could you
  please post the output of git format-patch in the future?
- You addressed dpaa_set_coalesce() but not also dpaa_fq_setup()
- You misrepresented the patch content by saying you only allocate size
  for online CPUs in the commit message. But you allocate for all
  possible CPUs.
- You only kfree(needs_revert) in the error (revert_values) case, but
  not in the normal (return 0) case.
- The netdev coding style is to sort the lines with variable
  declarations in reverse order of line length (they call this "reverse
  Christmas tree"). Your patch broke that order.
- You should use kcalloc() instead of kmalloc_array() + memset()

I have prepared and tested the attached alternative patch on a board and
I am preparing to submit it myself, if you don't have any objection.

Thanks,
Vladimir

--hpogfizkbgtmf2d4
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-net-dpaa-avoid-on-stack-arrays-of-NR_CPUS-elements.patch"

From 00b942829ee283baa602011a05b02d18c6988171 Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Mon, 8 Jul 2024 11:57:33 -0700
Subject: [PATCH] net: dpaa: avoid on-stack arrays of NR_CPUS elements

The dpaa-eth driver is written for PowerPC and Arm SoCs which have 1-24
CPUs. It depends on CONFIG_NR_CPUS having a reasonably small value in
Kconfig. Otherwise, there are 2 functions which allocate on-stack arrays
of NR_CPUS elements, and these can quickly explode in size, leading to
warnings such as:

  drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning:
  stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]

The problem is twofold:
- Reducing the array size to the boot-time num_possible_cpus() (rather
  than the compile-time NR_CPUS) creates a variable-length array,
  avoidable in the Linux kernel.
- Using NR_CPUS as an array size makes the driver blow up in stack
  consumption with generic, as opposed to hand-crafted, .config files.

A simple solution is to use dynamic allocation for num_possible_cpus()
elements (aka a small number determined at runtime).

Link: https://lore.kernel.org/all/202406261920.l5pzM1rj-lkp@intel.com/
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 20 ++++++++++++++-----
 .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 10 +++++++++-
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index ddeb0a5f2317..c856b556929d 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -931,14 +931,18 @@ static inline void dpaa_setup_egress(const struct dpaa_priv *priv,
 	}
 }
 
-static void dpaa_fq_setup(struct dpaa_priv *priv,
-			  const struct dpaa_fq_cbs *fq_cbs,
-			  struct fman_port *tx_port)
+static int dpaa_fq_setup(struct dpaa_priv *priv,
+			 const struct dpaa_fq_cbs *fq_cbs,
+			 struct fman_port *tx_port)
 {
 	int egress_cnt = 0, conf_cnt = 0, num_portals = 0, portal_cnt = 0, cpu;
 	const cpumask_t *affine_cpus = qman_affine_cpus();
-	u16 channels[NR_CPUS];
 	struct dpaa_fq *fq;
+	u16 *channels;
+
+	channels = kcalloc(num_possible_cpus(), sizeof(u16), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
 
 	for_each_cpu_and(cpu, affine_cpus, cpu_online_mask)
 		channels[num_portals++] = qman_affine_channel(cpu);
@@ -997,6 +1001,10 @@ static void dpaa_fq_setup(struct dpaa_priv *priv,
 				break;
 		}
 	}
+
+	kfree(channels);
+
+	return 0;
 }
 
 static inline int dpaa_tx_fq_to_id(const struct dpaa_priv *priv,
@@ -3416,7 +3424,9 @@ static int dpaa_eth_probe(struct platform_device *pdev)
 	 */
 	dpaa_eth_add_channel(priv->channel, &pdev->dev);
 
-	dpaa_fq_setup(priv, &dpaa_fq_cbs, priv->mac_dev->port[TX]);
+	err = dpaa_fq_setup(priv, &dpaa_fq_cbs, priv->mac_dev->port[TX]);
+	if (err)
+		goto free_dpaa_bps;
 
 	/* Create a congestion group for this netdev, with
 	 * dynamically-allocated CGR ID.
diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
index 5bd0b36d1feb..3f8cd4a7d845 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
@@ -457,12 +457,16 @@ static int dpaa_set_coalesce(struct net_device *dev,
 			     struct netlink_ext_ack *extack)
 {
 	const cpumask_t *cpus = qman_affine_cpus();
-	bool needs_revert[NR_CPUS] = {false};
 	struct qman_portal *portal;
 	u32 period, prev_period;
 	u8 thresh, prev_thresh;
+	bool *needs_revert;
 	int cpu, res;
 
+	needs_revert = kcalloc(num_possible_cpus(), sizeof(bool), GFP_KERNEL);
+	if (!needs_revert)
+		return -ENOMEM;
+
 	period = c->rx_coalesce_usecs;
 	thresh = c->rx_max_coalesced_frames;
 
@@ -485,6 +489,8 @@ static int dpaa_set_coalesce(struct net_device *dev,
 		needs_revert[cpu] = true;
 	}
 
+	kfree(needs_revert);
+
 	return 0;
 
 revert_values:
@@ -498,6 +504,8 @@ static int dpaa_set_coalesce(struct net_device *dev,
 		qman_dqrr_set_ithresh(portal, prev_thresh);
 	}
 
+	kfree(needs_revert);
+
 	return res;
 }
 
-- 
2.34.1


--hpogfizkbgtmf2d4--
