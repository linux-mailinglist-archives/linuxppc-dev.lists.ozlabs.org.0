Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F59855BD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 08:49:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qajf8PZ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tb6fC4L2Mz3cS3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 18:49:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qajf8PZ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tb6dQ56m0z3cB0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 18:48:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94A6361C55;
	Thu, 15 Feb 2024 07:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6981C433C7;
	Thu, 15 Feb 2024 07:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707983332;
	bh=gahLnnsNTqmUik4SdEeXvaqgZ4vCmG45RsllVXdj/mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qajf8PZ65kKGyotnqyIUZ3vlSkpstKVFTdqCpNtt11yZc3WQx0TBIeEixG38eBjtF
	 dQqDmJTsG/G5wsnuGVF8KapV2qoQO5WOO8TzkkTkg7Dn5t3dStmcx0CXS5nF0PGms9
	 s3OFz8TRzd2nuSJQYkDvFpQtkCeofc/Pulf3+EIQ=
Date: Thu, 15 Feb 2024 08:48:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH 0/2] ALSA: struct bus_type cleanup
Message-ID: <2024021539-boxcar-shown-c829@gregkh>
References: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 14, 2024 at 04:28:27PM -0300, Ricardo B. Marliere wrote:
> This series is part of an effort to cleanup the users of the driver
> core, as can be seen in many recent patches authored by Greg across the
> tree (e.g. [1]).
> 
> ---
> [1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
> 
> To: Johannes Berg <johannes@sipsolutions.net>
> To: Jaroslav Kysela <perex@perex.cz>
> To: Takashi Iwai <tiwai@suse.com>
> Cc:  <linuxppc-dev@lists.ozlabs.org>
> Cc:  <alsa-devel@alsa-project.org>
> Cc:  <linux-sound@vger.kernel.org>
> Cc:  <linux-kernel@vger.kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
