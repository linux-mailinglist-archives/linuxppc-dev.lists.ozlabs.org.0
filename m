Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251C60D7CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 01:18:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxntB50mGz2xsc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 10:18:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jgmD4R4n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jgmD4R4n;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxnsH3MsWz2xvJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 10:17:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18C1161AAD;
	Tue, 25 Oct 2022 23:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CB3C433D6;
	Tue, 25 Oct 2022 23:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666739838;
	bh=nV7OVDrwGLapIVrA2MkHe7ePYFXFsBK++LsqBN3LGxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jgmD4R4nRxyvZqQf+RFkpy8OzZlwZWaN3uMpSb/mKDFK4G0lCt3Ub6SDpdtaf3acw
	 RZVWqtWUdVWFpdnLdaoRDbX+u2XI7TUZeUGvvX6eMRqfThv4W+1QhoXi6FhA0uiu3U
	 PNjHDugBCqcOWYunfi/Rxn2nqZEUG6HpBB5lfDfbMkst0/sSI7ZTmhUxaSyxO3Dp5g
	 X0HKBuHzTUAQJMZ+v2mw/xPvuoxoT7NR1OW7a7axArGENNfisA0CnRHJWsile+/6Db
	 VyiNFed0Lk2ahgi29Z9TjFLF2VANpmwGA00vmUK5eYV1xioMDnC9uB8Re4MJZgl8vv
	 jUNx3NlKFq+vw==
Date: Tue, 25 Oct 2022 16:17:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Doug Berger <opendmb@gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 89bf6e28373beef9577fa71f996a5f73a569617c
Message-ID: <20221025161716.1b92a033@kernel.org>
In-Reply-To: <8fbc9d02-3c73-5990-85af-82eecb6d64e3@gmail.com>
References: <63581a3c.U6bx8B6mFoRe2pWN%lkp@intel.com>
	<20221025154150.729bbbd0@kernel.org>
	<8fbc9d02-3c73-5990-85af-82eecb6d64e3@gmail.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, kernel test robot <lkp@intel.com>, linux-scsi@vger.kernel.org, netdev@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, linux-mm@kvack.org, linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 Oct 2022 16:04:15 -0700 Doug Berger wrote:
> > On Wed, 26 Oct 2022 01:17:48 +0800 kernel test robot wrote:  
> >> drivers/net/ethernet/broadcom/genet/bcmgenet.c:1497:5-13: ERROR: invalid reference to the index variable of the iterator on line 1475  
> > 
> > CC Doug  
> Thanks for highlighting this for me, but I happened to catch it from the 
> linux-mm list and was just looking into it.
> 
> It looks to me like a false positive since I am initializing the 
> loc_rule variable in all paths outside of the list_for_each_entry() loop 
> prior to its use on line 1497.

Ack, indeed the code looks right. Thanks for investigating.

> If desired I can submit a new patch to make coccinelle happy.

I wonder if Cocci can detect writes. Let me add Julia for visibility.

If not we can use a different variable for the "check if already
exists" iteration? It could make the code easier to follow, IMHO.
Or leave it be.
