Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF6AF4C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 12:54:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tdhd24VbzDqBy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 20:54:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tdNg4hSWzDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 20:41:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="AnPltY9z"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44tdNg2RSBz8tPR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 20:41:07 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44tdNg0rsTz9sCJ; Tue, 30 Apr 2019 20:41:07 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="AnPltY9z"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44tdNf2ngfz9sBr
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 20:41:06 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C33D42075E;
 Tue, 30 Apr 2019 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556620864;
 bh=5A29S3cnWeF4VgOVYXaq06PYgt6Ur5/12rFsJgdRx+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AnPltY9zbOygFy8W7YFwRfPcdBDU87InA7ZUBB9blqQlm/dGEMzreXogDibUYAp3S
 RsJth5izYyFeiVNKUWKyhVI/RJI/AXSof62ydI7w66K8OXE1sxmk+IDGDf/7YmNvjq
 X/eeafWYjhBUE0OW1eBpbGk6UIAeb6tJdux/zXHA=
Date: Tue, 30 Apr 2019 12:41:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Diana Craciun <diana.craciun@nxp.com>
Subject: Re: [PATCH stable v4.4 0/8] missing powerpc spectre backports for 4.4
Message-ID: <20190430104102.GA28863@kroah.com>
References: <1556552948-24957-1-git-send-email-diana.craciun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556552948-24957-1-git-send-email-diana.craciun@nxp.com>
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

On Mon, Apr 29, 2019 at 06:49:00PM +0300, Diana Craciun wrote:
> Hi Greg,
> 
> These are missing patches from the initial powerpc spectre backports for 4.4.
> Please queue them as well if you don't have any objections.

I applied the first 6 of these now.  If you could fix up the last two
and resend them, that would be wonderful.

thanks,

greg k-h
