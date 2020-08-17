Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC3246B29
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 17:49:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVdlR029PzDqD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 01:49:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cuCOTw7v; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVdNx510lzDqVW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 01:33:36 +1000 (AEST)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 273CA22CAE;
 Mon, 17 Aug 2020 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597678413;
 bh=oRpPTF8CLVl2GdwVLqbcgNxfGrfqo2YvIIghubdcD3U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cuCOTw7vdPagZu/YDOJ36n2k21iuhjC6Q+xcZCv5VwkvMnHehBKNuY7qWH1YfhLfQ
 uxs01fevGl2GXxKi+lBy8SDRp/QtPGUzthJFloMf+LShCgY+WQoz9xkezYTUR31ppl
 J47G6NfE97P+DK4Vs9w04H/cBfS//QF3y2IB04fA=
Date: Mon, 17 Aug 2020 08:33:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Allen Pais <allen.lkml@gmail.com>
Subject: Re: [PATCH 08/20] ethernet: hinic: convert tasklets to use new
 tasklet_setup() API
Message-ID: <20200817083330.78e365eb@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200817082434.21176-10-allen.lkml@gmail.com>
References: <20200817082434.21176-1-allen.lkml@gmail.com>
 <20200817082434.21176-10-allen.lkml@gmail.com>
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
Cc: jes@trained-monkey.org, borisp@mellanox.com, keescook@chromium.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kda@linux-powerpc.org,
 cooldavid@cooldavid.org, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-acenic@sunsite.dk, oss-drivers@netronome.com,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 mlindner@marvell.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Aug 2020 13:54:22 +0530 Allen Pais wrote:
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c:374: warning: Function parameter or member 't' not described in 'ceq_tasklet'
drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c:374: warning: Excess function parameter 'ceq_data' description in 'ceq_tasklet'
