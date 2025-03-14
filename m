Return-Path: <linuxppc-dev+bounces-7031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E0A607E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 04:47:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDVgH2MX4z3cW2;
	Fri, 14 Mar 2025 14:47:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741924043;
	cv=none; b=MVj+zvnlp9utd5xSviUQIrjeIu0CwzeXrmvp4b/dJEfc+x5J5+KpWQjnVGrh+P6lD4OwuGiHjQbI8cBnQofJIPcjW7NGkZQeiVIZjFW5xAGNklUIGtWcgFYJpy6ed4askYEIjcai8ucVlU2MgbQ/ark7tGYCE2CaV3XmOjnDbTVNtEDCj/cmbAyZeUabITGgIxGEVmEio2KIIRzU5lRnGWr6eJKGxgKQMj+2KRo+PpjLD3EdJYz8w3O7HouEjiUDWedzDpGISK1gRD7n4SbuLPAn/nEHk4rW1AbIbGxVRgwrSrqUUjqcWKGcF4QfcICSqc/wdpeJrrigrcfjLbKARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741924043; c=relaxed/relaxed;
	bh=jn35deRvCVcgZ11e6phbQa3ao0XQUYGI0q9A1c6rtG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FIeJTuUZxmQDjm07TCmyapTVtjlFjZbLBNbFcKLwNVWIBd15hn1L9ECuRY1mmma945VXglJulsG5ocUCQD7WJ3ZXP0PO61csjZfQFXDmKTfKs/NdsgfI2avEzd06tmByyPBfy0FPwSwi4AOQWeeBfr+BKG3NAtVftvovqHmssPlmsSksnPrModKA+aecJxzkMl/XZoRofLTUx2IR9/T+u73jnb/QiQjrJvXnifc7bmZHWzT6M9A/yhduwM+S38bsx3PhJBDbMsf5farNhA1PQcrL3G/dgSD6ut54GDwOohoWwDYz1KwPCb4Nsc/PZggzWjQYmCQHHZYG3aKThO2zhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BfgXg1TO; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BfgXg1TO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDVgG2g5bz3cY6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 14:47:22 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNPih4015112;
	Fri, 14 Mar 2025 03:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jn35de
	RvCVcgZ11e6phbQa3ao0XQUYGI0q9A1c6rtG0=; b=BfgXg1TOrWR79MFSST42tx
	0o+2sQIf07eiwDXfZ8hbUsGyhJTHo9jrVa/wamYq9Aih2JuwwJhpEW0DoefWGG1p
	R42MvwLMHOraOHKQ4EvXOFyyO0KWMl3hsKTOmXP3DlUfRBdmPorTcNkm6xj9x9jr
	/JZj4qF+7hNBO2wfAwyJ5Ql/pVlZFmg+yyy1su6rFaJDRgObp5q7W+fR5Yn/IVc8
	lHTJAY3LBdduIeg10dVcneF8RBics9YeyV++zdTkGWL4flfcENft8KZ8yzu0lYfP
	0UuN5VGu0Bpjb3296LVX5lRoHfrOhUNOEQ4qA4u1NQVdQBqth0emNrb/BwSYWjZA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6k01dd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:46:58 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E3kvKb028609;
	Fri, 14 Mar 2025 03:46:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6k01dd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:46:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E0F5iU003141;
	Fri, 14 Mar 2025 03:46:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atstw3ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:46:56 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E3krh432702888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 03:46:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5891820043;
	Fri, 14 Mar 2025 03:46:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14C9D20040;
	Fri, 14 Mar 2025 03:46:50 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 03:46:49 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Danny Tsen <dtsen@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Breno Leitao <leitao@debian.org>, Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] crypto: powerpc: Mark ghashp8-ppc.o as an OBJECT_FILES_NON_STANDARD
Date: Fri, 14 Mar 2025 09:16:49 +0530
Message-ID: <174192385438.14370.17442105998926160601.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <7aa7eb73fe6bc95ac210510e22394ca0ae227b69.1741128786.git.christophe.leroy@csgroup.eu>
References: <7aa7eb73fe6bc95ac210510e22394ca0ae227b69.1741128786.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TWCf0-zAmmg-MthTRdUY4FKpVwhV-5tA
X-Proofpoint-ORIG-GUID: wjBXDa6-ut0NTyU-5dfrFA-wQCQyM5ej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=922 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503140026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 05 Mar 2025 00:02:39 +0100, Christophe Leroy wrote:
> The following build warning has been reported:
> 
>   arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call
> 
> This happens due to commit bb7f054f4de2 ("objtool/powerpc: Add support
> for decoding all types of uncond branches")
> 
> [...]

Applied to powerpc/next.

[1/1] crypto: powerpc: Mark ghashp8-ppc.o as an OBJECT_FILES_NON_STANDARD
      https://git.kernel.org/powerpc/c/1e4d73d06c98f5a1af4f7591cf7c2c4eee5b94fa

Thanks

