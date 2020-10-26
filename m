Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98144299B78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 00:51:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKs7R5LTfzDqKV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 10:51:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kylehuey.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=me@kylehuey.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kylehuey.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kylehuey.com header.i=@kylehuey.com header.a=rsa-sha256
 header.s=google header.b=JQw5fA5c; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKqtZ51ftzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 09:55:30 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id p93so1048907edd.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 15:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kylehuey.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=J/+n1x0TPOHJCTfSVoXlG/q+OLrGnnNxrysZ0ZyIy+Y=;
 b=JQw5fA5cqXZCTLCd2xkURV07bnYrA8gTT/8l9H7r6P+PgM37GQ7tblZcETghImepsU
 AcI0oUILLNpw7+Lob5wOxm8oxXKZgdxlvk1iOdkoLk31eLVc1crb3sEhxCSb6bD2V31l
 b7OGa6zHv0zDl28Z8OMcIxY0WvmVK7pWJSrW3Zs4sWifuxNiQ2iEW7pkdOAgHIEek3Fp
 L3yESbOX+0gb8ueK46K6rtDj34b55Vtmz8U4fPoQ/Dv2vqBsFOJNMTpbG7mznOfR5TaL
 kpOlREDICaBo0Xi3+x/a4pHYfGgO73EI5dQFmBZNKgKh2ry9/Y+FL54IAgbsbpnA0Xzm
 BeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=J/+n1x0TPOHJCTfSVoXlG/q+OLrGnnNxrysZ0ZyIy+Y=;
 b=eV1Dh807E0Ua2XHC+UFEODElLB2g2btd8qU7MmOVvcJqFgi3GLWvglxeNg1y8ezI/l
 +UptWpKbrBP//suegaIFbWRJNvwWMpwNUK1MyyoRrSQy3gTIm2Ft2a6BH5fY9SkDfn1R
 wg3+jEdNZCmvMB6AFQC8+7wG9+GAhjykRphWCPz8oHZgejGI84wBOfcq/bFHEjwy8PUz
 RK7hyhIxeAOc2IQgSG4t0zy1bt3NcBk1CWopO0r8gRrvcm00lWjQe8fc3OwWSE96fAMA
 IPFJ5p+V0UvjeY9qMDgXb0FQvLSnS3t5WtOBKmmrAIpSTGhtFqCwEe6VF3JDLQDzT+RC
 QUkA==
X-Gm-Message-State: AOAM5319sZFGpLJtkg87xRDkzGdASx+6INoQxD3iwemjaGsYkV4jJfgW
 TXl0ExVQt+WMg4qSEiocIP0qHbeV8I2gyqGI1w1Sbg==
X-Google-Smtp-Source: ABdhPJyAci+5cM2zXs7C2dh5O8VDIKXSp+LVa6rVM/MPlgy6tZLvyXi43c6iWM9w5BW9l3CIsdr5O5Od75OK4rN9ByQ=
X-Received: by 2002:aa7:d9ce:: with SMTP id v14mr12828586eds.203.1603752924617; 
 Mon, 26 Oct 2020 15:55:24 -0700 (PDT)
MIME-Version: 1.0
From: Kyle Huey <me@kylehuey.com>
Date: Mon, 26 Oct 2020 15:55:13 -0700
Message-ID: <CAP045Aqrsb=CXHDHx4nS-pgg+MUDj14r-kN8_Jcbn-NAUziVag@mail.gmail.com>
Subject: [REGRESSION] mm: process_vm_readv testcase no longer works after
 compat_prcoess_vm_readv removed
To: open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 27 Oct 2020 10:47:04 +1100
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
Cc: linux-aio@kvack.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 Robert O'Callahan <robert@ocallahan.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 io-uring@vger.kernel.org,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 "open list:FILESYSTEMS \(VFS and infrastructure\)"
 <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A test program from the rr[0] test suite, vm_readv_writev[1], no
longer works on 5.10-rc1 when compiled as a 32 bit binary and executed
on a 64 bit kernel. The first process_vm_readv call (on line 35) now
fails with EFAULT. I have bisected this to
c3973b401ef2b0b8005f8074a10e96e3ea093823.

It should be fairly straightforward to extract the test case from our
repository into a standalone program.

- Kyle

[0] https://rr-project.org/
[1] https://github.com/mozilla/rr/blob/master/src/test/vm_readv_writev.c
