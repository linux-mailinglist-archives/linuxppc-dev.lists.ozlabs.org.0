Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6C3763C8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 12:30:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc6DG16dcz2yYB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 20:30:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FRP3pSO0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FRP3pSO0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc6Cj6bbrz2yXT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 20:30:25 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147A306v116896; Fri, 7 May 2021 06:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=1ml/AUzZnFSZZXsPC0jgeX9RvmwYreSVg111ykGu7dA=;
 b=FRP3pSO0S6WEZICt9uo8a5LZxnr71jcljZCsIE7XYv4sXvUsVSTUDl3mvESgJZyh39QB
 rWIyzN/5Xyn3mmAlUzDQj0TfaJ2r91AsVwuDCt+Vcg4QLBxKyba3ih0ahFedbQ8f+ZKJ
 k5oaq5SHaSMIZhkw4B36WOBGekGQmW1tVSr2qopSeBuvA2fWn4HEY/I0hDJFYW3av9Y1
 /NwUYE68erKjvSzckPMNNsscjiG8UVHnJjw8lBmIlYkpVpy15g1pIIysuNPHBiP3/rXl
 CzZuKL7fv5ZtlgFIDiALjJDT/A0/qlxQZPvQJkNLh9e/xoy9FlW9Q5HfSD3PlGo5Ip9d Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38d36xh2rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 06:30:16 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 147ARDjh015341;
 Fri, 7 May 2021 06:30:16 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38d36xh2rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 06:30:16 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 147ABT9a029676;
 Fri, 7 May 2021 10:30:15 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 38csqyb91k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 10:30:15 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 147AUFOP13238636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 May 2021 10:30:15 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 116A2B2066;
 Fri,  7 May 2021 10:30:15 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CDCCB205F;
 Fri,  7 May 2021 10:30:11 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.85.249])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  7 May 2021 10:30:10 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Bharata B Rao <bharata@linux.ibm.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 4/6] KVM: PPC: Book3S HV: Nested support in
 H_RPT_INVALIDATE
In-Reply-To: <1620280840.cytifux60q.astroid@bobo.none>
References: <20210505154642.178702-1-bharata@linux.ibm.com>
 <20210505154642.178702-5-bharata@linux.ibm.com>
 <1620280840.cytifux60q.astroid@bobo.none>
Date: Fri, 07 May 2021 16:00:08 +0530
Message-ID: <87wnsa6dlb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vFAHQEF2oDgmsyvwTCq1oIs6XlMNH59j
X-Proofpoint-ORIG-GUID: MjFtjxyeFxv00ovOU3HabK2-Hd2_8DVK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_03:2021-05-06,
 2021-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105070069
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
Cc: david@gibson.dropbear.id.au, farosas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:


...

> + */
>> +long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
>> +			     unsigned long type, unsigned long pg_sizes,
>> +			     unsigned long start, unsigned long end)
>> +{
>> +	struct kvm_nested_guest *gp;
>> +	long ret;
>> +	unsigned long psize, ap;
>> +
>> +	/*
>> +	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
>> +	 *
>> +	 * However, nested KVM issues a L2 lpid flush call when creating
>> +	 * partition table entries for L2. This happens even before the
>> +	 * corresponding shadow lpid is created in HV which happens in
>> +	 * H_ENTER_NESTED call. Since we can't differentiate this case from
>> +	 * the invalid case, we ignore such flush requests and return success.
>> +	 */
>> +	gp = kvmhv_find_nested(vcpu->kvm, lpid);
>> +	if (!gp)
>> +		return H_SUCCESS;
>> +
>> +	/*
>> +	 * A flush all request can be handled by a full lpid flush only.
>> +	 */
>> +	if ((type & H_RPTI_TYPE_NESTED_ALL) == H_RPTI_TYPE_NESTED_ALL)
>> +		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_ALL);
>> +
>> +#if 0
>> +	/*
>> +	 * We don't need to handle a PWC flush like process table here,
>> +	 * because intermediate partition scoped table in nested guest doesn't
>> +	 * really have PWC. Only level we have PWC is in L0 and for nested
>> +	 * invalidate at L0 we always do kvm_flush_lpid() which does
>> +	 * radix__flush_all_lpid(). For range invalidate at any level, we
>> +	 * are not removing the higher level page tables and hence there is
>> +	 * no PWC invalidate needed.
>> +	 */
>> +	if (type & H_RPTI_TYPE_PWC) {
>> +		ret = do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_PWC);
>> +		if (ret)
>> +			return H_P4;
>> +	}
>> +#endif
>
> I think removing this #if 0 and the unnecessary code is fine, just a bit 
> more explanation in the comment would help. And "doesn't really" implies
> it sort of might a little bit, I think what you want is "really doesn't" 
> :)

yes.

>
> As I understand it, the L0 does not cache any intermediate levels of the
> nested guest's partition scope at all. Only the nested HV's pte entries
> are copied into the shadow page table, so we only care if the PTEs are
> changed, and the PWCs that the processor creates for the shadow page
> table are managed by the kvmppc_unmap_pte() etc functions... I think?

That is correct. The reason I added the comment there was to clarify why
the PWC type is not handled in case of partition scoped invalidate
similar to process scoped invalidate. The code fragment was left as an
indication of what should happen theoretically.

All higher levels of guest (L1, L2.. etc) have partition tables that are
not really used for hardware page table walk. H_RPT_INVALIDATE hcall is used as
a hint to free those page table entries. L0 on receiving the hcall will
forward the same to higher levels guest which after invalidating its
shadow pte will further issue the H_RPT_INVALIDATE hcall to clear
parition scoped entries of the current guest.

If it is a range TLB flush, we just clear the shadow pte, higher levels
page tables are not modified and hence no PWC flush is required.

If it is full lpid flush because of RIC=1/2 or because range is 0 -> -1
we do free the full partition table and does a kvmhv_flush_lpid()
which will eventually ends up calling radix__flush_all_lpid(). 

These function names are kept in the comment so that a new person
looking at the code can easily follow the code path. 


-aneesh
