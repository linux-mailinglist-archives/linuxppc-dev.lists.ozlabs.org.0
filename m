Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3460D74D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 00:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mxn5L2xFSz3c9q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 09:42:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CHENs7+J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CHENs7+J;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mxn4P4ycmz2xgG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 09:41:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4922CB81F5D;
	Tue, 25 Oct 2022 22:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708D9C433D6;
	Tue, 25 Oct 2022 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666737711;
	bh=3ReAlpbuxb1p9jUT1Tt05lQ1bFQXcNMX2FBhJvCl64U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CHENs7+Jm2JhwnGqKVG6LBdPWTr/zoY37HBmpX5axP8gH4//7lYRP+SI07XpMe+Ca
	 D+C2b5iwFp3jS6wY9M7rNui0VaCv79pxRRSE1Rm51kMzFUJuvUcQfXsSF841ZP7lpu
	 ys88kwX5Dn80rrnzny+sciuwoa9xxwFWymnQhvJ2s8bsH2UH6ZS/uWF2ffOy8rxhMg
	 uJ+dXnvYzzgkN+UA1k5mPdKPPoONNgo8MMI4SsB/9jnTLlN4op6rN4GANBGakjbQZ5
	 ybr0sZXx/kuN6dfeRXD/w4TpWBuY4CNTBobf5u92SrIEZWC0kPkQdB9MD5mG3ut2gh
	 e5+V9qhiJrpPw==
Date: Tue, 25 Oct 2022 15:41:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: kernel test robot <lkp@intel.com>, Doug Berger <opendmb@gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 89bf6e28373beef9577fa71f996a5f73a569617c
Message-ID: <20221025154150.729bbbd0@kernel.org>
In-Reply-To: <63581a3c.U6bx8B6mFoRe2pWN%lkp@intel.com>
References: <63581a3c.U6bx8B6mFoRe2pWN%lkp@intel.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-mm@kvack.org, linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Oct 2022 01:17:48 +0800 kernel test robot wrote:
> drivers/net/ethernet/broadcom/genet/bcmgenet.c:1497:5-13: ERROR: invalid reference to the index variable of the iterator on line 1475

CC Doug 
