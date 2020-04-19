Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B48321AFEF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 01:42:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4955w41GL1zDqgx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 09:42:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=sVBgZB5l; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4955sr18Y9zDqgx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 09:40:15 +1000 (AEST)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0A3A20771;
 Sun, 19 Apr 2020 23:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587339613;
 bh=8HW96paTqUPga/ybcu0VQG2Ba66pP4d10K1wkYORe1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sVBgZB5lsM5jjSEQwp7VYRhH7h57yQdK4/lS0qqxc8zv1K4Y1t9EeH0RWWoA1DN4z
 9i/LaNjg/T7bAAV39KU0z88lMD9hTN0TRSI1DIKjgyKvaTntkyjlN35EQrIch0PQeH
 lSBZ85RZQwhw3FWyLtcS3DOavyWUnQm6cA701JFM=
Date: Sun, 19 Apr 2020 19:40:11 -0400
From: Sasha Levin <sashal@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH AUTOSEL 5.5 73/75] ocxl: Add PCI hotplug dependency to
 Kconfig
Message-ID: <20200419234011.GF1809@sasha-vm>
References: <20200418140910.8280-1-sashal@kernel.org>
 <20200418140910.8280-73-sashal@kernel.org>
 <c2bceeb6-07bb-1cc4-0d67-48b9fe0f6ba9@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c2bceeb6-07bb-1cc4-0d67-48b9fe0f6ba9@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Alastair D'Silva <alastair@d-silva.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 20, 2020 at 02:32:19AM +1000, Andrew Donnellan wrote:
>On 19/4/20 12:09 am, Sasha Levin wrote:
>>From: Frederic Barrat <fbarrat@linux.ibm.com>
>>
>>[ Upstream commit 49ce94b8677c7d7a15c4d7cbbb9ff1cd8387827b ]
>>
>>The PCI hotplug framework is used to update the devices when a new
>>image is written to the FPGA.
>>
>>Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
>>Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
>>Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>>Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>Link: https://lore.kernel.org/r/20191121134918.7155-12-fbarrat@linux.ibm.com
>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This shouldn't be backported to any of the stable trees.

I'll drop it, thanks!

-- 
Thanks,
Sasha
