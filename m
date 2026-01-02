Return-Path: <linuxppc-dev+bounces-15162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22750CEF0D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 18:24:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djVsr4rLQz2xrC;
	Sat, 03 Jan 2026 04:24:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767374640;
	cv=none; b=JEygWWHK7JWbz3k3u/kvC/asv1ZG0hzzdvHPL0cM9bhaV8AzQpK6RdKw1lUxRR8Gj8SbMe8W23wrw388USEQT8AUmFBnL1ySYqwSrsORYJJV+7AQ/woaxEsa6UGufZnjcYMMtLsfOPm1hlMuFQaL0vI8l58KxBRYpbGgENu5ZEaw0V0XSmXKtWbC/ZRRdcZYnDMP+SmKAvyGmwRyR4cL5GKarnd4KNqHfWsdHyuzvHiWGFiG5pRkbqSTntLp6AyvY6wPWnjvRUG0PkbuZ7yraGHK5DDFpy0qn/4AinOHb1F0/gsAocX8yL5QgbAzDuLi6pAitC13H1lu2/oujAeGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767374640; c=relaxed/relaxed;
	bh=ze1t0HSoVtwVpp45sEbdbOBu9rBOWJHz6bjhHet3Le4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ejYk4aei5eXumxMM5C31awdNRrdk54Qyj0VYpJtTy+0YfI9BNtp7rXq708COSEjG6Dm72+cOPZnfOeQVMPHQ1ZvNA/q1SFjJPBbECUKdew6oFPP3Bgy+E0CjtaaehIC9Hh9rN3kBp8uT1quHT4XWiMDZsUUhEDc11ZahDS+1slLpulK+467K1bwQB2UjVxEimb7AH00aaVVUMjBkIFR0fQ8LY+ayN9sV/MhD74tzL5r8DYpkaHeNh0Hwz8rBNHDzhpUDX+HsZzVwY/jtQU6hbwqENz5h++CV23ZfsiHF3YN87bzrpOEW2Bbt1qYHp39IvP7qqMh3XFrj4q5PhSuH5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gDPp8jog; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gDPp8jog;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djVsp5m6yz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 04:23:58 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 602FFKHV010232;
	Fri, 2 Jan 2026 17:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ze1t0H
	SoVtwVpp45sEbdbOBu9rBOWJHz6bjhHet3Le4=; b=gDPp8jogfeaMd8HnTKJpEg
	aFEQV5sSGKiku4miEqtdGo+EcnN+M37dwjQyYSmauEcZ6jKS2Fwd8ORECJLugX/y
	k7okoJwQcXt4py5zkZu1NQhtB2j08mwAQ8yG2p1X/fYLxKUnNSvzt6VZBAyxekMB
	xGIrZoVGK0n6ic1B/fLlk0PvCMTxuwpZ+ohRHACrkHER5Ncy7RQeeZWx7aQ7P4lE
	PyXXiN0iDcGvudTBgv3nVn/4q9TMC40/sf5Nxc7j+UTHKzGCNPRXJNC7Zqfz+okv
	hTl24JiJCy79n7cFk65EEb5jwPOx8Yvr0P3EMVVFUjLZ0C/Vw5KM61VPUVaS7kyg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba5vfdcwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:23:43 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 602HG7q0015791;
	Fri, 2 Jan 2026 17:23:43 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba5vfdcwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:23:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 602EeKta026013;
	Fri, 2 Jan 2026 17:23:42 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4batsnqfdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:23:42 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 602HNeN28127344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Jan 2026 17:23:41 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6C195803F;
	Fri,  2 Jan 2026 17:23:40 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A16858054;
	Fri,  2 Jan 2026 17:23:39 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.43.105])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Jan 2026 17:23:39 +0000 (GMT)
Message-ID: <b37e42f245bff2ac47a0c97d91592f5089f99979.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/6] pseries/plpks: fix kernel-doc comment
 inconsistencies
From: Mimi Zohar <zohar@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
In-Reply-To: <20251217172505.112398-2-ssrish@linux.ibm.com>
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
	 <20251217172505.112398-2-ssrish@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jan 2026 12:23:38 -0500
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
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=a9k9NESF c=1 sm=1 tr=0 ts=6957ff1f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=PF3O2vm9e2mnU8G7xqAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -eDRTaFxnuSK5d7pvnFMlr0GsGZkZWoa
X-Proofpoint-ORIG-GUID: eu82CnB8m5OaGdcVGiFbXbKtjHLp97U5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDE1NCBTYWx0ZWRfX7RzsYMzBP9qN
 kIH3dcHavEZ7X39qUchrbbE5shCK7T6E3mGJQ7qKPG6XHLgXWnmgfY/YOMytXCznp4UufF7ieFX
 hm6lKi3Kc1y7P7H4sGzTR0QILuQB0NrL00xuJFxkOIQu9bre+LJvzP36kONMfqB47h1riziLe1h
 6vwaWqQDEmt0Qs8ioagHJEf0Q8TPcqOmEu7j94fC11Vx8ArDkxxcpT8iap8eAa9j38pxxwVeBwt
 1UkJZ0rfxbxUJzwQiG18k2tnJ0Nzt3I08xe8quN2DfyarTFhqWZlPr0Wfqn5eC9KCjjdbF354Kt
 f3UbzYJq9LRXp/L9lDt7Xw5WmsJnpPnoysKnfO78WEVwqblFPNREL0m9VI+sFoZLVuri7rEGIBk
 kul6OwixmJz3RHql6qiOffJe9KiZgBUA9iwjdeFSP9vxgOTs3ku5deAKUN4LdZzpkItak+HSfOD
 Ffy61nciehR4tsyL/Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601020154
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-12-17 at 22:55 +0530, Srish Srinivasan wrote:
> Fix issues with comments for all the applicable functions to be
> consistent with kernel-doc format. Move them before the function
> definition as opposed to the function prototype.
>=20
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>

Thanks Srish for moving and fixing the kernel documentation.

--=20
Mimi



