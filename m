Return-Path: <linuxppc-dev+bounces-3456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048AC9D48FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2024 09:39:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvBTz3TYlz2yD6;
	Thu, 21 Nov 2024 19:39:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732178343;
	cv=none; b=NSND7BiN/fEsh2nYPDi1Cd9WoXgwHrL2O2oRVq19nTCLYyQ+yKqt9tEPCrUz+T0rC4Bm9ek6CM6w1YhW7PU67gXtPGB5Z7phaNUR/GDqU063affgVuqhJ5acCz+XdDmP0kq9SpLeGx1UC0RoffUrdQIW5wznGFtcwVR7VsSOoHFAT4NbD2Ia1OMqClEWPEujtWWOywU24yxo1dH75Ps9yYd2155UMRwgMhZ5TD8q38TgVlCyRCTBgAc/qqgb6Qk9mpiasE2FNklC53SJgwiivuLK0DxoOYgdZup3OkET4iUK48vHkewvI0ly0yXoJMJdlUQ6u7624nUdqC6NbhWMjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732178343; c=relaxed/relaxed;
	bh=FHKNk3ZnkRHZqy1I3MVdZq0wTw6nyYKhvWFL++uRWnA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fn5luWNE6yB1SR6uhVD9GDJzAtfVaejPoQMSgGKi0ovi2tIs5KqRTAzS3MxzVCdbosztr3uKXjncLpURjL1Dqh/UeBsQsh4gIwTB0Y9YADs280miVjVpiA/1aUgyy+H8vgbLqifK8ln5nbzlfw2wndGOi9BqKozF8EBPbpLz1Xq7zrMpPzCtXy4JzapXA8rwNxijwDDDJV4nBkktyLzs0LMXz1GjpjApJhdhIHxOr+iaWQBiw9WztDeXvPGKKi/XDBtvLCcmojIJcgue9hmJRylTF8UdoydTX0ittTLKDswavVTUPanxp73hJaDjAYaWTkAwFxmOgJF+vJ7hPOMyxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=K5E5LPB7; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=K5E5LPB7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvBTs72mLz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 19:38:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FHKNk3ZnkRHZqy1I3MVdZq0wTw6nyYKhvWFL++uRWnA=; t=1732178338; x=1732783138; 
	b=K5E5LPB7HvETdCimRRacSvGhCjbU9KVmgNQgTp+CkGa8GdM0dDFgGEjj3+y9ThYqr6EH24J+oLr
	yO90fTwD+nc9n/enUmuaKuRZxlVOlMnEliRLT7fCOPGews4LlHTCbgHgQ/QiEkWthvIsBbyH636hN
	Qlsn0y8QrcFs64as1rC2gdy+y249M5Tmi72uDSmhQW0uLQqKZogQ5oGPQXDtoM586aRJdYq4EkPwr
	E0DgZAsxEWONXcgSKFdeCWE89YavD3/6Zo6j53TazTxKOBQGLFTP29LuRRmVlD0EzgcIoAHic0dAS
	NGEvCTzMkxXoR85taDXLOWLQSRFQuqEjtuFg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tE2i7-00000002umv-1tkB; Thu, 21 Nov 2024 09:38:47 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=z6.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tE2i7-00000002FgF-11eP; Thu, 21 Nov 2024 09:38:47 +0100
Received: from glaubitz by z6.fritz.box with local (Exim 4.96)
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id 1tE2i6-00FJ8T-2m;
	Thu, 21 Nov 2024 09:38:46 +0100
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: mpe@ellerman.id.au
Cc: arnd@arndb.de,
	geert@linux-m68k.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
Date: Thu, 21 Nov 2024 09:38:46 +0100
Message-Id: <20241121083846.3648473-1-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
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
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.78
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Michael,

> The Linux CHRP code only supports a handful of machines, all 32-bit, eg.
> IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possibly
> some from Motorola? No Apple machines should be affected.

I have a Pegasos 2 and I planned on keeping it.

Have you asked among the Amiga community whether they plan on discarding
your hardware? I think it's always ill-fated to ask for popularity of
hardware on just the LKML. Most users are not on the LKML.

Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

