Return-Path: <linuxppc-dev+bounces-3457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F49D4908
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2024 09:41:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvBY21cFSz2yjb;
	Thu, 21 Nov 2024 19:41:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732178502;
	cv=none; b=lyR06CmBOXO/GGhfLw7KuQnRYcgWxEkKeGb1TWUxwRmFhY/0ThuwVu7A3qlmI/PoKhqPz7ahoqYBwxCoLk1MRy2NzfdmVxpfxBy1MTqKiRDqnyMopPAl1w9GNOfUtbOxfEi5Gdi1ZaqBaHb2LthwjpHhx75TmFN6k8tZvTPGB2kBFz/CcFQ+SQ5J+nEX39Kc6EuAizq8+tVzzKS7IE3VjYsxUrQsS9+9guzCKOBZgnwoAPeAA33G38XoFSH2lSb3L0MeFuMvFqucJwgOaan7IvnoYdB293T5Y/JATOWmKSAGPLbR7DjKH8TQZr3AO82MumvPOxI6u+TeRf5pQGhJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732178502; c=relaxed/relaxed;
	bh=16L1uVsMKT2JSxXl9EOWpH3BTvZFEO5ntf79G2Mx4hw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EirEFii9Rjc28MvfZ5S92IjEVUv473bZHvQtsAKKlHwP+cM0NJvAUA/nZ8CbaqzMHQzQwsrSVIwlFdaeSwteOKMV1UQiH46bHxhrcGyhpkgWmW6R5QKznIpLW6gPWeKrjDUZGeQiPAnAahNktN7uoKId6s5nGzUek1Fdi5Lw1JAdQFUcaaxv/+uIiPIntQor3WXB7/tHAEAb/tm+3+oJQ6mRp7E9yvgAkvIvEMCc43JILPUIjwQhUlD40xWiRsmFVR7f81c6pNryIlxZ02pi4F6PDqEcseHdcaDzKw8qiAnQJW//HYW9mjLd00Q6w2V2/2PjQ09lv2jRKYjc6zWSkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=m6+RsJ3E; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=m6+RsJ3E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvBY10zSvz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 19:41:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=16L1uVsMKT2JSxXl9EOWpH3BTvZFEO5ntf79G2Mx4hw=; t=1732178501; x=1732783301; 
	b=m6+RsJ3Ev81bsoArElMvvqFPnyRcsmrAQm9JgObHwm96rBOybre1yphbbXPtk+vQ1+2PaFo2a9R
	Kq+P3p1ua80Y80r98YgAwRCbjeqPC2rhE7L/mLvwXvmt6uo34Ow+JYt1jCguwIQWZVP9tTyTRsg5/
	LtngpTKXCGbNYjYxiZpVkUduNZWWTOd3FnMzVM+i6A1rCfWNTxrKbPGB7GCkFVlmpX8b7W5m14Ixl
	wCsAzMQX1fZdvGpAIJIb1BQZ935j8rrXuaKgiL7Il0k5EcXKEtb9uTREEG6eEbkdjmqj7WktesR7H
	J49oLP8Of7gPMgBPMsXa/ZUsKS9q7kWeiW+w==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tE2kr-00000002vkI-06LO; Thu, 21 Nov 2024 09:41:37 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=z6.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tE2kq-00000002G9n-3QFW; Thu, 21 Nov 2024 09:41:36 +0100
Received: from glaubitz by z6.fritz.box with local (Exim 4.96)
	(envelope-from <glaubitz@physik.fu-berlin.de>)
	id 1tE2kq-00FJAD-1Q;
	Thu, 21 Nov 2024 09:41:36 +0100
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: mpe@ellerman.id.au
Cc: arnd@arndb.de,
	geert@linux-m68k.org,
	gerhard_pircher@gmx.net,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
Date: Thu, 21 Nov 2024 09:41:36 +0100
Message-Id: <20241121084136.3648581-1-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <87bjydoz18.fsf@mpe.ellerman.id.au>
References: <87bjydoz18.fsf@mpe.ellerman.id.au>
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

>> Pegasos2 users still exist, but admittedly they mainly use MorphOS and
>> AmigaOS4 on these machines.
>
> The Linux CHRP support is still present in v6.12, which will be an LTS
> for the next 2 years at least, so if there's folks who occasionally boot
> Linux they will still be able to do that for a while.

Is there any urgency that warrants the removal? I could understand when ia64
support was removed because it put a burden on maintainers.

But CHRP support?

Adrian

--
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

