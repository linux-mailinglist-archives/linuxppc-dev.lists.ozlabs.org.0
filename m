Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B7912700C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 22:54:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f5JJ40kHzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 08:54:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sukadev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f5F331N9zDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 08:51:51 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBJLlcSd158979; Thu, 19 Dec 2019 16:51:43 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x0efrpfn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 16:51:43 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBJLpI4T023517;
 Thu, 19 Dec 2019 21:51:42 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 2wvqc7eecf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 21:51:42 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBJLpf6N32112990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 21:51:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 531AEAC05B;
 Thu, 19 Dec 2019 21:51:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35FBCAC059;
 Thu, 19 Dec 2019 21:51:41 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Dec 2019 21:51:41 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id AD58A2E0EC5; Thu, 19 Dec 2019 13:51:39 -0800 (PST)
Date: Thu, 19 Dec 2019 13:51:39 -0800
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH V3 2/2] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
Message-ID: <20191219215139.GB22629@us.ibm.com>
References: <20191215021104.GA27378@us.ibm.com>
 <20191215021208.GB27378@us.ibm.com>
 <20191218053632.GC29890@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218053632.GC29890@oak.ozlabs.ibm.com>
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-19_07:2019-12-17,2019-12-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=977 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912190162
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
Cc: linuxram@us.ibm.com, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Mackerras [paulus@ozlabs.org] wrote:
> On Sat, Dec 14, 2019 at 06:12:08PM -0800, Sukadev Bhattiprolu wrote:
> > 
> > Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
> > abort an SVM after it has issued the H_SVM_INIT_START and before the
> > H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
> > encounters security violations or other errors when starting an SVM.
> > 
> > Note that this hcall is different from UV_SVM_TERMINATE ucall which
> > is used by HV to terminate/cleanup an VM that has becore secure.
> > 
> > The H_SVM_INIT_ABORT should basically undo operations that were done
> > since the H_SVM_INIT_START hcall - i.e page-out all the VM pages back
> > to normal memory, and terminate the SVM.
> > 
> > (If we do not bring the pages back to normal memory, the text/data
> > of the VM would be stuck in secure memory and since the SVM did not
> > go secure, its MSR_S bit will be clear and the VM wont be able to
> > access its pages even to do a clean exit).
> > 
> > Based on patches and discussion with Paul Mackerras, Ram Pai and
> > Bharata Rao.
> > 
> > Signed-off-by: Ram Pai <linuxram@linux.ibm.com>
> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> 
> Minor comment below, but not a showstopper.  Also, as Bharata noted
> you need to hold the srcu lock for reading.

Yes, I fixed that.

> 
> > +	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> > +		struct kvm_memory_slot *memslot;
> > +		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
> > +
> > +		if (!slots)
> > +			continue;
> > +
> > +		kvm_for_each_memslot(memslot, slots)
> > +			kvmppc_uvmem_drop_pages(memslot, kvm, false);
> > +	}
> 
> Since we use the default KVM_ADDRESS_SPACE_NUM, which is 1, this code
> isn't wrong but it is more verbose than it needs to be.  It could be
> 
> 	kvm_for_each_memslot(kvm_memslots(kvm), slots)
> 		kvmppc_uvmem_drop_pages(memslot, kvm, false);

and simplified this.

Thanks.

Sukadev
