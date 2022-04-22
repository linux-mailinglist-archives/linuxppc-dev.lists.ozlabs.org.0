Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 193BF50C264
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 00:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlVDm6j5Zz3bkb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 08:58:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iXFl9zY2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iXFl9zY2; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlVD94bfSz2xlF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 08:57:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 801386147D;
 Fri, 22 Apr 2022 22:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF74C385A0;
 Fri, 22 Apr 2022 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650668246;
 bh=eHLSXrt72i6TaH/+If0ihwqLZQ/LBVXgDxHiWMQEzuo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iXFl9zY2I5UHRGR7OaF1h6qlAK5mPZxdv+O0/pAngV8myikt1Swc/85KxvGyNVcfO
 c+CJWtfaiXl8iS4eDwm1tYLL7mlGL2OJEbQRIyx9Oxnmwt2nYscDdw9pUFUKju5Rc3
 8Smqu72LB7YDpmuwjcwdikHO/+HwAQLvXA/jK7PevxaApA0vXIIT+xAvp6YNrYwW6z
 q1/aUsGP3jl+P0ELlTWntjHg6xRI0iccI6aJTjuD8V03kr63SrpkSJD23r6yezDvk8
 TT4cjRbKMoXPFsOx4c8XKhYFXss7sxjKe8fuaZ2qJtOjsu9QfpIkpihlggl0InOGdM
 4UfcD6bK0Sc2g==
Date: Fri, 22 Apr 2022 15:57:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
Message-ID: <20220422155725.5347ca6f@kernel.org>
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
References: <20220421070440.1282704-1-hch@lst.de>
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
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Apr 2022 09:04:40 +0200 Christoph Hellwig wrote:
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Judging by the To: I presume the intention is for Andrew to take this
one, so FWIW:

Acked-by: Jakub Kicinski <kuba@kernel.org>
