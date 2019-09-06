Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D2AB740
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 13:38:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PwYp5tVNzDq83
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 21:38:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PwWf41ctzDr7q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 21:37:01 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x86BadTm089538
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Sep 2019 07:36:55 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uunksa8xp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2019 07:36:54 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Fri, 6 Sep 2019 12:36:46 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Sep 2019 12:36:45 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x86Bahag46399692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Sep 2019 11:36:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AA2652054;
 Fri,  6 Sep 2019 11:36:43 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.53.172])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id B556A5204E;
 Fri,  6 Sep 2019 11:36:41 +0000 (GMT)
Date: Fri, 6 Sep 2019 17:06:39 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v7 1/7] kvmppc: Driver to manage pages of secure guest
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-2-bharata@linux.ibm.com>
 <20190829083810.GA13039@lst.de> <20190830034259.GD31913@in.ibm.com>
 <20190902075356.GA28967@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902075356.GA28967@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19090611-0008-0000-0000-00000311D8FF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090611-0009-0000-0000-00004A303630
Message-Id: <20190906113639.GA8748@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-06_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=993 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909060123
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
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 02, 2019 at 09:53:56AM +0200, Christoph Hellwig wrote:
> On Fri, Aug 30, 2019 at 09:12:59AM +0530, Bharata B Rao wrote:
> > On Thu, Aug 29, 2019 at 10:38:10AM +0200, Christoph Hellwig wrote:
> > > On Thu, Aug 22, 2019 at 03:56:14PM +0530, Bharata B Rao wrote:
> > > > +/*
> > > > + * Bits 60:56 in the rmap entry will be used to identify the
> > > > + * different uses/functions of rmap.
> > > > + */
> > > > +#define KVMPPC_RMAP_DEVM_PFN	(0x2ULL << 56)
> > > 
> > > How did you come up with this specific value?
> > 
> > Different usage types of RMAP array are being defined.
> > https://patchwork.ozlabs.org/patch/1149791/
> > 
> > The above value is reserved for device pfn usage.
> 
> Shouldn't all these defintions go in together in a patch?

Ideally yes, but the above patch is already in Paul's tree, I will sync
up with him about this.

> Also is bit 56+ a set of values, so is there 1 << 56 and 3 << 56 as well?  Seems
> like even that other patch doesn't fully define these "pfn" values.

I realized that the bit numbers have changed, it is no longer bits 60:56,
but instead top 8bits. 

#define KVMPPC_RMAP_UVMEM_PFN   0x0200000000000000
static inline bool kvmppc_rmap_is_uvmem_pfn(unsigned long *rmap)
{
        return ((*rmap & 0xff00000000000000) == KVMPPC_RMAP_UVMEM_PFN);
}

> 
> > > No need for !! when returning a bool.  Also the helper seems a little
> > > pointless, just opencoding it would make the code more readable in my
> > > opinion.
> > 
> > I expect similar routines for other usages of RMAP to come up.
> 
> Please drop them all.  Having to wade through a header to check for
> a specific bit that also is set manually elsewhere in related code
> just obsfucates it for the reader.

I am currently using the routine kvmppc_rmap_is_uvmem_pfn() (shown
above) instead open coding it at multiple places, but I can drop it if
you prefer.

Regards,
Bharata.

