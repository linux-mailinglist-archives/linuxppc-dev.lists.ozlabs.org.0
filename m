Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC603BCAFD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 12:53:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJztq65hxz3bwb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 20:53:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJzsy2VNgz300x
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 20:52:54 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GJzsy1QGmz9sXV; Tue,  6 Jul 2021 20:52:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <cover.1625145429.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1625145429.git.naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] powerpc/bpf: Fix issue with atomic ops
Message-Id: <162556873716.460578.10069325708926626758.b4-ty@ellerman.id.au>
Date: Tue, 06 Jul 2021 20:52:17 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Brendan Jackman <jackmanb@google.com>, Jiri Olsa <jolsa@redhat.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 1 Jul 2021 20:38:57 +0530, Naveen N. Rao wrote:
> The first patch fixes an issue that causes a soft lockup on ppc64 with
> the BPF_ATOMIC bounds propagation verifier test. The second one updates
> ppc32 JIT to reject atomic operations properly.
> 
> - Naveen
> 
> Naveen N. Rao (2):
>   powerpc/bpf: Fix detecting BPF atomic instructions
>   powerpc/bpf: Reject atomic ops in ppc32 JIT
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/bpf: Fix detecting BPF atomic instructions
      https://git.kernel.org/powerpc/c/419ac821766cbdb9fd85872bb3f1a589df05c94c
[2/2] powerpc/bpf: Reject atomic ops in ppc32 JIT
      https://git.kernel.org/powerpc/c/307e5042c7bdae15308ef2e9b848833b84122eb0

cheers
