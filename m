Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30693270FEF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 20:12:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtzLW22GtzDqRr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 04:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cpvwH2Kr; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtzJn2y2kzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 04:10:33 +1000 (AEST)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DC222075E;
 Sat, 19 Sep 2020 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600539030;
 bh=ng7qoQuro8I40AS+rk/GWBwGyH15HMQ2lDGOq46y4z4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cpvwH2KrCL/Wnp9RLnIilCAmFNGJnA/Xz3AeEVRdVfqGVPzVfVP0VofE667VVToHs
 jwuf3LzAoLV6m+kZlGbQJM0pqhCaQGX9sb9Q+5Pml3db5kddP3elGivYKzJVOST361
 sxBp9dKbdTYoXsXbuK/Lzs7A2Rtdn2z8KHlU/og8=
Date: Sat, 19 Sep 2020 14:10:29 -0400
From: Sasha Levin <sashal@kernel.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH AUTOSEL 5.4 101/330] powerpc/powernv/ioda: Fix ref count
 for devices with their own PE
Message-ID: <20200919181029.GI2431@sasha-vm>
References: <20200918020110.2063155-1-sashal@kernel.org>
 <20200918020110.2063155-101-sashal@kernel.org>
 <52532d8a-8e90-8a68-07bd-5a3e08c58475@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52532d8a-8e90-8a68-07bd-5a3e08c58475@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 18, 2020 at 08:35:06AM +0200, Frederic Barrat wrote:
>
>
>Le 18/09/2020 � 03:57, Sasha Levin a �crit�:
>>From: Frederic Barrat <fbarrat@linux.ibm.com>
>>
>>[ Upstream commit 05dd7da76986937fb288b4213b1fa10dbe0d1b33 ]
>>
>
>This patch is not desirable for stable, for 5.4 and 4.19 (it was 
>already flagged by autosel back in April. Not sure why it's showing 
>again now)

Hey Fred,

This was a bit of a "lie", it wasn't a run of AUTOSEL, but rather an
audit of patches that went into distro/vendor trees but not into the
upstream stable trees.

I can see that this patch was pulled into Ubuntu's 5.4 tree, is it not
needed in the upstream stable tree?

-- 
Thanks,
Sasha
