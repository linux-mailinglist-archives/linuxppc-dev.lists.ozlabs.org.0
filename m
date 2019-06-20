Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE764C930
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 10:15:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TvkV5SwPzDr0d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 18:14:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=haiyanx.song@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tvf42tmkzDrFK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 18:11:05 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 01:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,396,1557212400"; 
 d="out'?scan'208";a="150857738"
Received: from haiyan.sh.intel.com ([10.239.48.70])
 by orsmga007.jf.intel.com with ESMTP; 20 Jun 2019 01:10:56 -0700
Date: Thu, 20 Jun 2019 16:19:45 +0800
From: Haiyan Song <haiyanx.song@intel.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v12 00/31] Speculative page faults
Message-ID: <20190620081945.hwj6ruqddefnxg6z@haiyan.sh.intel.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
 <20190606065129.d5s3534p23twksgp@haiyan.sh.intel.com>
 <3d3cefa2-0ebb-e86d-b060-7ba67c48a59f@linux.ibm.com>
 <1c412ebe-c213-ee67-d261-c70ddcd34b79@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ghgds33dkojdyykr"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c412ebe-c213-ee67-d261-c70ddcd34b79@linux.ibm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: jack@suse.cz, sergey.senozhatsky.work@gmail.com, peterz@infradead.org,
 Will Deacon <will.deacon@arm.com>, mhocko@kernel.org, linux-mm@kvack.org,
 paulus@samba.org, Punit Agrawal <punitagrawal@gmail.com>, hpa@zytor.com,
 Michel Lespinasse <walken@google.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andrea Arcangeli <aarcange@redhat.com>, ak@linux.intel.com,
 Minchan Kim <minchan@kernel.org>, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 David Rientjes <rientjes@google.com>, paulmck@linux.vnet.ibm.com,
 npiggin@gmail.com, sj38.park@gmail.com, Jerome Glisse <jglisse@redhat.com>,
 dave@stgolabs.net, kemi.wang@intel.com, kirill@shutemov.name,
 Thomas Gleixner <tglx@linutronix.de>, zhong jiang <zhongjiang@huawei.com>,
 Ganesh Mahendran <opensource.ganesh@gmail.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 vinayak menon <vinayakm.list@gmail.com>, akpm@linux-foundation.org,
 Tim Chen <tim.c.chen@linux.intel.com>, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ghgds33dkojdyykr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Laurent,

I downloaded your script and run it on Intel 2s skylake platform with spf-v12 patch
serials.

Here attached the output results of this script.

The following comparison result is statistics from the script outputs.

a). Enable THP
                                            SPF_0          change       SPF_1
will-it-scale.page_fault2.per_thread_ops    2664190.8      -11.7%       2353637.6      
will-it-scale.page_fault3.per_thread_ops    4480027.2      -14.7%       3819331.9     


b). Disable THP
                                            SPF_0           change      SPF_1
will-it-scale.page_fault2.per_thread_ops    2653260.7       -10%        2385165.8
will-it-scale.page_fault3.per_thread_ops    4436330.1       -12.4%      3886734.2 


Thanks,
Haiyan Song


On Fri, Jun 14, 2019 at 10:44:47AM +0200, Laurent Dufour wrote:
> Le 14/06/2019 à 10:37, Laurent Dufour a écrit :
> > Please find attached the script I run to get these numbers.
> > This would be nice if you could give it a try on your victim node and share the result.
> 
> Sounds that the Intel mail fitering system doesn't like the attached shell script.
> Please find it there: https://gist.github.com/ldu4/a5cc1a93f293108ea387d43d5d5e7f44
> 
> Thanks,
> Laurent.
> 

--ghgds33dkojdyykr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="page_fault2_threads.5.1.0-rc4-mm1-00300-g02c5a1f.out"

#### THP always
#### SPF 0
average:2628818
average:2732209
average:2728392
average:2550695
average:2689873
average:2691963
average:2627612
average:2558295
average:2707877
average:2726174
#### SPF 1
average:2426260
average:2145674
average:2117769
average:2292502
average:2350403
average:2483327
average:2467324
average:2335393
average:2437859
average:2479865
#### THP never
#### SPF 0
average:2712575
average:2711447
average:2672362
average:2701981
average:2668073
average:2579296
average:2662048
average:2637422
average:2579143
average:2608260
#### SPF 1
average:2348782
average:2203349
average:2312960
average:2402995
average:2318914
average:2543129
average:2390337
average:2490178
average:2416798
average:2424216

--ghgds33dkojdyykr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="page_fault3_threads.5.1.0-rc4-mm1-00300-g02c5a1f.out"

#### THP always
#### SPF 0
average:4370143
average:4245754
average:4678884
average:4665759
average:4665809
average:4639132
average:4210755
average:4330552
average:4290469
average:4703015
#### SPF 1
average:3810608
average:3918890
average:3758003
average:3965024
average:3578151
average:3822748
average:3687293
average:3998701
average:3915771
average:3738130
#### THP never
#### SPF 0
average:4505598
average:4672023
average:4701787
average:4355885
average:4338397
average:4446350
average:4360811
average:4653767
average:4016352
average:4312331
#### SPF 1
average:3685383
average:4029413
average:4051615
average:3747588
average:4058557
average:4042340
average:3971295
average:3752943
average:3750626
average:3777582

--ghgds33dkojdyykr--
