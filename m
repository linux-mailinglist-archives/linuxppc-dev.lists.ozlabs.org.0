Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D61EDB39
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 04:33:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cqb51b76zDqg5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 12:33:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cqY15ksSzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 12:31:49 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05422U24059338; Wed, 3 Jun 2020 22:31:42 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dr0k1k21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 22:31:42 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0542LObH031167;
 Thu, 4 Jun 2020 02:31:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 31bf483ph4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 02:31:39 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0542ULK825952622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jun 2020 02:30:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA9CB52052;
 Thu,  4 Jun 2020 02:31:36 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.52.252])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 817905204E;
 Thu,  4 Jun 2020 02:31:34 +0000 (GMT)
Date: Thu, 4 Jun 2020 08:01:32 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v1 3/4] KVM: PPC: Book3S HV: migrate remaining
 normal-GFNs to secure-GFNs in H_SVM_INIT_DONE
Message-ID: <20200604023132.GC31382@in.ibm.com>
References: <1590892071-25549-1-git-send-email-linuxram@us.ibm.com>
 <1590892071-25549-4-git-send-email-linuxram@us.ibm.com>
 <20200601115518.GA31382@in.ibm.com>
 <20200601190535.GA6925@oc0525413822.ibm.com>
 <20200602100639.GB31382@in.ibm.com>
 <20200603231025.GA5772@oc0525413822.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603231025.GA5772@oc0525413822.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 adultscore=0 impostorscore=0 cotscore=-2147483648 phishscore=0
 mlxlogscore=966 spamscore=0 priorityscore=1501 suspectscore=1
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006040009
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
Cc: rcampbell@nvidia.com, ldufour@linux.ibm.com, cclaudio@linux.ibm.com,
 kvm-ppc@vger.kernel.org, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 04:10:25PM -0700, Ram Pai wrote:
> On Tue, Jun 02, 2020 at 03:36:39PM +0530, Bharata B Rao wrote:
> > On Mon, Jun 01, 2020 at 12:05:35PM -0700, Ram Pai wrote:
> > > On Mon, Jun 01, 2020 at 05:25:18PM +0530, Bharata B Rao wrote:
> > > > On Sat, May 30, 2020 at 07:27:50PM -0700, Ram Pai wrote:
> > > > > H_SVM_INIT_DONE incorrectly assumes that the Ultravisor has explicitly
> > > > > called H_SVM_PAGE_IN for all secure pages.
> > > > 
> > > > I don't think that is quite true. HV doesn't assume anything about
> > > > secure pages by itself.
> > > 
> > > Yes. Currently, it does not assume anything about secure pages.  But I am
> > > proposing that it should consider all pages (except the shared pages) as
> > > secure pages, when H_SVM_INIT_DONE is called.
> > 
> > Ok, then may be also add the proposed changes to H_SVM_INIT_DONE
> > documentation.
> 
> ok.
> 
> > 
> > > 
> > > In other words, HV should treat all pages; except shared pages, as
> > > secure pages once H_SVM_INIT_DONE is called. And this includes pages
> > > added subsequently through memory hotplug.
> > 
> > So after H_SVM_INIT_DONE, if HV touches a secure page for any
> > reason and gets encrypted contents via page-out, HV drops the
> > device pfn at that time. So what state we would be in that case? We
> > have completed H_SVM_INIT_DONE, but still have a normal (but encrypted)
> > page in HV?
> 
> Good point.
> 
> The corresponding GFN will continue to be a secure GFN. Just that its
> backing PFN is not a device-PFN, but a memory-PFN. Also that backing
> memory-PFN contains encrypted content.
> 
> I will clarify this in the patch; about secure-GFN state.

I feel all this is complicating the states in HV and is avoidable
if UV just issued page-in calls during memslot registration uvcall.

Regards,
Bharata.
