Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E258A0221
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 23:31:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=JFp1xYoQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFGGc2y85z3vZw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 07:31:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=JFp1xYoQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFGFt6qcVz3dRp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 07:30:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5362861D60;
	Wed, 10 Apr 2024 21:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D19C433F1;
	Wed, 10 Apr 2024 21:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1712784622;
	bh=14ZzdB+5ZJ89hfQO2P/iVaITshCuwOTD8j6Uc+CSv9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JFp1xYoQBbQ39g+uTbt4JLn3SBzgRbjqJ31eyFQf9/KYKQPg93LaIEw4AqO9qBCBd
	 IaZLQJEvG3vUqIKZSLW207ouLZUCv3OzXKGTpgCVOAXkPkkakvzfiiajTuIeyu76gy
	 L/McdS+iJHvTrIxiRy4HiJClm2JWS4c9rS0J95ME=
Date: Wed, 10 Apr 2024 14:30:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/4] KVM, mm: remove the .change_pte() MMU notifier and
 set_pte_at_notify()
Message-Id: <20240410143020.420cafd47bf8af257b2e647a@linux-foundation.org>
In-Reply-To: <20240405115815.3226315-1-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kvm-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, loongarch@lists.linux.dev, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, kvmarm@lists.linux.dev, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri,  5 Apr 2024 07:58:11 -0400 Paolo Bonzini <pbonzini@redhat.com> wrote:

> Please review!  Also feel free to take the KVM patches through the mm
> tree, as I don't expect any conflicts.

It's mainly a KVM thing and the MM changes are small and simple.
I'd say that the KVM tree would be a better home?
