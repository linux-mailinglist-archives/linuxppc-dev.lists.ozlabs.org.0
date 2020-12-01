Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 837572C9475
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 02:14:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClPJj2fXrzDqpC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 12:14:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=W114iU4S; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClPGs6NPvzDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 12:12:53 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98FB420857;
 Tue,  1 Dec 2020 01:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606785171;
 bh=tp9F3B7fyRvH6VEIZo3A6vSljFPz8X8qTWx7C0ahHx8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W114iU4S84WxU8Gi/8cD6d5BzTY7plgIorqvYzHc2AkjirhR204+Sd4o6IsLKfhvH
 c6SwjonuXq77BDjHMO2udssLiLB/ABsa/PAqBCudqzkwxxPr1hSsvSAOP8jv4k5hHy
 rlh/5EKOdkb/SrDm1H9kfNTCwToMfcF5WZd/dsnU=
Date: Mon, 30 Nov 2020 17:12:49 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net v2 0/2] ibmvnic: Bug fixes for queue descriptor
 processing
Message-ID: <20201130171249.2bc0d7ba@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <1606763244-28111-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1606763244-28111-1-git-send-email-tlfalcon@linux.ibm.com>
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
Cc: cforno12@linux.ibm.com, ljp@linux.vnet.ibm.com, ricklind@linux.ibm.com,
 dnbanerg@us.ibm.com, drt@linux.vnet.ibm.com, netdev@vger.kernel.org,
 brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Nov 2020 13:07:22 -0600 Thomas Falcon wrote:
> This series resolves a few issues in the ibmvnic driver's
> RX buffer and TX completion processing. The first patch
> includes memory barriers to synchronize queue descriptor
> reads. The second patch fixes a memory leak that could
> occur if the device returns a TX completion with an error
> code in the descriptor, in which case the respective socket
> buffer and other relevant data structures may not be freed
> or updated properly.
> 
> v2: Provide more detailed comments explaining specifically what
>     reads are being ordered, suggested by Michael Ellerman

The commit hashes on fixes tags need to be at least 12 characters long,
please fix and repost.
