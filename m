Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC61BAF47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 22:22:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499x5n3LNBzDqgn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 06:22:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=0dPVwJ/H; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499x0v0GS9zDqhT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 06:18:07 +1000 (AEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB8ED2072D;
 Mon, 27 Apr 2020 20:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588018684;
 bh=FZznVs7DKImH4bMp84GuK30NCRT+ks2QZb0zw61Aw2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0dPVwJ/H9B7uUoDHVQh+JzhGMmouLB2JEnhplDQk7I3xuAgcbSFK60H1piEfCx5Sx
 t+jKABLjlMrQXuoJB1Wv7UdopSfsHYSYtmSlzWb93RhaIDNLpcyXt7Avmd+0pazZfN
 HbeEsAjiXXS9v7hdBuMksmtrvhaQ+taOUTUIOuQQ=
Date: Mon, 27 Apr 2020 13:18:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v3 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
Message-Id: <20200427131802.3d132055a59535a0e6780e9f@linux-foundation.org>
In-Reply-To: <b1f04f9f-fa46-c2a0-7693-4a0679d2a1ee@oracle.com>
References: <20200417185049.275845-1-mike.kravetz@oracle.com>
 <20200417185049.275845-3-mike.kravetz@oracle.com>
 <7583dfcc-62d8-2a54-6eef-bcb4e01129b3@gmail.com>
 <5a380060-38db-b690-1003-678ca0f28f07@oracle.com>
 <b1f04f9f-fa46-c2a0-7693-4a0679d2a1ee@oracle.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Mina Almasry <almasrymina@google.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Nitesh Narayan Lal <nitesh@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Sandipan Das <sandipan.osd@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Apr 2020 12:09:47 -0700 Mike Kravetz <mike.kravetz@oracle.com> wrote:

> Previously, a check for hugepages_supported was added before processing
> hugetlb command line parameters.  On some architectures such as powerpc,
> hugepages_supported() is not set to true until after command line
> processing.  Therefore, no hugetlb command line parameters would be
> accepted.
> 
> Remove the additional checks for hugepages_supported.  In hugetlb_init,
> print a warning if !hugepages_supported and command line parameters were
> specified.

This applies to [4/4] instead of fixing [2/4].  I guess you'll
straighten that out in v4?

btw, was
http://lkml.kernel.org/r/CADYN=9Koefrq9H1Y82Q8nMNbeyN4tzhEfvDu5u=sVFjFZCYorA@mail.gmail.com
addressed?

