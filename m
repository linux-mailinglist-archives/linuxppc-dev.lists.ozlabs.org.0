Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7632FCB7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 20:24:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtF0L3SMPz3cb9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 06:24:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xdU0jKfv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=xdU0jKfv; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtDzt2pHdz3cJ7
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Mar 2021 06:23:52 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 813AB64E0F;
 Sat,  6 Mar 2021 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615058629;
 bh=cTnXEc/F4W5azx4fPkGRWkSBUH6CHrJ93Qn3flShYsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xdU0jKfvhBBnrl7a+pwDiUlnXJVbuBJT0ZBRK57ZNgBWZKcxfpDjerLzn4TuqFa4b
 8p7p3SNgdzG/gzhE8E65D+l4AeN0wE37I+dtB2J1rM3H/ftKqsj0zk2ciQbfZGpRFQ
 U55CHCRKETy0MXekjLnApTi3abggfVLSTgRFNyts=
Date: Sat, 6 Mar 2021 20:23:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 2/3] tty: serial: ucc_uart: replace qe_io{read, write}*
 wrappers by generic io{read,write}*
Message-ID: <YEPWwpxMFRwyI8w5@kroah.com>
References: <cover.1615053848.git.christophe.leroy@csgroup.eu>
 <479e57158ed85c041e4c32ef17b55024f8a784ce.1615053848.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <479e57158ed85c041e4c32ef17b55024f8a784ce.1615053848.git.christophe.leroy@csgroup.eu>
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
Cc: Timur Tabi <timur@kernel.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 06, 2021 at 06:09:30PM +0000, Christophe Leroy wrote:
> Commit 6ac9b61786cc ("soc: fsl: qe: introduce qe_io{read,write}*
> wrappers") added specific I/O accessors for qe because at that
> time ioread/iowrite functions were sub-optimal on powerpc/32
> compared to the architecture specific in_/out_ IO accessors.
> 
> But as ioread/iowrite accessors are now equivalent since
> commit 894fa235eb4c ("powerpc: inline iomap accessors"),
> use them in order to allow removal of the qe specific ones.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/tty/serial/ucc_uart.c | 124 +++++++++++++++++-----------------
>  1 file changed, 62 insertions(+), 62 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
