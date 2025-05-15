Return-Path: <linuxppc-dev+bounces-8602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83079AB908E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 May 2025 22:10:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zz1YF01sdz304Z;
	Fri, 16 May 2025 06:10:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=23.83.212.6 arc.chain=mailchannels.net
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747339840;
	cv=pass; b=oSmPHV1lEKSfme/z1PtU62QsHkJZqfoV5acdzH4YBSsXmBdjgWucnDbuy2R+rOxANi2nrhIeJBU/0iZ4MJ9uNpWXNNWkXFCSnGAtImLBMvNXjH1P1aPl9tTbdKcx+X8wkwiUKf5uWWlS1a4rgu94hTWguL+gywCNPRR+EJ7Js/5eWTa5Ojdhd7eh+VOWn9zkNUZgGiBGgQ9PvjAeYnt8QtSWM1B774s7EwNxVuXMt6LMOJNjtPm7UA/9aPS/l8mCtlajsItffn+ESmgYkK2Btye+tSbEWcyaUnl1KKf1RnImNX7UYum7PMGKi24ShRrzWXIPt0j/zUy/JPn6Ut4GsA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747339840; c=relaxed/relaxed;
	bh=T16Vq3COiNADWOyKep3xzMkAc7Ot1wv/VcPJ3MHB8W8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jMl76/uFF5dyZPx16HoQGTNMDXD8PSjr504cKXiwYKB6deJrCunYSAqYQiIu4FFf3Vz+qNdjUtctHGbAEZocRvOVp2wbCqtQisG96MuFfSpGfAblqQymgapUCcCIAm+gAK0NkUT0FhViLwc9MM/MjZajnn1GNH1D0dOgFNWTLEsZpGL4J+WUI+2raF+Wnz8uwyEZ8CcEg730JjTsiTkS3kF9NTQrYytKcWqQWzmuFY/T1z6yFdOC4+Sdk/U46hVJPxg5BTQw5QQnyb5QE/fZm/apF4ZWyZmBU1ezsaQnzRV2OCeHlqp/E+c/wy9qARdZBS1GbrM7DEgvAOb61VQD6w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ascii.art.br; dkim=pass (2048-bit key; unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha256 header.s=dreamhost header.b=iPBnIW8o; dkim-atps=neutral; spf=pass (client-ip=23.83.212.6; helo=aye.elm.relay.mailchannels.net; envelope-from=tuliom@ascii.art.br; receiver=lists.ozlabs.org) smtp.mailfrom=ascii.art.br
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ascii.art.br
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha256 header.s=dreamhost header.b=iPBnIW8o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ascii.art.br (client-ip=23.83.212.6; helo=aye.elm.relay.mailchannels.net; envelope-from=tuliom@ascii.art.br; receiver=lists.ozlabs.org)
Received: from aye.elm.relay.mailchannels.net (aye.elm.relay.mailchannels.net [23.83.212.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zz1Y95qcCz2yjN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 May 2025 06:10:36 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D7F901C28FC;
	Thu, 15 May 2025 20:10:33 +0000 (UTC)
Received: from pdx1-sub0-mail-a313.dreamhost.com (100-115-193-229.trex-nlb.outbound.svc.cluster.local [100.115.193.229])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id B73EA1C318A;
	Thu, 15 May 2025 20:10:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1747339832; a=rsa-sha256;
	cv=none;
	b=Uyrfi9ccIaPNozmUSVynifagsp0g0FrDL2C6K+vx0UMk3RdVDF+Bf1Fomz5m4sbT5Sowlh
	ufo5kdzstLoO9t5dRwQrURmNmgV57Dfgyxid7bfKZYRLxKWGLWHVkocwuYgdaVRA/rGIO/
	WCUccsm9yMn7N5xorzxCicT54Eu9xLTE85IuYORM8tEyonHkxRHuK8RI9qbE5pxowtRSjL
	mVSJiNGazZ7Pdig/CLONzcbS8oL4LSY38vcHfIaUwKG+AGkfWV3D9aszn5xO1iNxsCjX9m
	00hJ8kbPo8ngJrNi5pB36zejwoDN6RFrUqSbTdT5pGSMelRD8rM7WkMHongFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1747339832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=T16Vq3COiNADWOyKep3xzMkAc7Ot1wv/VcPJ3MHB8W8=;
	b=DcRrVds5caV7Z6g3Q8Hd4tjszCWoE8dR4PgGt8+hISpbD9uLdQs6klaRC7++9tOgHyFEKv
	uuO7GoisGLCtMfBeIQBY4ulImQ2+eEC4XknDB9NBmab60Gn2knYiBsPzthUebCBLMitp9K
	6K3j+QLBhNlNlVOT5LzjyA4VQaV71YnqWkDUmL10zEBMGQ9hRY108SsiiRYGMD8Q5mW6TL
	F7wK4FMsz3dmuZsgD4vB2pRsxIfX0W5MYTn6n9HA9JLGloGTGxab+J79YfHHCNOw00m7AR
	ndJlQ+COGSqZayel9qerKG9IsKva5viDs6CLsPA4n6w+jusrPLPtPpPlGTDuvQ==
ARC-Authentication-Results: i=1;
	rspamd-5b49d78d5-tf6lw;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=tuliom@ascii.art.br
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|tuliom@ascii.art.br
X-MailChannels-Auth-Id: dreamhost
X-Vacuous-Snatch: 16e26d8c644a3a69_1747339833690_2771381105
X-MC-Loop-Signature: 1747339833689:1918709797
X-MC-Ingress-Time: 1747339833689
Received: from pdx1-sub0-mail-a313.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.115.193.229 (trex/7.0.3);
	Thu, 15 May 2025 20:10:33 +0000
Received: from ascii.art.br (ip-187-73-1-26.isp.valenet.com.br [187.73.1.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: tuliom@ascii.art.br)
	by pdx1-sub0-mail-a313.dreamhost.com (Postfix) with ESMTPSA id 4Zz1Y374nZzHn;
	Thu, 15 May 2025 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ascii.art.br;
	s=dreamhost; t=1747339832;
	bh=T16Vq3COiNADWOyKep3xzMkAc7Ot1wv/VcPJ3MHB8W8=;
	h=From:To:Cc:Subject:Date:Content-Type;
	b=iPBnIW8o/n2XcpXcuQyubTaxqPxavpO+OSu+vR4iwoc0bjfkZ6vzz8kwILap4lNLH
	 hMwgpJWrr3dYOk1KKa3Y2Dv7136oMockiAbQyzsJ2JjlcEI7u1bj0t3Dm9QhkMgODO
	 Wbd6oD/7MXH3DknRL1FqIWvzAmg0QGKPsTTiJztwZr8ygFXToMYEZwSg++9RayFSwS
	 aROiaj2fCacYCLYClSHzCsUlROjUrKQNXAsm0vkfjwTQsQnH14noLLFyCsvoaFer2B
	 L0Gm3t+6D3qMXyQs0LZ8xMIQVRzHq3vFuxMJsrNfmEATLXbCZiTrQPHfVHvEO4AEs1
	 gI+CNH9Zvf6xQ==
From: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Fix struct termio related ioctl macros
In-Reply-To: <20250511080404.861898-1-maddy@linux.ibm.com>
References: <20250511080404.861898-1-maddy@linux.ibm.com>
Date: Thu, 15 May 2025 17:10:28 -0300
Message-ID: <87zffdhbyj.fsf@ascii.art.br>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Madhavan Srinivasan <maddy@linux.ibm.com> writes:

> Since termio interface is now obsolete, include/uapi/asm/ioctls.h
> has some constant macros referring to "struct termio", this caused
> build failure at userspace.
>
> In file included from /usr/include/asm/ioctl.h:12,
>                  from /usr/include/asm/ioctls.h:5,
>                  from tst-ioctls.c:3:
> tst-ioctls.c: In function 'get_TCGETA':
> tst-ioctls.c:12:10: error: invalid application of 'sizeof' to incomplete type 'struct termio'
>    12 |   return TCGETA;
>       |          ^~~~~~
>
> Even though termios.h provides "struct termio", trying to juggle definitions around to
> make it compile could introduce regressions. So better to open code it.
>
> Reported-by: Tulio Magno <tuliom@ascii.art.br>
> Closes: https://lore.kernel.org/linuxppc-dev/8734dji5wl.fsf@ascii.art.br/
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>

I've tested and confirmed this patch does fix the issue.

Tested-by: Tulio Magno Quites Machado Filho <tuliom@redhat.com>

Thank you!

-- 
Tulio Magno

