Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9414A46DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 13:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnRyS4z7wz3cRC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 23:22:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kU5t8mrV;
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
 header.s=bombadil.20210309 header.b=kU5t8mrV; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnRxq3vTwz2xtb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 23:21:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3wNIYew9FTqVt8X3C3MpN6htZ5VEftQt1dS3fPy0Ox4=; b=kU5t8mrV53XE6VG7WEyBe6Ra2m
 sI3IGk6Geor2271toZ3n1TXDrnm8GPZ6KHGMIjX6PJvqrk+1xc6wMB10y6ukUj1GffqA4GowX71qG
 KyA3oiDJgA7wme1bjM7ajJzIcMhLi8pVG5TJZJm/vPz5AsDu2V4MENP9GPAmpkL4DcF3izBBIuXQO
 ZNt0XurceE3LxabmNTNaS+umGtLmbUBlGgo8a/Am8wD8ZoxKvFnWGSi94Q83b+JAZwA4r6l5pOfgt
 22HYiVhhZDGKv/dNcR03rm4PgW9myIXVHcC5qbi5gNJI1+swrGMLuU45ay6728KcdrJhkk7d98mw4
 OWUQ5yIg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nEVgU-009J6Z-4J; Mon, 31 Jan 2022 12:21:26 +0000
Date: Mon, 31 Jan 2022 04:21:26 -0800
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Subject: Re: [PATCH V4 03/17] asm-generic: compat: Cleanup duplicate
 definitions
Message-ID: <YffURrqD0pfXnEkV@infradead.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129121728.1079364-4-guoren@kernel.org>
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

On Sat, Jan 29, 2022 at 08:17:14PM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> There are 7 64bit architectures that support Linux COMPAT mode to
> run 32bit applications. A lot of definitions are duplicate:
>  - COMPAT_USER_HZ
>  - COMPAT_RLIM_INFINITY
>  - COMPAT_OFF_T_MAX
>  - __compat_uid_t, __compat_uid_t
>  - compat_dev_t
>  - compat_ipc_pid_t
>  - struct compat_flock
>  - struct compat_flock64
>  - struct compat_statfs
>  - struct compat_ipc64_perm, compat_semid64_ds,
> 	  compat_msqid64_ds, compat_shmid64_ds
> 
> Cleanup duplicate definitions and merge them into asm-generic.

The flock part seems to clash with the general compat_flock
consolidation.  Otherwise this looks like a good idea.
