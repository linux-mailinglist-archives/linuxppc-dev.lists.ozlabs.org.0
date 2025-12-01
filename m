Return-Path: <linuxppc-dev+bounces-14556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093AC96ACC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 01 Dec 2025 11:34:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKgJ25Qc9z2yvD;
	Mon, 01 Dec 2025 21:34:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::832"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764585266;
	cv=none; b=U0mmtZF36jv/x1/cZKAxE+YabnOCX7hkiYiSC4YOA6bA4pAaxZABtuHsQDFByQs8VuqasDtY4eZT/veYf74LwMV5wNd1EzFKVYiYdp4t26Tpooan7Vj43YKs1nqut3V2UP5e5eJu8MKFbMc8uE65KLSYcB/tm7ovzxDXuoPDJt91AM4q2Z+cdi2Zlyx5rTWnpePdDj6hhnh4zo0xr2b0/0zQrDnUQOYJrN1VJSVKdLYFDsG7Sdg8pEl1eD7Xdzj0yHD1TrFLkt6bOq01+EtnUOJG0urherWQcq3I9NfV+E9lg1BxzhFWiKnkgzxWo5I57YKnwjCfRVytTAckm8pH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764585266; c=relaxed/relaxed;
	bh=/NFC26iZ51Jq0FMro6cx4anMEPoTOz73Uuc7um5nw/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6MhpsaxDJlfnFao9I15vQRK7LkfAkyGNrpl9QC/9CFmRWaUuKvg2nc9bPEIklCZaKpuds3NvcFwR/93UzqvY+xzHcrjVJoK5i7LE/R5WScb4XScjDZbUWo3VEDrdi8FMB275ixPVGU8u8LZTsESk3x0uS6q7QgM1ZIBS3UNnRLKliIQVwc/FN87vLLoOLFy7fjWfCy6DTHXuDofSXIK2L56iTVOH4+qEWNGeRtOhva14/rmGy1YKjchfY/ditDci7TzWde/qjoE74/quSxHvpYIciQwtwkG+LjCWOqF9PJUdxcDy7FO/cUKg41sm6ZMDvc7ooyl8T1zMyNjFp+0Aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zgbI3kIH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zgbI3kIH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dKgJ1048rz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Dec 2025 21:34:24 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee13dc0c52so34062611cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Dec 2025 02:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764585261; x=1765190061; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NFC26iZ51Jq0FMro6cx4anMEPoTOz73Uuc7um5nw/A=;
        b=zgbI3kIHbCHPygQj345oTtmTn0042FwF75qS2b9Tb76MnyNaOVHqohrRxcvB85osbe
         emdDeS4XfoOcd/tetNorbbPy6ZxZeJC3nwJ8sK15TmtrOq10jsgIChOlaXuj09CAbWhx
         Wq9pH3fYENhgQ58dRcGkJN5/xXySMmQ+ADqg4ZQenBjB5fR0dvzys3fWns3kb7bUXAk8
         Wq3SL4RWglya839wZdPiJ1yJc3uAehDOYQ1/HjClR2zvPBIUBpC1MdkxKC6SaB+vPBJc
         SqtM7P1NCBzQ4QTaoyxLQBNbjMD1fRSK5gncHem8TnFhjLLwEp2roGWJMPQmoNUcosDc
         F9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585261; x=1765190061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NFC26iZ51Jq0FMro6cx4anMEPoTOz73Uuc7um5nw/A=;
        b=qGn2A3W15ZB783ZE7cd9DFZl3JZwTGZ4zp0E2k7JeEbPlCXnFgHVSx00iZa/8rkqFU
         g5FDjvMjBhdLJLmUwGeiJ+yy8wn5UkkiHphhgfk3y/3YEvYkGLjgJAPjLZsyIsBiy5+/
         y4ERcRlhtLq2OtH26U2aDzke1OmnYArVgj+8wikV+7UylVe/P8eAEWiCNtqClTQ2vxQ6
         JX3qUZFzR1RWwN3MICQj4RTs6lp8bx2vZS3ub40mue3adn8ribobWRoqoMl5HlpjZEkC
         VciYMaa7DdxUxx234Exb7B14JiNEq/3LIZHsMnqr3oXnUna+NkkgKtvouAZKR5MY5WDl
         WD9g==
X-Forwarded-Encrypted: i=1; AJvYcCXSGv5awsoOMobMw0oGsSldB8ZRi20iCIfgO7m7PnAdRVHnJC+kkHMnM5Uk5jjKHcam1WI2/5zNTl+ZTuk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVGRb9JwpMIiVKFItP/1lrwdh3lPdMfxkRTD1/pk4HQJ4hUmIn
	HNroJyYGTUksr04YHhuh1Kol3rxMffXZp5r7oCWgR/aei05VZKZshiDv+4kvZKGmi6uOXMwHuhM
	zLJYhHGWi6BZRn4dYYOUOHF+l9I7lBkBvLnIrg2Yy
