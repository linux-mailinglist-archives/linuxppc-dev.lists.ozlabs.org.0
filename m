Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BD9127121
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 00:03:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f6qs1rdHzDqlh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 10:03:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="ax5pfVwR"; 
 dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f6nn0MVKzDqlh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 10:01:48 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfc01460000>; Thu, 19 Dec 2019 15:01:26 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 19 Dec 2019 15:01:36 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 19 Dec 2019 15:01:36 -0800
Received: from [10.2.165.11] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Dec
 2019 23:01:32 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <f10b2a18-a109-d87d-f156-2e5941cbf4a0@nvidia.com>
Date: Thu, 19 Dec 2019 14:58:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191219210743.GN17227@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576796486; bh=tiz2hjGylLUwQicEfM7bbVznNfOI7NYEds0c0vA1QMM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ax5pfVwRTOuRMGRTTENUug1V5pL/RA0R/ro68Ef6qbAC2dMIpaMVof5lAjrJh/YsQ
 tzguzyOG/LzutEbtWDwyfHV9sKc8B+QE/oAsfQggRxnppIAZTNjdwjoShd1hqL3Scp
 PwDEgdunQ5+3RZaDnDjRY1Ma0ZpDqQcVz1QAXQFHukq22+SRzGz1hOWdS1Kam2nyY2
 CDT0AZ+Yyg+ZRHDTJHnr4JvmQTB2CGF09WlCJB69OrCNdaPzyZjzlP0CWvWnN5wMNt
 lrxupzD+I8Xm9/TBpPiZ2SZw5etOEm+wZ4cFWC8o/KBZNRn3emLZ8rxxX3WRl4ZX7o
 4lpXlR7HRSRdg==
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
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Maor Gottlieb <maorg@mellanox.com>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex
 Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/19/19 1:07 PM, Jason Gunthorpe wrote:
...
>> 3. It would be nice if I could reproduce this. I have a two-node mlx5 Infiniband
>> test setup, but I have done only the tiniest bit of user space IB coding, so
>> if you have any test programs that aren't too hard to deal with that could
>> possibly hit this, or be tweaked to hit it, I'd be grateful. Keeping in mind
>> that I'm not an advanced IB programmer. At all. :)
> 
> Clone this:
> 
> https://github.com/linux-rdma/rdma-core.git
> 
> Install all the required deps to build it (notably cython), see the README.md
> 
> $ ./build.sh
> $ build/bin/run_tests.py
> 
> If you get things that far I think Leon can get a reproduction for you
> 

Cool, it's up and running (1 failure, 3 skipped, out of 67 tests).

This is a great test suite to have running, I'll add it to my scripts. Here's the
full output in case the failure or skip cases are a problem:

$ sudo ./build/bin/run_tests.py --verbose

