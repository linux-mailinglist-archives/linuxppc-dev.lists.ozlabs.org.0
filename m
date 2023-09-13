Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F020379E84C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 14:50:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PBTkdMx3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm0fr6DvJz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 22:50:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PBTkdMx3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm0dx6fLrz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 22:49:41 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rm0dm39PVz4x5J
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 22:49:32 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Rm0dm35dvz4x4D; Wed, 13 Sep 2023 22:49:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PBTkdMx3;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Rm0dm0nTlz4x3D;
	Wed, 13 Sep 2023 22:49:31 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38DCgNHZ008272;
	Wed, 13 Sep 2023 12:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=vG9I/8EExw5T5a9/O+8mnQd48Bf5ohWZENo7yaYMpGw=;
 b=PBTkdMx36SBk7th25NWsUrJTC4usB/Pqu94IeU26x3x/8RmrU9hMRNFkWcmPtCbZx2Te
 6nEq9kAjT8qB0krTziX9yX97AJFVDutHmu5RE/YY9mFfLN81vC8LHgsXXT6VaLBDeUm+
 XRThUfKn5U7EKwIAPJ9urWtbBAMOC0e2MsRrQ0YnDDBr0rSeQfHJZgTj9Z2QGjf25WCm
 4qtf2yOtjHXDt/zrL6krPql7ipVa0cUg1OwKUeY0ZlqBUDUEF5h6mXoQoiHgC3Zm0qye
 nhjoUyYoYt6AfGGfp06bSKY9BMWSPgsFpRGDSVqvMDxOzJqe756EiWPX8HSWf1ha4P2R 6g== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t3dapg8x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 12:49:27 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38DBM8OX002318;
	Wed, 13 Sep 2023 12:49:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t158kara2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 12:49:26 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38DCnO8O23855720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Sep 2023 12:49:24 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 239882004D;
	Wed, 13 Sep 2023 12:49:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E291B20040;
	Wed, 13 Sep 2023 12:49:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.220])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Sep 2023 12:49:22 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230911091409.415662-1-adityag@linux.ibm.com>
Date: Wed, 13 Sep 2023 18:19:11 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A4BD07EC-C0B1-4957-9201-35C15706F40B@linux.ibm.com>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
To: Aditya Gupta <adityag@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3C1scpPbhjCx2sDSNDNEJ6Y0Y-ICrSeh
X-Proofpoint-ORIG-GUID: 3C1scpPbhjCx2sDSNDNEJ6Y0Y-ICrSeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_06,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 clxscore=1011 mlxlogscore=858 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309130101
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 11-Sep-2023, at 2:44 PM, Aditya Gupta <adityag@linux.ibm.com> =
wrote:
>=20
> Presently, while reading a vmcore, makedumpfile uses
> `cur_cpu_spec.mmu_features` to decide whether the crashed system had
> RADIX MMU or not.
>=20
> Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
> a vmlinux is passed with the `-x` flag to makedumpfile), and hence
> assigns offsets and shifts (such as pgd_offset_l4) incorrecly =
considering
> MMU to be hash MMU.
>=20
> Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
> `cpu_spec` struct, to VMCOREINFO, so that the symbol address and =
offset
> is accessible to makedumpfile, without needing the vmlinux file
>=20
> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> ---

Thanks for the patch. With this patch applied (along with makedumpfile =
changes)
I am able to capture vmcore against a kernel which contains commit =
8dc9a0ad0c3e

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin
