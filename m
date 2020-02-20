Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C707C166207
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 17:13:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nflj71khzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 03:13:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Tw6lme9c; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Nfk76LdtzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 03:12:15 +1100 (AEDT)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CF9B20658;
 Thu, 20 Feb 2020 16:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582215133;
 bh=7sh9tmZCNa/XG2MFk6jwAzLZ290b8gu6jJpshQH8oBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tw6lme9cckLT8eZtoLZ70Lm5AzuDcvbStw+EMEzKYsN1j6lkpTcp5avqdF8UJRLUF
 Jv2+WimGHRjAJYL9cy6ojcPmcejgLEosDQKOYH6yUcHM1c6tvZTJa9A1rTAQUU+49O
 cNPyqrZk/gATUiD+2SQgllJOlko0vPz4wcLJqCDw=
Date: Thu, 20 Feb 2020 11:12:12 -0500
From: Sasha Levin <sashal@kernel.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH AUTOSEL 5.5 096/542] powerpc/powernv/ioda: Fix ref count
 for devices with their own PE
Message-ID: <20200220161212.GC1734@sasha-vm>
References: <20200214154854.6746-1-sashal@kernel.org>
 <20200214154854.6746-96-sashal@kernel.org>
 <0867167a-73b8-0735-78ce-0d984f7a80b5@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0867167a-73b8-0735-78ce-0d984f7a80b5@linux.ibm.com>
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

On Mon, Feb 17, 2020 at 09:49:41AM +0100, Frederic Barrat wrote:
>
>
>Le 14/02/2020 � 16:41, Sasha Levin a �crit�:
>>From: Frederic Barrat <fbarrat@linux.ibm.com>
>>
>>[ Upstream commit 05dd7da76986937fb288b4213b1fa10dbe0d1b33 ]
>
>
>Hi,
>
>Upstream commit 05dd7da76986937fb288b4213b1fa10dbe0d1b33 doesn't 
>really need to go to stable (any of 4.19, 5.4 and 5.5). While it's 
>probably safe, the patch replaces a refcount leak by another one, 
>which makes sense as part of the full series merged in 5.6-rc1, but 
>isn't terribly useful standalone on the current stable branches.

I'll drop it, thank you.

-- 
Thanks,
Sasha
