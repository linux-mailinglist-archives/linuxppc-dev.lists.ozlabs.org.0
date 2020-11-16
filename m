Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8A2B4F8B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 19:33:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZd4R4LJ3zDqJf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 05:33:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=To9l+Wqb; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZd0k5NkyzDqLj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 05:30:14 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86EC0206F9;
 Mon, 16 Nov 2020 18:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605551411;
 bh=D8+Lewj6IDHI/5nKxpZeK0EQjFsxhCqLxFxn3pzd320=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=To9l+WqbnwWBHr/pV3r52km/e6zeQj89+007lKEzTBdoLYZIDAkBKibdpydWjSjs3
 +UKqNRszV2/yRA9Dt7XMdQAUshYVeHkBFOsOzlcrrIOqOFRB+BXlnQMvlk3+JEzz18
 ZK0CPb+bYSzQ7Tq2WgEMjRH3bwTjWql5QCv4laKo=
Date: Mon, 16 Nov 2020 10:30:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net-next 01/12] ibmvnic: Ensure that subCRQ entry reads
 are ordered
Message-ID: <20201116103009.0bfb2d09@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <b0cd74bb-8f05-a201-080c-e325ae4a27b2@linux.ibm.com>
References: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
 <1605208207-1896-2-git-send-email-tlfalcon@linux.ibm.com>
 <20201114153524.1a32241f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <b0cd74bb-8f05-a201-080c-e325ae4a27b2@linux.ibm.com>
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
Cc: cforno12@linux.ibm.com, netdev@vger.kernel.org, ljp@linux.vnet.ibm.com,
 ricklind@linux.ibm.com, dnbanerg@us.ibm.com, drt@linux.vnet.ibm.com,
 brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 16 Nov 2020 12:28:05 -0600 Thomas Falcon wrote:
> On 11/14/20 5:35 PM, Jakub Kicinski wrote:
> > On Thu, 12 Nov 2020 13:09:56 -0600 Thomas Falcon wrote:  
> >> Ensure that received Subordinate Command-Response Queue
> >> entries are properly read in order by the driver.
> >>
> >> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>  
> > Are you sure this is not a bug fix?  
> Yes, I guess it does look like a bug fix. I can omit this in v2 and 
> submit this as a stand-alone patch to net?

Yup, that's the preferred way. Thanks!
