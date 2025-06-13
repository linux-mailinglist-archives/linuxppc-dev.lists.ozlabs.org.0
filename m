Return-Path: <linuxppc-dev+bounces-9364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F826AD96DB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 23:04:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJsNF2pqVz2ynh;
	Sat, 14 Jun 2025 07:04:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749848685;
	cv=none; b=OKIQFPgpz6Ic2DEA8kMj85hMddA+htDWj3xah0Yz5I3IenZujNwG86L8UYcTUX4CUNjJijtQIocyhaNwHanT3egr3lpdPLgDYmd5uztftLAUer+AlgYBJPQLCGR6S3bbc5x7TnJRbT14IDgSSBiSOjZcGvjqsyKrju7+cAhrFoviKn9RSGiM1X7XS1ttrX1EwXoMWAmgLfm2l7+Y1B2OCiLyWgphnas/j9SiwKesO4QmxKQD2ey9retYRu+ABoxn+XNRgW6ODPoe5rSX1UhavzjdxZZX8ryKL1r5+phFB3tax8x9rmEbL8tv5jYZRrGgSAOBGmMgfiAUaZvX6ofTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749848685; c=relaxed/relaxed;
	bh=UYPjxyG6Lkdruehl3Wfp/fvOgutsisDdZvGlZZakKgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QA8Vrpm6o5xlilUzNYGCrsQyT/qE9s0knWUnkBe2itS7RoOrj3IZfqorzcqu1TUMyq6OS80pDAlRgcg5RS3LNWQgNr2thGIwj1l4k80z1UnE7X1t9ug4xVE1DDbauRD6a3jhiPuAaTDdmZSotVym1wnJ4AHFQ0mIdY3uTXp4FemCclN+Mzn0mAI3bpjp9N1j7FNiqrEMVtSFIr1jm+8dgbKRSPqaXxyNGqtnyCIMuy6JCHDZWbVfaP11Fu3DTFPYBf8BgMQHKE4M7y5KPirwIAN9b3PjuLZB1emfzDpNRjBV7qgRaxpL26GuolSLdgDLf4XKkWu0B2M/l4wvLUvR9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Kc8nPVhl; dkim-atps=neutral; spf=pass (client-ip=95.215.58.170; helo=out-170.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Kc8nPVhl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.170; helo=out-170.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 73 seconds by postgrey-1.37 at boromir; Sat, 14 Jun 2025 07:04:41 AEST
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJsN95bCYz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 07:04:41 +1000 (AEST)
Date: Fri, 13 Jun 2025 14:02:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749848582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UYPjxyG6Lkdruehl3Wfp/fvOgutsisDdZvGlZZakKgQ=;
	b=Kc8nPVhlXgf6TePD1ArgM60c5dmNUT/R1JjVbnGxN7TexwkvkpcVz2WLId55A9oZ/CDUE5
	FbP2i2FSaWw7NAS2SkcnbcgK6HWEZ0xCShW/gxdnuC/LY4NPQptRcXYiWmJk0yYg54tCZA
	FkggVzxEL64vxvaUGTfILfyirGgdhDI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Anish Ghulati <aghulati@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/8] KVM: Remove include/kvm, standardize includes
Message-ID: <aEyR_bixN696F1sP@linux.dev>
References: <20250611001042.170501-1-seanjc@google.com>
 <125bfa5b-4727-4998-a0da-fb50feec6df6@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <125bfa5b-4727-4998-a0da-fb50feec6df6@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 12, 2025 at 06:56:53AM +0200, Paolo Bonzini wrote:
> On 6/11/25 02:10, Sean Christopherson wrote:
> > Kill off include/kvm (through file moves/renames), and standardize the set of
> > KVM includes across all architectures.
> > 
> > This conflicts with Colton's partioned PMU series[1], but this should work as
> > a nice prepatory cleanup for the partitioned PMU work (and hopefully can land
> > sooner).
> > 
> > Note, these patches were originally posted as part of a much larger and more
> > agressive RFC[1].  We've effectively abandoned upstreaming the multi-KVM idea,
> > but I'm trying to (slowly) upstream the bits and pieces that I think/hope are
> > generally beneficial.
> > 
> > [1] https://lore.kernel.org/all/20250602192702.2125115-1-coltonlewis@google.com
> > [2] https://lore.kernel.org/all/20230916003118.2540661-1-seanjc@google.com
> 
> Marc, Oliver, I'd like to commit this to kvm/next sometime soon; I'll wait
> for your ack since most of the meat here is in arch/arm64.

Let it rip, just to get ahead of potential conflicts can you push out a
topic branch?

Acked-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

