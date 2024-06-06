Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 259448FDE03
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 07:02:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CkgJxfne;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvsdB4gFKz3cXb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 15:02:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CkgJxfne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvscT2xqZz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 15:01:28 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4564vtDx006539;
	Thu, 6 Jun 2024 05:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pp1; bh=BymymZEyA0yHK9zj1vReM5+8mEepYefZuoRBwFkiKqc=;
 b=CkgJxfneFAYTO8f0IEX5iCwHmEuifWjQs/1UhdPzvYekt/vqZpc/qbLOwmc1vzvqxiTl
 bOn5A9gdaq7IWKwCMBJ5mDSDA+romw0Eivp6EN27Nm8dS967RFYtukNJzFJRBbFg2eXz
 Hue/g/t85w6BqTqcymuen5JATIOqrKjrTPwyKNzD39AYWTM5n5p858hBc3JdolrkAlm+
 iguIZ08liIl1mO1xNbl3zgzEIfG4DBeLTa5EA0sCWf6XgwOBhQRZrfTVzP6GXCPMxvUa
 /SNKqZakv/F/oHtbz58P3GJIdOlXyxHzoK8zhe6RHLIZRUaSNaaaHprFedVCApdrareR Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yk6hpr0b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 05:01:17 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45651GgO012946;
	Thu, 6 Jun 2024 05:01:16 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yk6hpr0b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 05:01:16 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4561Wvow000781;
	Thu, 6 Jun 2024 05:01:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygdyu8td6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 05:01:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45651CF449807754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jun 2024 05:01:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1111920043;
	Thu,  6 Jun 2024 05:01:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40BA82004B;
	Thu,  6 Jun 2024 05:01:08 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.43.32.207])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  6 Jun 2024 05:01:07 +0000 (GMT)
Date: Thu, 6 Jun 2024 10:31:04 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/2] Fix doorbell emulation for v2 API on PPC
Message-ID: <bpeyrufcsihsd6mllreour3rd4kmtkpaagoeantsz3qpgfyl2u@lxrdmjlsj5oc>
References: <20240605113913.83715-1-gautam@linux.ibm.com>
 <D1SLK9T4ODZO.11N6J5D94530R@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D1SLK9T4ODZO.11N6J5D94530R@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zff5-WbwXj-_z9krGYPFA0JECxW8aSsX
X-Proofpoint-ORIG-GUID: IP0Nw7Vu1g2iFtlKuxbNXvYmpd1ZM1lN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_08,2024-06-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=525
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406060035
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
Cc: kvm@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, stable@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2024 at 01:00:19PM GMT, Nicholas Piggin wrote:
> On Wed Jun 5, 2024 at 9:39 PM AEST, Gautam Menghani wrote:
> > Doorbell emulation for KVM on PAPR guests is broken as support for DPDES
> > was not added in initial patch series [1].
> > Add DPDES support and doorbell handling support for V2 API. 
> 
> Looks good, thanks. So fix for v1 doorbells is coming?

Yes I've root caused the doorbell breakage in V1 API to 
commit 7c3ded5735141ff4d049747c9f76672a8b737c49. I'll send out a fix
soon.

Thanks,
Gautam
