Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8E438C43
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 00:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hcsgw17ysz3bXv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 09:09:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YlPGprI+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=YlPGprI+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HcbxP6sthz2yQH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Oct 2021 22:50:16 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6F0761002;
 Sun, 24 Oct 2021 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635076212;
 bh=ywaQfwTgTWoV+2mMimVw/CeGgClkCrRfF+W0SYSuYuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YlPGprI+CSRfUClnDM5XvqMhqWFAUjHI1t4VtGv5Y67ovY+odcSxSv4OUvSpmxPGR
 ipT+mgo7hTHRVwof7SpUDG0+hs2L3l3gFSlmYd1rSnbULM6PhoAClTH2BU24ovRE74
 2XlILDKV5zLuvKt02g99dWmEKdOf1wyO8tB2rXAs=
Date: Sun, 24 Oct 2021 13:49:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Stable backport request
Message-ID: <YXVILOXgE9u/UOpM@kroah.com>
References: <87zgqzbcx6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgqzbcx6.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 24, 2021 at 09:21:09AM +1100, Michael Ellerman wrote:
> Hi Greg,
> 
> Please backport the following commit to v5.4 and v5.10:
> 
>   73287caa9210ded6066833195f4335f7f688a46b
>   ("powerpc64/idle: Fix SP offsets when saving GPRs")
> 
> 
> And please backport the following commits to v5.4, v5.10 and v5.14:
> 
>   9b4416c5095c20e110c82ae602c254099b83b72f
>   ("KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()")
> 
>   cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337
>   ("KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest")
> 
>   496c5fe25c377ddb7815c4ce8ecfb676f051e9b6
>   ("powerpc/idle: Don't corrupt back chain when going idle")

All now queued up, thanks!

greg k-h
