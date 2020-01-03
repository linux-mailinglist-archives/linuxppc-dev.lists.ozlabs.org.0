Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1012F2D4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 03:08:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ppH64mVtzDqDC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 13:08:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ppF65J3DzDq9L
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2020 13:07:06 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00322OEg085352
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Jan 2020 21:07:02 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x88jwhm54-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2020 21:07:02 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 3 Jan 2020 02:07:00 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Jan 2020 02:06:57 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00326t7C54591496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jan 2020 02:06:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 566EE11C05E;
 Fri,  3 Jan 2020 02:06:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BBE311C066;
 Fri,  3 Jan 2020 02:06:53 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.213.131])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Jan 2020 02:06:53 +0000 (GMT)
Date: Thu, 2 Jan 2020 18:06:50 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
References: <20191216041924.42318-1-aik@ozlabs.ru>
 <20191216041924.42318-5-aik@ozlabs.ru>
 <20200102222106.GB5556@oc0525413822.ibm.com>
 <20200103000849.GL2098@umbus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103000849.GL2098@umbus>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20010302-4275-0000-0000-000003943CC5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010302-4276-0000-0000-000038A82092
Message-Id: <20200103020650.GE5556@oc0525413822.ibm.com>
Subject: RE: [PATCH kernel v2 4/4] powerpc/pseries/svm: Allow IOMMU to work in
 SVM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-02_08:2020-01-02,2020-01-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=753 mlxscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=18 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001030018
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Michael Anderson <andmike@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 03, 2020 at 11:08:49AM +1100, David Gibson wrote:
> On Thu, Jan 02, 2020 at 02:21:06PM -0800, Ram Pai wrote:
> > On Mon, Dec 16, 2019 at 03:19:24PM +1100, Alexey Kardashevskiy wrote:
> > > H_PUT_TCE_INDIRECT uses a shared page to send up to 512 TCE to
> > > a hypervisor in a single hypercall.
> > 
> > Actually H_PUT_TCE_INDIRECT never used shared page.  It would have
> > used shared pages if the 'shared-page' solution was accepted. :)
> 
> Well, it depends what you mean by "shared".  In the non-PEF case we do
> use a shared page in the sense that it is accessed by both guest and
> hypervisor.  It's just not shared in the PEF sense.

Ah..I see. That sentence can be right or wrong based on the reader's
interpretion of the phrase 'shared page'.  To me a 'shared page' is a
page that is **explicitly** shared with the hypervisor. However I can see
'shared page' to mean a page that is simply shared; either implicitly or
explicitly.

Given that, there is a possibility for mis-interpretation, I think, it
might be better to avoid the phrase 'shared page' if possible.

> 
> > > This does not work for secure VMs
> > > as the page needs to be shared or the VM should use H_PUT_TCE instead.
> > 
> > Maybe you should say something like this.. ?
> > 
> > H_PUT_TCE_INDIRECT does not work for secure VMs, since the page
> > containing the TCE entries is not accessible to the hypervisor.
> > 
> > > 

..snip.

-- 
Ram Pai

