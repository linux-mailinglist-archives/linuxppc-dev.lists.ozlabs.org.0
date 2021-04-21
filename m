Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26DF366BF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:10:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLWB5xXjz3bxG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:09:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVD1ZDVz301k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:08 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLV93XvFz9vDk; Wed, 21 Apr 2021 23:09:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com, yhs@fb.com,
 Paul Mackerras <paulus@samba.org>, john.fastabend@gmail.com, andrii@kernel.org,
 daniel@iogearbox.net, Christophe Leroy <christophe.leroy@csgroup.eu>,
 kafai@fb.com, songliubraving@fb.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, kpsingh@chromium.org,
 Michael Ellerman <mpe@ellerman.id.au>, ast@kernel.org
In-Reply-To: <34d12a4f75cb8b53a925fada5e7ddddd3b145203.1618227846.git.christophe.leroy@csgroup.eu>
References: <34d12a4f75cb8b53a925fada5e7ddddd3b145203.1618227846.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/ebpf32: Fix comment on BPF_ALU{64} | BPF_LSH
 | BPF_K
Message-Id: <161901050428.1961279.6678434799432870652.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:24 +1000
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Apr 2021 11:44:16 +0000 (UTC), Christophe Leroy wrote:
> Replace <<== by <<=

Applied to powerpc/next.

[1/3] powerpc/ebpf32: Fix comment on BPF_ALU{64} | BPF_LSH | BPF_K
      https://git.kernel.org/powerpc/c/d228cc4969663623e6b5a749b02e4619352a0a8d
[2/3] powerpc/ebpf32: Rework 64 bits shifts to avoid tests and branches
      https://git.kernel.org/powerpc/c/e7de0023e1232f42a10ef6af03352538cc27eaf6
[3/3] powerpc/ebpf32: Use standard function call for functions within 32M distance
      https://git.kernel.org/powerpc/c/ee7c3ec3b4b1222b30272624897826bc40d79bc5

cheers
