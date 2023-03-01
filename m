Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2FA6A769C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 23:06:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRpHL4pgBz3cFW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 09:06:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKe0O2Lc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKe0O2Lc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRpGK6zkMz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 09:06:01 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 321LMTWG027826;
	Wed, 1 Mar 2023 22:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=39c11Ssc1CX8s2GyMWJeHdQmYlK8L6WtbDOGfOdmh68=;
 b=iKe0O2Lc5KkXR5ERdZWkP/fQ5VATfwlWMkhls6rIzEHd0ZJJwuJZb9iwCVRqA4+8/rtv
 QTZp4mNzYlIF2y6u33DUXnmclc8fYiyCaUG8hxAaXj/7dpLeXXk04uveFv3k+cxmQttK
 VEr49CBvVtQ0XObImwmLC+uUeV9oBhngtZeH446kcgVr2nKA5WzXxhdapTVOkzLeix1v
 R3rrjpJFAfflcS5vUmLbbPe9s5JjzPI1mjAwGGMfXF0kUxk4Y+qS1iGDbWpZEYUi9tYs
 h2/8ag2cm3rO2cUYzk7hxloSM2mA7m27wUo68d0TGLncJR236WrTLtAXi/jf1iFTX9Wp 8Q== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2ejms520-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Mar 2023 22:05:55 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3210UQow009219;
	Wed, 1 Mar 2023 22:05:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3nybbyumhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Mar 2023 22:05:52 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 321M5oqU67043768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Mar 2023 22:05:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F1EA20080;
	Wed,  1 Mar 2023 22:05:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 217FC2007F;
	Wed,  1 Mar 2023 22:05:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Mar 2023 22:05:50 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A5045602FD;
	Thu,  2 Mar 2023 09:05:46 +1100 (AEDT)
Message-ID: <5a796d43f45c86d770ee88cffaae78f4ca305103.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] selftests/powerpc/pmu: fix including of utils.h
 when event.h is included
From: Benjamin Gray <bgray@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au
Date: Thu, 02 Mar 2023 09:05:46 +1100
In-Reply-To: <20230301170918.69176-2-kjain@linux.ibm.com>
References: <20230301170918.69176-1-kjain@linux.ibm.com>
	 <20230301170918.69176-2-kjain@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SxXqKe2oB6PNCtNcfJzA034VYeknEGws
X-Proofpoint-ORIG-GUID: SxXqKe2oB6PNCtNcfJzA034VYeknEGws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_15,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 mlxlogscore=908 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010176
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-03-01 at 22:39 +0530, Kajol Jain wrote:
> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>=20
> event.h header already includes utlis.h. Avoid including
> the same explicitly in the code when event.h included.
>=20
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>

As I understand, transitive includes should not be depended upon. If
you use a thing, and the thing is declared in a header, you should
include _that_ header. Anything else is a recipe for weird include
dependencies, ordering of the includes, etc.

These files all use FAIL_IF, etc., which are declared in utils.h. So
utils.h is a legitimate include. The fact that events.h also includes
it (for u64) is a coincidence. If the u64 type def gets moved to, e.g.,
types.h, and utils.h is removed from events.h, suddenly all these files
stop compiling.
