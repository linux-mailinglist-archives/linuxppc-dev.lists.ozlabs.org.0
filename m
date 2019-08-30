Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E588CA357E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 13:15:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KcNP0zT3zDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 21:15:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KcLF5xqPzDr2p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 21:13:56 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7UBCOEi129369
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 07:13:51 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uq0ksvp0r-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 07:13:51 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Fri, 30 Aug 2019 12:13:40 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 30 Aug 2019 12:13:38 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7UBDaHf59965478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Aug 2019 11:13:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BDB9A405F;
 Fri, 30 Aug 2019 11:13:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E47B3A405C;
 Fri, 30 Aug 2019 11:13:34 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.81.70])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Aug 2019 11:13:34 +0000 (GMT)
Date: Fri, 30 Aug 2019 16:43:32 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 1/7] kvmppc: Driver to manage pages of secure guest
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-2-bharata@linux.ibm.com>
 <20190829030219.GA17497@us.ibm.com>
 <20190829065642.GA31913@in.ibm.com>
 <20190829193911.GA26729@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829193911.GA26729@us.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19083011-0020-0000-0000-000003659D50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19083011-0021-0000-0000-000021BAF9A8
Message-Id: <20190830111332.GE31913@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-30_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=960 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908300122
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 12:39:11PM -0700, Sukadev Bhattiprolu wrote:
> Bharata B Rao [bharata@linux.ibm.com] wrote:
> > On Wed, Aug 28, 2019 at 08:02:19PM -0700, Sukadev Bhattiprolu wrote:
> Where do we serialize two threads attempting to H_SVM_PAGE_IN the same gfn
> at the same time? Or one thread issuing a H_SVM_PAGE_IN and another a
> H_SVM_PAGE_OUT for the same page?

I am not not serializing page-in/out calls on same gfn, I thought you take
care of that in UV, guess UV doesn't yet.

I can probably use rmap_lock() and serialize such calls in HV if UV can't
prevent such calls easily.

> > > > +
> > > > +	if (!trylock_page(dpage))
> > > > +		goto out_clear;
> > > > +
> > > > +	*rmap = devm_pfn | KVMPPC_RMAP_DEVM_PFN;
> > > > +	pvt = kzalloc(sizeof(*pvt), GFP_ATOMIC);
> > > > +	if (!pvt)
> > > > +		goto out_unlock;
> 
> If we fail to alloc, we don't clear the KVMPPC_RMAP_DEVM_PFN?

Right, I will move the assignment to *rmap to after kzalloc.

> 
> Also, when/where do we clear this flag on an uv-page-out?
> kvmppc_devm_drop_pages() drops the flag on a local variable but not
> in the rmap? If we don't clear the flag on page-out, would the
> subsequent H_SVM_PAGE_IN of this page fail?

It gets cleared in kvmppc_devm_page_free().

> 
> Ok. Nit. thought we can drop the "_fault" in the function name but would
> collide the other "alloc_and_copy" function used during H_SVM_PAGE_IN.
> If the two alloc_and_copy functions are symmetric, maybe they could
> have "page_in" and "page_out" in the (already long) names.

Christoph also suggested to reorganize these two calls. Will take care.

Regards,
Bharata.

