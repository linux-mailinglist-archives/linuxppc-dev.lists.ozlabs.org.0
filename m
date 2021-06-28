Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351F73B60B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 16:27:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD9110pgjz3bbV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 00:27:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YBLDD38L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YBLDD38L; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD90V1ncJz30BN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 00:26:49 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SEAjOM007317
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 10:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=RNpaominM2LVkNyDe7gWbMavWXeP+EluvZMGuXOXsus=;
 b=YBLDD38L+COUj+3VMeOYi2xmbveefvaarq0RVXWu3SYBMx6ddNnhQNS+qvGYLGaTgCLP
 GAk/LK3wsbftg8ZAckIvHpnytFfZ9x5ZVATIC8gdYoFETJwdlf911KPXlvBX7LpXzqaj
 rCLY1oQcbx7ww16jVWrgKzkShfdWY9NvE7HiuqN2PPSFiUAj4KLnnOtbgv2hJQqb85av
 2+Ou8WVUhAmV976Yu1D5PneLSwYCUMXbAByusRutQrWKssm4q+xuqr6wetv6/BDAlFxa
 EHcK8cLeNiCG6/TS0HJT329XtcUYLKLCeuQHPJb6btp+QiwKgooVy5hUJbQTyWs/SO5u CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39feaqbnn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 10:26:43 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SEAtF6007515
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 10:26:43 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39feaqbnkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 10:26:43 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SEOAxU001728;
 Mon, 28 Jun 2021 14:26:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 39duv88ecq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:26:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15SEQdTg33095950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 14:26:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08CA1A4060;
 Mon, 28 Jun 2021 14:26:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79E0CA4091;
 Mon, 28 Jun 2021 14:26:38 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.85.88.152])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jun 2021 14:26:38 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 3/8] powerpc/64s: add a table of implicit soft-masked
 addresses
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20210628074932.1499554-4-npiggin@gmail.com>
Date: Mon, 28 Jun 2021 19:56:37 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <39317B6C-D4D2-4330-B92A-BE21D0C7B4CC@linux.vnet.ibm.com>
References: <20210628074932.1499554-1-npiggin@gmail.com>
 <20210628074932.1499554-4-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tGOSFHUOAypFQhVUfEsPvDKjxGzoh8jf
X-Proofpoint-ORIG-GUID: tepIZxuwhSvrm7DQ7V950dx9fJEKTH8x
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_11:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=938 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280098
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



> On 28-Jun-2021, at 1:19 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Commit 9d1988ca87dd ("powerpc/64: treat low kernel text as irqs
> soft-masked") ends up catching too much code, including ret_from_fork,
> and parts of interrupt and syscall return that do not expect to be
> interrupts to be soft-masked. If an interrupt gets marked pending,
> and then the code proceeds out of the implicit soft-masked region it
> will fail to deal with the pending interrupt.
>=20
> Fix this by adding a new table of addresses which explicitly marks
> the regions of code that are soft masked. This table is only checked
> for interrupts that below __end_soft_masked, so most kernel interrupts
> will not have the overhead of the table search.
>=20
> Fixes: 9d1988ca87dd ("powerpc/64: treat low kernel text as irqs =
soft-masked")
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Thanks Nick for the fix.

I was able to verify this patch.=20
Both kernel boot and test ran to completion without the reported =
warning.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

-Sachin

