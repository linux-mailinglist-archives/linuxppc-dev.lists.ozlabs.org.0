Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 595FA1C39D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 09:06:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4537yf43WvzDqJs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 17:06:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="NX57qEPQ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4537x84jPPzDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 17:05:16 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4B9D2086A;
 Tue, 14 May 2019 07:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557817514;
 bh=8hs7Xcl5TFH1iWCZIg0nQD01cSQmtLRwbxKGpKk8ND0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NX57qEPQuFUFp7hNAvrfVcBhFpGsf8JlJhizpUha0i5KaC1bAqC8ToOZckdblC3hN
 rKs1jGfaR8L6AHCOkKtDkaF+ryhbRFsC+uXkMMS2ChdU2m6tVCZ5gb33rFgJngL2TT
 dsxAwrXT16gYge7Fm4awe6FtTuKu3IFuNMhGQpkM=
Date: Tue, 14 May 2019 09:05:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [Bug 203597] New: kernel 4.9.175 fails to boot on a PowerMac G4
 3,6 at early stage
Message-ID: <20190514070511.GA14854@kroah.com>
References: <bug-203597-206035@https.bugzilla.kernel.org/>
 <e1a6f0c2-c93a-05bd-0623-ccffa733c5a7@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a6f0c2-c93a-05bd-0623-ccffa733c5a7@c-s.fr>
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
Cc: erhard_f@mailbox.org, linuxppc-dev@lists.ozlabs.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 14, 2019 at 06:56:03AM +0200, Christophe Leroy wrote:
> Hi Greg,
> 
> Could you please apply b45ba4a51cde29b2939365ef0c07ad34c8321789 to 4.9 since
> 51c3c62b58b357e8d35e4cc32f7b4ec907426fe3 was applied allthought marked for
> #4.13+

It does not apply there (nor to the 4.4.y queue, which will need it as
well), so can you provide a working backport so that I can queue it up?

thanks,

greg k-h
