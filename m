Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F38A2F5746
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 03:37:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGT4Z2wKDzDr13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 13:37:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cf6rChqU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGT2P1ZdszDrff
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 13:35:56 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4592235FA;
 Thu, 14 Jan 2021 02:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610591754;
 bh=OnrEzauNIUmRoTePTl/di2SdI5/HWt+oHV9ERTTYpHI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cf6rChqUsRowWZtFyN5DQ4NEB0ojvM8pRPVvGqjlj7lRHIyCp0tThuAnSPeUnEe10
 nMw6QeuBYpLSdFqHIusats0zGv3jyOCxP9zB/DeHsq6kZLm8SvHxsAx5VUsZRKKwL8
 o97SCGnNS9EF3+fTKFb1WDq4xQlchR8AkwmH2wO5Wz+e600erG1l6iTJUpVVflmG6q
 0FvyuDLcqE2xmEWU6oSZyG4CW1jQAyAIpJDSnk5VDeDQcvxq+ssVjkZXqs6bVkAxMf
 XXjdfMAD2pbOtWnuT8xP+gE1q7ay4yNdoSaxvskHCqEpc4TwzjzjZzHT45Silb4oGL
 f9v1FRAJ+j5mg==
Date: Wed, 13 Jan 2021 18:35:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/7] Rid W=1 warnings in Ethernet
Message-ID: <20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210113164123.1334116-1-lee.jones@linaro.org>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
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
Cc: Paul Durrant <paul@xen.org>, Kurt Kanzenbach <kurt@linutronix.de>,
 Alexei Starovoitov <ast@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Cammaert <pc@denkart.be>,
 Paul Mackerras <paulus@samba.org>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Wei Liu <wei.liu@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Santiago Leon <santi_leon@yahoo.com>, xen-devel@lists.xenproject.org,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
 Rusty Russell <rusty@rustcorp.com.au>, Daris A Nevil <dnevil@snmc.com>,
 Lijun Pan <ljp@linux.ibm.com>, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Nicolas Pitre <nico@fluxnic.net>, Geoff Levand <geoff@infradead.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Erik Stahlman <erik@vt.edu>, John Allen <jallen@linux.vnet.ibm.com>,
 Utz Bacher <utz.bacher@de.ibm.com>, Dany Madden <drt@linux.ibm.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Russell King <rmk@arm.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jan 2021 16:41:16 +0000 Lee Jones wrote:
> Resending the stragglers again.                                                                                  
> 
> This set is part of a larger effort attempting to clean-up W=1                                                   
> kernel builds, which are currently overwhelmingly riddled with                                                   
> niggly little warnings.                                                                                          
>                                                                                                                  
> v2:                                                                                                              
>  - Squashed IBM patches                                                                                      
>  - Fixed real issue in SMSC
>  - Added Andrew's Reviewed-by tags on remainder

Does not apply, please rebase on net-next/master.
