Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C3222C890
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:56:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCsj94J9YzF1C6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:56:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgZ4LV7zDqBG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:24:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgV4J65z9sV1; Fri, 24 Jul 2020 23:24:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jiri Olsa <jolsa@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
In-Reply-To: <20200707004812.190765-1-leobras.c@gmail.com>
References: <20200707004812.190765-1-leobras.c@gmail.com>
Subject: Re: [PATCH 1/1] KVM/PPC: Fix typo on H_DISABLE_AND_GET hcall
Message-Id: <159559697292.1657499.11332603391566688077.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:24:52 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Jul 2020 21:48:12 -0300, Leonardo Bras wrote:
> On PAPR+ the hcall() on 0x1B0 is called H_DISABLE_AND_GET, but got
> defined as H_DISABLE_AND_GETC instead.
> 
> This define was introduced with a typo in commit <b13a96cfb055>
> ("[PATCH] powerpc: Extends HCALL interface for InfiniBand usage"), and was
> later used without having the typo noticed.

Applied to powerpc/next.

[1/1] KVM: PPC: Fix typo on H_DISABLE_AND_GET hcall
      https://git.kernel.org/powerpc/c/0f10228c6ff6af36cbb31af35b01f76cdb0b3fc1

cheers
