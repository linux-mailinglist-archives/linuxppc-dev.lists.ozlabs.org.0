Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8852B317B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Nov 2020 00:48:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CYX8H0g4NzDqMd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Nov 2020 10:47:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=j0b3+MQX; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CYX6h0pN8zDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Nov 2020 10:46:36 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CDE022314;
 Sat, 14 Nov 2020 23:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605397593;
 bh=KgCggMZ2pkwFlvuPeBB0qobWPyJuaZLSJfGsePi/4A0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j0b3+MQX4DZsIlJl7wz1U86GsRqR75Poq70I2zdXzIxCLseJs2AKUVMVYGEy2aQKg
 e0nDHnSaLxZbXwk5sLNeyGDffIwkiL8rvVEL0/Bj1boSblfvO7OvHL0Vo8qdy3KIHZ
 h0BS2g3rMyLafNwYx6vUM83ToIGWvu0Qr8oYogL0=
Date: Sat, 14 Nov 2020 15:46:32 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net-next 04/12] ibmvnic: Introduce xmit_more support
 using batched subCRQ hcalls
Message-ID: <20201114154632.55e87b1c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1605208207-1896-5-git-send-email-tlfalcon@linux.ibm.com>
References: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
 <1605208207-1896-5-git-send-email-tlfalcon@linux.ibm.com>
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
Cc: cforno12@linux.ibm.com, netdev@vger.kernel.org, ljp@linux.vnet.ibm.com,
 ricklind@linux.ibm.com, dnbanerg@us.ibm.com, drt@linux.vnet.ibm.com,
 brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 Nov 2020 13:09:59 -0600 Thomas Falcon wrote:
> Include support for the xmit_more feature utilizing the
> H_SEND_SUB_CRQ_INDIRECT hypervisor call which allows the sending
> of multiple subordinate Command Response Queue descriptors in one
> hypervisor call via a DMA-mapped buffer. This update reduces hypervisor
> calls and thus hypervisor call overhead per TX descriptor.
> 
> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>

The common bug with xmit_more is not flushing the already queued
notifications when there is a drop. Any time you drop a skb you need 
to check it's not an skb that was the end of an xmit_more train and 
if so flush notifications (or just always flush on error).

Looking at the driver e.g. this starting goto:

        if (ibmvnic_xmit_workarounds(skb, netdev)) {                            
                tx_dropped++;                                                   
                tx_send_failed++;                                               
                ret = NETDEV_TX_OK;                                             
                goto out;                                                       
        }  

Does not seem to hit any flush on its way out AFAICS.
