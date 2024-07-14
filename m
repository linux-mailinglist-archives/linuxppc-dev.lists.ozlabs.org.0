Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B9930A2A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 15:38:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qKn2oM67;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMRHG5lvzz3cb8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 23:38:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qKn2oM67;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMRGZ59lfz3cHH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 23:37:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31F4760A3B;
	Sun, 14 Jul 2024 13:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9F8C116B1;
	Sun, 14 Jul 2024 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720964256;
	bh=z+mWMW1uIm1g/5AeGYEToqR9Xv3/y+6lpKivZwSQdj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKn2oM670TIhRLnD2FOvtL+vyq5nnfCAtRx/qahHtx4yyUhZvL6ZHkvVEn8WPB7nJ
	 cm5zknz2/0A55Q2MhvHIeQT3/WCF2RlGrgs/7mlb+pAZcCw173g+ZThDO09HgiKeH1
	 gGaAIRGsB1s0XFE6B0NBLquugzpBmWihPdw1wh8M=
Date: Sun, 14 Jul 2024 15:37:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ma Ke <make24@iscas.ac.cn>
Subject: Re: [PATCH v3] cxl: Fix possible null pointer dereference in
 read_handle()
Message-ID: <2024071459-obscurity-landlord-af08@gregkh>
References: <20240714121404.1385892-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240714121404.1385892-1-make24@iscas.ac.cn>
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
Cc: ajd@linux.ibm.com, arnd@arndb.de, linux-kernel@vger.kernel.org, stable@vger.kernel.org, manoj@linux.vnet.ibm.com, imunsie@au1.ibm.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, clombard@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 14, 2024 at 08:14:04PM +0800, Ma Ke wrote:
> In read_handle(), of_get_address() may return NULL which is later
> dereferenced. Fix this by adding NULL check.
> 
> Based on our customized static analysis tool, extract vulnerability
> features[1], then match similar vulnerability features in this function.

Please follow the documented rules for researchers submitting patches
based on non-public tools.

thanks,

greg k-h
