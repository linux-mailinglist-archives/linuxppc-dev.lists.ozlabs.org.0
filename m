Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 802BA4A46E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 13:22:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnRz92WDzz3cNS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 23:22:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0u1Cnjxt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c8a487c16eeb054acd37+6735+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=0u1Cnjxt; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnRyM2Qfnz3cHN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 23:22:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f4Y3/+mnt13M4Z9/M62N5ZCwD04W58R8ZTJkz565l8U=; b=0u1CnjxtmYRSbXpXwQeALFKTO1
 p8CPA7S/POyhrDUXoe7Q9T+q5HklpvRWMpCudZaQQUBwQbfx/2ZpD+ONHk8u3O7bHR+3MBQsjChAV
 3tmIAMd+cUuX69aq1UYA4QevllOPD3YUl5YQltKLkJi+7HWznbwJfna6wL6VMm9yxzfAvcATqoLlw
 4l/an+pWUstnjj1GJb6jTewiiinb5MPHUI2x5OCkIaXD3mjkYlPy4gCkvvbtJhd/s3vvAxzm3Lteq
 NP/m0koFsSDjGnPcH0IBpP0nQV+j/NOZjUCvza+o/hpHLpnmvXqJY+GaZVY0JHMuIyFYJNzhubjB/
 4oTn4Sqw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nEVgx-009JGM-DM; Mon, 31 Jan 2022 12:21:55 +0000
Date: Mon, 31 Jan 2022 04:21:55 -0800
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Subject: Re: [PATCH V4 04/17] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
Message-ID: <YffUY/l8ydK8+/70@infradead.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-5-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129121728.1079364-5-guoren@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-parisc@vger.kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, drew@beagleboard.org,
 anup@brainfault.org, wangjunqiang@iscas.ac.cn, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, palmer@dabbelt.com, liush@allwinnertech.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 wefu@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 08:17:15PM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Make "uapi asm unistd.h" could be used for architectures' COMPAT
> mode. The __SYSCALL_COMPAT is first used in riscv.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
