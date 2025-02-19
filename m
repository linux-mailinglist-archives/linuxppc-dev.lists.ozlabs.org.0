Return-Path: <linuxppc-dev+bounces-6338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A05A3B113
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 06:49:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyQTF5DKZz2yMh;
	Wed, 19 Feb 2025 16:49:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739944193;
	cv=none; b=Pq5Eb6MF5AXvpkl1J44MXEwiLLWLId8lT6NKappXR1COoConwLdLjq4Qx066pfa8quqeVmr7kyxfAx9pn9VJR5QRrdkxrNGSwKxG/yQetQ3e2AuweRnA8yRYarkrncgrKtierunkzrN60HZMlczgKUzxMrKxQ4hPgtc7J+z4EAroabX8fXbPKrJB/i3bZgESeHIiOOhX3tl/Awfg1BXFT4te8Afceh7ILD2oagSUPVM7YzyaigLpTSM1SXZYj3r0cQQjoH1jXl2gpazUiskVi6U8ef2G6+beQLGpkBZrdX2BPlqGYZB3Sipox9GE3CUitvlQFUyalQjgDk3ojUjSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739944193; c=relaxed/relaxed;
	bh=DlSMfgiPnDwuemdvuxNC8ndrB15CyhAUTewsr6te6to=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a+iTw63treTQQ5dlPvHOvsdTtZ4VsNuozzoCDX7HfBgVEYem3RrhqMrxgH7aiO1B87cqN8FVh0o47yRXs8d3q8rAwnNRZ7V3EF07wi7VSpBEUDfWlKNgbXzxbo2Ryrz4FFHB+QdX78EUaguujx/hJIMpN3Mn/Y1yH3qLTgGMd582WB282etdUJ0VvhPoCtro2KtvLCKt4S9y84BudaQcg51rjSjX+JOWk4GJv0S9WbRgpUgQDPUNNKa5cAqakbzE/2u6IkIyI0gHOPW5UJSrk16sfXxEWYjQyYT8M3NxaCUa6qJq/rsykUNVRX1sfhg5Rw+5o41iTqQRAyezOdZ4Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g8O6Yc6F; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g8O6Yc6F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyQTD34j6z2yGm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 16:49:52 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIxluG007930;
	Wed, 19 Feb 2025 05:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DlSMfg
	iPnDwuemdvuxNC8ndrB15CyhAUTewsr6te6to=; b=g8O6Yc6F2jtIJvPuJxlAW8
	sElBdow1C0Q1Yk+L8Hhts727xqsE2IR4TnsbuG58R4OsmVd2OnKYMnYc4Boqhsjb
	s+lADZSYSqn0eVZRQoxVjiIqO6WG2ZAPzUZ8PZBm4Rlfg4jvPoHC6ZgPG6de4UHr
	/vI1cJJq+nuL5n0frkjYPeNs1uADAA+gcw9SKotrGYPcwr+EBEojtEVFSqpmAH+K
	4PsevT1TjkiN1Y0SXZJzomhwWXS5uZD4lnP53aUDCgUVEiYOo0BObqqolyRfHshf
	/odjXB5BwlxoyySpeczb3fnW0VJm+LYVaknOuTfsyNP4/r7u3+mm5mWjet0gRHKQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44vyyq25gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 05:49:39 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51J2uP1c002323;
	Wed, 19 Feb 2025 05:49:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44w03x2cn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 05:49:38 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51J5nbsx60555620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 05:49:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59C2F20040;
	Wed, 19 Feb 2025 05:49:37 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E824020043;
	Wed, 19 Feb 2025 05:49:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 05:49:36 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 68DD76015C;
	Wed, 19 Feb 2025 16:49:33 +1100 (AEDT)
Message-ID: <866cbf9a3a5b9605b368b694f1ed333eb9394923.camel@linux.ibm.com>
Subject: Re: linux-next: build warning after merge of the powerpc tree
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Madhavan Srinivasan
	 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC
	 <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Wed, 19 Feb 2025 16:49:21 +1100
In-Reply-To: <20250219154649.49986660@canb.auug.org.au>
References: <20250219154649.49986660@canb.auug.org.au>
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
X-Proofpoint-GUID: rt1nlQhdMa46Ko5gKqHA2HVVCa65_Fb7
X-Proofpoint-ORIG-GUID: rt1nlQhdMa46Ko5gKqHA2HVVCa65_Fb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1011
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=888 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190040
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 2025-02-19 at 15:46 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the powerpc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> WARNING: Documentation/ABI/testing/sysfs-class-cxl not found
>=20
> Introduced by commit
>=20
> =C2=A0 5731d41af924 ("cxl: Deprecate driver")
>=20
> The reference is from Documentation/arch/powerpc/cxl.rst
>=20
> I don't know why this has appeared just now.

I think this warning is added by ff7ff6eb4f809 ("docs: media: Allow
creating cross-references for RC ABI").

I can send a patch to fix the reference in cxl.rst.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

