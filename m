Return-Path: <linuxppc-dev+bounces-8498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5CAB2F33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 07:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zwpkr0zhvz2xqC;
	Mon, 12 May 2025 15:56:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747029380;
	cv=none; b=N378kKutas1eT1IYfHtac+/23KIb+acLg5sltE+gyyuWqbknZocG4g7Gsjdi2kt9SHebZmMIr7iq0JMp5zxV3HUnZqE2QIMgehlqW8VZWVtZMRckZUr6XYQy/SBDVTyQ8SFVV1ISq4QMscY2UtKoOIul0VGzdmpZ82O+x/ac9Gp/RMDwTj5BKiBGAVHunYnerk9nBna2OuzNFEh2YcAIlaWTOcr6gN5kFhMPaFBTSYt5fNiDhjhSawibjoNMVLeSRTJFVmnhy4AMlNFN4Kl/0BogLbYiHs1/m9w2bwoCcuqvMlqriN0gSKm0izLXCkG6XEXPMCGMisSwZycWD4D3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747029380; c=relaxed/relaxed;
	bh=/HZBneFh885hFHtK+mIFsmXRT5LG1VxJtuXyYUQ6Rvg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Alx4mgK9qc+eTdntXc47wZtIhWB0+9DozeOpmStQC7PNtaUQZML4U7BacL4hmxIwH8EIrA4VUnqHNcKWT3q2rROuwSjQGXL/QOP88Z874TAbuWZ2BZ2sU4IY5K+IoeZWn72CvrP2hWwVwr2HRQRDsdSwHrhXqeeFEIuVXOg3btGxXbclPJqEu2RKILKTxs9NeRfAA89YqKup5wQuIwki7hVlLArxJqOY0fi4jwImi+lbE8ww6fHJDQc6o2TJcARVZyPMCeVvyM+iXrTAL7HsiuO5oZgSjg5VGWn1R/WiiVf9okZj1gGfBD5EEeSzy1616G/z3PZmeqk1iXD5L61Fxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cYZHNKPR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cYZHNKPR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zwpkp3043z2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 15:56:17 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BIsxvG017744;
	Mon, 12 May 2025 05:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/HZBne
	Fh885hFHtK+mIFsmXRT5LG1VxJtuXyYUQ6Rvg=; b=cYZHNKPRQY/5iOvCivKtb2
	dd/VMS1tCZKuOeFJHecJQv/vZU+28Z5p02TtRxWLFQWfgGGcPsDXlnUCEcfcm+vs
	2aSdTYhZOdN/Ih84tmYodBA/joVpfKFRgISh8kKi6G+ke60huL0NnWbCkTmGpdpN
	oGN9MOgiylneV3APiC5UYhNhKkxcnpljNhuEEdzqrJjzWYG7YYHxMJ6srPMI30yd
	SNKWHdZhMkQt+TG0nMtVoij9A025EDcyZX8LmzhfMASCQsAp3ilumrgovw0Dua0U
	sY5ztlhnYSC6vcRAoDfLWWWuu993jRukJBUk5Ri0XvEn/1L4CtlPHsMkjtPn96PA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46k1k6hjt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:55:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54C1YAjE011591;
	Mon, 12 May 2025 05:55:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jku24867-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:55:40 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54C5tbcg54133184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 05:55:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6368E20175;
	Mon, 12 May 2025 05:05:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF62520171;
	Mon, 12 May 2025 05:05:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 05:05:11 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4DBF06057F;
	Mon, 12 May 2025 15:05:08 +1000 (AEST)
Message-ID: <7f40b03a926145e79c060f5a0cfdab829b2a5f1c.camel@linux.ibm.com>
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org,
        maddy@linux.ibm.com
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu
Date: Mon, 12 May 2025 15:04:55 +1000
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dNSmmPZb c=1 sm=1 tr=0 ts=68218d5c cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=VlGTkuFJ5WdtLxIKyCAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BEhtyqcew9NhysJzzJPiJH-Y-nhqpckr
X-Proofpoint-ORIG-GUID: BEhtyqcew9NhysJzzJPiJH-Y-nhqpckr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1MiBTYWx0ZWRfXxkgdbtEmf1nz dwd7yYAc5Bva+GTN20ZcaaRJI8dRBGYqlLgSgKVPxDqPaR6nHfb8HftYw/MUT5Pccf9AOHh+lXm Q2he+N8skgs1knm9yr1SAniMXxWCEQptEdIyRFgofwnKH7Nr65r5FhKvJ5t+WWz0934l5Z0tSXx
 tBO9kzHyy+03JWmDebEltQ0cA1lYhj6PZ+L8R4UBJsehl3Zmloz92oOZ/OBmyEFjB2OUUFpK5Rl g1bOX8IeClFPgllsfpqzZToIVTmXeFfH3VYdhTg8VnVAUuJ6hmP2ygvjHKgKEtqVg1as+SRjpS/ 2bL0qEl5fFyE5HechMx2LuOeZwKveA98APYPOmYvGo9/L36yZEqLjdx2r8tmKXFdxVisOTxvYgw
 Wsrx2E6M6AW3YRzLDj4mxn8pJsIydIwqWdGM+L7EnvZyMDNVB1iB4wq/1SVLvacjZ6dPiz1/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxlogscore=953 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120052
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-04-11 at 15:43 +1000, Andrew Donnellan wrote:
> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
>=20
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, separate
> set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented
> mappings.
>=20
> (This series was written by Rohan McLure, who has left IBM and is no
> longer
> working on powerpc.)

Anything more we need to get this merged?

Thanks,
--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

