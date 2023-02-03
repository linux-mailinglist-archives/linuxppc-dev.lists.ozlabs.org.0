Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6227E688EDC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 06:12:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7P1N1Xyqz3f66
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 16:12:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pVFKaflM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pVFKaflM;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7NzK5tfmz3f7n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 16:11:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 669B9B82967;
	Fri,  3 Feb 2023 05:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9475BC433EF;
	Fri,  3 Feb 2023 05:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675401065;
	bh=dUOhQ6hNe3dggdDGLK7/bWxkEVbMRTxh5/gan/XL6mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVFKaflMctQb/ML/0ajJVSDSBT7PpApdYW8gG1YINZAkcXebWWWpu23h5dR4qfko3
	 gB7sFiekxNcrFvo8h0s5vYAtxsApkK28xENkaK87MRHMexYfS2DPCspVRU1HN0PmN1
	 NeVPWxCteb6VzBLc8Ad/ptWTAAXLyNJzuhCGUeTI=
Date: Fri, 3 Feb 2023 06:11:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Brian King <brking@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/6] hvcs: Use driver groups to manage driver
 attributes
Message-ID: <Y9yXZpwa7TDmRd+H@kroah.com>
References: <20230202222804.383229-1-brking@linux.vnet.ibm.com>
 <20230202222804.383229-4-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202222804.383229-4-brking@linux.vnet.ibm.com>
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
Cc: mmc@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 02, 2023 at 04:28:01PM -0600, Brian King wrote:
> Rather than manually creating attributes for the hvcs driver,
> let the driver core do this for us. This also fixes some hotplug
> remove issues and ensures that cleanup of these attributes
> is done in the right order.
> 
> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>  drivers/tty/hvc/hvcs.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index 7f79444b4d89..5de7ad555540 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -473,6 +473,20 @@ static ssize_t rescan_store(struct device_driver *ddp, const char * buf,
>  
>  static DRIVER_ATTR_RW(rescan);
>  
> +static struct attribute *hvcs_attrs[] = {
> +	&driver_attr_rescan.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group hvcs_attr_group = {
> +	.attrs = hvcs_attrs,
> +};
> +
> +const static struct attribute_group *hvcs_attr_groups[] = {
> +	&hvcs_attr_group,
> +	NULL,
> +};

Again, ATTRIBUTE_GROUPS()?

thanks,

greg k-h
