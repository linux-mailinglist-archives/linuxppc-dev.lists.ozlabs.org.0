Return-Path: <linuxppc-dev+bounces-15166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0FCEF190
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 18:48:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djWQb0Fp6z2xrC;
	Sat, 03 Jan 2026 04:48:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767376134;
	cv=none; b=R21tSy3hJKAHraXhe0MZy4COxy489OlnP3V+CcrJKvo6yHiPO/rGkOILSGEv+7cNJHGV+7fj1Fu3mnsqNp7eoKneL/+duTHmkny1Y2tLaMNrQEE/uKRBQK2iVKZeXjLAeynzO8otD/GRBKvVX1XbjFkPf4kSZuaO3w2v5mBktnA9AyFtmASyu9zbqq6+Xj13Wf2/4ivjo5HuNaaiVIZeWEl7sBKW8Fct8T6M7OntKr0yQZ4ytwym8nKljaz7z2szLTE1mS3qNZALpgdKeFyu3fTScif5ej0SoVIpMB5PRGAQLqjogbUG9BR+gXsDsmVunuAlSyXB/4KElvixo6DVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767376134; c=relaxed/relaxed;
	bh=dCvSZMHRcIMvmMrk8Xrdw9qHq3fJKcUlxZqsI0VmiWg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XDIB9lG1kazpFUXtdTArOJZsR6qynIT7k8bg9BOfKBuhgIUjPUbo0x4o36L6SqBOrmE0U4H3w1Miwg0LCXzsYmIw7MROyO7uClsMekPScwF2Feu+yCakD9+01pDfKTY2uU/VEvQ7+sFQcK1/xWXDb0gC/B/8FNm8JDbKcQdi3lqPZEDztWhooNNeHXECZAoR6X/hkSKgGwin06e6M3vEaCL6Y3Y+9BdbT6/oD6oFCrtNiy2fCqH1Nab4ijqDdium8zdjqGkv9UFOyAST5u13c05dgMufSNsT0CeXuUeZJrGb//5aG2SOx+fnbX14MzgZh/Xi4QBFeeBvQvDko1Vgww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IJZn8vfi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IJZn8vfi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djWQY6D4fz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 04:48:53 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 601Ksb03012496;
	Fri, 2 Jan 2026 17:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dCvSZM
	HRcIMvmMrk8Xrdw9qHq3fJKcUlxZqsI0VmiWg=; b=IJZn8vfi+DxfslAX9b0UJH
	6R58TPo0+eFtgYhZ3s0rKmT6H2BZfXa9rzn05tVNffDrmekru8vyx0Wz+nuR1BTR
	BnXRhb3caDH/0nvx5pb4U3VBog7TUHBsXhetZcaqagmEcx4hh0wAqhlYgiEklVWj
	0VAuQSlKexwe+UmnzPrrq1bvqbRIqXd8bHHzxjOynQJrLht8sKA77+l09CXjXRKm
	F/tPfITw01yC9OjeXIWds64Elyt8/By4Cp9YfRsai/Oo+E6lExF2rIAoAzbiz0dE
	hgUafzfVk6ncsPBFWVBqfn4vXykrYlh1zOvOmEVSsSG9SOVs9ZYlXqVzEQvlzePg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73w5b0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:48:42 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 602Hh28L004763;
	Fri, 2 Jan 2026 17:48:41 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73w5b0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:48:41 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 602FWKkX003076;
	Fri, 2 Jan 2026 17:48:40 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bavg279g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:48:40 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 602HmdhL22807084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Jan 2026 17:48:39 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A1D15803F;
	Fri,  2 Jan 2026 17:48:39 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9452F58054;
	Fri,  2 Jan 2026 17:48:37 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.43.105])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Jan 2026 17:48:37 +0000 (GMT)
Message-ID: <02583d9d0691468e7facfbbc9a13b591fbdaadb2.camel@linux.ibm.com>
Subject: Re: [PATCH v2 6/6] docs: trusted-encryped: add PKWM as a new trust
 source
From: Mimi Zohar <zohar@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
In-Reply-To: <20251217172505.112398-7-ssrish@linux.ibm.com>
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
	 <20251217172505.112398-7-ssrish@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jan 2026 12:48:37 -0500
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
X-Proofpoint-ORIG-GUID: bqQUh9EJFkG1jRU0auuKMxYkwrx6rNqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDE1OSBTYWx0ZWRfX1BXqiSNK8fx+
 Vx5+FlFJ4qDFD6cxTRDSmrrxfWez+1x6Viv0jExQMb8ypAaxoQ80dcqNwI2JV9NNScCCJBWAAtT
 U0/APwC2YKYpdBKvxZOyDE0tKNcnv88lfFWwNRxNduQa90i09lEWUryDbFrmZZhMqiaZNUPNU0p
 U5HF6JfLokqdSZeMNYmbXd0/hwxL9PwmPNK7ofSrBMUdHV0Fn3W9Yg2KNTwIN46rT4E18TKVqQ0
 lb1UuJZ3Qk9da2tMRabLrstKCOVw0iNJXmLJpZHtuVbZ+xYHjYeBbAiNwRt3nnTbaRat6C68W9V
 LBN1A3+POYjxseC2asAd1AN3xx4rt/A8aQXr0ff73TG9Pvs+eVGMcOgfMi2PANWgPmHr1KZ/j5e
 ipI4qr0NODKBojM4imHVWOQ9c92WDT3tDovXwAXfkF25od7e4ypY5KbRseQCMc6N8pW6+uQcC5r
 8AGnzQivA9Q7xlJwFwg==
X-Authority-Analysis: v=2.4 cv=fobRpV4f c=1 sm=1 tr=0 ts=695804fa cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=sgltXFsEcmSdi6oR4GcA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-GUID: Opj_w7Q9PCZHxaSEFXVcrEa_BqVYe0v4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601020159
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-12-17 at 22:55 +0530, Srish Srinivasan wrote:
> From: Nayna Jain <nayna@linux.ibm.com>
>=20
> Update Documentation/security/keys/trusted-encrypted.rst and Documentatio=
n/
> admin-guide/kernel-parameters.txt with PowerVM Key Wrapping Module (PKWM)
> as a new trust source
>=20
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>

Thanks, Nayna, Srish.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>



