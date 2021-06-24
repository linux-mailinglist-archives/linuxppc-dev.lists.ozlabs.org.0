Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879D63B32F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 17:55:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9l941y9Lz3byf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 01:55:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r+Tk1Rmq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r+Tk1Rmq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9l8Y3whnz302c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 01:55:24 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OFYDdQ036150; Thu, 24 Jun 2021 11:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : mime-version : content-type; s=pp1;
 bh=70voqBDCjLyVbA4YA+h5sR8dzQZQGfW8a3mYRzXbcLs=;
 b=r+Tk1RmqR4X1TkU2b5ybkQ9Y1bL0emshaAKQwRO/4UAUtljOk+fjt4MqajZU+j71VUuh
 jQ4qNwRHpntoseB7v+dZkc12ZKQmg558/i3kOZPSUTxIJcl8jYEtWAmKrtlcTQRxIXbT
 Ci9g5AtjFFoYoVte0M3UKWKfcTcLPyw0y/TCIqoz2Q0iBn5SSZRiuqB0PeGgh/CkevqS
 aWP3yk1s+XiVjjFn4tBSO76tMnssSh91f2j9BL6P/9fx4yr+Zy+oYgsKWvR7HwyjQze9
 6fwsyDC1gy3zEcZaqkCPa9dP5qUczfTp/Exh9d2Q+ccrNMgjQwQXn+2W/gSzQnaGUaBO /w== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cvq8s095-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 11:55:17 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15OFs3Pj001390;
 Thu, 24 Jun 2021 15:55:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 399878amuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 15:55:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15OFtCqZ34931150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 15:55:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D27A74C040;
 Thu, 24 Jun 2021 15:55:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 086654C058;
 Thu, 24 Jun 2021 15:55:12 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.47.185])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 24 Jun 2021 15:55:11 +0000 (GMT)
Date: Thu, 24 Jun 2021 21:25:09 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: PowerPC guest getting "BUG: scheduling while atomic" on
 linux-next-20210623 during secondary CPUs bringup
Message-ID: <YNSq3UQTjm6HWELA@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jHPrxFdDA7ykan0m5jEhuQwh3ZUNLzGP
X-Proofpoint-ORIG-GUID: jHPrxFdDA7ykan0m5jEhuQwh3ZUNLzGP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_12:2021-06-24,
 2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240086
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

Hi,

A PowerPC KVM guest gets the following BUG message when booting
linux-next-20210623:

smp: Bringing up secondary CPUs ...
BUG: scheduling while atomic: swapper/1/0/0x00000000
no locks held by swapper/1/0.
Modules linked in:
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.13.0-rc7-next-20210623
Call Trace:
[c00000000ae5bc20] [c000000000badc64] dump_stack_lvl+0x98/0xe0 (unreliable)
[c00000000ae5bc60] [c000000000210200] __schedule_bug+0xb0/0xe0
[c00000000ae5bcd0] [c000000001609e28] __schedule+0x1788/0x1c70
[c00000000ae5be20] [c00000000160a8cc] schedule_idle+0x3c/0x70
[c00000000ae5be50] [c00000000022984c] do_idle+0x2bc/0x420
[c00000000ae5bf00] [c000000000229d88] cpu_startup_entry+0x38/0x40
[c00000000ae5bf30] [c0000000000666c0] start_secondary+0x290/0x2a0
[c00000000ae5bf90] [c00000000000be54] start_secondary_prolog+0x10/0x14

<The above repeats for all the secondary CPUs>

smp: Brought up 2 nodes, 16 CPUs
numa: Node 0 CPUs: 0-7
numa: Node 1 CPUs: 8-15

This seems to have started from next-20210521 and isn't seen on
next-20210511.

Regards,
Bharata.
