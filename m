Return-Path: <linuxppc-dev+bounces-17117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGO5IprOnWn4SAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 17:15:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824B6189A42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 17:15:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL2r66QfRz3cWv;
	Wed, 25 Feb 2026 03:15:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771949718;
	cv=none; b=P62dSiki/AXq+/rLj/8Ddx7Q4nibrI3oNGQArNMbn6sFNXlIev2wl1z72vIKpGS9qy1IYgOOtty+QeDuzbovtKAzL07n+gAfZ+ePSSuLrglt5+WlMIAL5zjrRF5pFCk2IaveaMC3wUgHau0ZV0H44ur9QwMKbTE9MVQs44KD6Wb6iVuKw7NZJISYpgRB9sPXCN+JUiYvjnzLzDLj5mmVTe+2Jw4hROCjS53MStOKdoL/7ih+Ecr989OmEB+ofx3BGKjCEZkk6VhVDl+JcK5hcyAhc27xNgcs+0XmRIOATpHYch1uUoW7Bh6hWNRzseV4G+ddVQtU43y/15/sNjpi3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771949718; c=relaxed/relaxed;
	bh=TcCab+Oc090dbZQOacet5ipuIYY0TItZpINJDVPLWus=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k45OonA73K5/zAUsXo7alB0ZcitYDk5KlzHT3xXFHEpwyaBnX8je28rMcozuIIIKXDvua12wEvA0OP8zkYTWVEB5cjnExGgqyx9TPTywNFhAh9XFY6aXZQectv95sDTO7xgKFWZQxlGxvxTHC1aZ/fKNqb9nd42Lhdwb69zKdjfu0oRJzb/sFIVINzBNKuIcM1Sveu4R3kHL5k8eAsTs4k2eDnOvf/KG78MRqrLj/7QXOvJi7al1dTXKi72XgbvqmjB2UHNIeo0N54PH5Qlk7TAjXr9O30H0B6WzqFkL7CdfaLszcahNjAJgbUbxBSSaXgwVh9fiqqXleUh9U4DThQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QybVP9Fr; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QybVP9Fr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL2r54qfQz3cVK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:15:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA20143E94;
	Tue, 24 Feb 2026 16:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491CAC2BC87;
	Tue, 24 Feb 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771949715;
	bh=M70nIzVXO7Ck6scYDO0aC8TqvdXXZp+11UABd836Tm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QybVP9Fr9wGUOohN9vTBDwIk2Klj4+KVM95gSiWFFs3cFGQc1hbhjJ9MlNM9prWEt
	 T9bND1DMWFcAERhEN/v6hMzvE+bHM+3UZ712hgccGLupO7jVQZlkiXM7wg77BahXHJ
	 0uFdJVZe0B0zOkFAzP+38/o1UjQFCyQrYBTw3G56qqE7RS9018HQC1KZhAW4aUXN8O
	 1wZqEbWdfwOLyxYg+8eS7EexOpj6WLOu9cq38cZqbkLDjhBc4iS1x0fw9ntLARQJsr
	 IKthMAsbsqYJdsNpdOg06XvaVfbGwPZHs9lR6WH1RUYGIecJ3u3ng4dwFFf0Ip5ZGa
	 T7bxBhqBmAPaw==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/6] fsl-mc: Move over to device MSI infrastructure
In-Reply-To: <20260224100936.3752303-1-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
Date: Tue, 24 Feb 2026 17:15:12 +0100
Message-ID: <87wm02t8xb.ffs@tglx>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.79 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17117-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:ioana.ciornei@nxp.com,m:chleroy@kernel.org,m:sascha.bischoff@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 824B6189A42
X-Rspamd-Action: no action

On Tue, Feb 24 2026 at 10:09, Marc Zyngier wrote:

> This is the second drop of this cleanup series for the fsl-mc MSI
> infrastructure, initially posted at [1].
>
> * From v1 [1]:
>
>   - Drop the now unused DOMAIN_BUS_FSL_MC_MSI bus token
>
>   - Tidy-up fsl_mc_write_msi_msg() while removing the legacy helper
>
>   - Fix include ordering in irq-gic-its-msi-parent.c
>
>   - Various commit message cleanups
>
>   - Collected tags from Ioana and Sascha, with thanks
>
>   - Rebased on top of v7.0.rc1
>
> [1] https://lore.kernel.org/r/20260218135203.2267907-1-maz@kernel.org

Acked-by: Thomas Gleixner <tglx@kernel.org>

in case this goes through the FSL SoC tree. If not, please let me know
and I pick it up.

Thanks,

        tglx

