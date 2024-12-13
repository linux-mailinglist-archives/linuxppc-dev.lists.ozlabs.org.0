Return-Path: <linuxppc-dev+bounces-4072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62D9F024E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 02:36:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8X415KWNz30Sy;
	Fri, 13 Dec 2024 12:36:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734053777;
	cv=none; b=BjX3PHBCajUvravNeaR74+AzDSDLiqg6kVtEu5YzwH3DcQEFkrjd/dhUXGuiBH/iO1O/aayfLBZE5rU1kuZl+iiEK8+zG60c7PVsA+R066GahPo08R2ga285mkzBsEfJjUwDT3kkCdZwd8k+S7KOZdDP9JLuEFLRLpkMpAD+sOke6hewQh8F09at72GGjLepZ5rKjPx3DVWluqS90hIxG2LuA6HIp1i5mBBcQvcMMJr1U6n19jBJ0IRP/3Xbr2U/3ogh/9LO7HdWn6aPpD2N/rzro1RCbeByO5NNJenhEedsVMJwFIdJ5Nend9aSsZSvE45wltogCxN//To0+HGQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734053777; c=relaxed/relaxed;
	bh=XmLMT9HyJdtqZoszt9l3H7/SZ22CYQFZhILA0LbfIRc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Yhie0tAHHTQWDC2MlRFCSohEN7gnp1UmGCyGtGU6FjS0XMe0qdeynnLzJxBQkdeaohUMiNJUCEePMjQKeUDkttGDCX7lTFHd8Fx44WOMxf3fsdaaG/BlXlQTyGHUv0AooIxj2Lc2BAWbJq51Ua+6ZBd6nC/OO1bcpB0NaeQxlAQ08MFi9QT266026f+BeLKO4pj3zYwqpiMGFt/yvuP7H8T/V1nk6YCzugL3dji4svVcn2a9ByfPQxVNdiQ51bX2fp8bAaG088wxYSXO8+nZqJB4Qxd2BhIWuzadUKsZJnr9cQpWNN738lTw56WZYENtSpOOkVvBj2uv8rv1J1P96Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pU24h8Qm; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pU24h8Qm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8X4003bYz2yXm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 12:36:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5A045C6682;
	Fri, 13 Dec 2024 01:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07DAC4CECE;
	Fri, 13 Dec 2024 01:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1734053771;
	bh=7f/5fqryMUGvRImZN3hfJmmlKUrLgbHGWnv+giipYko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pU24h8Qmf2l3dWmBoawfB733EGF8ZWmMJjrPI6B43pMJbMG4ZTBpTRzP1HUP8GzP4
	 1boZnf+GhhYVxYCiYxKJ0ZLRya4Nw9Vpsn1tw6iHWN3gws31ENEkqbfbQgsb2j17Bw
	 tbFaFZWjLH1q1pTGS9LCKFYhq+6kLBeOOeefROU4=
Date: Thu, 12 Dec 2024 17:36:09 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Kalesh Singh
 <kaleshsingh@google.com>, vbabka@suse.cz, yang@os.amperecomputing.com,
 riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com,
 linux@armlinux.org.uk, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
 andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
 leitao@debian.org, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org, kernel-team@android.com,
 android-mm@google.com, Jann Horn <jannh@google.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-Id: <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
In-Reply-To: <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
	<hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
	<1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 12 Dec 2024 22:51:34 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> You've fundamentally violated kernel process and etiquette. I'd be more
> forgiving, but this is at v2 and you've not cc'd KEY people. Twice. This is
> totally unacceptable. See [0] if you are unsure of how to do so.

This feels excessive to me.  linux-mm averages a mere 140 mesages/day
and it seems reasonable to assume that key people are spending their 5
minutes to scroll through the email subjects.

