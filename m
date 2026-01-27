Return-Path: <linuxppc-dev+bounces-16323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GYZDybfeGkGtwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 16:52:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C916A971E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 16:52:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0qf95ZPvz309N;
	Wed, 28 Jan 2026 02:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769529121;
	cv=none; b=eHswaZ+WR9xOEcofau/N0lxtitHYLgvU4OZ/BIBeb4oAWp4ne0NoVa5C5Vd1I814Yz+h7B1P1/Hz24ctDGxocySuGD49FuAyKzFYCVvIvRU9Wf50zj9lpKKjB9mfcuSB11un1710mb3JcP+CUTgLbAFKuPjjfIqT+rjQRLChwOkuCYkFRHHfMvB799NRpbDEDmp1EFTcKoEROAdDOXnsMqoG0Ibncp0TnqrbbJvyHIfMUXFqpSBRrlHg+DWD1mRgim5fxEZ9/UzZo3JpS3BYcxxqus3XUzyfUtCuUZ7lp8BDtnutXayEsXgD0yGnCOe1NrXFsszWKd7f5rhMdilRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769529121; c=relaxed/relaxed;
	bh=0OxxS5n1xieZUpH8YohdiA+9VRXqomSLAoDHyJVmPjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTre4v7V8fn+Shl4FrOQMW7T+GFRuU3Q2inoX/4QG+xOl7azK+dc4+IhRjyd7HZopGWHYTbteSWGbCUlTpQhjDtPZlwplSwx/vjI2Iy2PWByICHogMicsteHYRsZkH7WLvqZAg4QzBhBhQJKi+NCpj1I1mAP6RZZNv0udMCxMaIpv9mjy79EaPR5Dmb2pMIn7C667ZF3tPyXM/tHGlFuGd1DKs6eYdaDchit+l6W1VnEXbIa9b7mRd2WhVtbYnbaHfpPJ3B3QHwp44nNg84ICsSBX9I1Argmhqz+UXuNuIlFS60QyPGGKkxJX1m+y9IyY3L/AnvzJoIRlXuHieY0YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R2OZ3tNd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R2OZ3tNd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0qf80KQLz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 02:51:59 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60R7WMWC008927;
	Tue, 27 Jan 2026 15:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=0OxxS5n1xieZUpH8YohdiA+9VRXqom
	SLAoDHyJVmPjo=; b=R2OZ3tNd9SFjbhgmya+gAkR1LeSUyxH/4qTui9x0/Uant4
	+He/E+9jhq17CXdAWqvn5tlXSBsBIY0k423Lv7jq6+YfHZeVMd54Yo78qQxKVPuq
	dd6+jAI5VodjgFmoPT7n1593r1Fb9KKf6vYGR1TGJZ3ta6ySO2jEKN+/Q8hmskV6
	M8b11DKp4JlY2KTeW8cYzln1cfyON+Phmgew57hSVAbypNIaxaMdvoh0QMqa7FG9
	hBGIKEIipRzww0uYI0TSD1KqYz0ocdD/Bq8GtccsOZugDFGRaiamzsY71sb3mD3g
	D02I83U0zVNelxPrFSiVffd8VmGWOQFku/D27YOQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr64dmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 15:51:44 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60RFhAPC013427;
	Tue, 27 Jan 2026 15:51:43 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr64dmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 15:51:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60RD696c019647;
	Tue, 27 Jan 2026 15:51:42 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bw9dn18ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 15:51:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60RFpc0B25821738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 15:51:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FDCE20040;
	Tue, 27 Jan 2026 15:51:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F2062004B;
	Tue, 27 Jan 2026 15:51:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 27 Jan 2026 15:51:38 +0000 (GMT)
Date: Tue, 27 Jan 2026 16:51:36 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
        Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
        x86@kernel.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>,
        Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v18 10/12] powerpc/mm: Implement *_user_accessible_page()
 for ptes
Message-ID: <20260127155136.2808076Add-agordeev@linux.ibm.com>
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
 <20251219-pgtable_check_v18rebase-v18-10-755bc151a50b@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-10-755bc151a50b@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyOSBTYWx0ZWRfXxChMywYP3CXN
 le5d6yn3Qq6MfjN6zC+Z+DQqleCzkUqKSkhMwpJSnn1Mj3zS2dO0nICsNnXEMtWsE3vyb83rzjQ
 6kso4VpQ4wBoGpfXa+uDicwe3s/Tx9G27+lBkSjIdnBpBe924kovkU2wInK8zp4fCnVcBOZS31H
 BJ3DIi34TvoRR/5d3SQODO1mtpcggsmfvH/oLD96EUws0DAq+gksrBtgsBJS82RwOsHFmTzrNBL
 CNwOe0QD3sOFuH+hrRzC0HuLjsyg7NKVHQVFym8CqHd55vAIbLaoGLE/k7/e/ZOrw+hMYWVP7oQ
 3uUxUrs0HYHgzU6E9dLRct4A1ePYLRq2MVcmQ4XlAiQw0ogB0VlRgK8V/qrltGoxEmwPlQvaIpZ
 oDSvwJEhdafxFukf2IRJrEZNbsOh1QhzlSOcS3BDkUFas4hDHNqKbsmPKpZG1pCe2JqB0joy895
 KqtIgfb/A4B51Vjsq2g==
X-Proofpoint-GUID: 8EJeeV34r0_XNIY9EmhfW46Wh100FMUs
X-Proofpoint-ORIG-GUID: Bk5rloqyZadRkxusHYTPbD17s7SpVN9w
X-Authority-Analysis: v=2.4 cv=X+Vf6WTe c=1 sm=1 tr=0 ts=6978df10 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cPWeadVanShsLn6B-a8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601270129
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16323-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kvack.org,lists.ozlabs.org,soleen.com,linux-foundation.org,linux.ibm.com,gmail.com,nvidia.com,kernel.org,ghiti.fr,dorminy.me,donnellan.id.au,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajd@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:pasha.tatashin@soleen.com,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:rmclure@nvidia.com,m:chleroy@kernel.org,m:alex@ghiti.fr,m:x86@kernel.org,m:nicholas@linux.ibm.com,m:sweettea-kernel@dorminy.me,m:andrew+kernel@donnellan.id.au,m:ssrish@linux.ibm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:andrew@donnellan.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[agordeev@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[agordeev@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: C916A971E4
X-Rspamd-Action: no action

On Fri, Dec 19, 2025 at 04:09:42AM +1100, Andrew Donnellan wrote:

Hi All,

...
> Page table checking depends on architectures providing an
> implementation of p{te,md,ud}_user_accessible_page.
...
> +static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
> +{
> +	return pte_present(pte) && !is_kernel_addr(addr);
> +}

We looked into implementing this for s390 and for us the only possible
user vs kernel entry attribute is comparing mm to init_mm. The generic
code already does that, but I am not sure whether such check alone is
enough.

But it occured to me that we could implement e.g. ARCH_SUPPORTS_PTC_USER_PAGE
that adds an extra field to struct page_table_check:

struct page_table_check {
	atomic_t anon_map_count;
	atomic_t file_map_count;
#ifdef CONFIG_ARCH_SUPPORTS_PTC_USER_PAGE
	bool user_page;
#endif
};

Page Table Extensions already used by PTC, so that would fit pretty natural.
Once a page is mapped into a user process it would be marked as user_page,
while p{te,md,ud}_user_accessible_page() could go generic:

static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
{
	return pte_present(pte) && page_table_check_is_user_page(pte);
}
...

I guess, many architectures without viable p.._user() support could benefit
from that.

But I am not sure whether is it doable, so opinions are very welcomed!

Thanks!

