Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0383B6EB6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 09:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDbf91hKBz30hl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 17:27:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dVAjEqJc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=dVAjEqJc; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDbdk5Khqz300S
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 17:27:05 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E42BD61DD6;
 Tue, 29 Jun 2021 07:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624951622;
 bh=/wC0kC8OS5dr+JvXY9eZyoD6DFcLuoL5e4QdrlGMkwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dVAjEqJcmSZH0mpea9fRLTf/ER2mQBZQxAGP4l5xoEQ2PsCnhORVJFTRQfpOYOabx
 oAdbAx8MwE8Pyd7RtnD8k2jAW9pPVLdniQfogq1R1cCTdDeat5Yj+AqOWOG7tAl0/H
 6hXNi9wXoXBIHiLyb9Os4AF00fk/JecY5w7Xh+nw=
Date: Tue, 29 Jun 2021 09:27:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kajoljain <kjain@linux.ibm.com>
Subject: Re: [PATCH] fpga: dfl: fme: Fix cpu hotplug issue in performance
 reporting
Message-ID: <YNrLRLyyUeDemxTS@kroah.com>
References: <20210628101721.188991-1-kjain@linux.ibm.com>
 <adc3b013-d39b-a183-dfce-86ca857949b8@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adc3b013-d39b-a183-dfce-86ca857949b8@linux.ibm.com>
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 trix@redhat.com, linux-fpga@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, mdf@kernel.org,
 will@kernel.org, yilun.xu@intel.com, hao.wu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 29, 2021 at 12:45:20PM +0530, kajoljain wrote:
> 
> 
> On 6/28/21 3:47 PM, Kajol Jain wrote:
> > The performance reporting driver added cpu hotplug
> > feature but it didn't add pmu migration call in cpu
> > offline function.
> > This can create an issue incase the current designated
> > cpu being used to collect fme pmu data got offline,
> > as based on current code we are not migrating fme pmu to
> > new target cpu. Because of that perf will still try to
> > fetch data from that offline cpu and hence we will not
> > get counter data.
> > 
> > Patch fixed this issue by adding pmu_migrate_context call
> > in fme_perf_offline_cpu function.
> > 
> 
> Adding stable@vger.kernel.org in cc list as suggested by Moritz Fischer.


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
