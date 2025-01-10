Return-Path: <linuxppc-dev+bounces-4973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D22A090FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 13:45:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV1bg1LPYz2yFD;
	Fri, 10 Jan 2025 23:45:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736513151;
	cv=none; b=aUP+WJO1PcN9lTalDasBoiF7aLfwBcMFjxQODeLk2C5CHvYABTsMxoeMWWovsL3aZDLLHEYiaICIiWkbUarafyphss6eJlZAmCDudYHRfZ30Wusg/Gqt+MmmWcJgSpKwxVw6EqKrkywHJfqCNnzQ9ZZplXBgOevDrPhj3ZVxH2TvujPxmzw6/6JRGrKNnNmTkTDWnK+NojpxwCeGTuJSHa9QC8ILzm8BKhEDTowG0gVAiLS/xibrL9wg8RSvifIga1xWspKGKQZaZWuf2PHiLz/iyeUm7Uj2VkrAx/oNnvBBqcuKFsGdPysCeaxt8zY0pcM1Pyu4Kz4Kg7pXGtnrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736513151; c=relaxed/relaxed;
	bh=42c5pBSxqemZ6wnpJ8fo/6qnHtDvq9ZkYmO5VF2Npx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjvzFPpA4petZh24AnML3niceKJ9anzQGnSsMQsGLXbLm/R6q3g7t4w6i5ke0yUz5gEN7Tir941RwO46yvYWyTBvthFU5M/i/FWSygnn6dHUBnXECcKgO64DAjelBaUfw2RJHCrTWHTLSg6267ntfoRN/AeO12JnNbyiJRUwfAeEfKQvZnfXr1hK6CehoVrmXJetWdocbUDuQ3Zz8J9d9EMklKN6E2XIQMf4uuKJSOdfX4a5m97YRan9Mx9+y5/OVIjpGXL1LReKX6rX8qXY2fmqQnggoQIVhYuFpBmWSykfRk8JKPJVMG28TI+PtSLgRRgD9ASx0MOvtXHLE0sdeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JIRXkIsX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JIRXkIsX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV1bd6gjBz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 23:45:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D60CBA41EE9;
	Fri, 10 Jan 2025 12:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D81EC4CED6;
	Fri, 10 Jan 2025 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736513145;
	bh=bca8BxMfdc975okjycip8BdofCPaqbTOhIcMezZca7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JIRXkIsXVAAuDPCblcDhjrAUDCdKcVwhQFs1+lUoeE/gUeTmJkWUSoksS3xLU0Uf6
	 vkk/qiXLG83GkO0i/vEt3uH5FPzeZmNEJHVeOmP2+VQWzCw5RuKf9IxyCvZMxWB90O
	 xHBZn0J5EqYkzYdorXObKEQuuEtG09skfWQViCxUAyl/cFzjcqlluDYFP61hqJxxtT
	 SoqK8ME4Fu0QKGnmVezpH+a6AhqA1fpAlovK1BGlHJkXDvmn7YPTcVGQmNRwS5SmGn
	 mPhTI9Q5QhVkx+Huya363BjXwZwfU18TJXxlVjM2Fsu61Qtu15NgXs6lHjZOyYM7i6
	 xNdhG2p8RPI7g==
Date: Fri, 10 Jan 2025 12:45:41 +0000
From: Simon Horman <horms@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next] freescale: ucc_geth: Remove set but unused
 variables
Message-ID: <20250110124541.GE7706@kernel.org>
References: <20250110-ucc-unused-var-v1-1-4cf02475b21d@kernel.org>
 <8b080760-c1c7-4d9d-a17b-3c0115392b36@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b080760-c1c7-4d9d-a17b-3c0115392b36@csgroup.eu>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 12:07:25PM +0100, Christophe Leroy wrote:
> 
> 
> Le 10/01/2025 à 11:18, Simon Horman a écrit :
> > Remove set but unused variables. These seem to provide no value.
> > So in the spirit of less being more, remove them.
> 
> Would be good to identify when those variables became unused.
> 
> There is for instance commit 64a99fe596f9 ("ethernet: ucc_geth: remove
> bd_mem_part and all associated code")

Sure, I can work on an updated commit message for v2 along those lines.

> 
> ...
> 
> > 
> > Compile tested only.
> > No runtime effect intended.
> > 
> > Signed-off-by: Simon Horman <horms@kernel.org>
> 
> As you are playing with that driver, there are also sparse warnings to be
> fixed, getting plenty when building with C=2

Yes, I noticed.
That is on my todo list :)

> 
> > ---
> >   drivers/net/ethernet/freescale/ucc_geth.c | 39 +++++++------------------------
> >   1 file changed, 8 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
> > index 88510f822759..1e3a1cb997c3 100644
> > --- a/drivers/net/ethernet/freescale/ucc_geth.c
> > +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> > @@ -1704,14 +1704,8 @@ static int ugeth_82xx_filtering_clear_addr_in_paddr(struct ucc_geth_private *uge
> >   static void ucc_geth_free_rx(struct ucc_geth_private *ugeth)
> >   {
> > -	struct ucc_geth_info *ug_info;
> > -	struct ucc_fast_info *uf_info;
> > -	u16 i, j;
> >   	u8 __iomem *bd;
> > -
> > -
> > -	ug_info = ugeth->ug_info;
> > -	uf_info = &ug_info->uf_info;
> > +	u16 i, j;
> 
> Why do you need to move this declaration ? Looks like cosmetics. That goes
> beyond the purpose of this patch which is already big enough and should be
> avoided. The same applies several times in this patch.

It seemed convenient to move this around at the same time,
as the lines are adjacent. But will drop them as you wish.

> 
> >   	for (i = 0; i < ucc_geth_rx_queues(ugeth->ug_info); i++) {
> >   		if (ugeth->p_rx_bd_ring[i]) {

...

> > @@ -2904,7 +2883,7 @@ static int ucc_geth_rx(struct ucc_geth_private *ugeth, u8 rxQ, int rx_work_limit
> >   	/* while there are received buffers and BD is full (~R_E) */
> >   	while (!((bd_status & (R_E)) || (--rx_work_limit < 0))) {
> > -		bdBuffer = (u8 *) in_be32(&((struct qe_bd __iomem *)bd)->buf);
> > +		in_be32(&((struct qe_bd __iomem *)bd)->buf);
> 
> This line should go completely.

Thanks,

I was slightly concerned that it may have some side effect - that
I have no way to test. But I will remove it on your advice.

> 
> >   		length = (u16) ((bd_status & BD_LENGTH_MASK) - 4);
> >   		skb = ugeth->rx_skbuff[rxQ][ugeth->skb_currx[rxQ]];

...

-- 
pw-bot: changes-requested

