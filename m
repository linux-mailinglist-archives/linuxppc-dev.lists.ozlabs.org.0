Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 029833AFDA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 09:13:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Hg8410Kz3btW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 17:13:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FXh8TvdB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FXh8TvdB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Hfg2CTzz301J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 17:12:58 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15M72ixN164405; Tue, 22 Jun 2021 03:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=aI8XFhwHUSaejHBEuDiQsvYp+AGGM47cYndk5QgMGDo=;
 b=FXh8TvdBvXdeC6416pSiiDFQ1ZZWoahCu0S4YT+WlLOqlPDVdAYDbdK0GXL1HZNocKS4
 pz0LqakT8KAcHFc2Ly1VaLjH++M2ZhKR3TJtuFiYIFwmS/x3b2sJlrSpE8p4wwlRMSYt
 IDc5d4DcGfvC6s9Bk+Opjiaj68LHCbrGQEnuMx7aqpPiiJdKPlFDefDifYlg449PAiG3
 2y51Y0nNqxxyFJjjDdEpdHSsnb8d2TPJYYWdBHUYkU7py65HxOCtmzpeYPte5Hb7oGwq
 pUX+sb+1tUiVqedNfCOUESyyPnYFqCaPzsQSY6SutljfQMqguOceMeYlQPQiN2pxu2Ob vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b8urkqa7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 03:12:49 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15M73L7G166220;
 Tue, 22 Jun 2021 03:12:48 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b8urkq9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 03:12:48 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15M7BhDm003237;
 Tue, 22 Jun 2021 07:12:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 399878997c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 07:12:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15M7CiOa21430726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 07:12:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BC1F11C069;
 Tue, 22 Jun 2021 07:12:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1268911C054;
 Tue, 22 Jun 2021 07:12:43 +0000 (GMT)
Received: from in.ibm.com (unknown [9.77.207.147])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 22 Jun 2021 07:12:42 +0000 (GMT)
Date: Tue, 22 Jun 2021 12:42:25 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Nathan Chancellor <nathan@kernel.org>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, farosas@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com, david@gibson.dropbear.id.au
Subject: Re: [PATCH v8 4/6] KVM: PPC: Book3S HV: Nested support in
 H_RPT_INVALIDATE
Message-ID: <YNGNWRsUgRiMqrGs@in.ibm.com>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
 <20210621085003.904767-5-bharata@linux.ibm.com>
 <YNDIitJ3Hn1/G8Jw@Ryzen-9-3900X.localdomain>
 <YNFom3Ojb4TGsKj2@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNFom3Ojb4TGsKj2@in.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i3ii2YbwlkjjAqgE48I7PNsWFxs2XBD7
X-Proofpoint-GUID: KAzww0lJmmjcB_vEN_1CNotKmxQGp1vD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_04:2021-06-21,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220043
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 22, 2021 at 10:05:45AM +0530, Bharata B Rao wrote:
> On Mon, Jun 21, 2021 at 10:12:42AM -0700, Nathan Chancellor wrote:
> > I have not seen this reported yet so apologies if it has and there is a
> > fix I am missing:
> > 
> > arch/powerpc/kvm/book3s_hv_nested.c:1334:11: error: variable 'ap' is uninitialized when used here [-Werror,-Wuninitialized]
> >                                                            ap, start, end);
> >                                                            ^~
> > arch/powerpc/kvm/book3s_hv_nested.c:1276:25: note: initialize the variable 'ap' to silence this warning
> >         unsigned long psize, ap;
> >                                ^
> >                                 = 0
> 
> Thanks for catching this, this wasn't caught in my environment.
> 
> I will repost the series with proper initialization to ap.

Michael,

Here is the fix for this on top of powerpc/next. If it is easier
and cleaner to fold this into the original series and re-post
the whole series against any updated tree, let me know.


From 2e7198e28c0d1137f3230d4645e9cfddaccf4987 Mon Sep 17 00:00:00 2001
From: Bharata B Rao <bharata@linux.ibm.com>
Date: Tue, 22 Jun 2021 12:07:01 +0530
Subject: [PATCH 1/1] KVM: PPC: Book3S HV: Use proper ap value in
 H_RPT_INVALIDATE

