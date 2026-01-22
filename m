Return-Path: <linuxppc-dev+bounces-16117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNlnChTKcWlGMQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 07:56:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9790F625B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 07:56:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxX0G1kFzz2ySb;
	Thu, 22 Jan 2026 17:56:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769064974;
	cv=none; b=INfJuWDya5bbaVgopO0ohCBzqLdNu6Jxw13sp18aGzqn5SH4mtRqVrdgH8xEddF4rLdKoVi8oyqH8XI7eObMr/whZxnYwAUpR+ARDpB0bS8KGZyKwpysqg81/bj76GwaZsWxuLaR5HWxE9MKPBTUK846f0mq1Y59fv8y/S3J8YJv+N2enkBa7GjpgxFOBDl/oaH+/ycSk8esaDHv/5x8nzb050XrDPIynG7lHL/QdzV+viTG7CiPsGzflTrb+VI7nxMNByd2hytxOXkxG7VbJlp1iau3nuenKra+Y94tV4vwcjb2lZF2ttvbl2KkUo72eOZiYhbUXcjBM37wXo/FDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769064974; c=relaxed/relaxed;
	bh=yFnrCLE2ih62P8Iy8pZgaaa7eRrY0HpVTFLc/gWIgjw=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=GFMOYVr8joDRGRSADDCQ/Hs0GFu+LHyZNSxmoP0LwCvqWqrNn7ctONjXwNWw6qhvqvnCcf0rDJNbJnuiOkalj2XAe47aSpC257yL3BzBHImlqURq4CWjZRS2G0aKnM2tqTSHxiaxMl3jj1zALEBbSuZPHupY/Elm8N6SseKih2fHsKkOv+Zps/kA1PY1Dh+/R5lWLjsB9Qrw4eVGNM51K6Aq4W4leEGwPkAi2G0xHpn9K+GXHj7B3duqlsCuImqT5nO0Bm+vdPTatrlC4nvPGz/4h72iMdY4RDeCHTAe3Y5uxDo28C4iw6qMb4uqSa1hNhsnWyOGv+nXSVOaeSeJXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=fwqRthQA; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=fwqRthQA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxX0D4qP7z2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 17:56:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=To:In-Reply-To:Cc:References:Message-Id:Date:
	Subject:Mime-Version:From:Content-Transfer-Encoding:Content-Type:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=yFnrCLE2ih62P8Iy8pZgaaa7eRrY0HpVTFLc/gWIgjw=; t=1769064972;
	x=1769669772; b=fwqRthQAgmDIjV8JdxeHtX/4qlLLI52yEc7UgQWYlfJi/i0tqS5EkvtCICvOL
	zLUa+DNxJkVlEuVeO37Nku8XixGi/Jfwc9hmEq3lOeQIhQTr4C9B3rUQOmJRxyebR+Guu1A8xnR0B
	Ub+zJga99cELH1Rx3Ry9ScCvIeAOnLuZhLDinsg/TtzBe8Aarn7nd5Zss9kxacELpJ3vZuPPJm93k
	soQ+xAwATgd3rWtGT69I6diS7GLkELUsjQe7EjsNB5+l4nSkC2eV1PRrsizOwQ4nPdZd8DCms0EDR
	1nT3Aa0jUCubIw1prY2fkK5rCCzPxYlEkpWcJDWaQzqp5InsIw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1viobv-00000003I6R-2uXj; Thu, 22 Jan 2026 07:56:07 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=smtpclient.apple)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1viobv-0000000280W-213d; Thu, 22 Jan 2026 07:56:07 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
Mime-Version: 1.0 (1.0)
Subject: Re: Github tracker for PowerPC issues
Date: Thu, 22 Jan 2026 07:55:56 +0100
Message-Id: <1534D914-DAFF-4008-87ED-E887BA0DC070@physik.fu-berlin.de>
References: <f80cd9f9b91966862ece4bb270460198@linux.ibm.com>
Cc: debian-powerpc <debian-powerpc@lists.debian.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 gentoo-powerpc@lists.gentoo.org
In-Reply-To: <f80cd9f9b91966862ece4bb270460198@linux.ibm.com>
To: Trupti <trupti@linux.ibm.com>
X-Mailer: iPhone Mail (23C55)
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.95.41
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16117-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:debian-powerpc@lists.debian.org,m:linuxppc-dev@lists.ozlabs.org,m:gentoo-powerpc@lists.gentoo.org,m:trupti@linux.ibm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[glaubitz@physik.fu-berlin.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9790F625B9
X-Rspamd-Action: no action



> On Jan 22, 2026, at 7:47=E2=80=AFAM, Trupti <trupti@linux.ibm.com> wrote:
>=20
> Thanks for sharing this information. However, the issues at https://github=
.com/linuxppc/issues/issues are mostly related to the core Linux kernel and t=
oolchain.
>=20
> For Debian-specific work, we need a separate issue tracker: https://github=
.com/linuxppc/Debian/issues, where Debian-related issues can be reported.

But I=E2=80=99m not talking about Debian-specific issues. Tracking Debian-sp=
ecific issues happens in Debian.

When I report an issue in the GHC Haskell compiler on PowerPC, it belongs in=
 the existing tracker. Doesn=E2=80=99t it?

Adrian=


