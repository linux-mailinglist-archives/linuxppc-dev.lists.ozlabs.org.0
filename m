Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C576652A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 09:50:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kpB00TTnzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 17:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kp7N62yKzDqfS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 17:47:44 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6B7i9bv119109
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 03:47:41 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tp035jbvk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 03:47:41 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Thu, 11 Jul 2019 08:47:39 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 11 Jul 2019 08:47:37 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6B7la4j52297764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jul 2019 07:47:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EFD411C052;
 Thu, 11 Jul 2019 07:47:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAA0C11C050;
 Thu, 11 Jul 2019 07:47:35 +0000 (GMT)
Received: from [9.109.244.158] (unknown [9.109.244.158])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Jul 2019 07:47:35 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] powerpc/eeh: Handle hugepages in ioremap space
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20190710150517.27114-1-oohall@gmail.com>
Date: Thu, 11 Jul 2019 13:17:34 +0530
Content-Transfer-Encoding: 7bit
References: <20190710150517.27114-1-oohall@gmail.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19071107-0020-0000-0000-000003528D56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071107-0021-0000-0000-000021A6454F
Message-Id: <F0297020-030E-4480-877E-8FD3607C1506@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=607 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907110090
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 10-Jul-2019, at 8:35 PM, Oliver O'Halloran <oohall@gmail.com> wrote:
> 
> In commit 4a7b06c157a2 ("powerpc/eeh: Handle hugepages in ioremap
> space") support for using hugepages in the vmalloc and ioremap areas was
> enabled for radix. Unfortunately this broke EEH MMIO error checking.
> 
> Detection works by inserting a hook which checks the results of the
> ioreadXX() set of functions.  When a read returns a 0xFFs response we
> need to check for an error which we do by mapping the (virtual) MMIO
> address back to a physical address, then mapping physical address to a
> PCI device via an interval tree.
> 
> When translating virt -> phys we currently assume the ioremap space is
> only populated by PAGE_SIZE mappings. If a hugepage mapping is found we
> emit a WARN_ON(), but otherwise handles the check as though a normal
> page was found. In pathalogical cases such as copying a buffer
> containing a lot of 0xFFs from BAR memory this can result in the system
> not booting because it's too busy printing WARN_ON()s.
> 
> There's no real reason to assume huge pages can't be present and we're
> prefectly capable of handling them, so do that.
> 
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Fixes: 4a7b06c157a2 ("powerpc/eeh: Handle hugepages in ioremap space")
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin

