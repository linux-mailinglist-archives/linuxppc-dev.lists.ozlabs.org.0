Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8302F456
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 12:39:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tdLn2XXszDqRf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 20:39:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tdK13J85zDqDb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 20:37:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="oKUhQ4Mo"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44tdK06WvNz8tXV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 20:37:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44tdK05j0Gz9sCJ; Tue, 30 Apr 2019 20:37:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="oKUhQ4Mo"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44tdK03NXcz9sCF
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 20:37:55 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88E2B2075E;
 Tue, 30 Apr 2019 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556620673;
 bh=Adu11RItFO9r3zbk9rSrJJtqi4RFZUGpULMOz/Q7ZYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oKUhQ4MogALpSxrHfUf7rFOuqBWh+34klKvQZtG0PgimMow5iy/0M0BS8lX1pujPb
 GybpKK51XER9LDcQB5X4bJkRZVMRt7qPLLmHEux7yGRLeqmV4tY5hshC/6/s789phS
 rRwqpC7yUjdDDRUEUHdBKOZAkSkZanMzysY0w5xg=
Date: Tue, 30 Apr 2019 12:37:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Diana Craciun <diana.craciun@nxp.com>
Subject: Re: [PATCH stable v4.4 7/8] powerpc/fsl: Add FSL_PPC_BOOK3E as
 supported arch for nospectre_v2 boot arg
Message-ID: <20190430103750.GA10539@kroah.com>
References: <1556552948-24957-1-git-send-email-diana.craciun@nxp.com>
 <1556552948-24957-8-git-send-email-diana.craciun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556552948-24957-8-git-send-email-diana.craciun@nxp.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linuxppc-dev@ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 06:49:07PM +0300, Diana Craciun wrote:
> commit f633a8ad636efb5d4bba1a047d4a0f1ef719aa06 upstream.

No, the patch below is not that git commit :(

I'll stop here in applying these patches.

thanks,

greg k-h
