Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA242C03BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 11:57:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfkcy2pRbzDqPy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 21:57:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gPfFMTyW; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfkbD6lqBzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 21:55:48 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ANAWDBe072774; Mon, 23 Nov 2020 05:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=VsSdaqwqk86Q4mKhLRZTU0X0aJbk+rvyePfEdyVWfBY=;
 b=gPfFMTyWVfiyLeEJegWKG0pBxl0Ty4Tr+adg1HTQII+eebaTUSBf82vWm3Ago5g1LpVZ
 C0ukMiCzoSq+NoQ7Aq2ubL+JZjjxSjmIzUw0HQJot32BSI1YIfLTYo5H8wxTa6GiXF9z
 cW7DyNXESNoZgw0WFuMu4f1ehaPvkQYhniLY97wbrkZrOG2VXvQ0YFVf2AhiryamFIrK
 1gB60bXWyG6KsSmRSPluA10r4fBDG47hDHqUvomamQXtmCFKRvhhELj23UzX7ctqTt4p
 VZRwCxCMAXkzRlqfXoE3q3NZ7VguJ1JBFAcyfcf/wmqRaKn8bJ/i7DDsoIRpkHkf5cHc ug== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xyrvebxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 05:55:42 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ANArZZ6013262;
 Mon, 23 Nov 2020 10:55:40 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 34xth82cek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 10:55:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ANAtcof6226464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 10:55:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3560F4C046;
 Mon, 23 Nov 2020 10:55:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64BFA4C040;
 Mon, 23 Nov 2020 10:55:37 +0000 (GMT)
Received: from [9.85.106.218] (unknown [9.85.106.218])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Nov 2020 10:55:37 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: [PATCH] powerpc/perf: Fix crash with 'is_sier_available' when pmu
 is not set
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <1606124997-3358-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Mon, 23 Nov 2020 16:25:36 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <0D88C7CE-370B-4570-BEDA-D20642847857@linux.vnet.ibm.com>
References: <1606124997-3358-1-git-send-email-atrajeev@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3445.104.17)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_02:2020-11-23,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=912 clxscore=1011 bulkscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011230068
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> When perf record session started with "-I" option, capture registers
> via intr-regs, on each sample =E2=80=98is_sier_available()'i is called =
to check
> for the SIER ( Sample Instruction Event Register) availability in the
> platform. This function in core-book3s access 'ppmu->flags'. If =
platform
> specific pmu driver is not registered, ppmu is set to null and =
accessing
> its members results in crash. Patch fixes this by returning false in
> 'is_sier_available()' if 'ppmu' is not set.
>=20
> Fixes: 333804dc3b7a ("powerpc/perf: Update perf_regs structure to =
include SIER")
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin=
