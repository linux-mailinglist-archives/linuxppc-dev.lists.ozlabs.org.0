Return-Path: <linuxppc-dev+bounces-8646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A1EABADE8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 06:11:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0S6h02mhz2ysb;
	Sun, 18 May 2025 14:11:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747541467;
	cv=none; b=QKFfTPV2VUGJo3vndok6SHrrIcf8oylulRvlOWQKqxq5ttniVOIZIy2dsgF2RS9drSZrC5uGg1CzSW2vHBB+XOWqMQOmcX4OoPh44ZksYfHXykvIs0uEHZYkGoVL1bfBwQSWIBBS2LlApFNsATrtGR9nxKOlGk/GACFypinm8tOchEHcg+gy9LUEWIxC/vcTkU/Fc60eITmZ20ZLZlkXznTUd7ZIrfGsSW/3eYSETj/n+5GYWxXOBOOleBcUPPY7nViEZF55FSqhb1SBahNUysCxV7VhoUY6/rwGE+xraWo4L/NOJdn0r4pr4keTxHmP7jinHAjsNRNgSeJxkomfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747541467; c=relaxed/relaxed;
	bh=lZr01GmqW9FsJmFstYGZZlQSl2u2zNrJtPHT928qRvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JL/mf1FYheRih+iiSWtDO2sbBgQmKC56QMDf7JmFPmCh72BxJMKdsb2xvarhLyZcW1EU/Fc7/IQzetuwGfk5csDA6wTLcgf1cJ2WGrF76flH8dZrwzzzhv56a0TfS463S15qBSy7zagG8KpMDuYL74ERSS5QgifLNauNXdTKfhf02EOAkY3bo6FY3UQdWH81AOS6av9jHXh5sFiZki9MNcHnr7IjR1tVSNIsSYJ59peNcAmNICR2g1om/pf4c1ZFtNfsmXaKPes0uK4paturlWJVzXXaLpCetU8IDZ5Hm+6cJVXJ6ZduvJSwqHvi+D5ADKnnsMmy4ZkgNoVn5mSzlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jXmwgWw5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jXmwgWw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0S6g1LZXz2ydx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 14:11:06 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I20P2i013585;
	Sun, 18 May 2025 04:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lZr01G
	mqW9FsJmFstYGZZlQSl2u2zNrJtPHT928qRvk=; b=jXmwgWw5rSQFfbF5VGlFTQ
	BZED1ifx4KQht17bODgPH73zORx1RiKckhRjJmUAkM3B+mOfVAKEPOwd2p6ot+sS
	l6ru9FZJEHCtg1Fe1tJE549z1G7XASDqrE+f8SO8hE/LB5Wtycv5TeoTA6oJe+X8
	hPWjnFa7p84tDFBquTQz/Kcw+80b/69gqEhyJp5JCVNHH1N45Bef4PDfPBcKhgLH
	9/YrFP0J3/8WJnuyk1mAJSuMdmHeuYkYZnHQ/RFL7NkFrXODhItO5ly0HKQXy1wf
	7wJUdSXCqZ49+i84HAfTIkrm+C5STrw/uaIPfcvSE1a0C7U0OFCsa3pBjuj4p7LA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pn2sb9rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:10:34 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I4AXsT024560;
	Sun, 18 May 2025 04:10:33 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pn2sb9rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:10:33 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3FMlI016070;
	Sun, 18 May 2025 04:10:32 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q7g20563-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:10:32 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I4AVda45220270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 04:10:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A34EE200BA;
	Sun, 18 May 2025 03:45:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 855FB200B3;
	Sun, 18 May 2025 03:45:04 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:45:04 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Replace strcpy() with strscpy() in proc_ppc64_init()
Date: Sun, 18 May 2025 09:15:02 +0530
Message-ID: <174753967075.24504.4269062328317378824.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421183110.436265-1-thorsten.blum@linux.dev>
References: <20250421183110.436265-1-thorsten.blum@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzNCBTYWx0ZWRfXx/zOcLDG91Ed IEEgr3xxtD+i4n+eek2esBuXvLfm86CSuCKfZEImltjgSe9bd5Z99kDAVGDjYs+Zi8qGblAwp9t H6ved9YS3zSKqWTz/lL+5DyF7XM9zRzAdzWKi83Sd3tgS622eGrtv2OgwyW6zj/D5hefIo2JM/m
 TOBTYUlNKbV1LpG/yxAblIMFZ93TDhzwQCIFPjINJsbMo+0L/cQHwxf8e94AH/F74QLf+RcdQ8L RxToVbSnos6XVBzX5VjzjniPGqEYK+JTgp0aNQPnJV1EJ7QuV4bznOozX37P9fp6Vfh06a+QUpy iqJTUtnBFnfcVid69lIjkhgUCoWzSmgP5yBRcH/NWRY+Hoaywz0GDPKZa0JFt33loNaftxcfs5t
 NSNDymeGH6gcWKOkbCjR5XS9Q9E7uES/FkBouKUHjRrvW7WX+OWK6CrpP8S0wAfzGehYsoGn
X-Proofpoint-ORIG-GUID: dBHuUcMunzL_RAR4C-1ueT5IMf6FvjuC
X-Proofpoint-GUID: jv_TqUPimTSwFXqO-AStKCjPLWwjZrVC
X-Authority-Analysis: v=2.4 cv=GYQXnRXL c=1 sm=1 tr=0 ts=68295dba cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=Uu9fRxi0hxKbv0zXlPQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxlogscore=691 bulkscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180034
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 21 Apr 2025 20:31:08 +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Don't cast the destination buffer from 'u8[]' to 'char *' to satisfy the
> __must_be_array() requirement of strscpy().
> 
> No functional changes intended.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Replace strcpy() with strscpy() in proc_ppc64_init()
      https://git.kernel.org/powerpc/c/7e99a4a60d8fc9b24a3f9632011bf7e197f1aff9

Thanks

