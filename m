Return-Path: <linuxppc-dev+bounces-10009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B98AAAEFAD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 15:38:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWkd605DDz2xPc;
	Tue,  1 Jul 2025 23:38:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751377113;
	cv=none; b=clBV2V7onky6VjGAp6cNY1tcYF8kncKD69rbBm7UxRTXIx5Ho1sw8xyvqdWoUNQQ4tcmRJ5bihQf14R2sn3Fb0dheWF5U/ipDyd98DPRZdKf9KKyVKx6uc8kgC+Sv42Gpbo4E5zHiGoHuBveoJQeZx9lX/rjLV96GtEATA7SKq/qWqm3Rm65rXFtB0HlyhzQc2TnqroKMQpMSAK/rZstqZ0FWkpuhGlw/hDwSSvmK52+QslIdjSIGEZ6NOip3mZ7cPuIn7yPF4VcNOWRYehEngvJEUuvTfXtWaWzVHQm8wufy5Eg121ChoQXN+FVmo8RQqqNaas6JxqJ9eEzLnBTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751377113; c=relaxed/relaxed;
	bh=AJLNXeZBidDlQX/9niKzeIA7RdIQ35aaPXD/kLpTeHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpcLJLUXa5XYAOC00c8+EznRGb3BNRqxsKL7S7l+mSeMxDQ7XCUzJtvAN9KpKmcBVLmW04f4iWc3gEuhBJW+WhOxXl3hUKZlY+Hxx+q5YFdmcs2822jFBMm4IoP1VgzLk0VCLxEqoWAXZqfYMfGuVCpJ0jILfQzmvVbQ78pHhiFSwLy0rI8Ox0ZaSiIh47GOzR+ngmDa6iziSiQNvyroXqNhQd2kQx/pqRTRAC0WLuLIiCEc+k2WczO0bhPjpzL20nC1CA1P29e/AdzbN+F6d0r2GIaEv2m9rUeMEfsf2hs25kbs9FO35Zgd4v/D3bvhkezDXRsQHTQx++76oz2LWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlhS3ni/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlhS3ni/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWkd50DSnz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 23:38:32 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Ao1Lm012254;
	Tue, 1 Jul 2025 13:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=AJLNXeZBidDlQX/9niKzeIA7RdIQ35
	aaPXD/kLpTeHk=; b=rlhS3ni/cF+oHD+o2LmQH00Tt1yf+IXrQwS8k/NYdNoQmt
	duh9xElSzAv31IeesiKLOuUaS7Js+v1FcCM3idLgVIqiFfWon7XDGjUUaGS1gO7k
	A0JrbTyaswrFc7s4ZFW4HADsPTEgUor320+59p+Q02H940E/xpViJv61e7ViyNjJ
	vMcXo0c5xDHAYQwHYeEOaFbcipPGvNgKtWbscb8fvFkysHG+EG7pEVr+wrBpt5rP
	TvpzBk/V8AqMNvTK7fz483B21FzXBpDlDdKDMGCI6bWWjVPpwYCBxl8uHjAuPKPZ
	sumQ0qg/FxaZ17KQzTSCoQkinixWtocLfr+JROcQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrfqxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 13:37:34 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 561DK4Af030631;
	Tue, 1 Jul 2025 13:37:33 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrfqxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 13:37:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 561CFQo0021945;
	Tue, 1 Jul 2025 13:37:32 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47juqpju2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 13:37:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 561DbRkS39191032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Jul 2025 13:37:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D64A12004B;
	Tue,  1 Jul 2025 13:37:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79D812005A;
	Tue,  1 Jul 2025 13:37:25 +0000 (GMT)
Received: from osiris (unknown [9.111.81.242])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  1 Jul 2025 13:37:25 +0000 (GMT)
Date: Tue, 1 Jul 2025 15:37:24 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
        Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
        glider@google.com, dvyukov@google.com, vincenzo.frascino@arm.com,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        johannes@sipsolutions.net, dave.hansen@linux.intel.com,
        luto@kernel.org, peterz@infradead.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        chris@zankel.net, jcmvbkbc@gmail.com, akpm@linux-foundation.org,
        nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, arnd@arndb.de, rppt@kernel.org,
        geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com,
        tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
        linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with
 kasan_enabled
Message-ID: <20250701133724.10162Bea-hca@linux.ibm.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
 <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
 <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
 <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
 <20250701101537.10162Aa0-hca@linux.ibm.com>
 <0400f0be-6b63-4bc7-846e-8852e1d01485@csgroup.eu>
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
In-Reply-To: <0400f0be-6b63-4bc7-846e-8852e1d01485@csgroup.eu>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E/PNpbdl c=1 sm=1 tr=0 ts=6863e49e cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=9kVARt_T5sJ8cKZ6P08A:9 a=CjuIK1q_8ugA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: RhlQaPOLrhblKhkyaR8lhPAADXtAGdqv
X-Proofpoint-ORIG-GUID: GE-5RQzQLYwKSRuZzvD2Ieha-YyMeWy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4NSBTYWx0ZWRfXzvbPIXoCFjaA YSsHPBvgZlo8uA940MrN2nhmDxVD4yrQC0Blr21wUJpIGCnNlNYIEYn0zUSw91bxc/h5BgvR4PQ 8+gmBbA2hDH7/zlVMxuAui0Eg0eLEMWJxQ2/qxuHFp9hM4UusUMJXT1gcIBCqFiNlncOSMVN5PG
 Ld5QIjM0M/RCgeT9uZc/VoQiigSg/ZOOijWeB0ApYuTWAn6oTpW5uLedkuEa+H9gsqL267RFsh+ hsZlShfTEsI5dV1qJMDiUaZYdjPAHbt+/Y5HPTDay65IxTT2JuvXcJaPY0TCfNXxBXRdcK6cNfg T9ENU2fNsIOPb8h0JhVPWTlgBKUQsNsQrY0goxWlNMztanR3wFR0fwoMfm4Jvvns3yERoc04SWn
 h0O40s/ZVSLp603nO33OhPNgBdCIeQQuKGnHgEsIbQLtMjKZdTC34lQKNuw31VIbsvBRZVlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=594
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010085
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 01, 2025 at 12:25:32PM +0200, Christophe Leroy wrote:
> Your patch below is simpler than what I proposed, but it keeps the static
> branches so the overhead remains.
> 
> I also proposed a change, it goes further by removing the static branch for
> architectures that don't need it, see https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20250626153147.145312-1-snovitoll@gmail.com/#3537388
> . Feedback welcome.

Yes, removing the static branches during compile time is of course
even better.

