Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C222B2327A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 00:29:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH7Wv2XVhzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 08:29:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=RonR9rcW; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH7VK3kKZzDqlP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 08:28:25 +1000 (AEST)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D72320656;
 Wed, 29 Jul 2020 22:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596061702;
 bh=s6XN6FQuW11x9gEqpvZqSpW8QoAqs+XwsUC8i5vOzaM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RonR9rcWncx9rrbVBYtVkmperGYF4ThKntjcFDvcDmrOQrCy74mgqPJfroE8xKJ2Y
 LrNCqxPdTyKXaCLtJrMo/hTzunhS2zkQoRrLjxJmvhJs6dWhPSkAsoBGPlx7b2rB0n
 ud2e0YZQVIfwIBkMff9fZsleBMSZfWuBiP5xo6qs=
Date: Wed, 29 Jul 2020 15:28:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net] ibmvnic: Fix IRQ mapping disposal in error path
Message-ID: <20200729152820.79c00fe7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1596058592-12025-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1596058592-12025-1-git-send-email-tlfalcon@linux.ibm.com>
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

On Wed, 29 Jul 2020 16:36:32 -0500 Thomas Falcon wrote:
> RX queue IRQ mappings are disposed in both the TX IRQ and RX IRQ
> error paths. Fix this and dispose of TX IRQ mappings correctly in
> case of an error.
> 
> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>

Thomas, please remember about Fixes tags (for networking patches, 
at least):

Fixes: ea22d51a7831 ("ibmvnic: simplify and improve driver probe function")
