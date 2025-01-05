Return-Path: <linuxppc-dev+bounces-4671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC5A017C4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2025 02:45:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQg9k32D8z2yn2;
	Sun,  5 Jan 2025 12:45:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736041514;
	cv=none; b=fFjOMT2PA17/9P2q5c7j2YiPRvCOooLdwTBgjcE99pRZzko0ohYysHl8xFRmYy0Zpe1glpEDQOGI2YyA18Swh9biS4h4OX5jpW3r82814FVLCEw42uZnoinaTc1wBnF21GHKDoj4eAE5SyNT5G3sRWTkzXC29ysALj+IiC36VeI0TArWw3uFHsHEGSmeC/V5efzIa82yzlBXryONuR1LXpQ0rBPtkLNMHFWqE8OPSj8l1zveD9+2prcOA+bL7P+YNlWwwwQbyVIyMrLhUYCzhTrCerkTlu0fLXlWgMPtRke6xC3IGaRlkajFW9QM3nfyjEL7kPwAPPECIHydiCMqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736041514; c=relaxed/relaxed;
	bh=SOBt5DPnUIGvC38vlr30QgnqV2+SG/MycZQ+czmsjrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4CEwWwF2LVhm5S6xRH3teb/yf4mMWyUUSxWwkS1nm9d3LNwLFOBQCsUokxQnfP1ffbNhTUuI2YkUQBoKzQ//YMJ9Uy7Y0wG128HZdNeDWmsx+dY9DtxvycjGPt3aACNQmx6CaKpdy6/BY9r6m3zMQnJtQSzeK9aI+5kmYcmXMiC58d94vZT9vgTH0lNRBEPt4C0Yja5NjqOv1sS4txLL5mFEHXiaW+ZrRkLFPv94wpbl6YniWlAWiZXxeTF93q6a2eshLs4FpGozNETndBLP1fh4sT7OrXob06gd5uEa7JlADW9tVPPJCA99li4HSvvIRNlJMBIcqHn/QfJ149caw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dzldYET2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dzldYET2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQg9f6c5Sz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 12:45:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A3875C5780;
	Sun,  5 Jan 2025 01:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE66C4CED1;
	Sun,  5 Jan 2025 01:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736041504;
	bh=oq/Zazx3snTJ//HvVkRX0cBRbpMDsarbsm2tecQIdeI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dzldYET2emHDIAf7pzP0JoImS29VgCeY5/sCXhrOSKaxR6uYeadUuElqftv4FLpGK
	 fLXF6VYE8kqqFAQgqJ5ZPUAl6NcPe4N8yw63oF0pCNU7QCaQ3rUiaqrNkXAGZSAUpe
	 pOml0TNelBOAPn8HO/MR/lobpU5ydKFYEuhZIIkndr2ok5amNRxKyyog/lE+QZ4Tz3
	 Xt7sYf0lK3xoiLYHzahbLj3ljbjWtL4Z0eZvM4y4hwfBhihxbDjXJwBNr5R9HSE9Zb
	 BZ6sVBRhXiQBLYpjk3km+425LXrZTM4OXYTHXwruV2TsbfxR1OMLFbkqUDq/PcpCaw
	 W4mevP1ED11vQ==
Date: Sat, 4 Jan 2025 17:45:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH net-next 04/13] net: enetc: add MAC filter for i.MX95
 ENETC PF
Message-ID: <20250104174502.0d43e7c0@kernel.org>
In-Reply-To: <20250103060610.2233908-5-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
	<20250103060610.2233908-5-wei.fang@nxp.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri,  3 Jan 2025 14:06:00 +0800 Wei Fang wrote:
> The i.MX95 ENETC supports both MAC hash filter and MAC exact filter. MAC
> hash filter is implenented through a 64-bits hash table to match against
> the hashed addresses, PF and VFs each have two MAC hash tables, one is
> for unicast and the other one is for multicast. But MAC exact filter is
> shared between SIs (PF and VFs), each table entry contains a MAC address
> that may be unicast or multicast and the entry also contains an SI bitmap
> field that indicates for which SIs the entry is valid.
> 
> For i.MX95 ENETC, MAC exact filter only has 4 entries. According to the
> observation of the system default network configuration, the MAC filter
> will be configured with multiple multicast addresses, so MAC exact filter
> does not have enough entries to implement multicast filtering. Therefore,
> the current MAC exact filter is only used for unicast filtering. If the
> number of unicast addresses exceeds 4, then MAC hash filter is used.
> 
> Note that both MAC hash filter and MAC exact filter can only be accessed
> by PF, VFs can notify PF to set its corresponding MAC filter through the
> mailbox mechanism of ENETC. But currently MAC filter is only added for
> i.MX95 ENETC PF. The MAC filter support of ENETC VFs will be supported in
> subsequent patches.

clang reports:

drivers/net/ethernet/freescale/enetc/enetc4_pf.c:1158:6: warning: variable 'pf' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
 1158 |         if (err)
      |             ^~~
drivers/net/ethernet/freescale/enetc/enetc4_pf.c:1179:24: note: uninitialized use occurs here
 1179 |         enetc4_pf_struct_free(pf);
      |                               ^~
drivers/net/ethernet/freescale/enetc/enetc4_pf.c:1158:2: note: remove the 'if' if its condition is always false
 1158 |         if (err)
      |         ^~~~~~~~
 1159 |                 goto err_wq_task_init;
      |                 ~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/freescale/enetc/enetc4_pf.c:1128:21: note: initialize the variable 'pf' to silence this warning
 1128 |         struct enetc_pf *pf;
      |                            ^
      |                             = NULL
-- 
pw-bot: cr

