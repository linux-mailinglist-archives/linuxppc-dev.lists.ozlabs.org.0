Return-Path: <linuxppc-dev+bounces-2549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BBC9AEA06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 17:13:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ8Z56p10z3bbT;
	Fri, 25 Oct 2024 02:13:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729782813;
	cv=none; b=CillUwECys5rsd9Ne2palRqcm85SjmfvHwVyWLa/XFaegS/6mFE8BEdJq7GEywWSm6yK92mr0jv8BfWt0mEYLSCxTV4rgKnevl4xC+inK/Z3oeFRjJiXxC1bMrbXToPzjWdZ7hhpkSx2P8IRue87nAhTzSm458sVtTrVm9GqG5t1eCHXcFpTRR/icUBdHo7ONEBs2G6wz6D7sk1YVeG9X6HbZrcjENKTb4++rabOwZxPDtf4tLztaXY3qLCMhk9km6SMB3oMXb7XGCHeNqg33gm6kROzkcBw46hvNamN6VMhLQuCNVF4n2ni9t54Vn4GMM64hHG503xpmkgBvigibA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729782813; c=relaxed/relaxed;
	bh=iRoSWvJdDDplRCp4I+wRYslk0eY1xan03865C9HXF7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdLlcpuVTF/osgdHIuOIcDWiW8WSI1WpIyScLaYHIw1+ui2vVAzeyWfQQJJcOvjZ5U81MyVqT2RTrBBxMDwP+iS6grD7YuuNiyjeprvp9UXkWTjC1q7bUiS1UKZsADhFywgmRthoPx69J+JEH7gecmFk/qiDaf0oV0aH28w5lJWAxTFQWVTjsoF5FjcPby0RvS3S9qKouMhII+9tcGJKUun1kaILP5idJ5oenR22p8FpAYpApCQJJwYQ+wA6v/KFKhBJxWQOQGWq/GagknKm1AYhYxK5dpffAG+pSxYi2LrdZohSYcTMhG2AOHELTpU8+lvnuBbbJSjCFhoM5O2VPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mEORTeaL; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mEORTeaL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ8Z50H0wz2yj3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 02:13:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C95B25C4B3B;
	Thu, 24 Oct 2024 15:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2328C4CEC7;
	Thu, 24 Oct 2024 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782810;
	bh=+2/uySlBuG14jAytYUtOfQ+CdOhbHG/L2RdziFggh6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEORTeaLkZDxVvyF3BOW9HHvNx88UMCv0Tio04GdcG9VUjPkPmTxhKP/Co7EVJD32
	 r9vPeaGx3h3gqyxkt1RpipYVvpKutXryFUubGQbWCYuqwrXZjxGBGfbxeGst/oOJ+2
	 ROO5RAnVoQaQI/YCWQYUN61BWcF4uXc12TR9br0cg73n/oho+O/Ltu3tNj9z7cHYT3
	 HOkTfC4kUn1u467IAvWrouRYqaIvWWKcis6L2jpK4rDUi/zQD72zoF568gjE8Lbn9Y
	 BtjkwNT4HfqsOpvzsR+XEuFMgpGMYVWePJ75CeR5UqygtPmsDMUdqjVeIs8Zg7syGV
	 8fBS8pYX8gVvA==
Date: Thu, 24 Oct 2024 16:13:24 +0100
From: Simon Horman <horms@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] ibmvnic: use ethtool string helpers
Message-ID: <20241024151324.GX1202098@kernel.org>
References: <20241022203240.391648-1-rosenp@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022203240.391648-1-rosenp@gmail.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 22, 2024 at 01:32:40PM -0700, Rosen Penev wrote:
> They are the prefered way to copy ethtool strings.
> 
> Avoids manually incrementing the data pointer.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


