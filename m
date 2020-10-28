Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B529CCD3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 01:56:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLVWG4QfGzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 11:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=L20IJGQt; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLVTQ3NjLzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 11:54:34 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9B90222D9;
 Wed, 28 Oct 2020 00:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603846471;
 bh=bd15X0ZO/kKl56YTZtPK2286ovxkGWRvjUY09nh7kq4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L20IJGQtEtrEoLKXAHARu3Eqoz4drhMWZC/OnKcl8MOLELTjQqaxghn1LeYvApIY/
 vN4gel8NeDlz/iH/e0Bp9YTi+sOsaE18ZIp3689mKtyOTuOaX+FyejQ/DefkkPBu9f
 Yd/cSwI3PDj7pZC0vxW3vKMU2TWO4ZvBpCzyLd0E=
Date: Tue, 27 Oct 2020 17:54:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Subject: Re: [PATCH] ibmveth: Fix use of ibmveth in a bridge.
Message-ID: <20201027175430.1f6a74b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201026200407.fcf43678ba4cef7fe0cb7c98@suse.de>
References: <20201026104221.26570-1-msuchanek@suse.de>
 <20201026115237.21b114fe@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <20201026200407.fcf43678ba4cef7fe0cb7c98@suse.de>
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
Cc: Cristobal Forno <cforno12@linux.ibm.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Cris Forno <cforno12@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Oct 2020 20:04:07 +0100 Thomas Bogendoerfer wrote:
> > On Mon, 26 Oct 2020 11:42:21 +0100 Michal Suchanek wrote:  
> > > From: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> > > 
> > > The check for src mac address in ibmveth_is_packet_unsupported is wrong.
> > > Commit 6f2275433a2f wanted to shut down messages for loopback packets,
> > > but now suppresses bridged frames, which are accepted by the hypervisor
> > > otherwise bridging won't work at all.
> > > 
> > > Fixes: 6f2275433a2f ("ibmveth: Detect unsupported packets before sending to the hypervisor")
> > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>  
> > 
> > Since the From: line says Thomas we need a signoff from him.  
> 
> you can add
> 
> Signed-off-by: tbogendoerfer@suse.de

Applied, thanks.
