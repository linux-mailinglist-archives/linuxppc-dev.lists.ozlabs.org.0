Return-Path: <linuxppc-dev+bounces-16884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFHuI7H/kmlr0wEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 12:29:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C405F142FC8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 12:29:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF0tQ3l6nz2ySS;
	Mon, 16 Feb 2026 22:29:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771241390;
	cv=none; b=hCLeheTsAWK6tJm3gdxo7zvn9GE/UtKSUbIL8CmuBx3f35Dn3wVt9I1u0Of+9xr+m5IQoWfum9PRv5PWuKh4NPabf5ZBVJs+59SUuXhJaacwt1cHcSFlEl+8QLFK/TKY24LOyVK8hJhKo8rMeCmeoh9tIwOvmDaSTWo/3ynWgxI0ESEziJ6aq60rrXi/9LtSpiRZCpUDsvq6T3sJzPnMtWpIdpUcsCJlwImhDkvLIJc9LNP+77NKF99Wni28CDk/WnrsxPcaqCc34RJ60vngTUHKuQ/OiAktngxOmOfk8zSbZVWuB9gxxTsXYD9TaAzqNexOmygFKit4F5unAlgbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771241390; c=relaxed/relaxed;
	bh=jLx0WCaLMjp3lvLh/r5JfmxhvnvExNdesRviJp6D4ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FARcxQDcv+VDgj/VHtOyU60QN9N693N9DV8tPL44/Ajdsk1ndLgNCmRr2D88/atTTVx71D1NGlRGfBA9DpRLKBn+0KtScXD2U5wNiCgF7gRiUU3EQ/10a5fE1rJZ0/Vp1Iormeb7kboafSbnKykF5ECdJfkrpbO6SzsU2oegI2rLIgYXsX1uF6OrxR4yWp0Q6YN/Az/vVI6c18IFIUz80s45x1IXDAFJ6B+9eXCJDAJJjARLAklcydFOdjenDcSszryxIpHa50qEcmSmq9Bk0Q/LMGQ+I8Pu4z0tsfF6jeEaeIJNDWIW2DjDWMjLRrXhsrpUwpvHhhenBBdXZMDO1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=t21M0Ig2; dkim-atps=neutral; spf=pass (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=t21M0Ig2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 340 seconds by postgrey-1.37 at boromir; Mon, 16 Feb 2026 22:29:47 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF0tM6PrLz2xVT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 22:29:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1771241384; x=1771846184; i=j.neuschaefer@gmx.net;
	bh=jLx0WCaLMjp3lvLh/r5JfmxhvnvExNdesRviJp6D4ms=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=t21M0Ig2AlSkZIc5NJrPIUBvbBTWKdD1Ljn1tx5Pb5HorQa0gaBAfQp/MADxMt1x
	 o09yUiDC5VXHqhDXn8kEWslf7z5DkRQWdb4yJvIMcr2K6y0VNCNoM2yvikSwNyXlu
	 FCpV9x0GjzxY7ogWxAVE8OXm6fh1AU3L21xLclMAjLxMzGDjA0OVpXCWgWSQP63kC
	 bOFXfCviwgO28I9+I+6Cw0268quioED1Cw01j6mMMVp7kaL4krkqFZSoyQ9ninATS
	 6jhyaQYAIUuj1zzIx5UYzOExfv9fhIhdJ7DnylLedBf0Q0uXLeUV6WmRO0ftZbAIJ
	 uVz92KW0hrD5RvMX7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([213.196.210.86]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxlzI-1vYSXe1pXS-00tkKW; Mon, 16
 Feb 2026 12:23:20 +0100
Date: Mon, 16 Feb 2026 12:23:16 +0100
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Rust version requirement (was: [PATCH V2 3/3] powerpc: Enable Rust
 for ppc64le)
Message-ID: <aZL-JO3950gc9YO_@probook>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna>
 <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
X-Provags-ID: V03:K1:TZEGS3yIRnzGTsQgtyXI//4X3xREH7A7RhFb+PTTLu+uFjBmyja
 cupRUBg5GUrisD0dve5yzDO+sy0lDqiz62j0TLYG3XNc2XdfqO+CxdeanK4zP5SFIat571A
 wCc7WEtUVDZ/h+/fL/rgFPEXuNfqUILjPZbSns3jswERweP995VxekB/KO6MMHAHVCBBdRk
 2vxk14Zxg0vaq9DWMUxcg==
UI-OutboundReport: notjunk:1;M01:P0:EvRggLFQbuU=;+qERIw4n5P2dhCOeZKJEWnpDpPH
 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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_FROM(0.00)[gmx.net];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:venkat88@linux.ibm.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[j.neuschaefer@gmx.net,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16884-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j.neuschaefer@gmx.net,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DKIM_TRACE(0.00)[gmx.net:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C405F142FC8
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 09:12:01PM +0530, Mukesh Kumar Chaurasiya wrote:
[...]
> use rust version nightly-2026-01-28
>=20
> the latest one has some issue. I just raised a bug for the rustc
> here[1].
>=20
> [1] https://github.com/rust-lang/rust/issues/152177

Another reason to use a nightly version is that Rust inline assembly for
PowerPC will only be stabilized[1] in version 1.94, so current release
versions fail like this (tested with 1.91.1):

    error[E0658]: inline assembly is not stable yet on this architecture
      --> ../rust/kernel/sync/barrier.rs:19:14
       |
    19 |     unsafe { core::arch::asm!("") };
       |              ^^^^^^^^^^^^^^^^^^^^
       |
       =3D note: see issue #93335 <https://github.com/rust-lang/rust/issue=
s/93335> for more information
       =3D help: add `#![feature(asm_experimental_arch)]` to the crate att=
ributes to enable
       =3D note: this compiler was built on 2025-11-07; consider upgrading=
 it if it is out of date

This is somewhat at odds with Documentation/process/changes.rst which
only requires Rust 1.78. I wonder if the rust version requirement should
generally be bumped, or if there should be arch-specific requirements
somewhere in changes.rst or rust/arch-support.rst.

Best regards,
J. Neusch=C3=A4fer

[1]: https://github.com/rust-lang/rust/pull/147996

