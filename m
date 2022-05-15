Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E175276DA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:16:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1JF710QQz3dwT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:16:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JC84KCXz3bpJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:14:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JC82lTcz4xZ0;
 Sun, 15 May 2022 20:14:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
In-Reply-To: <20220406093839.206608-1-hbathini@linux.ibm.com>
References: <20220406093839.206608-1-hbathini@linux.ibm.com>
Subject: Re: [PATCH 0/3] powerpc/fadump: fadump fixes and improvements
Message-Id: <165260954350.1040779.17651676068924566416.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:12:23 +1000
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 6 Apr 2022 15:08:36 +0530, Hari Bathini wrote:
> This series fixes a couple of issues in fadump and improves logging.
> The first patch fixes a bug that is observed when memory reserved for
> fadump is not adjacent to boot memory area. The second patch ensures
> mmap read succeeds for all memory regions in the vmcore. The third
> patch improves the data that is printed for fadump.
> 
> Hari Bathini (3):
>   powerpc/fadump: fix PT_LOAD segment for boot memory area
>   powerpc/fadump: align destination address to pagesize
>   powerpc/fadump: print start of preserved area
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/fadump: fix PT_LOAD segment for boot memory area
      https://git.kernel.org/powerpc/c/15eb77f873255cf9f4d703b63cfbd23c46579654
[2/3] powerpc/fadump: align destination address to pagesize
      https://git.kernel.org/powerpc/c/9cf3b3a33a36ef4a988be0a770edd3555297f2a9
[3/3] powerpc/fadump: print start of preserved area
      https://git.kernel.org/powerpc/c/a3ceb5882edf6696ebc6aeb8043ddec548a93052

cheers
