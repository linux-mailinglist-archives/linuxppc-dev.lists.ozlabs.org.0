Return-Path: <linuxppc-dev+bounces-12056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2047B54146
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:57:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLGD0dvHz3cmg;
	Fri, 12 Sep 2025 13:56:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649411;
	cv=none; b=n9MNUaODp6v4pJ+oYscLvGTVAE5R56R/a6znQ1pjtb1S3In8V5BLbI7D/OxcG+jUuNIpmol4fy3UTRXZRabRxGOJY51iCdkwTxgh5xLAhl7ZbrRb66gt7hHyJNNl8O8TT76AvgFFmWHFD7jC1EE6SXSzpxE90Vj8QxvuKME0xH4U+IbcxkkzpoVjPROn9eLrFZHOcYC6actHoDeszu/hy7z4DLDpfmi8uxY/h2UY0RkHwwOKlurX82K1u0C4Efu3q4sLkt3N1FDGAc2Dm93IrHNswL0FovxHNoADKgIR81DHqLAVs2gWn1bJG8SxPB//E7UFGhF65C6t6H/e55YYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649411; c=relaxed/relaxed;
	bh=vrrVEH8tAjFNV3upvm/jC7WnGRQXBkPj0N1pG029RZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NYJzeEJl1W2ZZKaNT/cK32XHtVjwdK9khrfl99cTcLHSRObYFg89si3s+Fk15pJ63eH4QqUUIHfqvl7nEik6hdkWM/eAnZxgKYLLat2wwSGaK3DZ7G955BjUaSuXcwKoWMRSs02EeMRG+aEZaP7f4NhJ7KxtpD32BdBA9yezOBLugokKGmftoWd8kSvNuztXVynkMEV4uNmkeLCtJMPQ3wZ7IJqd+jFsD8VdrHTCAGCHtAg3DL8eesqy/KtJbolY9SnSwaTNlNtzPvaSXvmxhBTj0qyUjQje+uYYEd1Uwjr26F2Eso4hgfEf/tgR90gswTSJLYAP7wbWiogKdBXohA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TF7xVJPl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TF7xVJPl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLGC2WyYz3cfW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:51 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BKDKol028671;
	Fri, 12 Sep 2025 03:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vrrVEH
	8tAjFNV3upvm/jC7WnGRQXBkPj0N1pG029RZU=; b=TF7xVJPl8gH9vJ4D5E7RZy
	+J4SUEnmPOFZtFMKGTNZ8ZmCGa7Hg5Hqk1kngguLOYw5bwDGx/Q4jZnuENgs1avX
	QR9nw5fbdJu9g0Ksw4QwKMAnvdjbazZZHQ2cIGQje893Eru1T2DiOpfshB2fg03G
	vRgTerj+HPAf9uZVndcnTJbuBNuFe6TJpACRyDNjEVu9E3wRd4ijVAzlZ94kl51B
	kJdoh/fRqmnj377NwpaqFqOn8cvi6EfRnl0qc4SuAeMTkPvtwuwe58F4O2jmQkXS
	MSKxIaK40C7apzvHjjQVQB/YYN7ckL8PH0mUQPCJ6qVGeJuoixxZRsbGlHtA/IVg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xyddtqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:27 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3uRaF019098;
	Fri, 12 Sep 2025 03:56:27 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xyddtqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C1LvD8007912;
	Fri, 12 Sep 2025 03:56:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49109q11e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3uN4H39649644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:56:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9BA52004B;
	Fri, 12 Sep 2025 03:56:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0C0A2004D;
	Fri, 12 Sep 2025 03:56:21 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:56:21 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/ps3: Use str_write_read() in ps3stor_read_write_sectors()
Date: Fri, 12 Sep 2025 09:26:20 +0530
Message-ID: <175764920912.610338.11006366512834680585.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165829.714344-2-thorsten.blum@linux.dev>
References: <20250819165829.714344-2-thorsten.blum@linux.dev>
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
X-Proofpoint-ORIG-GUID: CcvW4kbXSzDPVuoHyqqRjJzI-R7--lWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX+rpKQNEpkmw5
 Ttpvx5SDDmADyJooRUJVENpesLoFBJ5qlozqjJevfSKge+xVFsM/r9RzomJuqt+JVqXYY0CnNkQ
 eTXIrQVzvs6sr5b2aiyuJPKsHMe9Z/5ZlrLHYvuCQNhWfOtxy/cD25qWbQd+RCIBi6zJlTtCosw
 hJtptjlBjbqi79IJFAonx7E3v9IyNG1YkVQwUgZtRoDmBJEiXtldTLWcEX5A6keob6PtVvd6fm/
 JRbfBoOBZTRS6FedbAnfjdqssVeAbfv276TmwkDgvHPlV8b0WYaNuwp+yXrLinkvMriyd580/Lv
 JArGlnSRfNBrbVF+APeRcPC7QV+27Twynb89tHxefquGnNVhfRb7AeEkczx93A9oDQXFxPstkFC
 tfG8RwtL
X-Proofpoint-GUID: -ZSTadxp-uBK_BYyzehJEhm3LmdZs_0V
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68c399eb cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=CSAOVHq4OqcpjwAznNoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 19 Aug 2025 18:58:29 +0200, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_write_read() helper function
> and silence the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
> 
>   opportunity for str_write_read(write)
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ps3: Use str_write_read() in ps3stor_read_write_sectors()
      https://git.kernel.org/powerpc/c/6dc5d0770dc99d6bf9b786fa3c8fc04be2091648

Thanks

