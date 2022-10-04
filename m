Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFD65F406B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 11:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhY3P1Ct9z3c74
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 20:55:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C4pqIPjH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C4pqIPjH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhY2P4Fnqz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 20:54:20 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2949r1dq022227
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Oct 2022 09:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=KQTNyI10QvJuiVc8tgocxFSyHPt3YD3m03UtgFck6+Q=;
 b=C4pqIPjHCH1EORLdL79FICLzBHAsbbrxglA7dZBS2wKfNaArDi1+O7jHStNsKFjA1/3R
 2TOVLnJpliOSgJUGazhb1DgpD9wfJKdb+Ts8An0rwnAFcEuWWKCW5iAcdq4j+ZFQSnVZ
 BDJgKfeUsT7kv/quSw6XD9XG8pIMzbuRKs0nuOa3GcBJP66u4qRGkrdAIOkmyPl81evn
 xL4f4Y7s47AoZ4Gnq7Z93pcMCu0swUaQ3n6/pDOvOSLyjHe5ARnAdOArAo2GKi59bxGp
 cl4m0ZWbWh8cRjJWQ5N9QUhBJ+eky+cL25ATlujXGG7HFafGsnM1bzP2IPZQ0WBnAzC1 AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0hka1pbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 09:54:18 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2949X3Bs007480
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Oct 2022 09:54:18 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0hka1pak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 09:54:17 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2949pXRb029742;
	Tue, 4 Oct 2022 09:54:15 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03fra.de.ibm.com with ESMTP id 3jxd68tvbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 09:54:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2949sgx751708214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Oct 2022 09:54:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0915911C04A;
	Tue,  4 Oct 2022 09:54:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62C0D11C04C;
	Tue,  4 Oct 2022 09:54:12 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.83.148])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  4 Oct 2022 09:54:12 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 1/2] powerpc/64s/interrupt: Change must-hard-mask
 interrupt check from BUG to WARN
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20221004051157.308999-1-npiggin@gmail.com>
Date: Tue, 4 Oct 2022 15:24:11 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <20BCDFE3-3786-49ED-A17A-28FA7700C839@linux.ibm.com>
References: <20221004051157.308999-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8VK5fJvKgiOWIDdisfCzGqsqBxIphs6X
X-Proofpoint-GUID: _0Uhmj28nwkXxk2tJzC7EgRajExAMTo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=954 impostorscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040061
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 04-Oct-2022, at 10:41 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> This new assertion added is generally harmless and gets fixed up
> naturally, but it does indicate a problem with MSR manipulation
> somewhere.
>=20
> Fixes: c39fb71a54f0 ("powerpc/64s/interrupt: masked handler debug =
check for previous hard disable")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Thanks Nick. Tested both the patches on Power9 and Power10. I no longer
see the reported problem.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin
