Return-Path: <linuxppc-dev+bounces-16555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M2aUM0QbgmmhPQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 16:59:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE230DB99B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 16:58:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f57Sx1BxYz30T8;
	Wed, 04 Feb 2026 02:58:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770134337;
	cv=none; b=c0X419G1RlFH6R2kP57I7Nr5y0c2G4Qx5zvDV0rKJnCMcOqZv3HJEuxi0KK3BbrCXQEbnC1c2JbkNcuShoo7zpwa6jY9+8nQNBZFO4meEvNnCNRP0PkW4s/xvhKIDzoTY6FZRFAt13tcba1fafiKqS2fEPAzVBR4fCyoGuUus0R/8c1QrWAjjZU1oD5nBchTLcyM04E8BgBzeqj3SCgWM+1JCoI/R45b+LaVU4e74Egmcs9w8aR++aFZhXfowr0QeLRuFxnAJEe53Diog7CmPgkU6UVeFi7cKAk5o6XNxEFTJCFoCUUWf9fOJ/fiTNKsYAeCw/VROMHKFP1sjupg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770134337; c=relaxed/relaxed;
	bh=iVuzePoxDYRu2v/nsnoXJ910VzMDXNIrkBMcyIHHHrw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R5N/hlx6zYsTwzGk1zyAz80x/xAvieohfebiMcnuQJJx/wvwNgXlLMVoDMgXSWQ3YlstYhLW8L+Z8K4a4r01crEo67aHSLy1FbUhV3heoGNIXFKpsJvaRzHnm5dHfyF7B/LSHXNWZ4BUShKmEmnomLJOwQlfqjQp/7BOO30PDWGHM15GwNZ68H7bdVS/Ikf7qphH/OVojmyYlSjWFv4rMgu9ggwAXnZEgaK2meZlunD/miv89C0iPQLOjQjFu+riYWRlhQTjmLh0zsLh8j3x4RxVvlDNbT/wgSNHp6+kNqCsi06rVi7gkwxix9aq2qQmJWRcrIbK9qrJxrNu+WzUoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qGnNI4dw; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qGnNI4dw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f57Sw1C4Sz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 02:58:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92F0E42BB7;
	Tue,  3 Feb 2026 15:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB2AC116D0;
	Tue,  3 Feb 2026 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770134333;
	bh=2t+iOBu1qL3o1+V+ofvma+8JenL4mCzkrRS352ATK1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qGnNI4dwlw3oIfavt1FfjJDvaOtTmqNc6VRkanxU1Lx58MzaEjB3TRyfoMwZiKN9w
	 90K8EPrS7cdl1t2M6KjLhic/Yodl1o/iF1LY584cwlGhJp4SQ/lVvA2oCGA5X0jJHX
	 9Y4oRofbcti6m7fL+c5rf97FWm0G//L0BHF01I1cqalfhpbkiR6da9v0BZ8Aa36+/F
	 hkmWHtGXRn2WEnGeUxMeGs8Uh1Sil3lC3CCZ0bwEBm2SxUxwlOKkkmxQKzSt662lCd
	 uWHeJdnv4YHxBrxMY0tn57HEgJiQykuuW8I7gV2a3aUsvGVNTXRzeDIUFHRPX8gqTI
	 Zwr22JbREkvWw==
From: Thomas Gleixner <tglx@kernel.org>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Tony Luck
 <tony.luck@intel.com>, Dave Hansen <dave.hansen@intel.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Dan Williams <dan.j.williams@intel.com>, Len
 Brown <len.brown@intel.com>
Cc: Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>,
 "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Ricardo Neri
 <ricardo.neri@intel.com>, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Alexander
 Graf <graf@amazon.com>
Subject: Re: [PATCH v7 00/24] x86: Implement an HPET-based hardlockup detector
In-Reply-To: <20230413035844.GA31620@ranerica-svr.sc.intel.com>
References: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
 <20230413035844.GA31620@ranerica-svr.sc.intel.com>
Date: Tue, 03 Feb 2026 16:58:49 +0100
Message-ID: <874inx4y4m.ffs@tglx>
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
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ricardo.neri-calderon@linux.intel.com,m:tony.luck@intel.com,m:dave.hansen@intel.com,m:rafael.j.wysocki@intel.com,m:reinette.chatre@intel.com,m:dan.j.williams@intel.com,m:len.brown@intel.com,m:ak@linux.intel.com,m:eranian@google.com,m:ravi.v.shankar@intel.com,m:ricardo.neri@intel.com,m:linuxppc-dev@lists.ozlabs.org,m:iommu@lists.linux-foundation.org,m:linux-kernel@vger.kernel.org,m:graf@amazon.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16555-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CE230DB99B
X-Rspamd-Action: no action

On Wed, Apr 12 2023 at 20:58, Ricardo Neri wrote:
> Hello, checking if there is any feedback on these patches that I plan to
> send to the x86 maintainer.

Seems this completely fell through the cracks. Alexander reinvented this
recently with all mistakes made before, which made me come back to this.

This needs to be respun against current mainline.

Most rejects for the x86 preparatory patches are trivial, just the AMD
IOMMU code has changed significantly. I haven't tried to apply the core
watchdog stuff at all.

I'll go through the x86/HPET side quickly and comment on what might need
to be still address.

Thanks,

        tglx

