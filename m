Return-Path: <linuxppc-dev+bounces-2833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 046299BB7E1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 15:34:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xhv9y6M6lz2yMF;
	Tue,  5 Nov 2024 01:34:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730730870;
	cv=none; b=Mh4aflW4ByHByzSAYqYN1aE78Z6O4fQHCbc6wtuDWuKsXfiSR1vwaYkok8+RljhAps4ZBDOi0rZbaY4M4cZiRX+rZ8HqeR/vXUeQNus0N6sk4q9kLCuSc7sP7QeY1psOOb8eNAw6GqvUhdvhO+TRKZIig32hmyD6NrLxF8Wqh+V++VbFRk2GvHm/zU3CrpB+VsNKHUqjwL8SefL2KD5zq8Yk7ZNbn42NshRRTT7cfwGmfJ5FowF1QVI6mWPsQUVDAgn0b/FrdtGF1mG7Q5yAba571TY/2nzWzptXIDoEeYj5Aa55gQjhJ3shicPZPxmlh4Qk7cbNP2hBI/+VD78aTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730730870; c=relaxed/relaxed;
	bh=zpyT7tE07BjOP0Fir/BNsKyQ5l4rDLa/KXv/XcsxY98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CivOj4eBIXcChzOTgbr5FToZXlUe3bOYQ7WV0WH8Zwq7jeJhk4hupZiwu3xGa80x9jrDt5KRmwmA3w+fBGA7Vf72SGhLMFpu9Fffv3QCSF/c1gq4fMmhQpnn283UjM+CXGdlssYfF/5kvLO1CzgO8pNp7ZsRBiu0Xce2Y2MH4twKxFb8EdJ0DuWgZqDHH/NChDylFtpjoogGwRPHrvpS3+F5xQTGqDWi3D8p7uxkFRvC4D0m20/vheO76BKmyhQ4IMUMDBHSdSKosChTdDmsXEMaYp749ElL5K8QPJOgxvWaIT0wCGOxnF/llAKmfyCNgpOG/9UjgrTtPtMkW2D2Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xhv9x71Lyz2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 01:34:29 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xhv9v0sCKz9sST;
	Mon,  4 Nov 2024 15:34:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RH5f9tRQBcV2; Mon,  4 Nov 2024 15:34:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xhv9t6hz1z9sSS;
	Mon,  4 Nov 2024 15:34:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD0A68B770;
	Mon,  4 Nov 2024 15:34:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vJlu8CVG94Eu; Mon,  4 Nov 2024 15:34:26 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DAC98B763;
	Mon,  4 Nov 2024 15:34:26 +0100 (CET)
Message-ID: <81fa5067-88d3-4693-9e42-7072b5430ac8@csgroup.eu>
Date: Mon, 4 Nov 2024 15:34:26 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: dpaa_eth: add assertions about SGT
 entry offsets in sg_fd_to_skb()
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Breno Leitao <leitao@debian.org>,
 Madalin Bucur <madalin.bucur@nxp.com>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Radu Bulie <radu-andrei.bulie@nxp.com>,
 Sean Anderson <sean.anderson@linux.dev>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-3-vladimir.oltean@nxp.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241029164317.50182-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 29/10/2024 à 17:43, Vladimir Oltean a écrit :
