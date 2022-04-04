Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC424F104C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 09:50:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX2xQ0r5Tz3bdF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 17:50:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FXkYDEIA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=FXkYDEIA; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX2ws5KlVz2x9c
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 17:49:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18B33B80EE7;
 Mon,  4 Apr 2022 07:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6603DC2BBE4;
 Mon,  4 Apr 2022 07:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649058566;
 bh=AoiHI2nGjs21fXdHt44B/SOkaBG2cktvg1RoLP5GUNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FXkYDEIAYyQ6mAzM0f8Q1KO9Cv9fD2oab8cDuj1NalBNo7BV1eurVJykhNGlVvrah
 XyzZKQ7woNh+ig6bsuZPTZy1LvvMQixmZjeQBXXTzTyjEyYKwnBhWw8EW+VsMa6a1k
 9LE67NwFqi61nP/Em5Z/bYmcpuw247j7HaaqbHRM=
Date: Mon, 4 Apr 2022 09:49:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] [Rebased for 5.4] powerpc/kasan: Fix early region not
 updated correctly
Message-ID: <YkqjBFVqgHtUojdC@kroah.com>
References: <d4d9f1d352e617848a8ec19013fcce8d0cf2ceea.1648993765.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4d9f1d352e617848a8ec19013fcce8d0cf2ceea.1648993765.git.christophe.leroy@csgroup.eu>
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
Cc: Chen Jingwen <chenjingwen6@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 03, 2022 at 03:49:43PM +0200, Christophe Leroy wrote:
> From: Chen Jingwen <chenjingwen6@huawei.com>
> 
> This is backport for 5.4
> 
> Upstream commit dd75080aa8409ce10d50fb58981c6b59bf8707d3

Now queued up, thanks.

greg k-h
