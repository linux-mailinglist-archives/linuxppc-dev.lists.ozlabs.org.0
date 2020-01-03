Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D6612F2E6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 03:22:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ppZT1S0JzDqCg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 13:22:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ppXb0CrHzDqC4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2020 13:20:30 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0032J7Li108999
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Jan 2020 21:20:27 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x6njcu5ed-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2020 21:20:27 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 3 Jan 2020 02:20:26 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Jan 2020 02:20:23 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0032KMuH50462858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jan 2020 02:20:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D91F042041;
 Fri,  3 Jan 2020 02:20:22 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC0A942049;
 Fri,  3 Jan 2020 02:20:20 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.213.131])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Jan 2020 02:20:20 +0000 (GMT)
Date: Thu, 2 Jan 2020 18:20:17 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 2/2] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
References: <20191215021104.GA27378@us.ibm.com>
 <20191215021208.GB27378@us.ibm.com>
 <20200103001814.GD5556@oc0525413822.ibm.com>
 <20200103003233.GA16216@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103003233.GA16216@us.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20010302-0020-0000-0000-0000039D642D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010302-0021-0000-0000-000021F4B42D
Message-Id: <20200103022017.GF5556@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-02_08:2020-01-02,2020-01-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=699 bulkscore=0
 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001030020
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
Cc: kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 02, 2020 at 04:32:33PM -0800, Sukadev Bhattiprolu wrote:
> Ram Pai [linuxram@us.ibm.com] wrote:
> > > +unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
> > > +{
> > > +	int i;
> > > +
> > > +	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
> > > +		return H_UNSUPPORTED;
> > 
> > It should also return H_UNSUPPORTED when 
> > (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE) is true.
> 
> If KVMPPC_SECURE_INIT_DONE is set, KVMPPC_SECURE_INIT_START is also
> set - we never clear KVMPPC_SECURE_INIT_START right?

I am concerned about the case, where the VM has successfully
transitioned into a SVM, where both KVMPPC_SECURE_INIT_DONE and
KVMPPC_SECURE_INIT_START are set.

In this scenario, if the UV makes a H_SVM_INIT_ABORT hcall, the
Hypervisor will not return H_UNSUPPORTED, because
KVMPPC_SECURE_INIT_START is set.

That is the reason, I think, we need to add another check as below.

if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
	return H_UNSUPPORTED;



> 
> Sukadev

-- 
Ram Pai

