Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BACA26FEEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 15:44:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtFRm6qDWzDqhH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 23:44:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2002:c35c:fd02::1;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtFMq4YT6zDqCT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 23:40:37 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kJGcW-0014PO-Gq; Fri, 18 Sep 2020 13:40:12 +0000
Date: Fri, 18 Sep 2020 14:40:12 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Message-ID: <20200918134012.GY3421308@ZenIV.linux.org.uk>
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918124533.3487701-2-hch@lst.de>
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 18, 2020 at 02:45:25PM +0200, Christoph Hellwig wrote:
> Add a flag to force processing a syscall as a compat syscall.  This is
> required so that in_compat_syscall() works for I/O submitted by io_uring
> helper threads on behalf of compat syscalls.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/sparc/include/asm/compat.h | 3 ++-
>  arch/x86/include/asm/compat.h   | 2 +-
>  fs/io_uring.c                   | 9 +++++++++
>  include/linux/compat.h          | 5 ++++-
>  include/linux/sched.h           | 1 +
>  5 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/compat.h b/arch/sparc/include/asm/compat.h
> index 40a267b3bd5208..fee6c51d36e869 100644
> --- a/arch/sparc/include/asm/compat.h
> +++ b/arch/sparc/include/asm/compat.h
> @@ -211,7 +211,8 @@ static inline int is_compat_task(void)
>  static inline bool in_compat_syscall(void)
>  {
>  	/* Vector 0x110 is LINUX_32BIT_SYSCALL_TRAP */
> -	return pt_regs_trap_type(current_pt_regs()) == 0x110;
> +	return pt_regs_trap_type(current_pt_regs()) == 0x110 ||
> +		(current->flags & PF_FORCE_COMPAT);

Can't say I like that approach ;-/  Reasoning about the behaviour is much
harder when it's controlled like that - witness set_fs() shite...
