Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA98563F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:04:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFd43Rqwz3wF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:04:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFXB2lFcz3dT4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 23:59:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFX94csjz4x0t;
	Thu, 15 Feb 2024 23:59:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu, christophe.leroy@c-s.fr, Jiangfeng Xiao <xiaojiangfeng@huawei.com>
In-Reply-To: <1705974359-43790-1-git-send-email-xiaojiangfeng@huawei.com>
References: <1705974359-43790-1-git-send-email-xiaojiangfeng@huawei.com>
Subject: Re: [PING PATCH] powerpc/kasan: Fix addr error caused by page alignment
Message-Id: <170800185784.599237.15590850355904015757.b4-ty@ellerman.id.au>
Date: Thu, 15 Feb 2024 23:57:37 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: douzhaolei@huawei.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, wangbing6@huawei.com, wangfangpeng1@huawei.com, nixiaoming@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jan 2024 09:45:59 +0800, Jiangfeng Xiao wrote:
> In kasan_init_region, when k_start is not page aligned,
> at the begin of for loop, k_cur = k_start & PAGE_MASK
> is less than k_start, and then va = block + k_cur - k_start
> is less than block, the addr va is invalid, because the
> memory address space from va to block is not alloced by
> memblock_alloc, which will not be reserved
> by memblock_reserve later, it will be used by other places.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/kasan: Fix addr error caused by page alignment
      https://git.kernel.org/powerpc/c/4a7aee96200ad281a5cc4cf5c7a2e2a49d2b97b0

cheers
