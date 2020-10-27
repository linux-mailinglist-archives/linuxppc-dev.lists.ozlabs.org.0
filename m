Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1829A1F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 01:59:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKtdw6lLGzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 11:59:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKsRl17mYzDqDm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 11:05:53 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kXCUL-009VwG-7r; Tue, 27 Oct 2020 00:05:21 +0000
Date: Tue, 27 Oct 2020 00:05:21 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [REGRESSION] mm: process_vm_readv testcase no longer works after
 compat_prcoess_vm_readv removed
Message-ID: <20201027000521.GD3576660@ZenIV.linux.org.uk>
References: <CAP045Aqrsb=CXHDHx4nS-pgg+MUDj14r-kN8_Jcbn-NAUziVag@mail.gmail.com>
 <70d5569e-4ad6-988a-e047-5d12d298684c@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70d5569e-4ad6-988a-e047-5d12d298684c@kernel.dk>
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
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-security-module@vger.kernel.org,
 Robert O'Callahan <robert@ocallahan.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Kyle Huey <me@kylehuey.com>,
 "open list:FILESYSTEMS \(VFS and infrastructure\)"
 <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 26, 2020 at 05:56:11PM -0600, Jens Axboe wrote:
> On 10/26/20 4:55 PM, Kyle Huey wrote:
> > A test program from the rr[0] test suite, vm_readv_writev[1], no
> > longer works on 5.10-rc1 when compiled as a 32 bit binary and executed
> > on a 64 bit kernel. The first process_vm_readv call (on line 35) now
> > fails with EFAULT. I have bisected this to
> > c3973b401ef2b0b8005f8074a10e96e3ea093823.
> > 
> > It should be fairly straightforward to extract the test case from our
> > repository into a standalone program.
> 
> Can you check with this applied?
> 
> diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
> index fd12da80b6f2..05676722d9cd 100644
> --- a/mm/process_vm_access.c
> +++ b/mm/process_vm_access.c
> @@ -273,7 +273,8 @@ static ssize_t process_vm_rw(pid_t pid,
>  		return rc;
>  	if (!iov_iter_count(&iter))
>  		goto free_iov_l;
> -	iov_r = iovec_from_user(rvec, riovcnt, UIO_FASTIOV, iovstack_r, false);
> +	iov_r = iovec_from_user(rvec, riovcnt, UIO_FASTIOV, iovstack_r,
> +				in_compat_syscall());

_ouch_

There's a bug, all right, but I'm not sure that this is all there is to it.
For now it's probably the right fix, but...  Consider the fun trying to
use that from 32bit process to access the memory of 64bit one.  IOW, we
might want to add an explicit flag for "force 64bit addresses/sizes
in rvec".
