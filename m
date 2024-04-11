Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E588A1545
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 15:07:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nEAigv/e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFg3X2cFJz3vbd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 23:07:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nEAigv/e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFg2q2dM4z3d2x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 23:07:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6AD82CE2F5A;
	Thu, 11 Apr 2024 13:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171F6C433F1;
	Thu, 11 Apr 2024 13:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712840831;
	bh=jBDcfNa+ZA0GhG6LAA8y9wdXr1NILjkk4RiSds6k6CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEAigv/eqYtD+nsLaUlG13p5KlC4W5zHhp72SVBIi+SAijs3tSDYQHkjOz8atq0vF
	 YHn+MDCqfVqEJm7JLB4lMHJtirV0VLuYgEmqShGnDjWGqMR5VUT0324OZlMJaDNg8P
	 efibU29MYTA1wtA6bod9kF/GFyaPmhRldp5GKdYI=
Date: Thu, 11 Apr 2024 15:07:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/2] sysfs: Add sysfs_bin_attr_simple_read() helper
Message-ID: <2024041101-haggler-devouring-9dcf@gregkh>
References: <cover.1712410202.git.lukas@wunner.de>
 <5ed62b197a442ec6db53d8746d9d806dd0576e2d.1712410202.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ed62b197a442ec6db53d8746d9d806dd0576e2d.1712410202.git.lukas@wunner.de>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Jean Delvare <jdelvare@suse.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>, linux-acpi@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-efi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 06, 2024 at 03:52:01PM +0200, Lukas Wunner wrote:
> When drivers expose a bin_attribute in sysfs which is backed by a buffer
> in memory, a common pattern is to set the @private and @size members in
> struct bin_attribute to the buffer's location and size.
> 
> The ->read() callback then merely consists of a single memcpy() call.
> It's not even necessary to perform bounds checks as these are already
> handled by sysfs_kf_bin_read().
> 
> However each driver is so far providing its own ->read() implementation.
> The pattern is sufficiently frequent to merit a public helper, so add
> sysfs_bin_attr_simple_read() as well as BIN_ATTR_SIMPLE_RO() and
> BIN_ATTR_SIMPLE_ADMIN_RO() macros to ease declaration of such
> bin_attributes and reduce LoC and .text section size.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  fs/sysfs/file.c       | 27 +++++++++++++++++++++++++++
>  include/linux/sysfs.h | 15 +++++++++++++++
>  2 files changed, 42 insertions(+)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
