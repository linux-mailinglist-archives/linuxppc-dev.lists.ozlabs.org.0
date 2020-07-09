Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C77C219766
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 06:32:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2NYr4ww2zDrpp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:32:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2N3S2vG7zF10f
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 14:09:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=iCc6UqOp; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4B2N3R3m99z9sRR; Thu,  9 Jul 2020 14:09:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1594267763; bh=x3yYAYWDQc/AdH5qio9yXXUu0zr/fL7TKBtMwdncb/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iCc6UqOpjAdIOX2JTPrizZlG7+t7aHyyI5SgduWOnArh6gkN/ti74h+PyG40pemmv
 gdNifGpSclbkJE3kf3Lu5m8/zyEfs6Vd1EO5TJrV94DD3UPMzEuBbezVcufHTvAbRy
 aUHB9XpOli1FDFOxjDPKHB4s0vr2W51vRHYpX4GITYl9QhTcgNM6prVSqp7tHHkPKP
 JzvfhQ+RD4mlx3P8YW0jqC5kE7wLn937/qthldPGhURUf/ZzuyaGbGFSIitV9kln2m
 DSjAYumx/SA6f38vH3qntEn988EhWL23FfJqigij+Bn7uASbQ9FKCdlBKiJl6CKUue
 h5Cd7+pE+jYeQ==
Date: Thu, 9 Jul 2020 14:09:18 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH 1/1] KVM/PPC: Fix typo on H_DISABLE_AND_GET hcall
Message-ID: <20200709040918.GA2822576@thinks.paulus.ozlabs.org>
References: <20200707004812.190765-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707004812.190765-1-leobras.c@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Namhyung Kim <namhyung@kernel.org>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Jiri Olsa <jolsa@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 06, 2020 at 09:48:12PM -0300, Leonardo Bras wrote:
> On PAPR+ the hcall() on 0x1B0 is called H_DISABLE_AND_GET, but got
> defined as H_DISABLE_AND_GETC instead.
> 
> This define was introduced with a typo in commit <b13a96cfb055>
> ("[PATCH] powerpc: Extends HCALL interface for InfiniBand usage"), and was
> later used without having the typo noticed.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>

Since this hypercall is not implemented in KVM nor used by KVM guests,
I'll leave this one for Michael to pick up.

Paul.
