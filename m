Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9DE84A0F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 18:37:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BiRNHlK/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTD9Z2yjNz3dFm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 04:37:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BiRNHlK/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mhartmay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT7nw4hBTz30XZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 01:20:36 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 415EIMcb031493;
	Mon, 5 Feb 2024 14:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=bXHIioVqh5fYg2wfi29MHPmCBpLjApCBOLSYCA188qo=;
 b=BiRNHlK/sbO74w/nyY/aZK1S2jnEQtslw2Rts/wDr/xuQZm6eKT2WrLuYzQWNnTiHlPi
 NM48sGg/nUEqHzaVttwmAo4mwf4cacGzuV+jNKjbEDD/ycF++TBsyiuVng6PFCX0IKJ6
 UYM1gtpp0SWTOpkCoAmRUz55J6bM7UXLUwVzABZKSUIZ1qEhiYRppVi4szuohvWMM7Yo
 TamCCF6xjiMcscxM+6Z6rK/3pUwwUSwIb0J6mt/CKSybkoIHDKE28hOm2dK3jYI6+Wyh
 aCQhs8DY27aojuJN5iCiuCkPah7Vlkx+ht11iHwk77qEOkBjQn7YrEG9iVihDd/pWTUy yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w31aqg1es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 14:20:19 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 415EJRFv001741;
	Mon, 5 Feb 2024 14:20:15 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w31aqg1dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 14:20:15 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 415CZVWl016215;
	Mon, 5 Feb 2024 14:20:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w22h1rebg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 14:20:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 415EKBTj25756218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 14:20:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEBB420049;
	Mon,  5 Feb 2024 14:20:11 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD77C20040;
	Mon,  5 Feb 2024 14:20:10 +0000 (GMT)
Received: from li-1de7cd4c-3205-11b2-a85c-d27f97db1fe1.ibm.com (unknown [9.171.59.40])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  5 Feb 2024 14:20:10 +0000 (GMT)
From: "Marc Hartmayer" <mhartmay@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v2 1/9] (arm|powerpc|s390x): Makefile:
 Fix .aux.o generation
In-Reply-To: <20240202065740.68643-2-npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
 <20240202065740.68643-2-npiggin@gmail.com>
Date: Mon, 05 Feb 2024 15:20:09 +0100
Message-ID: <871q9ryova.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E_UQLZzuAQX3Cmy0SGcM-0uS1WzSgQUT
X-Proofpoint-ORIG-GUID: 3S1Vxil0i0--MMWXxApbW9AHcufAytFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_08,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 clxscore=1011 adultscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050108
X-Mailman-Approved-At: Tue, 06 Feb 2024 04:36:17 +1100
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 02, 2024 at 04:57 PM +1000, Nicholas Piggin <npiggin@gmail.com>=
 wrote:
> Using all prerequisites for the source file results in the build
> dying on the second time around with:
>
> gcc: fatal error: cannot specify =E2=80=98-o=E2=80=99 with =E2=80=98-c=E2=
=80=99, =E2=80=98-S=E2=80=99 or =E2=80=98-E=E2=80=99 with multiple files
>
> This is due to auxinfo.h becoming a prerequisite after the first
> build recorded the dependency.
>
> Use the first prerequisite for this recipe.
>
> Fixes: f2372f2d49135 ("(arm|powerpc|s390x): Makefile: add `%.aux.o` targe=
t")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arm/Makefile.common     | 2 +-

[=E2=80=A6snip]

Thanks a ton for fixing this!

Reviewed-by: Marc Hartmayer <mhartmay@linux.ibm.com>

--=20
Kind regards / Beste Gr=C3=BC=C3=9Fe
   Marc Hartmayer

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Wolfgang Wendt
Gesch=C3=A4ftsf=C3=BChrung: David Faller
Sitz der Gesellschaft: B=C3=B6blingen
Registergericht: Amtsgericht Stuttgart, HRB 243294