The ap value that is used when performing range based partition
scoped invalidations for the nested guests wasn't initialized
correctly.

Fix this and while we are here, reorganize the routine that does
this invalidation for better readability.

Fixes: 0e67d866cb32 ("KVM: PPC: Book3S HV: Nested support in H_RPT_INVALIDATE")
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 90 +++++++++++++----------------
 1 file changed, 40 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index d78efb5f5bb3..3a06ac0b53e2 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1222,27 +1222,6 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
 	return H_SUCCESS;
 }
 
-static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
-					 unsigned long lpid,
-					 unsigned long page_size,
-					 unsigned long ap,
-					 unsigned long start,
-					 unsigned long end)
-{
-	unsigned long addr = start;
-	int ret;
-
-	do {
-		ret = kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
-						   get_epn(addr));
-		if (ret)
-			return ret;
-		addr += page_size;
-	} while (addr < end);
-
-	return ret;
-}
-
 static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
 					 unsigned long lpid, unsigned long ric)
 {
@@ -1263,6 +1242,42 @@ static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
  */
 static unsigned long tlb_range_flush_page_ceiling __read_mostly = 33;
 
+static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
+					 unsigned long lpid,
+					 unsigned long pg_sizes,
+					 unsigned long start,
+					 unsigned long end)
+{
+	int ret = H_P4;
+	unsigned long addr, nr_pages;
+	struct mmu_psize_def *def;
+	unsigned long psize, ap, page_size;
+	bool flush_lpid;
+
+	for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
+		def = &mmu_psize_defs[psize];
+		if (!(pg_sizes & def->h_rpt_pgsize))
+			continue;
+
+		nr_pages = (end - start) >> def->shift;
+		flush_lpid = nr_pages > tlb_range_flush_page_ceiling;
+		if (flush_lpid)
+			return do_tlb_invalidate_nested_all(vcpu, lpid,
+							RIC_FLUSH_TLB);
+		addr = start;
+		ap = mmu_get_ap(psize);
+		page_size = 1UL << def->shift;
+		do {
+			ret = kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
+						   get_epn(addr));
+			if (ret)
+				return H_P4;
+			addr += page_size;
+		} while (addr < end);
+	}
+	return ret;
+}
+
 /*
  * Performs partition-scoped invalidations for nested guests
  * as part of H_RPT_INVALIDATE hcall.
@@ -1271,10 +1286,6 @@ long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
 			     unsigned long type, unsigned long pg_sizes,
 			     unsigned long start, unsigned long end)
 {
-	struct kvm_nested_guest *gp;
-	long ret;
-	unsigned long psize, ap;
-
 	/*
 	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
 	 *
@@ -1284,8 +1295,7 @@ long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
 	 * H_ENTER_NESTED call. Since we can't differentiate this case from
 	 * the invalid case, we ignore such flush requests and return success.
 	 */
-	gp = kvmhv_find_nested(vcpu->kvm, lpid);
-	if (!gp)
+	if (!kvmhv_find_nested(vcpu->kvm, lpid))
 		return H_SUCCESS;
 
 	/*
@@ -1313,29 +1323,9 @@ long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
 	if (start == 0 && end == -1)
 		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_TLB);
 
-	if (type & H_RPTI_TYPE_TLB) {
-		struct mmu_psize_def *def;
-		bool flush_lpid;
-		unsigned long nr_pages;
-
-		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
-			def = &mmu_psize_defs[psize];
-			if (!(pg_sizes & def->h_rpt_pgsize))
-				continue;
-
-			nr_pages = (end - start) >> def->shift;
-			flush_lpid = nr_pages > tlb_range_flush_page_ceiling;
-			if (flush_lpid)
-				return do_tlb_invalidate_nested_all(vcpu, lpid,
-								RIC_FLUSH_TLB);
-
-			ret = do_tlb_invalidate_nested_tlb(vcpu, lpid,
-							   (1UL << def->shift),
-							   ap, start, end);
-			if (ret)
-				return H_P4;
-		}
-	}
+	if (type & H_RPTI_TYPE_TLB)
+		return do_tlb_invalidate_nested_tlb(vcpu, lpid, pg_sizes,
+						    start, end);
 	return H_SUCCESS;
 }
 
-- 
2.31.1

