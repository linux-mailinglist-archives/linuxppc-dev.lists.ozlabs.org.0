Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C3F688ED9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 06:11:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7NzM4QJ1z3f7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 16:11:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QrEhHWlw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QrEhHWlw;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7NyQ4XfPz3083
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 16:10:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48E6CB82913;
	Fri,  3 Feb 2023 05:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B83CC433EF;
	Fri,  3 Feb 2023 05:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675401016;
	bh=eNaATQXgc7RaCupB3Sjv+2VvnJq3Q8Mm/89hEvFZUUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QrEhHWlwXC6AGDNFBU4K1ubmFkysWR19vUE/RGoiN9luU3NLi/wqBGGEpRTf+B1RM
	 75nJYODy24ADKXfCJg46QhYWPB9srB1w5GhzJs5SN0HHW0uHCVGyLfOalTEAIehZ4m
	 IFS7LLuNv3NWYClWvrHaPeCYFWoOI8iMoJ3KATGw=
Date: Fri, 3 Feb 2023 06:10:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Brian King <brking@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/6] hvcs: Use dev_groups to manage hvcs device
 attributes
Message-ID: <Y9yXNP+PzAdYPKb0@kroah.com>
References: <20230202222804.383229-1-brking@linux.vnet.ibm.com>
 <20230202222804.383229-3-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202222804.383229-3-brking@linux.vnet.ibm.com>
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

On Thu, Feb 02, 2023 at 04:28:00PM -0600, Brian King wrote:
> Use the dev_groups functionality to manage the attribute groups
> for hvcs devices. This simplifies the code and also eliminates
> errors coming from kernfs when attempting to remove a console
> device that is in use.
> 
> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>  drivers/tty/hvc/hvcs.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index faf5ccfc561e..7f79444b4d89 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -432,7 +432,7 @@ static ssize_t hvcs_index_show(struct device *dev, struct device_attribute *attr
>  
>  static DEVICE_ATTR(index, S_IRUGO, hvcs_index_show, NULL);
>  
> -static struct attribute *hvcs_attrs[] = {
> +static struct attribute *hvcs_dev_attrs[] = {
>  	&dev_attr_partner_vtys.attr,
>  	&dev_attr_partner_clcs.attr,
>  	&dev_attr_current_vty.attr,
> @@ -441,8 +441,13 @@ static struct attribute *hvcs_attrs[] = {
>  	NULL,
>  };
>  
> -static struct attribute_group hvcs_attr_group = {
> -	.attrs = hvcs_attrs,
> +static struct attribute_group hvcs_attr_dev_group = {
> +	.attrs = hvcs_dev_attrs,
> +};
> +
> +const static struct attribute_group *hvcs_attr_dev_groups[] = {
> +	&hvcs_attr_dev_group,
> +	NULL,
>  };

Why not just use the ATTRIBUTE_GROUPS() macro here?

thanks,

greg k-h
