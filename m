Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E91D544EA5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 23:42:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PxzB2FdTzDrPl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 07:42:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=iogearbox.net
 (client-ip=213.133.104.62; helo=www62.your-server.de;
 envelope-from=daniel@iogearbox.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iogearbox.net
X-Greylist: delayed 1742 seconds by postgrey-1.36 at bilbo;
 Fri, 14 Jun 2019 07:40:48 AEST
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PxxX0KVnzDqxh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 07:40:47 +1000 (AEST)
Received: from [78.46.172.2] (helo=sslproxy05.your-server.de)
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1hbX0S-0004am-6r; Thu, 13 Jun 2019 23:11:36 +0200
Received: from [178.199.41.31] (helo=linux.home)
 by sslproxy05.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <daniel@iogearbox.net>)
 id 1hbX0S-000WZf-1i; Thu, 13 Jun 2019 23:11:36 +0200
Subject: Re: [PATCH 0/2] powerpc/bpf: DIV64 instruction fix
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <cover.1560364574.git.naveen.n.rao@linux.vnet.ibm.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <a6fe940f-94bb-1b8f-ecd2-5e8e003a3f57@iogearbox.net>
Date: Thu, 13 Jun 2019 23:11:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1560364574.git.naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.3/25479/Thu Jun 13 10:12:53 2019)
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/12/2019 08:51 PM, Naveen N. Rao wrote:
> The first patch updates DIV64 overflow tests to properly detect error 
> conditions. The second patch fixes powerpc64 JIT to generate the proper 
> unsigned division instruction for BPF_ALU64.
> 
> - Naveen
> 
> Naveen N. Rao (2):
>   bpf: fix div64 overflow tests to properly detect errors
>   powerpc/bpf: use unsigned division instruction for 64-bit operations
> 
>  arch/powerpc/include/asm/ppc-opcode.h              |  1 +
>  arch/powerpc/net/bpf_jit.h                         |  2 +-
>  arch/powerpc/net/bpf_jit_comp64.c                  |  8 ++++----
>  .../testing/selftests/bpf/verifier/div_overflow.c  | 14 ++++++++++----
>  4 files changed, 16 insertions(+), 9 deletions(-)
> 

LGTM, applied to bpf, thanks!
