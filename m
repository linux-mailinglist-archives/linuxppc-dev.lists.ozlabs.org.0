Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E75228B47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 23:30:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBBZk4FStzDqk8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:30:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBBXw4qL5zDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 07:28:32 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LL2wsa152507; Tue, 21 Jul 2020 17:28:24 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vv3xnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 17:28:24 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LLA6KI024505;
 Tue, 21 Jul 2020 21:28:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 32brq826kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 21:28:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LLSJ7230146928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 21:28:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5257E11C050;
 Tue, 21 Jul 2020 21:28:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA3AB11C052;
 Tue, 21 Jul 2020 21:28:16 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.163.39.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 21 Jul 2020 21:28:16 +0000 (GMT)
Date: Tue, 21 Jul 2020 14:28:13 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] KVM: PPC: Book3S HV: move kvmppc_svm_page_out up
Message-ID: <20200721212813.GF7339@oc0525413822.ibm.com>
References: <20200721104202.15727-1-ldufour@linux.ibm.com>
 <20200721104202.15727-2-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721104202.15727-2-ldufour@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_15:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=871 malwarescore=0 clxscore=1011
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007210135
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com, paulus@samba.org, sukadev@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 12:42:01PM +0200, Laurent Dufour wrote:
> kvmppc_svm_page_out() will need to be called by kvmppc_uvmem_drop_pages()
> so move it upper in this file.
> 
> Furthermore it will be interesting to call this function when already
> holding the kvm->arch.uvmem_lock, so prefix the original function with __
> and remove the locking in it, and introduce a wrapper which call that
> function with the lock held.
> 
> There is no functional change.

Reviewed-by: Ram Pai <linuxram@us.ibm.com>

> 
> Cc: Ram Pai <linuxram@us.ibm.com>
> Cc: Bharata B Rao <bharata@linux.ibm.com>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---

RP
