Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99595647033
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:57:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ1K3P0Mz3fwM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:57:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYry2Fyjz3c9s
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYry19v5z4xvR;
	Thu,  8 Dec 2022 23:49:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linux-kselftest@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org, Miaoqian Lin <linmq006@gmail.com>, Anshuman Khandual <khandual@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20221205084429.570654-1-linmq006@gmail.com>
References: <20221205084429.570654-1-linmq006@gmail.com>
Subject: Re: [PATCH] selftests/powerpc: Fix resource leaks
Message-Id: <167050321517.1457988.92380060922256003.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:15 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 5 Dec 2022 12:44:27 +0400, Miaoqian Lin wrote:
> In check_all_cpu_dscr_defaults, opendir() opens the directory stream.
> Add missing closedir() in the error path to release it.
> 
> In check_cpu_dscr_default, open() creates an open file descriptor.
> Add missing close() in the error path to release it.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix resource leaks
      https://git.kernel.org/powerpc/c/8f4ab7da904ab7027ccd43ddb4f0094e932a5877

cheers
