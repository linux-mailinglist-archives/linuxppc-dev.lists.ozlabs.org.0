Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 330041F1370
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 09:18:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gPkN2Cj3zDqMr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 17:18:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gPbP1yLnzDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 17:12:49 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05873DDs027213; Mon, 8 Jun 2020 03:12:44 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g7p3tmg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 03:12:43 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05879ssO006032;
 Mon, 8 Jun 2020 07:12:42 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 31hdb38t5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 07:12:42 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0587Cglx45285848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 07:12:42 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FB02124058;
 Mon,  8 Jun 2020 07:12:42 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81C0A124052;
 Mon,  8 Jun 2020 07:12:40 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.88.17])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 07:12:40 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: Re: [PATCH v2 2/4] powerpc/64/mm: implement page mapping percpu
 first chunk allocator
In-Reply-To: <20200608070904.387440-2-aneesh.kumar@linux.ibm.com>
References: <20200608070904.387440-1-aneesh.kumar@linux.ibm.com>
 <20200608070904.387440-2-aneesh.kumar@linux.ibm.com>
Date: Mon, 08 Jun 2020 12:42:37 +0530
Message-ID: <87a71e9gka.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_03:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=981 impostorscore=0 suspectscore=0 cotscore=-2147483648
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080053
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
Cc: cam@neo-zeon.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Implement page mapping percpu first chunk allocator as a fallback to
> the embedding allocator. With 4K hash translation we limit our page
> table range to 64TB and commit: 0034d395f89d ("powerpc/mm/hash64: Map all the
> kernel regions in the same 0xc range") moved all kernel mapping to
> that 64TB range. In-order to support sparse memory layout we need
> to increase our linear mapping space and reduce other mappings.
>
> With such a layout percpu embedded first chunk allocator will fail
> because of small vmalloc range. Add a fallback to page mapping
> percpu first chunk allocator for such failures.
>
> The below dmesg output can be observed in such case.
>
>  percpu: max_distance=0x1ffffef00000 too large for vmalloc space 0x10000000000
>  PERCPU: auto allocator failed (-22), falling back to page size
>  percpu: 40 4K pages/cpu s148816 r0 d15024
>

This patch requires powersave=off kernel command line to boot. We are
working to make sure we don't access per cpu variables in real mode.
Additionally, you can also try the below workaround patch

modified   arch/powerpc/kernel/mce.c
@@ -711,7 +711,7 @@ long hmi_exception_realmode(struct pt_regs *regs)
 {	
 	int ret;
 
-	__this_cpu_inc(irq_stat.hmi_exceptions);
+//	__this_cpu_inc(irq_stat.hmi_exceptions);
 
 	ret = hmi_handle_debugtrig(regs);
 	if (ret >= 0)


-aneesh
