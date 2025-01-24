Return-Path: <linuxppc-dev+bounces-5550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1DBA1B7FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 15:40:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfgTv1GVWz2yfj;
	Sat, 25 Jan 2025 01:40:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737729651;
	cv=none; b=EweKQbtiiCFHJxJ+/NA23tu0MuMcMh4UJccK96dda2aW/3ubj3P3IP+DmooyMcJ9mrz89Z3ThNUgfzRDySS6fEnzw7/0t7iC6exbDDqCHCuO3bbi2vgLZSl23b586C44kxxTAiHN2U/sx9CJ2H0ywtteRB3l79/9EWh3GHdmM3yI5HIAPsMUYPMAvLp1AvbHV4mX+Z9ElW7FdzwBx0XEaxZ3Gos2Zl8KvhkWxRyqbN/RWdymycS4U9w+Kha14gCnemrvaJ65+xCVno7KsH/KvWriYXbynTw44vVW9i36Ei16Sl1IBYRnQVLWAts275lBWV/voYchp/YshqP1bPzSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737729651; c=relaxed/relaxed;
	bh=MijqXo/qegzNGMw8h3Z+Tc98rYVssd01nXwCTdecN0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciPcKtSF6u2f0Nn/P0rZfqc8CygJ4ypbCN+85lCZz3eXpBYC5V7tcqVE6MOTUqvDOH4+bXSOkheR4+ADPsu7o9raLLPcEOHLfApHOwAL7XjCIF6gukVNP2hRtDuskmjLRkCPPVchLdvQrhQQ0x1Yqa9pE6b/XxtdKGjj5rGjKGmx/C9vVIBi/S95Guz6tY+PCX8YRkcjWE9pEqCGuPuoDSJ/xGmKKK+WgTwVEVqdPznhgqMqaG70DQgWYinxplQu90Z85EbupPH3/mqFDU+2mz+ebt5zjzmnCAkmXHjd2d1+efJVRYpjz5MuMRIayq9JeM/eisaZD5Bb7O0m+bfSEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IRGrupAe; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IRGrupAe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfgTs5Yt0z2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 01:40:48 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAlvuK002021;
	Fri, 24 Jan 2025 14:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=MijqXo/qegzNGMw8h3Z+Tc98rYVssd
	01nXwCTdecN0M=; b=IRGrupAeLluTvOKxBZLroHEclLaOrnEGen0CkJpPgRe7kB
	VM7kWKp4KSnKbZ+V2iI/+7Vf/uxmgISzPesnRWYFON820JGKsK5Eqlxw/MDgFQ/b
	Krbzs9BvIeSeEufwhRUKJkPKCC/AFIoN4QTatc6SBPAXJx3GvcFOFFpTZOIAXIgS
	SECCStHvDe7EPSiCqp41QZzDm7D6iEcnNQdlCpAY+uOU2E+VnOszFD0emCRNrRH2
	WQ6FbWJJwLSwK8wz9T7wFMRJFOWDwi9TKq9IIgG50CevQvcw+a0r4Cr4O9ZOP4fO
	pc55tlCb93fv+5/wKz31jd8TpMr0LV4Ajw7+7viw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44brku6gxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 14:40:38 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50OEMSsZ007062;
	Fri, 24 Jan 2025 14:40:38 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44brku6gxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 14:40:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAlbYj019223;
	Fri, 24 Jan 2025 14:40:37 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 448pmsv0gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 14:40:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50OEeX3L57868646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 14:40:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B54902005A;
	Fri, 24 Jan 2025 14:19:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F3462004F;
	Fri, 24 Jan 2025 14:19:50 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.39.30.40])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 24 Jan 2025 14:19:49 +0000 (GMT)
Date: Fri, 24 Jan 2025 19:49:46 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, kconsul@linux.ibm.com, amachhiw@linux.ibm.com
Subject: Re: [PATCH v3 0/6] kvm powerpc/book3s-hv: Expose Hostwide counters
 as perf-events
Message-ID: <oup4aayidbvwixw6qmuojt4j356xgyx3kuqfbes6usyf622k3j@ahy3o7mjyueq>
References: <20250123120749.90505-1-vaibhav@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123120749.90505-1-vaibhav@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AlAleZUJt3ejvfjZu57Aa9nn26KgeaC5
X-Proofpoint-GUID: azqaEhDQ4bfJcqipHgCuLkr_xuc8ZPRr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=455 clxscore=1015 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240104
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


I tested this series on both lpar and bare metal, LGTM

For the series:
Tested-by: Gautam Menghani <gautam@linux.ibm.com>


