Return-Path: <linuxppc-dev+bounces-14728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB0CB7C89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Dec 2025 04:37:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSFWt2q0rz2yFW;
	Fri, 12 Dec 2025 14:37:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765510650;
	cv=none; b=hUoN911jd1qdzgYI7JA+SNMDwcEaCiAw3SGNE/QayzP01sydsXL4f5oaEG8JtJV3EKNaFslSOqcSYqKMrqsUt67qkHPzqOV8gIv3YzioNrehSK07+03Nad1r+gyJSeFB2kpuuqRjsZDMfuDil5g8iHTQiZ/fof9JdeU0SEabDTfZEbJ4Dg2o/RrCZA49El3gpfhW5UBdDf9x5o1xjJnWs0Cx+gyIule/T/ijfY8zp4gJd6jXkDtlCnDsg0+0UvcrBEWk7/gMSGFPTsdXbrm4wVcUcUxi2ANTTKSepu0RznfXq39qXB+4MZHEysATAkXxd6AbGigLrnX6eFxDWDlWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765510650; c=relaxed/relaxed;
	bh=wp+vTYCjH2BpXWY0mBvRIcmV+ZSaR++Da+3qfBFMKSA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l3BcEEyOYsuE0lBV0JeZzCg4zUrZ3kLAIkqgFNKMQnAHU/mPbTtdtYk8mTyJiTZxU82zzgMjznB1r/DzyW9pNCg4f49PacUyOGI6T/JAQjuEyMxebHRSd16lvSGiXC0uGpjKlSK/V9xWYu5TJihumHIrnn0X2yuZ0azkW4UXKQAK//zA1i7t/wRVnVccRT0HKsga39pT20hahMw5gcQf8iuYbjnNlDknY/m4xhE9sNtSj1CwgvDX9toZLG8mJ+VXlI1dfuXXeK/NY7bEn5GjsC3uBI3H6CzHXegth/IGXoGSM9v8rVZICNSK/dHfCicJL+SDkjneIsNX8dtgiwGE3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jelNWPiD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jelNWPiD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSFWs36Jbz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 14:37:29 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC3DAlB022803;
	Fri, 12 Dec 2025 03:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wp+vTY
	CjH2BpXWY0mBvRIcmV+ZSaR++Da+3qfBFMKSA=; b=jelNWPiDEORIsc+oAdJiOb
	o9vpR6YQf8a5zsNb+S7U+1LN6TWDH/x32WyxTBNfAnl1Z9nWm5LVLQJ2+e07vvfk
	1Aud37a770LgBDde6RHtaNGFINSllzeyZD20SnqVTZhxUpVFkzLdBiTeHu/9QCmi
	FupUi/zKeEkzuukr8y5PkmHkcbfwLyNwbAiq6eIrGKhvp+kLyBBl8H+A18JI81xi
	klyHVuD692tCsTiJbORCAGQ+7Re08ju+Q2TGVS1IoCZF0ArSxq7JU32oMQXvKHD0
	w8zYC0BW7vA9d3Dae9MwsAjcAz6liBn0NTgnyZodwATXI00cBu3L/5hge4uUea5w
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc61u8he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 03:37:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC0gIQa028126;
	Fri, 12 Dec 2025 03:37:11 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avy6ya1bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 03:37:11 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BC3bA1B29295108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Dec 2025 03:37:11 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A50CD5805E;
	Fri, 12 Dec 2025 03:37:10 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D58A5805B;
	Fri, 12 Dec 2025 03:37:06 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Dec 2025 03:37:06 +0000 (GMT)
Message-ID: <13664f203137541ce8aba74cac3777099992e856.camel@linux.ibm.com>
Subject: Re: [PATCH v17 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton
	 <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        alexghiti@rivosinc.com
Date: Fri, 12 Dec 2025 14:37:04 +1100
In-Reply-To: <CA+CK2bDDZi0TR9fhAuKpxz+XJU6-rOS_iM-akU=oTb5wVoVxMQ@mail.gmail.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
	 <336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
	 <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
	 <CA+CK2bDDZi0TR9fhAuKpxz+XJU6-rOS_iM-akU=oTb5wVoVxMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX+kBUVpmMzDE4
 RGj2CUtYWbrx/Of6PGswWBpTVaxGP3nwMJnxqHn9QiDDCAoiQit8W/rhik3ZjF7VM3ZQy69KSK3
 iCpfEiC49mzCq/hExQeWrtPs+FgePUlvAAkKjC9g88OB7j/3sVeUXgdsld/KQsvBbvCmyMYEn/y
 qeMU07abl6hWX4ojS+Mjks/PWvc5rqfiANkPjnyfMnd63LUykxH9T7HdI09JXvNavJML2w7/KTx
 r7m/URDYkfciRWxHUM7Ew5SBhyBEbLPpFpi81h1QgOWAtswLCHNojjMLOetW+oj+lV9FfT0+9Ro
 5eUn+Dm4AbXk57q9B6bqFXxJtBkWN7Lj/yT993PG/odDHdAchrmCWUsV0dFxiaNdJEfzoZGUaeq
 BocxCI++N4A16CPPI0nxK81kOXp51A==
X-Proofpoint-GUID: 0mx0bl7tMI0Ev7mDlA5PrAzvdwe37wsq
X-Proofpoint-ORIG-GUID: 0mx0bl7tMI0Ev7mDlA5PrAzvdwe37wsq
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=693b8de8 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=vpjFdhQh-OGVaG3VjK4A:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-12-12 at 12:35 +0900, Pasha Tatashin wrote:
>=20
> Andrew Donnelan, looks like the merge window missed again, could you
> please re-send this series so we could get it into 6.20?
>=20

Yes, sorry I have been busy and I am prepping this to send in the next few =
days.


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

