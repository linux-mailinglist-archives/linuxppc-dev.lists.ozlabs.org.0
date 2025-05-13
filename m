Return-Path: <linuxppc-dev+bounces-8541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A85AB56C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 16:11:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zxdg93XVqz2yb9;
	Wed, 14 May 2025 00:11:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747145461;
	cv=none; b=Aq9z+4cgfA8RlYfXZp0tQoTGAqFj4tslV02Q3p1bS4k6BpyvPxim+YgYkNl19oaNB9e34DGx4P4Yb89eQ9auAAjBiEe9MmBh9ETfRmn+0hi4K9s4uj0kcgqLIeqqTY8+Y95WAd/nciEjiyZb8oIZ7Y0y1OBsDPpflvD+lhWfySXsMoJdhvE2L0aQhvWws8ihgL7KYyfviN+CWj7ZoDvU2mo70lC8kvgLpCyTWASPkBy4Dgahyz9qMF9nn7IvNSJr+IvULc4LX3XulnkS/qY1m6l/opXtk0xgiDalEBBiNHrAJSW5tVmRcnJ1T2fA4W79BUb9azQqxhVY6ih5xn22mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747145461; c=relaxed/relaxed;
	bh=WJxlQK2BLgRievfiJv78ygfw01x+UGw/l/TDAlxIbio=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VpQKLGY4xh1CNf3BfaxxKpvdLZs0OQTkCoxhaCkIWWQ6yeRxKE2/WlmrY81zBSU2W2tiiCQjZwy//+YdnYfoR5CwIyK2a/NVjjWRnaVLpQUIqd8XPvXlFWx0+aPBpP8GXp/06vCJrFeqkKscRhtI609lpkmNfFP8Az07SOIYY5BmvrmmfMQFNt+gYwTufr0t5Nsls+kar0eMS6Zi2i8S9hjmYWj6xRZ9+zZrMKNXxmnmf8tuyim45YtsGhmoIUNEzNlkM5kShtNdjcX7J4b1XDdtGp/8CoPfyUxTVsRbJ9TufRMwCaPft0YmLBLwu/II4kxI3RXYJAW4faNIlJUjPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bRByksJT; dkim-atps=neutral; spf=pass (client-ip=91.218.175.177; helo=out-177.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bRByksJT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.177; helo=out-177.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zxdg65dr1z2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 00:10:58 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747145434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WJxlQK2BLgRievfiJv78ygfw01x+UGw/l/TDAlxIbio=;
	b=bRByksJTllYyII1FKBTMUY/MK+KgwgVbDRWKIpowlDva0i7U+YGZ21lCB2I1cVjASFQjjI
	3BoASqJrxPBPHCXDYEdFA6GlaVCQjlKbTrKg5eLMhs0KCeqBNRJaHGltS/1Ojx3kv08Fo8
	to7EiawZtqOGCmYCgU07/RhdBHuWFRw=
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
Date: Tue, 13 May 2025 16:10:21 +0200
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <504A9138-865E-4CB3-8E1C-E19C4B86F1D3@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
 <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
 <87v7weodqn.fsf@mpe.ellerman.id.au>
 <d9e232bb-5069-4526-b781-f4e316bda95d@csgroup.eu>
 <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 7. Jan 2025, at 13:16, Thorsten Blum wrote:
> On 23. Nov 2024, at 11:19, Christophe Leroy wrote:
>> Isn't our file just a copy of the one from binutils ? Shouldn't we =
adjust it based on commit =
https://github.com/bminor/binutils-gdb/commit/2ce18a16268a ?
>=20
> It looks like it's a copy and the name is spelled the same as in my =
patch:
>=20
>  "Mimi Phuong-Thao Vo"
>=20
> What's missing to get this merged?

Does it make sense to resubmit this or do we leave the name and the
FIXME as is?

Thanks,
Thorsten


