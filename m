Return-Path: <linuxppc-dev+bounces-7040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B50A608C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 07:07:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDYmL1vMQz3cWY;
	Fri, 14 Mar 2025 17:06:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741932418;
	cv=none; b=XIFKSKWldIZKynRyke49bedPU9TlqPicXaKQge4FKaRhY+nhH6wkwMoxHqSZQhC7Tu+bvLYewjJFVeqorH+JBEznRj0wuBpwGqZ3jIFzYY6RcysbnvfD3wx3YCvocPIgQrTU0XiCy6XBaZXc6S5EX9fDM5mR7ByNUMUdlwda23wQv21Ukc36jyiyIDDFAEcMpSJGdCMOUf+bGyMHgx2jewFX9SevDcvWy+vspjrgbEddoPURsXV2ARiBQJz0GEQ1+T/SVANITGcXqYZjtX52x+rd8CmKYPHRIURW+e4gWzdgDANdbMKfN5mxMWLGI8ktzPgVKSd4AUyOYB5SQXr+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741932418; c=relaxed/relaxed;
	bh=3TAfxR0+JNQ+AK6DJa4DTZDj6WBkKdLqZCDSRsJoqBs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jyinEnYB8+9TE1tU3cGZn9ZXT4UOjH/MVd+Lg91p3VDaqqkBoCtEguthlNSQ97mvr8DcsWWPNPCZj9vFfPLIzmOLlGPwoGIzmnEGSaWuZuZchQAh6w8ETigAMBzXXmcWy5HC9NND9oTQ6gxpU0BI7Ycpn8+FGoiskfiSBi91G4bIA4Kp+HhkoDV8NZcMP4N99NRafzx8LhWoSQ6ZoRwtDazn75/DmotdZYPQ1k8arYyszkiP4k2U262mUlIreMyz8eEgsp/OsM24WHtOnMik7VzNS63KHwoU3UViFtB0B4YEZqH3PSRQmhgksLq1vMKgkOG0fcKfsw8PLMvxEjBDEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sHvkkvJp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sHvkkvJp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDYmK1vw3z3cWW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 17:06:56 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNPvMS032088;
	Fri, 14 Mar 2025 06:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3TAfxR
	0+JNQ+AK6DJa4DTZDj6WBkKdLqZCDSRsJoqBs=; b=sHvkkvJp6uTe/srVh5O6SU
	AritX+k4Zr8ANKQwnkKxmyc+7iMZiPQ7PuOH0zFWys/pI5OnCU2eCA9YnO+NGtEO
	VKx5WBaslwJejMuCkK4zM2ggeJ+6YBH8aTV5v+o5K+CR7bFUwnUMeFEMTZwP8sat
	7gEiuJXpvyyaUMw03p7U4I6Sj9St5wixrdlCkBXJlShGaCuFur3j/RqpH7+Izous
	qhsVAl/d4tpyPEiakrBCaA8LWXOL9ToB1xRtjlmm0BcfTZp1SY9YzQ86ok/eLU7E
	RZg3OtohKA6nu0FwH2ArAsfqfTxsfW8PMQLUDF30lFpw2JBCJSKa+94T+2RSE8nw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8vj3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:06:42 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E5vYGC021391;
	Fri, 14 Mar 2025 06:06:41 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8vj3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:06:41 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E4sd3Y007412;
	Fri, 14 Mar 2025 06:06:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsrdfxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:06:40 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E66cTv30540176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 06:06:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7837620043;
	Fri, 14 Mar 2025 06:06:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BE3420040;
	Fri, 14 Mar 2025 06:06:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 06:06:38 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.9.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D58496015C;
	Fri, 14 Mar 2025 17:06:29 +1100 (AEDT)
Message-ID: <af15fbf507dee3d96249bdfbb1a7419a26985f9b.camel@linux.ibm.com>
Subject: Re: [PATCH 5/6] powerpc: powenv: oxcl: use lock guard for mutex
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
        peterz@infradead.org, fbarrat@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org
Date: Fri, 14 Mar 2025 17:06:27 +1100
In-Reply-To: <20250314054544.1998928-6-sshegde@linux.ibm.com>
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
	 <20250314054544.1998928-6-sshegde@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IdXWrtzs-qGyOw1hSOlmMCTkWa62cKbu
X-Proofpoint-ORIG-GUID: bwtSkGtVfUUsI5TEb4fLIDr8VP5plEF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=417 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140045
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 2025-03-14 at 11:15 +0530, Shrikanth Hegde wrote:
> use guard(mutex) for scope based resource management of mutex.
> This would make the code simpler and easier to maintain.
>=20
> More details on lock guards can be found at
> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
>=20
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

The subject line of this patch misspells powernv and ocxl.

Otherwise this looks like a nice cleanup.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

