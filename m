Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A41B873F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 17:02:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498Z5t1PPmzDqhC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 01:02:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=CDrGzv+8; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498Z3Q0PzszDqXZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 01:00:33 +1000 (AEST)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 764982071C;
 Sat, 25 Apr 2020 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587826831;
 bh=vLsTNvAtB8UdNTwK8YxWUdOCKQziYzomk2spCy9b7f8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CDrGzv+8QKY5rcp/D7K7PGok7MEPFBlMhUZUuM1PFbEHWmJofXmhXVQZiKPO1f7KT
 iGdjPeNtLO5GyK2AdW3DT2kfPdW3jT3B5GuPbwr0G+3CSBqvE4aNcqcFxFHxlZ1qHL
 rAD26tnSXILGIxhdzzohEdNsa7OlDxh+oyvWxVPA=
Date: Sat, 25 Apr 2020 11:00:30 -0400
From: Sasha Levin <sashal@kernel.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH AUTOSEL 5.4 69/78] powerpc/powernv/ioda: Fix ref count
 for devices with their own PE
Message-ID: <20200425150030.GH13035@sasha-vm>
References: <20200418144047.9013-1-sashal@kernel.org>
 <20200418144047.9013-69-sashal@kernel.org>
 <b4fcb316-4fe8-47ec-81c7-4a79b0543b15@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4fcb316-4fe8-47ec-81c7-4a79b0543b15@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 21, 2020 at 01:02:31PM +0200, Frederic Barrat wrote:
>
>
>Le 18/04/2020 à 16:40, Sasha Levin a écrit :
>>From: Frederic Barrat <fbarrat@linux.ibm.com>
>>
>>[ Upstream commit 05dd7da76986937fb288b4213b1fa10dbe0d1b33 ]
>
>
>This shouldn't be backported to stable.

I've dropped this and the other two commits you've pointed out from all
branches, thanks!

-- 
Thanks,
Sasha
