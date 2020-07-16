Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3B72218B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 02:08:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6ZMq3zTvzDqnD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 10:08:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=VCtcqMJ0; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6ZL54D3pzDqg5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 10:06:37 +1000 (AEST)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FF7F20658;
 Thu, 16 Jul 2020 00:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594857994;
 bh=MFjfF4+oC01Y6bevI5egaBIFd+jsLP2iZgwBUEXBvUI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VCtcqMJ0mmk+6vtldiSJQI/Ly9QMRV4sbHd2H08V5f55nY1rAGU3ucDyg97eRf7ou
 a6kw5sZF8kKZ7qSZOnlyw35KSmMccKI9MfSGTqMbuKMC0PNitazT71aiATqGdpg4I6
 XpaPKlhq+/651/Z2H19X+avmKufsYyfBjtoU+viw=
Date: Wed, 15 Jul 2020 17:06:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net-next] ibmvnic: Increase driver logging
Message-ID: <20200715170632.11f0bf19@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1594857115-22380-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1594857115-22380-1-git-send-email-tlfalcon@linux.ibm.com>
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
Cc: drt@linux.ibm.com, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jul 2020 18:51:55 -0500 Thomas Falcon wrote:
>  	free_netdev(netdev);
>  	dev_set_drvdata(&dev->dev, NULL);
> +	netdev_info(netdev, "VNIC client device has been successfully removed.\n");

A step too far, perhaps.

In general this patch looks a little questionable IMHO, this amount of
logging output is not commonly seen in drivers. All the the info
messages are just static text, not even carrying any extra information.
In an era of ftrace, and bpftrace, do we really need this?
