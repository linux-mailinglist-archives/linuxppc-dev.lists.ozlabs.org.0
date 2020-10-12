Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021928BD8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 18:22:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C93px4p32zDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 03:22:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=V7DSrccL; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C93mS34NlzDqd1;
 Tue, 13 Oct 2020 03:19:52 +1100 (AEDT)
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22B302080A;
 Mon, 12 Oct 2020 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602519589;
 bh=FXrMfe87r7In01hy1fZxNUDLVXbtP/5TJ3+XTzWq1o4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7DSrccLr5b4UIwMLihtwG0wHPpEpEeCdL4DEsryZDNbDbBe/031RRLLs/mkasjte
 GkozOXCGlriE75ewyNE/y/+1/YN0mvEXF3Fx+zkSk5bqABC19TCsH57zxXZt4yoDfc
 Gd/Q7Kn6Oc4wJMc886CZx9bFLur2svNEjPDcQyvk=
Date: Mon, 12 Oct 2020 09:19:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new kmap_thread()
Message-ID: <20201012161946.GA858@sol.localdomain>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
 <20201010003954.GW20115@casper.infradead.org>
 <20201010013036.GD1122@sol.localdomain>
 <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
 intel-wired-lan@lists.osuosl.org, kexec@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 bpf@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, io-uring@vger.kernel.org, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 11, 2020 at 11:56:35PM -0700, Ira Weiny wrote:
> > 
> > And I still don't really understand.  After this patchset, there is still code
> > nearly identical to the above (doing a temporary mapping just for a memcpy) that
> > would still be using kmap_atomic().
> 
> I don't understand.  You mean there would be other call sites calling:
> 
> kmap_atomic()
> memcpy()
> kunmap_atomic()

Yes, there are tons of places that do this.  Try 'git grep -A6 kmap_atomic'
and look for memcpy().

Hence why I'm asking what will be the "recommended" way to do this...
kunmap_thread() or kmap_atomic()?

> And since I don't know the call site details if there are kmap_thread() calls
> which are better off as kmap_atomic() calls I think it is worth converting
> them.  But I made the assumption that kmap users would already be calling
> kmap_atomic() if they could (because it is more efficient).

Not necessarily.  In cases where either one is correct, people might not have
put much thought into which of kmap() and kmap_atomic() they are using.

- Eric
