Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA536F58D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 08:02:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWhbz71mWz30Dv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 16:02:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zOKe5OK7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=zOKe5OK7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWhbY3xrNz2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 16:02:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B379E61456;
 Fri, 30 Apr 2021 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619762533;
 bh=QzCS0dCd4RoasI83jSHrwbAlJ/VAD4W5hnns+z19NmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zOKe5OK7HKSBzS7fUC97azmA6cCm3u8yJwqzwvHT6bOr+NW7wdVunaSb9sKGzWkge
 CNkm/d2jq3vxn9ncQCCx8wF81WuXmMY+UBBniNpmuKglw5DPKlZg3llsWmxPMsI79S
 E//XQxUuiKWl/pSFj3RVfQpoJ4XnnJElyLqbe+pY=
Date: Fri, 30 Apr 2021 08:02:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2] kbuild: replace LANG=C with LC_ALL=C
Message-ID: <YIudYzwMq18AS8nB@kroah.com>
References: <20210430015627.65738-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430015627.65738-1-masahiroy@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
 Mat Martineau <mathew.j.martineau@linux.intel.com>,
 Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org,
 mptcp@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org,
 Matthieu Baerts <matthieu.baerts@tessares.net>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 30, 2021 at 10:56:27AM +0900, Masahiro Yamada wrote:
> LANG gives a weak default to each LC_* in case it is not explicitly
> defined. LC_ALL, if set, overrides all other LC_* variables.
> 
>   LANG  <  LC_CTYPE, LC_COLLATE, LC_MONETARY, LC_NUMERIC, ...  <  LC_ALL
> 
> This is why documentation such as [1] suggests to set LC_ALL in build
> scripts to get the deterministic result.
> 
> LANG=C is not strong enough to override LC_* that may be set by end
> users.
> 
> [1]: https://reproducible-builds.org/docs/locales/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> Reviewed-by: Matthias Maennich <maennich@google.com>
> Acked-by: Matthieu Baerts <matthieu.baerts@tessares.net> (mptcp)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

