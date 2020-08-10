Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44204241157
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 22:05:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQRlr1lCzzDqT6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 06:05:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rw4ukRCB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQRk330R9zDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 06:03:55 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07AK3gTK165572; Mon, 10 Aug 2020 16:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ltAxQvBm96jE0Kt2+bv+siZbGSdbc3NhJqEOWuQ6MIA=;
 b=rw4ukRCByCCTBvDCUWYFWy7tO3+KVTVnMCH+fqYg7tSgdtB2//9GBSTCv2VHrLpJzk7d
 ZX9mJnMo2kZ7RLjw0M84b/JFgdgRwTq18ITYroSPQ20t+x0mUMV4lwWCFv/Kws7OyDwg
 wMsbjbDrkwbaWtKPlY0sc4as699Z819ahAea/Lphek+o82PDr+0/cIEu5B/YXhhrzrll
 g3zNMohxOPlXaynIYXg2u4v2vRYSRN53ztU7oqBN+EPy6affSebMe9cLNUX1W9eaEG0o
 QX1SM5SFYJm3rf29Xez1Jfrny+ysvXl6jNXT9OSrsw/6CTSzJ+yDWaJvVKNjkoJ9vfiQ yA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr9j5wkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 16:03:47 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07AK0RHp001466;
 Mon, 10 Aug 2020 20:03:46 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 32skp8v4t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 20:03:45 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07AK3iRc51577262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 20:03:44 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94A5CC6057;
 Mon, 10 Aug 2020 20:03:44 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41645C6059;
 Mon, 10 Aug 2020 20:03:44 +0000 (GMT)
Received: from localhost (unknown [9.65.223.18])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Aug 2020 20:03:44 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: explicitly reschedule during drmem_lmb
 list traversal
In-Reply-To: <87tuxl1ant.fsf@mpe.ellerman.id.au>
References: <20200728173741.717372-1-nathanl@linux.ibm.com>
 <bd9225f2-40c9-0460-ba45-c29c920b5f91@linux.ibm.com>
 <878sf31m8k.fsf@linux.ibm.com> <87lfj16cql.fsf@mpe.ellerman.id.au>
 <875za511z6.fsf@linux.ibm.com> <87ft974yf7.fsf@mpe.ellerman.id.au>
 <87365723m0.fsf@linux.ibm.com> <87tuxl1ant.fsf@mpe.ellerman.id.au>
Date: Mon, 10 Aug 2020 15:03:43 -0500
Message-ID: <87imdqz2sg.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_19:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=1 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100137
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> One thought, which I possibly should not put in writing, is that we
> could use the alignment of the pointer as a poor man's substitute for a
> counter, eg:
>
> +static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb)
> +{
> +	if (lmb % PAGE_SIZE == 0)
> +		cond_resched();
> +
> +	return ++lmb;
> +}
>
> I think the lmbs are allocated in a block, so I think that will work.
> Maybe PAGE_SIZE is not the right size to use, but you get the idea.
>
> Gross I know, but might be OK as short term solution?

OK, looking into this.
