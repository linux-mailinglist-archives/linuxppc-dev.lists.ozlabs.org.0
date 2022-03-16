Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C474DA767
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 02:36:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJCXp5Fxhz3bTm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 12:36:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qF/iwnuy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qF/iwnuy; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJCX773ZSz2xTd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 12:35:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B1663B819AB;
 Wed, 16 Mar 2022 01:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A87C340E8;
 Wed, 16 Mar 2022 01:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647394530;
 bh=7bPFgv/Hea8SdmXk6LIC9Qumvtn9wm7VULIScV4xUx0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qF/iwnuyXKqMAg3nnnFEum+5eckxU7SLAiBJA1+oNJ9RrY3TgiN2NqULuXKjDTVIY
 7sH07m1T09s2yrHQVBDq9nIUyMxVLDst6JmA1GY3MZGfzMHT0OVtywgG8UZrESV7U5
 Ow5hlUWDq505mYqTQBRaNxqEEVm6bKPdxNC3LWt0Z/oRumBRk4/OmXwoiYHFVW+kAI
 Med79C33aNF7tA8gA8ZZlUQI+CxuhOlwRHwJBj4VW8MDSbQ3gL739M6N5EourlGAri
 xINbkOX7draJHq+bfdPkSwF8iNHGbNlC9+MobdhF+ACVUiyerTDOd3mEHkCj0/X4dG
 DZ6fBNjMIAM2Q==
Date: Tue, 15 Mar 2022 18:35:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Michal Kubecek <mkubecek@suse.cz>
Subject: Re: bnx2x: ppc64le: Unable to set message level greater than 0x7fff
Message-ID: <20220315183529.255f2795@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <0497a560-8c7b-7cf8-84ee-bde1470ae360@molgen.mpg.de>
References: <0497a560-8c7b-7cf8-84ee-bde1470ae360@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ariel Elior <aelior@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Mar 2022 22:58:57 +0100 Paul Menzel wrote:
> On the POWER8 server IBM S822LC (ppc64le), I am unable to set the 
> message level for the network device to 0x0100000 but it fails.
> 
>      $ sudo ethtool -s enP1p1s0f2 msglvl 0x0100000
>      netlink error: cannot modify bits past kernel bitset size (offset 56)
>      netlink error: Invalid argument
> 
> Below is more information. 0x7fff is the largest value I am able to set.
> 
> ```
> $ sudo ethtool -i enP1p1s0f2
> driver: bnx2x
> version: 5.17.0-rc7+
> firmware-version: bc 7.10.4
> expansion-rom-version:
> bus-info: 0001:01:00.2
> supports-statistics: yes
> supports-test: yes
> supports-eeprom-access: yes
> supports-register-dump: yes
> supports-priv-flags: yes
> $ sudo ethtool -s enP1p1s0f2 msglvl 0x7fff
> $ sudo ethtool enP1p1s0f2
> Settings for enP1p1s0f2:
>          Supported ports: [ TP ]
>          Supported link modes:   10baseT/Half 10baseT/Full
>                                  100baseT/Half 100baseT/Full
>                                  1000baseT/Full
>          Supported pause frame use: Symmetric Receive-only
>          Supports auto-negotiation: Yes
>          Supported FEC modes: Not reported
>          Advertised link modes:  10baseT/Half 10baseT/Full
>                                  100baseT/Half 100baseT/Full
>                                  1000baseT/Full
>          Advertised pause frame use: Symmetric Receive-only
>          Advertised auto-negotiation: Yes
>          Advertised FEC modes: Not reported
>          Speed: Unknown!
>          Duplex: Unknown! (255)
>          Auto-negotiation: on
>          Port: Twisted Pair
>          PHYAD: 17
>          Transceiver: internal
>          MDI-X: Unknown
>          Supports Wake-on: g
>          Wake-on: d
>          Current message level: 0x00007fff (32767)
>                                 drv probe link timer ifdown ifup rx_err 
> tx_err tx_queued intr tx_done rx_status pktdata hw wol
>          Link detected: no
> $ sudo ethtool -s enP1p1s0f2 msglvl 0x8000
> netlink error: cannot modify bits past kernel bitset size (offset 56)
> netlink error: Invalid argument
> ```

The new ethtool-over-netlink API limits the msg levels to the ones
officially defined by the kernel (NETIF_MSG_CLASS_COUNT).

CC: Michal
