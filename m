Return-Path: <linuxppc-dev+bounces-7394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D3A762D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 11:00:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZR4p22sRMz2yFP;
	Mon, 31 Mar 2025 19:59:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743411594;
	cv=none; b=Ozd9DOGO1hvzrxrpzFFI5PWCEeCYnqPfNSBVnGGvQmYb+YBPVmT5DJm4bm8g0lbsho4HHIT7I/p++C+gHeOo4n1cD+1XB81O57SmHR+hFnLmSW2er4Gk8TZS0k0JJE/a4+rRmnDGXJ31Pw+sqjSMvyr2lf+oVLjaE0B3t8TBDIIKVjyTJ/DxZ8SInTZs9gwpE9QHXZ9XzpIMXcdzqAqGDLuRW8Aq23ioI0vQjeH3/eG7crQ3B9WM71TysBHKIEx/JC4YfaU61l2LRQ5/UQh/4TRwXhocjGep8T+i6CyYVaqAupZ3tXyVUX22F4Ggd/gHLH3K7XbWmQw5K9AZAQgX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743411594; c=relaxed/relaxed;
	bh=/02MeeTgr+edfUre6+XCDI7lrRPKBNs5wpBz5Bd11FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3yug4kevwkDEvW3Y2O18x3yycNlU5vwUYVDahaCtA1uF/e+fXUXqZr/bD4FH0p15JEhSlqhZlRN7TN7pUth8WVvJf3caMvI7qpQPbelOX8IsRYDRnrw1eGLpddHjvKw8J5bMKQsWMDNSjFSTnp9illKzXjTo6XFA9j1uyZsgzYconIO9pPe1xz9xcar/XcRLT11aNNvvmBwwi0usFHvKdqQ6aDTT6R4wLOPCii0LxKSn+8oKt8uvNU7ioCmLJHSmTJR31wdTI1b6TJlRe4M9Qw53OpufiyekEeK0nT8XJku4hWKlSgk7oE10bHIU2ITMcXnAYWra022DSXEIyD0ZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P63v/gXs; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P63v/gXs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZR4p05MFHz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 19:59:52 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UKauVs020777;
	Mon, 31 Mar 2025 08:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=/02MeeTgr+edfUre6+XCDI7lrRPKBN
	s5wpBz5Bd11FQ=; b=P63v/gXsRF4hDLy7ssEBBwh/kzsyGiOtp0mumcM5+A/LNj
	gdY0eBuzdPTmuXOhURZupJ1YyCReKhjV+btHVIxdh6bjRaJyvFsMnji9ym0MycpW
	FQ/tEiPUhIT3tmZjgUk0k8RfDGEkMM5umV5et3jPN0aBemzHNEpTH7otsAqg2D2s
	IgiQKjGXwzD3QmqVQYFZ00JQ3UFfmml/HrvUYzWU2spcPKwRznX4azB8E9B4uB+1
	1QpX2jha71AOh/TNdKabH257Nmy0qCW899l9HxKC4fFcsNGdaAqFdrftLmaLGGiG
	2KPUxEHGLnOeqqSwgqWBfYVrpnKHZUpIb/RQpJew==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qd4q286v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 08:59:20 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52V8pdhP010589;
	Mon, 31 Mar 2025 08:59:19 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qd4q286t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 08:59:19 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52V5GId8014560;
	Mon, 31 Mar 2025 08:59:18 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45pvpkw19g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 08:59:18 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52V8xEMj54460792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 08:59:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B244A20067;
	Mon, 31 Mar 2025 08:59:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D62920065;
	Mon, 31 Mar 2025 08:59:13 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.171.74.246])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 31 Mar 2025 08:59:13 +0000 (GMT)
Date: Mon, 31 Mar 2025 10:59:11 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/ptdump: Split note_page() into level specific
 callbacks
Message-ID: <Z+pZX2QmFnNnnjZ5@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250317061818.16244-1-anshuman.khandual@arm.com>
 <20250317061818.16244-2-anshuman.khandual@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317061818.16244-2-anshuman.khandual@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FB8uw0hSchlofFmG1jPA1lzwCpmzLf0-
X-Proofpoint-ORIG-GUID: 3iKHP7Q1z45fUexTKfPdZicsNHs_J4-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 mlxscore=0 adultscore=0 mlxlogscore=741
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310063
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Mar 17, 2025 at 11:48:17AM +0530, Anshuman Khandual wrote:

Hi Anshuman,

...
> --- a/include/linux/ptdump.h
> +++ b/include/linux/ptdump.h
> @@ -11,9 +11,12 @@ struct ptdump_range {
>  };
>  
>  struct ptdump_state {
> -	/* level is 0:PGD to 4:PTE, or -1 if unknown */
> -	void (*note_page)(struct ptdump_state *st, unsigned long addr,
> -			  int level, u64 val);
> +	void (*note_page_pte)(struct ptdump_state *st, unsigned long addr, pte_t pte);
> +	void (*note_page_pmd)(struct ptdump_state *st, unsigned long addr, pmd_t pmd);
> +	void (*note_page_pud)(struct ptdump_state *st, unsigned long addr, pud_t pud);
> +	void (*note_page_p4d)(struct ptdump_state *st, unsigned long addr, p4d_t p4d);
> +	void (*note_page_pgd)(struct ptdump_state *st, unsigned long addr, pgd_t pgd);
> +	void (*note_page_flush)(struct ptdump_state *st);
>  	void (*effective_prot)(struct ptdump_state *st, int level, u64 val);

Should you treat effective_prot() similarly?

>  	const struct ptdump_range *range;
>  };

