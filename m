Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1481DFB876
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 20:09:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CvKr238vzF4Vj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:09:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CvGQ2GfVzF706
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 06:06:05 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 11:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="198545356"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga008.jf.intel.com with ESMTP; 13 Nov 2019 11:06:02 -0800
Date: Wed, 13 Nov 2019 11:06:02 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 22/23] selftests/vm: run_vmtests: invoke gup_benchmark
 with basic FOLL_PIN coverage
Message-ID: <20191113190602.GC12947@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-23-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-23-jhubbard@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 08:27:09PM -0800, John Hubbard wrote:
> It's good to have basic unit test coverage of the new FOLL_PIN
> behavior. Fortunately, the gup_benchmark unit test is extremely
> fast (a few milliseconds), so adding it the the run_vmtests suite
> is going to cause no noticeable change in running time.
> 
> So, add two new invocations to run_vmtests:
> 
> 1) Run gup_benchmark with normal get_user_pages().
> 
> 2) Run gup_benchmark with pin_user_pages(). This is much like
> the first call, except that it sets FOLL_PIN.
> 
> Running these two in quick succession also provide a visual
> comparison of the running times, which is convenient.
> 
> The new invocations are fairly early in the run_vmtests script,
> because with test suites, it's usually preferable to put the
> shorter, faster tests first, all other things being equal.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  tools/testing/selftests/vm/run_vmtests | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests
> index 951c507a27f7..93e8dc9a7cad 100755
> --- a/tools/testing/selftests/vm/run_vmtests
> +++ b/tools/testing/selftests/vm/run_vmtests
> @@ -104,6 +104,28 @@ echo "NOTE: The above hugetlb tests provide minimal coverage.  Use"
>  echo "      https://github.com/libhugetlbfs/libhugetlbfs.git for"
>  echo "      hugetlb regression testing."
>  
> +echo "--------------------------------------------"
> +echo "running 'gup_benchmark -U' (normal/slow gup)"
> +echo "--------------------------------------------"
> +./gup_benchmark -U
> +if [ $? -ne 0 ]; then
> +	echo "[FAIL]"
> +	exitcode=1
> +else
> +	echo "[PASS]"
> +fi
> +
> +echo "------------------------------------------"
> +echo "running gup_benchmark -c (pin_user_pages)"
> +echo "------------------------------------------"
> +./gup_benchmark -c
> +if [ $? -ne 0 ]; then
> +	echo "[FAIL]"
> +	exitcode=1
> +else
> +	echo "[PASS]"
> +fi
> +
>  echo "-------------------"
>  echo "running userfaultfd"
>  echo "-------------------"
> -- 
> 2.24.0
> 
