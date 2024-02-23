Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8A861F4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 22:58:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H+lI+Rj8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThP615z66z3vZ5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 08:58:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H+lI+Rj8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ba; helo=out-186.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 356 seconds by postgrey-1.37 at boromir; Sat, 24 Feb 2024 08:57:53 AEDT
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [IPv6:2001:41d0:203:375::ba])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThP5F5pblz3dTm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 08:57:53 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708725085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUtHteZepb4z50jTNHYGGTGy3lyvRj0SCUA4OkqA8eU=;
	b=H+lI+Rj8l5nTGp5sBTzGuzdI5khJ9NsvrJ3HNWZCOgT40yuj3u48TDv3nLLpO2T8PtfRp/
	YQZBCLCcnw3Pnx5Pqvq7c0TEDoBv1IPwSEDUGIz5MhmRHrQ1Yb9dgp9qA5DNgz/i/+QCeL
	QNq6wIZM3TtiE5phWqnapfnpWDCsG9g=
From: Oliver Upton <oliver.upton@linux.dev>
To: Oliver Upton <oliver.upton@linux.dev>,
	kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: Get rid of return value from kvm_arch_create_vm_debugfs()
Date: Fri, 23 Feb 2024 21:51:12 +0000
Message-ID: <170872506304.206263.3199862434632781431.b4-ty@linux.dev>
In-Reply-To: <20240216155941.2029458-1-oliver.upton@linux.dev>
References: <20240216155941.2029458-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Marc Zyngier <maz@kernel.org>, Sean Christopherson <seanjc@google.com>, Sebastian Ene <sebastianene@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Feb 2024 15:59:41 +0000, Oliver Upton wrote:
> The general expectation with debugfs is that any initialization failure
> is nonfatal. Nevertheless, kvm_arch_create_vm_debugfs() allows
> implementations to return an error and kvm_create_vm_debugfs() allows
> that to fail VM creation.
> 
> Change to a void return to discourage architectures from making debugfs
> failures fatal for the VM. Seems like everyone already had the right
> idea, as all implementations already return 0 unconditionally.
> 
> [...]

Applied to kvmarm/next, thanks!

[1/1] KVM: Get rid of return value from kvm_arch_create_vm_debugfs()
      https://git.kernel.org/kvmarm/kvmarm/c/284851ee5cae

--
Best,
Oliver
