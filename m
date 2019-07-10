Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D864B3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 19:11:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kQhR3yTdzDqsv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 03:11:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kQfN0hMWzDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 03:09:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45kQfM4MBDz8t6X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 03:09:47 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45kQfM34j2z9s4Y; Thu, 11 Jul 2019 03:09:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=linuxram@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45kQfL69Q0z9sN6
 for <linuxppc-dev@ozlabs.org>; Thu, 11 Jul 2019 03:09:46 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6AH3aOm049269
 for <linuxppc-dev@ozlabs.org>; Wed, 10 Jul 2019 13:09:43 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tnkvugqsg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 10 Jul 2019 13:09:43 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <linuxram@us.ibm.com>;
 Wed, 10 Jul 2019 18:09:41 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Jul 2019 18:09:39 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6AH9crS35389764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 17:09:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1318252059;
 Wed, 10 Jul 2019 17:09:38 +0000 (GMT)
Received: from ram.ibm.com (unknown [9.80.212.138])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 571E052054;
 Wed, 10 Jul 2019 17:09:35 +0000 (GMT)
Date: Wed, 10 Jul 2019 10:09:32 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: janani <janani@linux.ibm.com>
Subject: Re: [PATCH v4 5/8] KVM: PPC: Ultravisor: Restrict flush of the
 partition tlb cache
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-6-cclaudio@linux.ibm.com>
 <134bd0eb97ed6cc616ced38732b9b52c@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <134bd0eb97ed6cc616ced38732b9b52c@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19071017-0008-0000-0000-000002FBA977
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071017-0009-0000-0000-000022690EB6
Message-Id: <20190710170932.GA4864@ram.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907100192
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 08, 2019 at 02:54:52PM -0500, janani wrote:
> On 2019-06-28 15:08, Claudio Carvalho wrote:
> >From: Ram Pai <linuxram@us.ibm.com>
> >
> >Ultravisor is responsible for flushing the tlb cache, since it manages
> >the PATE entries. Hence skip tlb flush, if the ultravisor firmware is
> >available.
> >
> >Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> >Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> >---
> > arch/powerpc/mm/book3s64/pgtable.c | 33 +++++++++++++++++-------------
> > 1 file changed, 19 insertions(+), 14 deletions(-)
> >
> >diff --git a/arch/powerpc/mm/book3s64/pgtable.c
> >b/arch/powerpc/mm/book3s64/pgtable.c
> >index 224c5c7c2e3d..bc8eb2bf9810 100644
> >--- a/arch/powerpc/mm/book3s64/pgtable.c
> >+++ b/arch/powerpc/mm/book3s64/pgtable.c
> >@@ -224,6 +224,23 @@ void __init mmu_partition_table_init(void)
> > 	powernv_set_nmmu_ptcr(ptcr);
> > }
> >
> >+static void flush_partition(unsigned int lpid, unsigned long dw0)
> >+{
> >+	if (dw0 & PATB_HR) {
> >+		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 1) : :
> >+			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> >+		asm volatile(PPC_TLBIE_5(%0, %1, 2, 1, 1) : :
> >+			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> >+		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
> >+	} else {
> >+		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 0) : :
> >+			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> >+		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
> >+	}
> >+	/* do we need fixup here ?*/
> >+	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> >+}
> >+
> > static void __mmu_partition_table_set_entry(unsigned int lpid,
> > 					    unsigned long dw0,
> > 					    unsigned long dw1)
> >@@ -238,20 +255,8 @@ static void
> >__mmu_partition_table_set_entry(unsigned int lpid,
> > 	 * The type of flush (hash or radix) depends on what the previous
> > 	 * use of this partition ID was, not the new use.
> > 	 */
> >-	asm volatile("ptesync" : : : "memory");
>  Doesn't the line above that was deleted need to be added to the
> beginning of flush_partition()

It has to. It got dropped erroneously.

This is a good catch!

Thanks,
RP

