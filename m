Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A2299628
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 19:56:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKkZt09BLzDqKN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 05:56:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=JckPPeS6; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKkVL1d4TzDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 05:52:42 +1100 (AEDT)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1FB9207E8;
 Mon, 26 Oct 2020 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603738359;
 bh=t2EQbcyl5c3xdLTzNkFpT08fzGpuuYyPqlb0/xDd3r4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JckPPeS6Q4j3QYgNH76zNGhEI+P2JRsz0T+do+ZJ0jXBaGM/h3iWH2jzj+1PmQ4yh
 qsl/JLRqufoBVgCw8TWFwiDAnMyBF0gzRXIKT8uv0Gm8e5QCTQZuBT9ARs90+bIeoM
 jA3gBYtw+K4gukXB97CGMg0jaj6i8HzU5aol5USc=
Date: Mon, 26 Oct 2020 11:52:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH] ibmveth: Fix use of ibmveth in a bridge.
Message-ID: <20201026115237.21b114fe@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201026104221.26570-1-msuchanek@suse.de>
References: <20201026104221.26570-1-msuchanek@suse.de>
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
 linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tbogendoerfer@suse.de>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Cris Forno <cforno12@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Oct 2020 11:42:21 +0100 Michal Suchanek wrote:
> From: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> 
> The check for src mac address in ibmveth_is_packet_unsupported is wrong.
> Commit 6f2275433a2f wanted to shut down messages for loopback packets,
> but now suppresses bridged frames, which are accepted by the hypervisor
> otherwise bridging won't work at all.
> 
> Fixes: 6f2275433a2f ("ibmveth: Detect unsupported packets before sending to the hypervisor")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Since the From: line says Thomas we need a signoff from him.
