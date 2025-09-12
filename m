Return-Path: <linuxppc-dev+bounces-12054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BF1B54143
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLFf3dxgz3cjb;
	Fri, 12 Sep 2025 13:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649382;
	cv=none; b=OgBEg1dtMFFk0LzU2sqNNI1eHj7UDNulE469wOsqlst60vdFyl8l0nsk5UC4LnyB1sUpvrr5vG6c3rwndZAKc6d5SsXRyl96b/lGTy+tyxWeftlwy7Z0OuWeAvEH8HXz07nr3cG3ydYoaZIt1ONi+Afcaqn6npN7hcBQN5TxZooIbiCBGp9JYmgk5O7kQJcmp+ZGj8ZJ+nofLo02y8nPGy1wUzjmbznp6uQmes8b4YR0LoCplsrMNivPqNj/m9resir/hV2YM5Fy6JxcDHh42zNali/+P8QH3icBy0M/K6xwOQnasGZWiFCH6PeXuZ+MopZw/p+d0Znrka/KM4ezgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649382; c=relaxed/relaxed;
	bh=iYt45rimt6jxKj1XBawMJJWpGpQDXdhAnHOcZ+vKLNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nM19qYjO7TMlvO+4N0Ot9z8aieyPbjt0dlQFXVS6d2HIMNgblYJR3cxeZoOid/XBxv/nU4HKduFP+J4FqXCzo1ZoDJ+390fdv+wFyovUcsSeOGScjduY5/oyKbxzSanZoE33/nyIMzX9A84Cga/pGg0qMuKj7HMWRgPF6NnrQ5349DF/tXOP+wf/YXUKaYq6JNv3MRFI0qQh8h5mNd6vbGldjw4BbUK9c+SBtML5UyoV/QjpI/PRYRtC0gX4a0P21kba5K5F1wA9HyaxjoIVkDTI4Yx032enTB8J0Els3ceKGmjm3/OXhVLcOlvQTTUAw/6IQC2t3AEFGrxlIA94+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ApPEAEm5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ApPEAEm5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLFd54GRz3cj2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:21 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BMeoHp018908;
	Fri, 12 Sep 2025 03:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iYt45r
	imt6jxKj1XBawMJJWpGpQDXdhAnHOcZ+vKLNI=; b=ApPEAEm5bZB0qH550eujsN
	Bvv1F9YjtfEGrLu7YQ3K4bmHAOKjQ1V/Um4pM6DOit6STUhQiKmkrHAKxi3GmZp1
	tH4lR+llaZRQVrGv/jlXUhATVHHBS/sOSYvxlTNGqt9Ee4hSuSs1E5d9qqACtleo
	lvSg1GDLYTG+TAaN6FkZBRVB12v39PuH9xsObc9MQ52JFBB7Uf4avoBamRP9U4ja
	y0daOBo3Vw0tzeJfimLZ5yV5cfXiyrpRtleb2q1LQ9qLCXFpkS3IyFPwHEQ41F3u
	n2GZahNayJFzjNwx+pgNaHj4v5T/HPmgE4R423epU2PflZO/w8HeXQQF5Qw9qMww
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acrfwg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:11 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3uBDw021477;
	Fri, 12 Sep 2025 03:56:11 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acrfwg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:11 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C2gJxW017181;
	Fri, 12 Sep 2025 03:56:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gmru4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:10 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3u82b47710466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:56:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91A7320043;
	Fri, 12 Sep 2025 03:56:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9C4920040;
	Fri, 12 Sep 2025 03:56:06 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:56:06 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        Gautam Menghani <gautam@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Remove duplicate definition for ppc_msgsnd_sync()
Date: Fri, 12 Sep 2025 09:26:05 +0530
Message-ID: <175764920913.610338.11505927926333703885.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813122319.62278-1-gautam@linux.ibm.com>
References: <20250813122319.62278-1-gautam@linux.ibm.com>
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
X-Proofpoint-GUID: yvWXTBQ_eBcfBLNY07ZcF0htEa8MZV-y
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68c399db cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=oY5UqJ9XbCPhir_Of8QA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: oyHKm9i5Jz2c7X0QRtUeMnecVx3t_6Bm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX3LmXBJ+y9bab
 eJuEe5VeyYu/XQHhL4ZflDGcNgMrU2cRKqkTODJgZWzgogJfVfgRLeORbsXqxXgpykqJVh/8bmA
 Rin6PiH7GvdQDYYuYkjvH3SCvZK8hGjdVdF5zWkeeioQtTi18hrrd5XdGMIEbuuNBhPj4lm/nNI
 Y8DwceQ5/5ZknvxubKImvBBgv7NEQyEXKqNo88CSvE9nOU0DgbIwDtW7CMsc/gsAhOYA/jvLf9c
 AIb3EIS5MXT0KytIvpqimxTdqkL7zVJIa6S7SqFKevHU06m5atVMuc2Sg1pwgGXyemrHTnzjnC1
 HMC7iWAP7mHqiBAMaIZ6iH/lh86puEjC2yypo9RqqoPLlIUCw26WiD2fwSoE/PJ0NNNgrJeM4PQ
 WYkinLDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 13 Aug 2025 17:53:18 +0530, Gautam Menghani wrote:
> Remove duplicate definition of ppc_msgsnd_sync() introduced in commit
> b87ac0218355 ('powerpc: Introduce msgsnd/doorbell barrier primitives').
> 
> No functional change intended.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Remove duplicate definition for ppc_msgsnd_sync()
      https://git.kernel.org/powerpc/c/b034baff11d050dd314d5f2645eb52988a93e4a1

Thanks

