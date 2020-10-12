Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7528ADBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 07:30:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8nLb65lFzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 16:29:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8nJr09vpzDqSD;
 Mon, 12 Oct 2020 16:28:26 +1100 (AEDT)
IronPort-SDR: lrxq8SmAoPUbPnmlepYkrFzQHLNo1dMSNwv1kdur+rz8j4KuEkepzImeWXbMtSyGx79NMp62p+
 RoDUOlTPohEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="153522270"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="153522270"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:28:23 -0700
IronPort-SDR: Awdi9Evv+UAQx0jH4ny/s7+Nxcmli85F+a73BOsSCHQvCG+q13xwJ2JLwUM5pKItlqpgm8qi5b
 o2XGvRLHUUbw==
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="529816997"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:28:22 -0700
Date: Sun, 11 Oct 2020 22:28:18 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Coly Li <colyli@suse.de>
Subject: Re: [PATCH RFC PKS/PMEM 48/58] drivers/md: Utilize new kmap_thread()
Message-ID: <20201012052817.GZ2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-49-ira.weiny@intel.com>
 <c802fbf4-f67a-b205-536d-9c71b440f9c8@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c802fbf4-f67a-b205-536d-9c71b440f9c8@suse.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, cluster-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Kent Overstreet <kent.overstreet@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>,
 linux-afs@lists.infradead.org, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 10, 2020 at 10:20:34AM +0800, Coly Li wrote:
> On 2020/10/10 03:50, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > These kmap() calls are localized to a single thread.  To avoid the over
> > head of global PKRS updates use the new kmap_thread() call.
> > 
> 
> Hi Ira,
> 
> There were a number of options considered.
> 
> 1) Attempt to change all the thread local kmap() calls to kmap_atomic()
> 2) Introduce a flags parameter to kmap() to indicate if the mapping
> should be global or not
> 3) Change ~20-30 call sites to 'kmap_global()' to indicate that they
> require a global mapping of the pages
> 4) Change ~209 call sites to 'kmap_thread()' to indicate that the
> mapping is to be used within that thread of execution only
> 
> 
> I copied the above information from patch 00/58 to this message. The
> idea behind kmap_thread() is fine to me, but as you said the new api is
> very easy to be missed in new code (even for me). I would like to be
> supportive to option 2) introduce a flag to kmap(), then we won't forget
> the new thread-localized kmap method, and people won't ask why a
> _thread() function is called but no kthread created.

Thanks for the feedback.

I'm going to hold off making any changes until others weigh in.  FWIW, I kind
of like option 2 as well.  But there is already kmap_atomic() so it seemed like
kmap_XXXX() was more in line with the current API.

Thanks,
Ira

> 
> Thanks.
> 
> 
> Coly Li
> 
