Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC78D7BC2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 08:41:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uqxOBull;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vt3zR5xwvz3cQf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 16:41:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uqxOBull;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vt3yl0Q7Sz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 16:41:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 304E1CE069D;
	Mon,  3 Jun 2024 06:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018E9C2BD10;
	Mon,  3 Jun 2024 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717396857;
	bh=Ixgu9gEpoO7nBwh5VUEu4mUMBJ7nDgpJMH3OkVxAQHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqxOBullKy/kLR6dCqAW2ltEtgOT+3uwMkTkByyPkVepQEB8eTOcEeGSe3Nd3HYP4
	 0Z4AVORhYT9QuT8uyC38ZIEpE5tDkFbQKeAvIHm4La3jFOtKaBYiR+e7Jx69hojRkd
	 orUls1T+QTJnXk6AeS6nXkJzXI8snIzjyIFbO+R0=
Date: Mon, 3 Jun 2024 08:41:05 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Qianbin Zheng (NSB)" <qianbin.zheng@nokia-sbell.com>
Subject: Re: [PATCH] usb: gadget: fsl: Enable usb snoop on PPC64
Message-ID: <2024060342-neuron-trapeze-4e2d@gregkh>
References: <20240531091926.3324847-1-qianbin.zheng@nokia-sbell.com>
 <HE1PR07MB4169B7A47CC7105A9FC3E993ACFF2@HE1PR07MB4169.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR07MB4169B7A47CC7105A9FC3E993ACFF2@HE1PR07MB4169.eurprd07.prod.outlook.com>
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 03, 2024 at 01:46:50AM +0000, Qianbin Zheng (NSB) wrote:
> Turn on usb snooping on PPC64.

This says what you are doing, but not _why_ you are doing it?

What changed to allow this to now work properly?

thanks,

greg k-h
