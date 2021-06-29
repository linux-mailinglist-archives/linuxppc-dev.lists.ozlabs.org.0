Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2B3B6DCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 06:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDXK86NCXz3bbP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 14:57:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o/PN5aoy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o/PN5aoy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDXJf3nJ2z301k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 14:57:05 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15T4peBq135269
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 00:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=VQ8RX94ztAcDkLAZubbmm7Lt8eaIUVTA/VvzD6VtSPw=;
 b=o/PN5aoy0NIK78utwzPA5ICof0ACNMpW+e50l+WbtdvtGBaO3FXWdiA/2Ioq+1f69Quh
 Dkc/WBku6MmhFNcmHTBzgeZwgxzXx1yTvEeVVo9C0vu/BI0PpJiirrIj4bOav/at3Wvm
 GQFOHgbJ5JIN464PYP8W2UUFHi23H7O/xSNPG4t2olpdjxDLOSoVe5U8utWXalyMJYBs
 4FhVEKwi0DlhaDUVW0IgMK2y6F0TW3hfoCitM38SO+k0BM/z5YezBIsie8oONnoTY3ef
 1yX5Vek3dgyNINbA5QH4sPlx03GLvwQyghBsjQDxt1AmoSHUg+X69TET0YtqOITLxI8s xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fvv6g35n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 00:57:02 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15T4q975136200
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 00:57:02 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fvv6g358-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 00:57:02 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15T4slC1021584;
 Tue, 29 Jun 2021 04:56:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 39duv892j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 04:56:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15T4tODE36503942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 04:55:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 617DD11C06E;
 Tue, 29 Jun 2021 04:56:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2B1F11C058;
 Tue, 29 Jun 2021 04:56:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.85.88.152])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Jun 2021 04:56:56 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH] powerpc/64s: fix hash page fault interrupt handler
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20210629015057.1635519-1-npiggin@gmail.com>
Date: Tue, 29 Jun 2021 10:26:55 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <F02BB776-5CFE-467C-BAF5-6B61F9BE3880@linux.vnet.ibm.com>
References: <20210629015057.1635519-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NnPTA6HtnLbKUYkbwYId26US_cEi-VWS
X-Proofpoint-ORIG-GUID: E5z4_GN8QrsFwSjTrWgsqEOypVX2IPRN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_14:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 mlxlogscore=977 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290032
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 29-Jun-2021, at 7:20 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
> 
> The early bad fault or key fault test in do_hash_fault() ends up calling
> into ___do_page_fault without having gone through an interrupt handler
> wrapper (except the initial _RAW one). This can end up calling local irq
> functions while the interrupt has not been reconciled, which will likely
> cause crashes and it trips up on a later patch that adds more assertions.
> 
> pkey_exec_prot from selftests causes this path to be executed.
> 
> There is no real reason to run the in_nmi() test should be performed
> before the key fault check. In fact if a perf interrupt in the hash
> fault code did a stack walk that was made to take a key fault somehow
> then running ___do_page_fault could possibly cause another hash fault
> causing problems. Move the in_nmi() test first, and then do everything
> else inside the regular interrupt handler function.
> 
> Fixes: 3a96570ffceb ("powerpc: convert interrupt handlers to use wrappers")
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Thanks Nick. 
Fixes the reported problem.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

-Sachin
