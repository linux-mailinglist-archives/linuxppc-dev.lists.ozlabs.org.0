Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24473F4035
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 07:07:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478VDV2VzjzF6n0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 17:07:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 478VBl3qmhzF6ls
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 17:06:06 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA8654u1053599
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 8 Nov 2019 01:06:03 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w526u8vdh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 01:06:03 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 8 Nov 2019 06:06:01 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 8 Nov 2019 06:05:57 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA865uKi55050352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Nov 2019 06:05:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4BD84203F;
 Fri,  8 Nov 2019 06:05:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE77642041;
 Fri,  8 Nov 2019 06:05:51 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.217.215])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  8 Nov 2019 06:05:51 +0000 (GMT)
Date: Thu, 7 Nov 2019 22:05:48 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <1572902923-8096-1-git-send-email-linuxram@us.ibm.com>
 <1572902923-8096-2-git-send-email-linuxram@us.ibm.com>
 <87h83g568t.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h83g568t.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19110806-0016-0000-0000-000002C1CDF4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110806-0017-0000-0000-000033235396
Message-Id: <20191108060548.GI5201@oc0525413822.ibm.com>
Subject: RE: [RFC v1 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-08_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911080060
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
Cc: andmike@us.ibm.com, mst@redhat.com, aik@ozlabs.ru,
 mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 07, 2019 at 09:29:54PM +1100, Michael Ellerman wrote:
> Ram Pai <linuxram@us.ibm.com> writes:
> > The hypervisor needs to access the contents of the page holding the TCE
> > entries while setting up the TCE entries in the IOMMU's TCE table. For
> > SecureVMs, since this page is encrypted, the hypervisor cannot access
> > valid entries. Share the page with the hypervisor. This ensures that the
> > hypervisor sees the valid entries.
> 
> Can you please give people some explanation of why this is safe. After
> all the point of the Ultravisor is to protect the guest from a malicious
> hypervisor. Giving the hypervisor access to a page of TCEs sounds
> dangerous, so please explain why it's not.

Yes. will do, in my next version of the patch.

BTW: this page, which is shareed with the hypervisor contains nothing
but TCE entries. The hypervisor has a need to see those entries, so that it
can update the TCE table with correct entires.

Yes, a malicious hypervisor may try to update the TCE table with entries
that point to incorrect memory location.  But doing so will not help the
hypervisor to steal any data from those memory location, because those
memory location; if accessed by the hypervisor, will only fetch
encrypted data.

At most it can lead to denial of service, but not stolen data.

RP

