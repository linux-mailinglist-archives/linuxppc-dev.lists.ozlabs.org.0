Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD2323A15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:33:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4571b00XZNzDqKX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 00:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4571WD2fLhzDqD4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:29:43 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KERPKP039627
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 10:29:40 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2skv9bw727-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 10:29:35 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 20 May 2019 15:29:29 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 May 2019 15:29:27 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4KETQk911993118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 May 2019 14:29:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A680BA4053;
 Mon, 20 May 2019 14:29:26 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31FE9A405F;
 Mon, 20 May 2019 14:29:25 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.42.100])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 20 May 2019 14:29:25 +0000 (GMT)
Date: Mon, 20 May 2019 19:59:22 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: PROBLEM: Power9: kernel oops on memory hotunplug from ppc64le
 guest
References: <16a7a635-c592-27e2-75b4-d02071833278@linux.vnet.ibm.com>
 <20190518141434.GA22939@in.ibm.com>
 <878sv1993k.fsf@concordia.ellerman.id.au>
 <20190520042533.GB22939@in.ibm.com>
 <1558327521.633yjtl8ki.astroid@bobo.none>
 <20190520055622.GC22939@in.ibm.com>
 <1558335484.9inx69a7ea.astroid@bobo.none>
 <20190520082035.GD22939@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520082035.GD22939@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19052014-0020-0000-0000-0000033E9E0D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052014-0021-0000-0000-000021917620
Message-Id: <20190520142922.GE22939@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905200096
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
Reply-To: bharata@linux.ibm.com
Cc: bharata@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, aneesh.kumar@linux.ibm.com,
 srikanth <sraithal@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 01:50:35PM +0530, Bharata B Rao wrote:
> On Mon, May 20, 2019 at 05:00:21PM +1000, Nicholas Piggin wrote:
> > Bharata B Rao's on May 20, 2019 3:56 pm:
> > > On Mon, May 20, 2019 at 02:48:35PM +1000, Nicholas Piggin wrote:
> > >> >> > git bisect points to
> > >> >> >
> > >> >> > commit 4231aba000f5a4583dd9f67057aadb68c3eca99d
> > >> >> > Author: Nicholas Piggin <npiggin@gmail.com>
> > >> >> > Date:   Fri Jul 27 21:48:17 2018 +1000
> > >> >> >
> > >> >> >     powerpc/64s: Fix page table fragment refcount race vs speculative references
> > >> >> >
> > >> >> >     The page table fragment allocator uses the main page refcount racily
> > >> >> >     with respect to speculative references. A customer observed a BUG due
> > >> >> >     to page table page refcount underflow in the fragment allocator. This
> > >> >> >     can be caused by the fragment allocator set_page_count stomping on a
> > >> >> >     speculative reference, and then the speculative failure handler
> > >> >> >     decrements the new reference, and the underflow eventually pops when
> > >> >> >     the page tables are freed.
> > >> >> >
> > >> >> >     Fix this by using a dedicated field in the struct page for the page
> > >> >> >     table fragment allocator.
> > >> >> >
> > >> >> >     Fixes: 5c1f6ee9a31c ("powerpc: Reduce PTE table memory wastage")
> > >> >> >     Cc: stable@vger.kernel.org # v3.10+
> > >> >> 
> > >> >> That's the commit that added the BUG_ON(), so prior to that you won't
> > >> >> see the crash.
> > >> > 
> > >> > Right, but the commit says it fixes page table page refcount underflow by
> > >> > introducing a new field &page->pt_frag_refcount. Now we are hitting the underflow
> > >> > for this pt_frag_refcount.
> > >> 
> > >> The fixed underflow is caused by a bug (race on page count) that got 
> > >> fixed by that patch. You are hitting a different underflow here. It's
> > >> not certain my patch caused it, I'm just trying to reproduce now.
> > > 
> > > Ok.
> > 
> > Can't reproduce I'm afraid, tried adding and removing 8GB memory from a
> > 4GB guest (via host adding / removing memory device), and it just works.
> 
> Boot, add 8G, reboot, remove 8G is the sequence to reproduce.
> 
> > 
> > It's likely to be an edge case like an off by one or rounding error
> > that just happens to trigger in your config. Might be easiest if you
> > could test with a debug patch.
> 
> Sure, I will continue debugging.

When the guest is rebooted after hotplug, the entire memory (which includes
the hotplugged memory) gets remapped again freshly. However at this time
since no slab is available yet, pt_frag_refcount never gets initialized as we
never do pte_fragment_alloc() for these mappings. So we right away hit the
underflow during the first unplug itself, it looks like.

I will check how this can be fixed.

> 
> Regards,
> Bharata.

