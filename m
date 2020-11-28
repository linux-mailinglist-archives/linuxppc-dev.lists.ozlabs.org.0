Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427C2C70E6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 22:34:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ck4WG6L2WzDr0N
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 08:34:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=NGIwED6I; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ck4TT0S5VzDsFc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 08:32:28 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BF91207CD;
 Sat, 28 Nov 2020 21:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606599146;
 bh=BkLSihrZLEUXgtQYzSMm1VBUPSC8VraPuQNRfnbFyR4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NGIwED6IV+SflyfKuFohf0tft/Mae58erzftgWLKtwJEt89cSNaxOfXhdmM4qlVYC
 mP6IPIC8V8z8z7gArWsu+yA9O4vtSNq6EzP1C3F4yzxknQpMx2DahRNvBsFgn+INjq
 7DQK6NFchFI44Rkz0MLSwF3Dui628du9w1Rpas+8=
Date: Sat, 28 Nov 2020 13:32:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dany Madden <drt@linux.ibm.com>
Subject: Re: [PATCH net v3 0/9] ibmvnic: assorted bug fixes
Message-ID: <20201128133225.6dff854f@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <20201126000432.29897-1-drt@linux.ibm.com>
References: <20201126000432.29897-1-drt@linux.ibm.com>
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
Cc: netdev@vger.kernel.org, sukadev@linux.ibm.com, ljp@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Nov 2020 18:04:23 -0600 Dany Madden wrote:
> Assorted fixes for ibmvnic originated from "[PATCH net 00/15] ibmvnic:
> assorted bug fixes" sent by Lijun Pan.

Applied, thanks!
