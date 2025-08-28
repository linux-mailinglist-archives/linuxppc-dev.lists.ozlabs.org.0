Return-Path: <linuxppc-dev+bounces-11410-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92690B393D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 08:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCBRl5sryz3cYG;
	Thu, 28 Aug 2025 16:33:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756362803;
	cv=none; b=aGNBIAWDfq2otw6OyC//8OSfc7rTtzktXE5DBLrFa9ton9ezV/4YtxLM0DItjsE8uzN0Ku+HKCmzmvwp85YGsPHUtCOBbUNXkY9sIyfB04NMSvRY1CnT9hYkpaI0TkxkCTkSMx1K64J0UoNKJrGvjeFqBXpeYC11AA4PHXZHvfE+kzcgnxlXqFidzawBUhVPSa3WtQR6kyPO697DIcbi7R8b7pGaYBG5aLdSmHVr/O8ZaevADbKAWmeAJz2PmVixwz48TOUoGsFRiRmhtF7XeazvckyqPi/Smo0V8GCN3bvgKbes79jBIxtEvk3Z+vswJ8PQBYn+FdkC5cETG8dvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756362803; c=relaxed/relaxed;
	bh=FV2yG5lnRJZgphjM9iPc5uyk5HUoEYTD6oTw6uf+4Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S0jON+azbfYJZEUnPztKcz2Se2GkWdEP3z8mRI/BClouWiXd3l2iOtzwLoaI9LrAqB74B+4/wn+EQ2sX/scTvW2X2DFi4TKN7Ne7FcN7SvmF35ltZhapR55boyZE6MX7YjhtHq7tHduf6e1kHjxBl21rNsbyneBL5FGBVHSOs4mbyqGx4zd4tddurzap/X/mETjuaDj6VivxSWvWmFxjZu/CzGwUrqMBFzekUPwKX29hzLsjsKscpIYlqDz7J9+l7W1sGNpMcjZvcvkf9W5wrwSkUQ8yZxVf6sGld1aiicXcoH6nVUrdxf21m4PsGjbcdkdceG7v9/KJCOGWDqqb0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y8FD7brU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y8FD7brU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCBRl0H4mz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 16:33:22 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S45wdV015750;
	Thu, 28 Aug 2025 06:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FV2yG5
	lnRJZgphjM9iPc5uyk5HUoEYTD6oTw6uf+4Qs=; b=Y8FD7brUIuKsuXVZIx6geD
	q6dNBoExj01/YTAs7MDKhN+XNm6IADgacMPhPS5kDxctHtW3ALJcPk8d9pgrJXG/
	Wi7uajtr+0JWoZzP2VQQ7aB9ZI62euMEr6wx21EPSVKhTyH5ZHLNcS6MbkLVz4EP
	Bq4rwpP1d6lN0u8F63nr9qllCd7d+bh202RIcRnirN3V+4rRdYxBdfYp15VoRhKh
	nXLde6gmVzLHzrBlvKk6kK/Gr3WLBJO6qMgN/mwHbbqnNkuBQ5S+CYs27XAcHCOe
	/jwX9G9iwK6dq0QPqUejBju1SYXvsuskR46WnDe89PvnZTO50f2ZtnOnKG9fo5hw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42j81f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:09 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57S6EkXd004065;
	Thu, 28 Aug 2025 06:33:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42j81f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57S58NYC029895;
	Thu, 28 Aug 2025 06:33:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfmuj7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:08 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57S6X6aJ19333582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 06:33:06 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7566220043;
	Thu, 28 Aug 2025 06:33:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55B4020040;
	Thu, 28 Aug 2025 06:33:04 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.161])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 06:33:04 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: unify two CONFIG_POWERPC64_CPU entries in the same choice block
Date: Thu, 28 Aug 2025 12:03:03 +0530
Message-ID: <175635911051.1554354.7539818924999902993.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250607102005.1965409-1-masahiroy@kernel.org>
References: <20250607102005.1965409-1-masahiroy@kernel.org>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMCBTYWx0ZWRfXwKvAVhxzj4b8
 MuLCwu7pEviOx19wJ9wUCQcIzJ8HLOasY981dJatjYw2bdxPEMhcuWDfCtmF4ah0NsMUBhMglyi
 N1Zy3soyQTqMeT9SaMa3ELNovtZxUE+b2obo32v/6+0Azq/xq+jsyAiSURtiwPWRRr6DelR16YE
 I3uELLF9FhXeU1zvvv8VdxwOKO/TpNXJMYKcbWVMpmFEPVq3mumYjz/Hbrsw/F6Jey9OyqFSpif
 gK92wY7MFwlf1StOa8lw/pp8jIqBqPpbaXIyvNIxZzjGub9UpUKKS0pWMYbPN0hVLSrhrQf13At
 pvH9bSmkFTtHW0AYAoBD8scm1Ugj/KNsgUuWkOOEYt56lRtUVd53oQ5GhSoV4o7i5LoxsWAvjT+
 gZFm1glJ
X-Proofpoint-ORIG-GUID: RFu2XqFXEcP7ZpjgQZ-syydYjHfikaEr
X-Proofpoint-GUID: yKavQkr0fwcd46e2k81oTAZA0qtayptv
X-Authority-Analysis: v=2.4 cv=evffzppX c=1 sm=1 tr=0 ts=68aff825 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=_Et6_qcphbWyiyTGtvwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 07 Jun 2025 19:13:51 +0900, Masahiro Yamada wrote:
> There are two CONFIG_POWERPC64_CPU entries in the "CPU selection"
> choice block.
> 
> I guess the intent is to display a different prompt depending on
> CPU_LITTLE_ENDIAN: "Generic (POWER5 and PowerPC 970 and above)" for big
> endian, and "Generic (POWER8 and above)" for little endian.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: unify two CONFIG_POWERPC64_CPU entries in the same choice block
      https://git.kernel.org/powerpc/c/6a859f1a19d1f8756ffb097f5973dfebbca4811a

Thanks

