Return-Path: <linuxppc-dev+bounces-6818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA45A577C2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 03:59:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8ntN4pFvz2xGF;
	Sat,  8 Mar 2025 13:59:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741402748;
	cv=none; b=Az05xMoxrjf8rMq/hFCI+JpV8tRzkpFAtPkSlu/wiPSzb+b3BFLBDNp9+9jHhLhkqjfY/6hg1GyZVhFqxGWGymX9rCvIUyOSjQjzW9h5gG/fnAKcgfr/SnwUWTBAtiDI8IG+vy6llwyoypA/gKvjQ6ZVWMzkCNuy+q1ve8rRPF3hZOVQ0fytwv6CLNk2weuAD2hQVBmaS+FFC7f4brM4/073Hf9/4ApMt7410rOfTYtgQfWurwxY/y/rS5sSBOKQHsavpCDNT0hf3Icb8gn2hCiKVfzK1sOqE99y8AXL4CRhVVFcPh0Eo0YRWrIfo6xvxa9L46b1Do4Z9Vp1f/P+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741402748; c=relaxed/relaxed;
	bh=7ETKGNohs1JuiFVrDiXY7s59ZmOAZHEk4puoypMh0ho=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EcjZECHnp+i2ElaEcZfjUVUkbBJerPTa/DIZ3ztfdWC0Q3svaosdcgGGxo/NBe66V/zCGYfGy6m7Xq9CNeLX7AT0+M+I/WQknIRKlL8YkR46T7slTkrREP7G0TOyE2Xle7iCaEt2blvsIXnENhBQ1MQ52WcmO4vUxCq3CkqLb1zzkRD4y6lqNw9CZ1aoEoxguoo2+/F03FsFC4T2Zt1usJwhloBT+Y/Q8J1g2vpD6/mrejR0MRvX28illnX5C4JvBfIEzoERXQH3GpcN2HZhbc+97M0m5/wPJieX245IwYuj73UYSBrVJPhcMiet2hm+JSNxmbQSOoRxk1xEdgna1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhLr56rB; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhLr56rB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8ntM3pZ5z2x9g
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 13:59:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92B3AA457D4;
	Sat,  8 Mar 2025 02:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FD8C4CED1;
	Sat,  8 Mar 2025 02:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741402743;
	bh=VpVgfZqL5pCD8VMIpfO//WgO/NgRuraRLNPhr0ucINg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qhLr56rB5CiqISw9E8FY/8/pkE4H1Kap65yRwfrQjaXE4GKKw5lv7TVmR7y+ppdkm
	 FgOanKxGp4MTHSc8nfMzxrj6FLlgMjFc2zmOP5u6k77tZ36jQXVlHuH0+kNKbrZLfC
	 FJR8HNf8CAITOfIhUkXaq0mew8fo9S9YWEYHqZ4CeqJTprTWbcrDJeaSJRM59zgk/r
	 vIxYIJEmmRa6q2zdHVf3YHpw13tHVbdXOlBEasZOTRC/Tk1IvrpbCaT3ivLydXsyzR
	 R5ZfprFRxepAtpOL/2gAobeDmgCHGOoi8aO1hfPbExbp2yxoKEPpLUF6reTwcbK5HC
	 /ozmbhctbWRPA==
Date: Fri, 7 Mar 2025 18:59:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 net-next 01/13] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250307185902.384554a5@kernel.org>
In-Reply-To: <PAXPR04MB8510771650890E8B7395B2DA88D42@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
	<20250304072201.1332603-2-wei.fang@nxp.com>
	<20250306142842.476db52c@kernel.org>
	<PAXPR04MB85107A1E5990FBB63F12C3B888D52@PAXPR04MB8510.eurprd04.prod.outlook.com>
	<PAXPR04MB8510771650890E8B7395B2DA88D42@PAXPR04MB8510.eurprd04.prod.outlook.com>
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
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 8 Mar 2025 02:05:35 +0000 Wei Fang wrote:
> > > On Tue,  4 Mar 2025 15:21:49 +0800 Wei Fang wrote:  
> > hm..., there are some interfaces of netc-lib are used in common .c files
> > in downstream, so I used "ifdef" in downstream. Now for the upstream,
> > I'm going to separate them from the common .c files. So yes, we can
> > remove it now.  
> 
> Sorry, I misread the header file. The ifdef in ntmp.h is needed because
> the interfaces in this header file will be used by the enetc-core and
> enetc-vf drivers. For the ENETC v1 (LS1028A platform), it will not select
> NXP_NETC_LIB.

Meaning FSL_ENETC ? And the calls are in FSL_ENETC_CORE ?