test_create_ah (tests.test_addr.AHTest) ... ok
test_create_ah_roce (tests.test_addr.AHTest) ... skipped "Can't run RoCE tests on IB link layer"
test_destroy_ah (tests.test_addr.AHTest) ... ok
test_create_comp_channel (tests.test_cq.CCTest) ... ok
test_destroy_comp_channel (tests.test_cq.CCTest) ... ok
test_create_cq_ex (tests.test_cq.CQEXTest) ... ok
test_create_cq_ex_bad_flow (tests.test_cq.CQEXTest) ... ok
test_destroy_cq_ex (tests.test_cq.CQEXTest) ... ok
test_create_cq (tests.test_cq.CQTest) ... ok
test_create_cq_bad_flow (tests.test_cq.CQTest) ... ok
test_destroy_cq (tests.test_cq.CQTest) ... ok
test_rc_traffic_cq_ex (tests.test_cqex.CqExTestCase) ... ok
test_ud_traffic_cq_ex (tests.test_cqex.CqExTestCase) ... ok
test_xrc_traffic_cq_ex (tests.test_cqex.CqExTestCase) ... ok
test_create_dm (tests.test_device.DMTest) ... ok
test_create_dm_bad_flow (tests.test_device.DMTest) ... ok
test_destroy_dm (tests.test_device.DMTest) ... ok
test_destroy_dm_bad_flow (tests.test_device.DMTest) ... ok
test_dm_read (tests.test_device.DMTest) ... ok
test_dm_write (tests.test_device.DMTest) ... ok
test_dm_write_bad_flow (tests.test_device.DMTest) ... ok
test_dev_list (tests.test_device.DeviceTest) ... ok
test_open_dev (tests.test_device.DeviceTest) ... ok
test_query_device (tests.test_device.DeviceTest) ... ok
test_query_device_ex (tests.test_device.DeviceTest) ... ok
test_query_gid (tests.test_device.DeviceTest) ... ok
test_query_port (tests.test_device.DeviceTest) ... FAIL
test_query_port_bad_flow (tests.test_device.DeviceTest) ... ok
test_create_dm_mr (tests.test_mr.DMMRTest) ... ok
test_destroy_dm_mr (tests.test_mr.DMMRTest) ... ok
test_buffer (tests.test_mr.MRTest) ... ok
test_dereg_mr (tests.test_mr.MRTest) ... ok
test_dereg_mr_twice (tests.test_mr.MRTest) ... ok
test_lkey (tests.test_mr.MRTest) ... ok
test_read (tests.test_mr.MRTest) ... ok
test_reg_mr (tests.test_mr.MRTest) ... ok
test_reg_mr_bad_flags (tests.test_mr.MRTest) ... ok
test_reg_mr_bad_flow (tests.test_mr.MRTest) ... ok
test_rkey (tests.test_mr.MRTest) ... ok
test_write (tests.test_mr.MRTest) ... ok
test_dereg_mw_type1 (tests.test_mr.MWTest) ... ok
test_dereg_mw_type2 (tests.test_mr.MWTest) ... ok
test_reg_mw_type1 (tests.test_mr.MWTest) ... ok
test_reg_mw_type2 (tests.test_mr.MWTest) ... ok
test_reg_mw_wrong_type (tests.test_mr.MWTest) ... ok
test_odp_rc_traffic (tests.test_odp.OdpTestCase) ... ok
test_odp_ud_traffic (tests.test_odp.OdpTestCase) ... skipped 'ODP is not supported - ODP recv not supported'
test_odp_xrc_traffic (tests.test_odp.OdpTestCase) ... ok
test_default_allocators (tests.test_parent_domain.ParentDomainTestCase) ... ok
test_mem_align_allocators (tests.test_parent_domain.ParentDomainTestCase) ... ok
test_without_allocators (tests.test_parent_domain.ParentDomainTestCase) ... ok
test_alloc_pd (tests.test_pd.PDTest) ... ok
test_create_pd_none_ctx (tests.test_pd.PDTest) ... ok
test_dealloc_pd (tests.test_pd.PDTest) ... ok
test_destroy_pd_twice (tests.test_pd.PDTest) ... ok
test_multiple_pd_creation (tests.test_pd.PDTest) ... ok
test_create_qp_ex_no_attr (tests.test_qp.QPTest) ... ok
test_create_qp_ex_no_attr_connected (tests.test_qp.QPTest) ... ok
test_create_qp_ex_with_attr (tests.test_qp.QPTest) ... ok
test_create_qp_ex_with_attr_connected (tests.test_qp.QPTest) ... ok
test_create_qp_no_attr (tests.test_qp.QPTest) ... ok
test_create_qp_no_attr_connected (tests.test_qp.QPTest) ... ok
test_create_qp_with_attr (tests.test_qp.QPTest) ... ok
test_create_qp_with_attr_connected (tests.test_qp.QPTest) ... ok
test_modify_qp (tests.test_qp.QPTest) ... ok
test_query_qp (tests.test_qp.QPTest) ... ok
test_rdmacm_sync_traffic (tests.test_rdmacm.CMTestCase) ... skipped 'No devices with net interface'

======================================================================
FAIL: test_query_port (tests.test_device.DeviceTest)
----------------------------------------------------------------------
Traceback (most recent call last):
   File "/kernel_work/rdma-core/tests/test_device.py", line 129, in test_query_port
     self.verify_port_attr(port_attr)
   File "/kernel_work/rdma-core/tests/test_device.py", line 113, in verify_port_attr
     assert 'Invalid' not in d.speed_to_str(attr.active_speed)
AssertionError

----------------------------------------------------------------------
Ran 67 tests in 10.058s

FAILED (failures=1, skipped=3)


thanks,
-- 
John Hubbard
NVIDIA
