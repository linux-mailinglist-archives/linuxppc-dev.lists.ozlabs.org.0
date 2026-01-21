Return-Path: <linuxppc-dev+bounces-16113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGlzHj87cWnKfQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 21:46:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 831915D8AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 21:46:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxGT65K8qz2xrC;
	Thu, 22 Jan 2026 07:46:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769028410;
	cv=none; b=AHooRzkxQFVz8fUA6xpFlohACZok6ZakJhj7ga/P+uBh75E8PiRO9404JYKfMONejQULRWwGxExfquQwq4+fX7mdC6BEMB7nD4kJ4DPACAEwRJjexWjhs8XWUtVYYR6jUeg+FUjTZBlP+WGMxECG3bVGY/9TApd6KHvn7A0ys3IGjKMUIAPJivvlxGf805meUJwecZR6tNS+PJbs9yZ28tBACuAGdZPDW7ktNoRVJHuEQ21gNAiZu7vC6wythgklHs3sVn1njtV0nPVCxQ+xxUUOqyYSiuj1ruqG7ZPAlAJpahWl/e3LveXtJqJ23E9el+euqq23R/2bha86qDGZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769028410; c=relaxed/relaxed;
	bh=9YQ0iB6tHGlmx4FNm0cMTJYg5esIL/mk4dDFvpnMobM=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=DLWAdaQCtcXTv0XW5qltkFI5eDAdot6Qd4Qupd4SV7jv9JLBPOZJcLRXnhEvz1vsJdARcN2iWy2KCDrHDpYK1JhhLSXxiu/BytsPbcArEx+m4E7EuBM3UGhmuSsFwRnosTQZ/hgYoTXrjD6YRY3KcedNJl9Nbk5/iqSRVvu//0tU9HqogB+TreilFfHZcu8yFvu05EujG0oaaAhUbXihOarYscsOtVma4nySybArIeGv1CVe6p3vUHl6Zopi7F7EE8ER3M3oTC+0PHCCqriIAjTshXoiEg2DhVvkgMDbAOhtogFk9VO3kWkjO3o2Cp2KoFF/fLm+8y6v2LrWiTw1Pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=Yp5mx6as; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=Yp5mx6as;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 198 seconds by postgrey-1.37 at boromir; Thu, 22 Jan 2026 07:46:47 AEDT
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxGT33NzGz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 07:46:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:From:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9YQ0iB6tHGlmx4FNm0cMTJYg5esIL/mk4dDFvpnMobM=; t=1769028407; x=1769633207; 
	b=Yp5mx6asXan3PwyNofvA6ET3h1SubDJCv8W+KiIQQ0spoyKcE0Yx0V/S4rSLYd9AJTYsuA2pj38
	dv/qTfoHgVjl1sBOm55dHyK5VP7ppJnbKm/21i9nM1kMfD8jX2nZIG0PsjI1GmLNeUa9NdFuxob6r
	bHbw7R5Eq9lOCmWiHDh0KHMiLsBqH5xCnWHQFXha+qFCipUQBaUGOQJOVW4e9ff223J0G7hcc/GAp
	nanytDedvKZHvicC1ZKN01OQQFxw5GFQPk/IUHZ8f7s+ovOelQrMzGlqIFIhy/gUHJsbHqzVUuxcR
	KMWyKSYMG55ZYa/HksvNYLYEyZm8D1cZWOGg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vif2w-00000001o2E-0c21; Wed, 21 Jan 2026 21:43:22 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vif2v-00000000srx-3q9b; Wed, 21 Jan 2026 21:43:22 +0100
Message-ID: <a8c239b497a3986fa20556b5aa54b8e2c8d56b17.camel@physik.fu-berlin.de>
Subject: Github tracker for PowerPC issues
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-powerpc <debian-powerpc@lists.debian.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	gentoo-powerpc@lists.gentoo.org
Date: Wed, 21 Jan 2026 21:43:21 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
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
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.95.41
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16113-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:debian-powerpc@lists.debian.org,m:linuxppc-dev@lists.ozlabs.org,m:gentoo-powerpc@lists.gentoo.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[glaubitz@physik.fu-berlin.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fu-berlin.de:dkim,physik.fu-berlin.de:mid]
X-Rspamd-Queue-Id: 831915D8AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I just noticed that similar to the issue tracker I created for SPARC [1], t=
here is an
issue tracker for PowerPC [2].

The idea is to track any issues specific to a certain architecture in a cen=
tral, prominent
location so these become visible to any distribution maintainer and PowerPC=
 upstream developer.

Thus, if you spot a bug affecting PowerPC, please report it in [2].

Thanks,
Adrian

> [1] https://github.com/sparclinux/issues/issues
> [2] https://github.com/linuxppc/issues/issues

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

