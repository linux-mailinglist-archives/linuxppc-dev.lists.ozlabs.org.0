Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95A6AD6E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:38:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW44d3BvGz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 16:38:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j/N1ga2K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j/N1ga2K;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW43d2Pmzz3bTG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 16:38:04 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 327418ls032457;
	Tue, 7 Mar 2023 05:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VoBTceaYt9JCGmcdLxZJw8x/bOhn6s3tw9JaQeRiKy0=;
 b=j/N1ga2KFROODXy2i4nxPXv1sYnepvLBfco1bHXAvBSpYycFXi7j/Vq1rWPpHXlVQkPl
 e/J6FgyGVlbbWhYNyMSpXKZ0AjFcY3PZ5/fyZNTajflPvgayUCBWDBkDUKf5+jbJxDCC
 OjWDaz82NaudEQimaavTl+dJj1F/daAelRMdIs9tIjgm8/U/qycRSjr2GazGRI2fLN6Y
 WDZsHaWWQUVF3LjaaQgzNkjm/yOvliMtCjec7n08TGxrYCJv9o+KCORezY6zGXFZmehT
 GpjcNk8ncrvq3cDPDI+/J/2bVpPWRE+pFCmSYn/1eQ86Hw9DLq7cBd57UPWNS/X9GyDX 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4wswvcra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 05:37:55 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275UMpr029385;
	Tue, 7 Mar 2023 05:37:54 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4wswvcqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 05:37:54 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326Lld6m011365;
	Tue, 7 Mar 2023 05:37:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3p418v2xsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 05:37:52 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3275bo4W58720734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Mar 2023 05:37:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 673FC20043;
	Tue,  7 Mar 2023 05:37:50 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAD6120040;
	Tue,  7 Mar 2023 05:37:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Mar 2023 05:37:49 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 28A2460235;
	Tue,  7 Mar 2023 16:37:48 +1100 (AEDT)
Message-ID: <eb19afda911f4868ec6ff194738afcfe7050d5c1.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 04/13] powerpc/dexcr: Support userspace ROP
 protection
From: Benjamin Gray <bgray@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 Mar 2023 16:37:47 +1100
In-Reply-To: <CQZW0SBFI6QM.3FW6O6LJ0PVS1@bobo>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
	 <20221128024458.46121-5-bgray@linux.ibm.com>
	 <CQZW0SBFI6QM.3FW6O6LJ0PVS1@bobo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2JSq7H7t-gkreVYe1Rk65jyRWOcElRP_
X-Proofpoint-GUID: khednyvDzsNf_GUNhkpbdt17rekD4YC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 mlxlogscore=834 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070050
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-03-07 at 15:05 +1000, Nicholas Piggin wrote:
> I think it is not quite per-process? I don't actually know how the
> user
> toolchain side is put together, but I'm thinking we can not give it a
> new
> salt on fork(), but we could on exec(). I think we could actually
> give
> each thread their own salt within a process too, right?

Yeah, the error case is we return further than we called in a given
execution context. A forked child may return after the fork, meaning it
needs the same key as the parent for the hashchk to work. Exec can get
a new key because we can't return with any existing hashes. I haven't
seen enough of kernel thread support to know if/how we can give threads
their own key. I believe they go through the fork() call that copies
the parent key currently.