> Multi-buffer frame descriptors (FDs) point to a buffer holding a
> scatter/gather table (SGT), which is a finite array of fixed-size
> entries, the last of which has qm_sg_entry_is_final(&sgt[i]) == true.
> 
> Each SGT entry points to a buffer holding pieces of the frame.
> DPAARM.pdf explains in the figure called "Internal and External Margins,
> Scatter/Gather Frame Format" that the SGT table is located within its
> buffer at the same offset as the frame data start is located within the
> first packet buffer.
> 
>                                   +------------------------+
>      Scatter/Gather Buffer        |        First Buffer    |   Last Buffer
>        ^ +------------+ ^       +-|---->^ +------------+   +->+------------+
>        | |            | | ICEOF | |     | |            |      |////////////|
>        | +------------+ v       | |     | |            |      |////////////|
>   BSM  | |/ part of //|         | |BSM  | |            |      |////////////|
>        | |/ Internal /|         | |     | |            |      |////////////|
>        | |/ Context //|         | |     | |            |      |// Frame ///|
>        | +------------+         | |     | |            | ...  |/ content //|
>        | |            |         | |     | |            |      |////////////|
>        | |            |         | |     | |            |      |////////////|
>        v +------------+         | |     v +------------+      |////////////|
>          | Scatter/ //| sgt[0]--+ |       |// Frame ///|      |////////////|
>          | Gather List| ...       |       |/ content //|      +------------+ ^
>          |////////////| sgt[N]----+       |////////////|      |            | | BEM
>          |////////////|                   |////////////|      |            | |
>          +------------+                   +------------+      +------------+ v
> 
> BSM = Buffer Start Margin, BEM = Buffer End Margin, both are configured
> by dpaa_eth_init_rx_port() for the RX FMan port relevant here.
> 
> sg_fd_to_skb() runs in the calling context of rx_default_dqrr() -
> the NAPI receive callback - which only expects to receive contiguous
> (qm_fd_contig) or scatter/gather (qm_fd_sg) frame descriptors.
> Everything else is irrelevant codewise.
> 
> The processing done by sg_fd_to_skb() is weird because it does not
> conform to the expectations laid out by the aforementioned figure.
> Namely, it parses the OFFSET field only for SGT entries with i != 0
> (codewise, skb != NULL). In those cases, OFFSET should always be 0.
> Also, it does not parse the OFFSET field for the sgt[0] case, the only
> case where the buffer offset is meaningful in this context. There, it
> uses the fd_off, aka the offset to the Scatter/Gather List in the
> Scatter/Gather Buffer from the figure. By equivalence, they should both
> be equal to the BSM (in turn, equal to priv->rx_headroom).
> 
> This can actually be explained due to the bug which we had in
> qm_sg_entry_get_off() until the previous change:
> 
> - qm_sg_entry_get_off() did not actually _work_ for sgt[0]. It returned
>    zero even with a non-zero offset, so fd_off had to be used as a fill-in.
> 
> - qm_sg_entry_get_off() always returned zero for sgt[i>0], and that
>    resulted in no user-visible bug, because the buffer offset _was
>    supposed_ to be zero for those buffers. So remove it from calculations.
> 
> Add assertions about the OFFSET field in both cases (first or subsequent
> SGT entries) to make it absolutely obvious when something is not well
> handled.
> 
> Similar logic can be seen in the driver for the architecturally similar
> DPAA2, where dpaa2_eth_build_frag_skb() calls dpaa2_sg_get_offset() only
> for i == 0. For the rest, there is even a comment stating the same thing:
> 
> 	 * Data in subsequent SG entries is stored from the
> 	 * beginning of the buffer, so we don't need to add the
> 	 * sg_offset.
> 
> Tested on LS1046A.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>


Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 24 ++++++++++++-------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> index ac06b01fe934..e280013afa63 100644
> --- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> @@ -1820,7 +1820,6 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
>   	struct page *page, *head_page;
>   	struct dpaa_bp *dpaa_bp;
>   	void *vaddr, *sg_vaddr;
> -	int frag_off, frag_len;
>   	struct sk_buff *skb;
>   	dma_addr_t sg_addr;
>   	int page_offset;
> @@ -1863,6 +1862,11 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
>   			 * on Tx, if extra headers are added.
>   			 */
>   			WARN_ON(fd_off != priv->rx_headroom);
> +			/* The offset to data start within the buffer holding
> +			 * the SGT should always be equal to the offset to data
> +			 * start within the first buffer holding the frame.
> +			 */
> +			WARN_ON_ONCE(fd_off != qm_sg_entry_get_off(&sgt[i]));
>   			skb_reserve(skb, fd_off);
>   			skb_put(skb, qm_sg_entry_get_len(&sgt[i]));
>   		} else {
> @@ -1876,21 +1880,23 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
>   			page = virt_to_page(sg_vaddr);
>   			head_page = virt_to_head_page(sg_vaddr);
>   
> -			/* Compute offset in (possibly tail) page */
> +			/* Compute offset of sg_vaddr in (possibly tail) page */
>   			page_offset = ((unsigned long)sg_vaddr &
>   					(PAGE_SIZE - 1)) +
>   				(page_address(page) - page_address(head_page));
> -			/* page_offset only refers to the beginning of sgt[i];
> -			 * but the buffer itself may have an internal offset.
> +
> +			/* Non-initial SGT entries should not have a buffer
> +			 * offset.
>   			 */
> -			frag_off = qm_sg_entry_get_off(&sgt[i]) + page_offset;
> -			frag_len = qm_sg_entry_get_len(&sgt[i]);
> +			WARN_ON_ONCE(qm_sg_entry_get_off(&sgt[i]));
> +
>   			/* skb_add_rx_frag() does no checking on the page; if
>   			 * we pass it a tail page, we'll end up with
> -			 * bad page accounting and eventually with segafults.
> +			 * bad page accounting and eventually with segfaults.
>   			 */
> -			skb_add_rx_frag(skb, i - 1, head_page, frag_off,
> -					frag_len, dpaa_bp->size);
> +			skb_add_rx_frag(skb, i - 1, head_page, page_offset,
> +					qm_sg_entry_get_len(&sgt[i]),
> +					dpaa_bp->size);
>   		}
>   
>   		/* Update the pool count for the current {cpu x bpool} */

