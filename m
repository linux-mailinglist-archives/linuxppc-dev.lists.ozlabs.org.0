Return-Path: <linuxppc-dev+bounces-3576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C50D9D9CBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 18:41:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyVHY64PYz2yhR;
	Wed, 27 Nov 2024 04:41:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732642889;
	cv=none; b=OUIY4sdvYGRpIaUoiZhzuilgXcHNAyMc2yuQQjVniT74z0H4BIJLctrmxSOT88mLu/T0X1qIPBXWpRMa1fUkEm6wG7Ks5dGN3/j4osg7Y8/afvwzAk4h6pua7U+Rrs/yRWcL6Tt+oTpk77eqIppLbo4eY+ScmMmHXJBSYt0UwTeexOgVyENIDlR02fYkEbwc0SV38D1dN9zA/pngAAkRch/JJVBU/1Wl2zh+oMKSYiFY5yDsBzHGtb6pUDXXDQzRdhcpuRgeDzoa6WiT+/qZXUJxC+kGMVIh/jkApafC1l+M5ODgxixKnaYBbxRBRoIVwhE1diHbRUrlmkYLp/JBng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732642889; c=relaxed/relaxed;
	bh=PPSnA41coIwDjhcOM58Qd6tknD86gTdOq24hZjP2m1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WFKoEd1q8QbI19r1HwqinABbLlByOtUbrMqVVDKAfkO7w0WCbD+h6XIvANdtPqoHChGdmcA8d2AiSGOJ2PXBy9kL1OeSmxAcVHr02OqZVgOrURwvTBPn1mT0ww98gtUhL5FOmhZz4AEh8wVL7pR+Ncrar7lCYbvteaJHQh+9pMQX8iJhaezwzWDZpcrBvaQTXoQFx6ZjAoeyV2MQkTw7ns/4KHDXV1UG4BzqD6U14XFbwlQ6vlVxC6m8WO94RKEsiwz5kgxP5mdouzGQ6k6oZqzsL2LxL0rVLnGqfWlzvwjKGsk9rTIWZ780L5ecNkPMep23RmTpq9fd0vK/xurnUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ERnD62+W; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XjA+cMRz; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ERnD62+W;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XjA+cMRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyVHV00lXz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 04:41:25 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732642875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PPSnA41coIwDjhcOM58Qd6tknD86gTdOq24hZjP2m1w=;
	b=ERnD62+Wlk5SL4814Wu7aFiw2ejB83hM5AqsZQg8VLDIOAgbrcX+lUsY0ee5oND6ky/gta
	z4shhSrN2/5tPh9MMPJ54OBw4T8T7qcA3ldPhTjWzSwOnrxgNSnu9+G8C5Aw5Xiy+z57tT
	dv+LCUXekD8p5EN9YzQtDl0szrs20cf/MWrE2jO4fJ9W+aqjcpMy4Pw2VCbiN0U8tSTvRH
	+ZP2lo3Foi8m2eWaqLrdUOK6bc5X12LNTnG36AcdISxf3seIE8JgFUkf0LUUal8IlIqSCn
	muzQjQEmEl2XOkgVdqBl49g3qTBUnwZeJrAocxrZdup1lFp4dok2UI6+t7zjHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732642875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PPSnA41coIwDjhcOM58Qd6tknD86gTdOq24hZjP2m1w=;
	b=XjA+cMRzcHZlSHcEIXNGER863US3c8G9D+GwsXT+6jOfmHKN7A2MsVYCBdNWJo6PDOzN0C
	ZiH9lugmUgYHk5Bg==
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, jk@ozlabs.org, arnd@arndb.de,
 geoff@infradead.org
Subject: Re: [RFC PATCH 20/20] genirq: Remove IRQ_EDGE_EOI_HANDLER
In-Reply-To: <20241114125111.599093-20-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
 <20241114125111.599093-20-mpe@ellerman.id.au>
Date: Tue, 26 Nov 2024 18:41:14 +0100
Message-ID: <8734jdzydh.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14 2024 at 23:51, Michael Ellerman wrote:
> The powerpc Cell blade support, now removed, was the only user of
> IRQ_EDGE_EOI_HANDLER, so remove it.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

