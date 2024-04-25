Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143258B18E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 04:32:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l95Ul+/T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ0JJ5NSNz3dRf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 12:32:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l95Ul+/T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQ0HY06t7z3cRB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 12:32:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EE5F61B23;
	Thu, 25 Apr 2024 02:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94257C113CD;
	Thu, 25 Apr 2024 02:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714012326;
	bh=nAygzTdKA7gXwOCRlEv0GHS1Jlllbh/PJCpLHTfVyZ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l95Ul+/TszTvgQgaS+2oB2XjSuinyC5Ndzqb8ogevjQn2wRGZIKRCs3XOTCYoeH99
	 SmC5TnalrDMs5NWkixVFud4Zj9Hl0cno7TJVBwGTvWMMDYgBZpVOB/O0ZbESZpwE5k
	 zjKAnLa9KL+dFGz4gUHPnbyAuBnaoiso6WA5Tv76uV/DYEXOFUYJFD/V/2P0GRgu0I
	 sLD/lH4h3kkUr7lWECblfnJ4pZJcshHtbIijQ3jv7ucKEvkv11qBcLxuN7JpR8JRq2
	 NmVpwTRM8w7lk/iZpzvBWAZefSzlhPeyk+srjmVplAdO+LE6tyFO0QrVNAHAA4bBms
	 PXvHHg13o0hWA==
Date: Wed, 24 Apr 2024 19:32:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] ibmvnic: Use -EBUSY in __ibmvnic_reset()
Message-ID: <20240424193204.39cde604@kernel.org>
In-Reply-To: <ba5e5ccf-59fa-4c7f-b649-97c19b2008a0@moroto.mountain>
References: <4cff158d-b5ac-4dca-9fbb-626237c1eafe@web.de>
	<f493e39063ee52a3d263de27bfd240149d910a88.camel@redhat.com>
	<da19d324-3c66-4bb1-8fa2-dc26dbea622b@moroto.mountain>
	<7e3f43a3-98e0-40ed-8820-2f1eef8742ba@linux.ibm.com>
	<ba5e5ccf-59fa-4c7f-b649-97c19b2008a0@moroto.mountain>
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
Cc: Nick Child <nnac123@linux.ibm.com>, netdev@vger.kernel.org, Rick Lindsley <ricklind@linux.ibm.com>, kernel-janitors@vger.kernel.org, Thomas Falcon <tlfalcon@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Eric Dumazet <edumazet@google.com>, Markus Elfring <Markus.Elfring@web.de>, Haren Myneni <haren@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Apr 2024 18:41:48 +0300 Dan Carpenter wrote:
> > So, the point of the patch not doing any behavioral differences is still
> > true.  
> 
> Ah yes.  You're right.

Hard call but overall I think this wasted more reviewer time than it's
worth. So in the spirit of not encouraging noise I'm not applying this.
-- 
pw-bot: reject