X-Gm-Gg: ASbGncvaf0HrtyApihsytxy4GPykTnEF3+LdnL0fzFcGwmzFx4pijBCtmb0gkTOBhnY
	LJVsJFBTSBvTVeHiVc/T+DJWriV/yMW5f7ZLrb6hIo871nLUxOeufp5nVRZnZN32FxmkOHyk/jK
	AQlozIJa1R5uwSrDH4FRRzDqXt/LATylUqLF2k+LgJcye6i5PZMKRCfZVbzQDoajTZXuWyPYkxz
	v1MyHysJjscvaNVtE9RTrjtE+znBrp4T6zToICNjzj9GmNdVcHt6i6RPhFyxR7jM5H7Yr8=
X-Google-Smtp-Source: AGHT+IHrOCxJDylsnf5RjbZYp5/hq9LRYZJVRZTrh485sxhY1zvrz1HEnuJgz8DasBfdSKWNNqOGg7kYZ0BBwnjm3h0=
X-Received: by 2002:ac8:5ace:0:b0:4ee:1d3e:6aba with SMTP id
 d75a77b69052e-4ee58b29568mr578454331cf.74.1764585260665; Mon, 01 Dec 2025
 02:34:20 -0800 (PST)
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
Precedence: list
MIME-Version: 1.0
References: <20251130194155.1950980-1-fuchsfl@gmail.com>
In-Reply-To: <20251130194155.1950980-1-fuchsfl@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 1 Dec 2025 02:34:09 -0800
X-Gm-Features: AWmQ_bkHbwPbn9xWGDfCo5ilV01Qvn8Z_JeT-bzbJliOYcgsFkjYCR2lM1YMuIM
Message-ID: <CANn89i+q_KBrrhY-PjqdG9gxkdYyWy88Vbgu=PAr=SqDmvOyUw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ps3_gelic_net: Use napi_alloc_skb() and napi_gro_receive()
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Nov 30, 2025 at 11:51=E2=80=AFAM Florian Fuchs <fuchsfl@gmail.com> =
wrote:
>
> Use the napi functions napi_alloc_skb() and napi_gro_receive() instead
> of netdev_alloc_skb() and netif_receive_skb() for more efficient packet
> receiving. The switch to napi aware functions increases the RX
> throughput, reduces the occurrence of retransmissions and improves the
> resilience against SKB allocation failures.
>
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
> ---
> Note: This change has been tested on real hardware Sony PS3 (CECHL04 PAL)=
,
> the patch was tested for many hours, with continuous system load, high
> network transfer load and injected failslab errors.
>
> In my tests, the RX throughput increased up to 100% and reduced the
> occurrence of retransmissions drastically, with GRO enabled:
>
> iperf3 before and after the commit, where PS3 (with this driver) is on
> the receiving side:
> Before: [  5]   0.00-10.00  sec   551 MBytes   462 Mbits/sec receiver
> After:  [  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec receiver
>
> stats from the sending client to the PS3:
> Before: [  5]   0.00-10.00  sec   552 MBytes   463 Mbits/sec  3151 sender
> After:  [  5]   0.00-10.00  sec  1.09 GBytes   940 Mbits/sec   37  sender
>
>  drivers/net/ethernet/toshiba/ps3_gelic_net.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Patch looks fine to me. My PS3 died years ago, so I can not test it :)

Reviewed-by: Eric Dumazet <edumazet@google.com>

BTW, I think we can cleanup gelic_descr_prepare_rx() a bit :

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 5ee8e8980393c3491bf9cf91eb8e0dbb2df0f427..f4f34e9ed49c5b7fd1cf4ea3f5b=
fe7297e97ea23
100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -392,10 +392,8 @@ static int gelic_descr_prepare_rx(struct gelic_card *c=
ard,
        descr->hw_regs.payload.size =3D 0;

        descr->skb =3D netdev_alloc_skb(*card->netdev, rx_skb_size);
-       if (!descr->skb) {
-               descr->hw_regs.payload.dev_addr =3D 0; /* tell DMAC
don't touch memory */
+       if (!descr->skb)
                return -ENOMEM;
-       }

        offset =3D ((unsigned long)descr->skb->data) &
                (GELIC_NET_RXBUF_ALIGN - 1);
@@ -404,13 +402,12 @@ static int gelic_descr_prepare_rx(struct gelic_card *=
card,
        /* io-mmu-map the skb */
        cpu_addr =3D dma_map_single(ctodev(card), descr->skb->data,
                                  GELIC_NET_MAX_FRAME, DMA_FROM_DEVICE);
-       descr->hw_regs.payload.dev_addr =3D cpu_to_be32(cpu_addr);
+
        if (dma_mapping_error(ctodev(card), cpu_addr)) {
                dev_kfree_skb_any(descr->skb);
                descr->skb =3D NULL;
                dev_info(ctodev(card),
                         "%s:Could not iommu-map rx buffer\n", __func__);
-               gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
                return -ENOMEM;
        }

