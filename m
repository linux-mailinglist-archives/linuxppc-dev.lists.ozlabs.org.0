Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 375552A6561
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 14:41:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR79N0BR0zDqLh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 00:41:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR75c0wZpzDqBy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 00:38:27 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kaIzP-005DCl-S7; Wed, 04 Nov 2020 14:38:15 +0100
Date: Wed, 4 Nov 2020 14:38:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 09/12] net: ethernet: ibm: ibmvnic: Fix some kernel-doc
 misdemeanours
Message-ID: <20201104133815.GC933237@lunn.ch>
References: <20201104090610.1446616-1-lee.jones@linaro.org>
 <20201104090610.1446616-10-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104090610.1446616-10-lee.jones@linaro.org>
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
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Santiago Leon <santi_leon@yahoo.com>, John Allen <jallen@linux.vnet.ibm.com>,
 Lijun Pan <ljp@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Dany Madden <drt@linux.ibm.com>, kuba@kernel.org,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 04, 2020 at 09:06:07AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  from drivers/net/ethernet/ibm/ibmvnic.c:35:
>  inlined from ‘handle_vpd_rsp’ at drivers/net/ethernet/ibm/ibmvnic.c:4124:3:
>  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'hdr_field' not described in 'build_hdr_data'
>  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'skb' not described in 'build_hdr_data'
>  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'hdr_len' not described in 'build_hdr_data'
>  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'hdr_data' not described in 'build_hdr_data'
>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'hdr_field' not described in 'create_hdr_descs'
>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'hdr_data' not described in 'create_hdr_descs'
>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'len' not described in 'create_hdr_descs'
>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'hdr_len' not described in 'create_hdr_descs'
>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'scrq_arr' not described in 'create_hdr_descs'
>  drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter or member 'txbuff' not described in 'build_hdr_descs_arr'
>  drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter or member 'num_entries' not described in 'build_hdr_descs_arr'
>  drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter or member 'hdr_field' not described in 'build_hdr_descs_arr'
>  drivers/net/ethernet/ibm/ibmvnic.c:1832: warning: Function parameter or member 'adapter' not described in 'do_change_param_reset'
>  drivers/net/ethernet/ibm/ibmvnic.c:1832: warning: Function parameter or member 'rwi' not described in 'do_change_param_reset'
>  drivers/net/ethernet/ibm/ibmvnic.c:1832: warning: Function parameter or member 'reset_state' not described in 'do_change_param_reset'
>  drivers/net/ethernet/ibm/ibmvnic.c:1911: warning: Function parameter or member 'adapter' not described in 'do_reset'
>  drivers/net/ethernet/ibm/ibmvnic.c:1911: warning: Function parameter or member 'rwi' not described in 'do_reset'
>  drivers/net/ethernet/ibm/ibmvnic.c:1911: warning: Function parameter or member 'reset_state' not described in 'do_reset'
> 
> Cc: Dany Madden <drt@linux.ibm.com>
> Cc: Lijun Pan <ljp@linux.ibm.com>
> Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Santiago Leon <santi_leon@yahoo.com>
> Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
> Cc: John Allen <jallen@linux.vnet.ibm.com>
> Cc: netdev@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
