Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0414D2CCF9A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 07:40:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmmRm3p7FzDrNw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 17:40:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Uct9uqS2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmmPN54wwzDrLb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 17:38:15 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B36aT1F189882; Thu, 3 Dec 2020 01:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=4MatgjWQtukI2Fk17lA9B23Y6m7LS1TjkcmQNeVR4C8=;
 b=Uct9uqS2xKRffbDJIQVnj1k0XHXUSgnIQFuiVbrWsNDG5e8JJjf+Z/431mgbiXUym+0R
 iKZIlmciIlpw9uMP5ZdjDX7/zdiMOM7iVsYol300BlubwBRls+1TOCY86QyOb8uZmMvg
 oaVRAEk1kltddrFKGYKgxiYQkfPuEzVzg6Y1T4w8DL1g2THtMZtbo4fr/vDjMkfLKBZW
 bXTFHbM3QB9QTtkPv6e7wn6GE1ZK4UwcsdNjg4XJ4yj0YopvVj4gkhKa6WpW1Ghr63pq
 yuJYCo77TIPuOYKlxVNZNQR2sq8wI1CD33QIg1mGPXjIRwZQSRrY4UFMfaL3Hp7OgUN3 rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356p2kp6fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 01:38:12 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B36aU5F189982;
 Thu, 3 Dec 2020 01:38:11 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356p2kp6ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 01:38:11 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B36WRcV023091;
 Thu, 3 Dec 2020 06:38:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 353e69r3rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 06:38:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B36c8a016515518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 06:38:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8685CBE063;
 Thu,  3 Dec 2020 06:38:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C671BE061;
 Thu,  3 Dec 2020 06:38:06 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.17.194])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Dec 2020 06:38:06 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v2] powerpc/kuap: Restore AMR after replaying
 soft interrupts
In-Reply-To: <20201203054724.44838-1-aik@ozlabs.ru>
References: <20201203054724.44838-1-aik@ozlabs.ru>
Date: Thu, 03 Dec 2020 12:08:03 +0530
Message-ID: <87zh2vjsxg.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_01:2020-11-30,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 mlxlogscore=741 malwarescore=0 clxscore=1011
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030040
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> When interrupted in raw_copy_from_user()/... after user memory access
> is enabled, a nested handler may also access user memory (perf is
> one example) and when it does so, it calls prevent_read_from_user()
> which prevents the upper handler from accessing user memory.
>
> This saves/restores AMR when replaying interrupts.
>
> get_kuap/set_kuap have stubs for disabled KUAP on RADIX but there are
> none for hash-only configs (BOOK3E) so this adds stubs and moves
> AMR_KUAP_BLOCK_xxx.
>
> Found by syzkaller. More likely to break with enabled
> CONFIG_DEBUG_ATOMIC_SLEEP, the call chain is
> timer_interrupt -> ktime_get -> read_seqcount_begin -> local_irq_restore.

Can you test this with https://github.com/kvaneesh/linux/commits/hash-kuap-reworked-2

We do save restore AMR on interrupt entry and exit.

-aneesh

