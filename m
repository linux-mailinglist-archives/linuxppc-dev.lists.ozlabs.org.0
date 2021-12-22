Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ECF47CFF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 11:26:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJqHR4jfNz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 21:26:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KgLbqk4c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KgLbqk4c; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJqGW3m77z3bZj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 21:25:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM7rHd7024389; 
 Wed, 22 Dec 2021 10:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=xhuJR3L8dEwvyO5gsg7AwTKXZpvRFzvjW5zotqMwbOc=;
 b=KgLbqk4cCxbt7NOo829znVs7w9KrJN0Tz/qWaIznNOXbsbgQN2saaRvlRnlbyaymROZC
 mTNuV3zr5o7Iz71VkQ/UafSRKTMUJ+BM2XWuIfeCitWDhV0AaPivIcTLy+0iX6ygyVaf
 clLK41msopRpuc5Ztm/KbcePWA6lTvU+SnM/mWOk1oyW9qMl6jqeoHxOLKPomw9SsRSG
 RGYWvJlh5GgO6KGjcdkpM804DynqWl5GqMXSccsAOVwYroAKAcoUJO6WuWjL7w4XJSlh
 pQLk/yTmNYqfREiBzh7Occ8w8SGitcnUDGlrafjz/bV77WMhGBLrFZVDPuYV2IZfw1ly lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3g6wkqet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 10:25:33 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BMAPWE5024806;
 Wed, 22 Dec 2021 10:25:32 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3g6wkqed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 10:25:32 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BMAIxCl005127;
 Wed, 22 Dec 2021 10:25:31 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3d179a3g01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 10:25:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BMAPSc232833990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 10:25:28 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE5CA11C04C;
 Wed, 22 Dec 2021 10:25:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E97E111C04A;
 Wed, 22 Dec 2021 10:25:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.78.193.41])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Dec 2021 10:25:27 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/3] powerpc/64s: Mask NIP before checking against SRR0
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20211221135101.2085547-1-mpe@ellerman.id.au>
Date: Wed, 22 Dec 2021 15:55:26 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <2FEFB9BD-2154-4F69-A51D-00FADB5A67DB@linux.vnet.ibm.com>
References: <20211221135101.2085547-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ktPwe0xbP34MmhX7PI71x7bsw3A93VeL
X-Proofpoint-GUID: qBJ0hzMUaMGFni5aVvRMZtbd3QdmRyNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_04,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220057
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 21-Dec-2021, at 7:20 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> When CONFIG_PPC_RFI_SRR_DEBUG=3Dy we check that NIP and SRR0 match =
when
> returning from interrupts. This can trigger falsely if NIP has either =
of
> its two low bits set via sigreturn or ptrace, while SRR0 has its low =
two
> bits masked in hardware.
>=20
> As a quick fix make sure to mask the low bits before doing the check.
>=20
> Fixes: 59dc5bfca0cb ("powerpc/64s: avoid reloading (H)SRR registers if =
they are still valid")
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Tested this 3 patch series successfully (with and without =
PPC_RFI_SRR_DEBUG)
on Power9/Power10 LPAR as well as Power9 PowerNV.=20

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

