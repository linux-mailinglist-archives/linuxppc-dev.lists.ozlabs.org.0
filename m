Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA4930D6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 07:13:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kVQJ+aVX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMr236FGZz3ck2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 15:13:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kVQJ+aVX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMr1M6f97z3bnt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 15:12:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9274CCE0C65;
	Mon, 15 Jul 2024 05:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C50C4AF0B;
	Mon, 15 Jul 2024 05:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721020355;
	bh=LJHclODpyrboPhQhaBBGs+WVF5tYU2NDz6MkUk+jTjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVQJ+aVX56E5jhlNT9GTOCl5hqMJqfnZXM5yvy+JTWfoKkWx2LA3UoXJkaEPRKYIq
	 h2B01zTXs/KSAM/4Tqpd/7cX2FdeEN6aYk8BfBMhAfCYBOd0rd/ZmAJt4bSpKmh1bp
	 wxZ/3gF1TaP25zaU/FXMztRSV7sWI7dYX6VgHKrA=
Date: Mon, 15 Jul 2024 07:12:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ma Ke <make24@iscas.ac.cn>
Subject: Re: [PATCH v4] cxl: Fix possible null pointer dereference in
 read_handle()
Message-ID: <2024071500-certainly-kick-11c8@gregkh>
References: <20240715025442.3229209-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715025442.3229209-1-make24@iscas.ac.cn>
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

On Mon, Jul 15, 2024 at 10:54:42AM +0800, Ma Ke wrote:
> In read_handle(), of_get_address() may return NULL if getting address and
> size of the node failed. When of_read_number() uses prop to handle
> conversions between different byte orders, it could lead to a null pointer
> dereference. Add NULL check to fix potential issue.
> 
> Found by static analysis.

You need to describe the tool that found this.  And how did you test
that your fix is correct?

thanks,

greg k-h
