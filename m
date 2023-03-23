Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9536C67FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 13:18:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj49m5R9sz3f7m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 23:18:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UhGrmVGV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UhGrmVGV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj48s1GDHz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 23:17:16 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NBtMer005459;
	Thu, 23 Mar 2023 12:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=fjtbWGSxvlY/uRmlcmWvGjZmek9sfYVeHGNSd5Tmx1A=;
 b=UhGrmVGVnxskCgeH52Vfeke/HrEfgPabN7upged2+NDk/xQNFyviUEFyaGv0IwxqLty+
 CyyF567omaN/VG0EErOgp8z9Vn7z2qEuzY+CegskrZfMUeoCeIjftAda9VWm4piEmF7l
 UTSDGI6tvaWqyEj6HJrBTPWwXMAoyraYaqeLJdilRvfE5Sizfzf1Ncq4Rem5SpK9gDkZ
 DE+IKP4/reNJduthCW3MYNhJI3FPSt1+O36rPNhg3gRTNXIElkWIU54IkS9AgbuYbZxc
 of8F6a1fMvgIL2pkCdcA5ivhFCmhYC+jOkQ/GXsrfJBJk+x2LHQNHEbcSPjJ3lwcXvRz Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgkxuv4v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 12:17:08 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32NBVmsP007244;
	Thu, 23 Mar 2023 12:17:08 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgkxuv4uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 12:17:08 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32N8e9sp012015;
	Thu, 23 Mar 2023 12:17:07 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x75sfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 12:17:07 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32NCH5DY15794712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 12:17:05 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCFDF58059;
	Thu, 23 Mar 2023 12:17:05 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 966BA58058;
	Thu, 23 Mar 2023 12:17:05 +0000 (GMT)
Received: from localhost (unknown [9.211.90.228])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 12:17:05 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH 7/8] powerpc/rtas: warn on unsafe argument to
 rtas_call_unlocked()
In-Reply-To: <e0f8c82707dce0300fc5a2bc5f0a3ab90a83cee0.camel@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-7-010e4416f13f@linux.ibm.com>
 <e0f8c82707dce0300fc5a2bc5f0a3ab90a83cee0.camel@linux.ibm.com>
Date: Thu, 23 Mar 2023 07:17:05 -0500
Message-ID: <87mt437jcu.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FXbSmraFhTQRCjn8E6ZiO9znHstvnCtJ
X-Proofpoint-ORIG-GUID: bFnEAx_FmvGAvG67aNkCaxVifIGbUFmf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230091
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:

> On Mon, 2023-03-06 at 15:33 -0600, Nathan Lynch via B4 Relay wrote:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>> 
>> Any caller of rtas_call_unlocked() must provide an rtas_args
>> parameter
>> block distinct from the core rtas_args buffer used by the rtas_call()
>> path. It's an unlikely error to make, but the potential consequences
>> are grim, and it's trivial to check.
>> 
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>
> call_rtas_display_status() seems to do exactly this, or am I missing
> something?

No you're right, the warning would be spurious in that case. May need to
drop this one, or refactor rtas_call():

  4456f4524604be2558e5f6a8e0f7cc9ed17c783e
  Author:     Michael Ellerman <mpe@ellerman.id.au>
  AuthorDate: Tue Nov 24 22:26:11 2015 +1100

  powerpc/rtas: Use rtas_call_unlocked() in call_rtas_display_status()

  Although call_rtas_display_status() does actually want to use the
  regular RTAS locking, it doesn't want the extra logic that is in
  rtas_call(), so currently it open codes the logic.

  Instead we can use rtas_call_unlocked(), after taking the RTAS lock.

aside: does anyone know if the display_status() code is worth keeping?
It looks like it is used to drive the 16-character wide physical LCD I
remember seeing on P4-era and older machines. Is it a vestige of
non-LPAR pseries that should be dropped, or is it perhaps useful for
chrp or cell?
