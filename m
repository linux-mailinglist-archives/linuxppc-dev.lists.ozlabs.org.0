Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C07A22AD73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 13:16:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC8t40jlDzDr9N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 21:16:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC8r34D2XzDr5j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 21:14:59 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NB1pho107211; Thu, 23 Jul 2020 07:14:45 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32f6wbvgn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 07:14:45 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NB6ebv016600;
 Thu, 23 Jul 2020 11:14:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 32brq839fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 11:14:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NBEe0230277936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 11:14:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD5AFA405B;
 Thu, 23 Jul 2020 11:14:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40564A4054;
 Thu, 23 Jul 2020 11:14:38 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.150.76])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jul 2020 11:14:38 +0000 (GMT)
Date: Thu, 23 Jul 2020 04:14:35 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [v4 2/5] KVM: PPC: Book3S HV: track the state GFNs associated
 with secure VMs
Message-ID: <20200723111435.GA5493@oc0525413822.ibm.com>
References: <1594972827-13928-1-git-send-email-linuxram@us.ibm.com>
 <1594972827-13928-3-git-send-email-linuxram@us.ibm.com>
 <20200723044830.GT7902@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723044830.GT7902@in.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_03:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230081
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 10:18:30AM +0530, Bharata B Rao wrote:
> On Fri, Jul 17, 2020 at 01:00:24AM -0700, Ram Pai wrote:
> >  	pvt->gpa = gpa;
..snip..
> >  	pvt->kvm = kvm;
> > @@ -524,6 +663,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
> >  		uvmem_page = pfn_to_page(uvmem_pfn);
> >  		pvt = uvmem_page->zone_device_data;
> >  		pvt->skip_page_out = true;
> > +		pvt->remove_gfn = false;
> >  	}
> >  
> >  retry:
> > @@ -537,12 +677,16 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
> >  		uvmem_page = pfn_to_page(uvmem_pfn);
> >  		pvt = uvmem_page->zone_device_data;
> >  		pvt->skip_page_out = true;
> > +		pvt->remove_gfn = false;
> 
> This is the case of making an already secure page as shared page.
> A comment here as to why remove_gfn is set to false here will help.
> 
> Also isn't it by default false? Is there a situation where it starts
> out by default false, becomes true later and you are required to
> explicitly mark it false here?

It is by default false. And will be true when the GFN is
released/invalidated through kvmppc_uvmem_drop_pages().

It is marked false explicitly here, just to be safe, and protect
against any implicit changes.

> 
> Otherwise, Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>
> 
Thanks for the review.

RP
