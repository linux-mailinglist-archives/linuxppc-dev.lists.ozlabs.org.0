Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE40E660BD4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 03:16:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpkNK4xknz3cFL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 13:16:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tn2R3p9F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tn2R3p9F;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpkMR0c5Nz306n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 13:15:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF7DFB81F48;
	Sat,  7 Jan 2023 02:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20ABDC433D2;
	Sat,  7 Jan 2023 02:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673057741;
	bh=Bwu0gjh6SC4DZe66nJYF/rW03OKiuMjUNnNGs7ZAZpA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tn2R3p9FmFC65DtY1yI2meOFQoswYCYYzajUw1UxHtC57rPs05J8US2iq1bLBU882
	 cLl0jZzMKRMCySrmGipwV3+iGUqnk2TyMdI7QOnnni778LqhRITgu/StEpEdl28DcV
	 Vhci8AlGrCghql9jHKRqtCymznFTm7YNYJs9jGx22YHHwaJQFoSoM+1NEKj6+ClrET
	 upes7Er7b6R5v1JmjfLwMuUMSmZ8kQNRnJxDX1vhhD+1T6stiwSVE97YSc+kTcDTjk
	 9yVO/l1zQ5IcUqkPtb5Um5pi8tYiIBcFvfxD0qQcxltAFeGuSjyoiTV764g7DY/7Qh
	 rPPkhtnkL3kLw==
Date: Fri, 6 Jan 2023 18:15:40 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
Subject: Re: [PATCH net-next 0/7] Remove three Sun net drivers
Message-ID: <20230106181540.61d4cad0@kernel.org>
In-Reply-To: <50dfdff7-81c7-ab40-a6c5-e5e73959b780@intel.com>
References: <20230106220020.1820147-1-anirudh.venkataramanan@intel.com>
	<800d35d9-4ced-052e-aebe-683f431356ae@physik.fu-berlin.de>
	<50dfdff7-81c7-ab40-a6c5-e5e73959b780@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 6 Jan 2023 18:04:54 -0800 Anirudh Venkataramanan wrote:
> >> In a recent patch series that touched these drivers [1], it was suggested
> >> that these drivers should be removed completely. git logs suggest that
> >> there hasn't been any significant feature addition, improvement or fixes
> >> to user-visible bugs in a while. A web search didn't indicate any recent
> >> discussions or any evidence that there are users out there who care about
> >> these drivers.  
> > 
> > Well, these drivers just work and I don't see why there should be regular
> > discussions about them or changes.  
> 
> That's fair, but lack of discussion can also be signs of disuse, and 
> that's really the hunch I was following up on.

Lack of feedback, too. Some of these drivers are missing entries 
in MAINTAINERS and patches don't get review tags from anyone.
