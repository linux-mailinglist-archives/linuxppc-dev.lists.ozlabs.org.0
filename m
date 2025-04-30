Return-Path: <linuxppc-dev+bounces-8188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F6AAA4D7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 15:29:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZndMR0qmWz2yVv;
	Wed, 30 Apr 2025 23:29:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746019779;
	cv=none; b=V3tnw4WGTbIwzRDT0NcNXzGFaiON/vNk/qK3/VWHRF8i/duEgvDH+1uSyJVR0uQZJYWoGc5DIKGzk7gBhZIW5yN/QO8DSDvk3PB1FtTHGqoH9zmb223+pyZB/OSr6MOES3D4Ts5r60VO0AF9WkEtUzmFpFM0FyUcrSz1CwQegXpFlyzxvt3JYO3QKNXZ45g2/vSPPnMSzVs+6huqkLQsN+GXKZR3pNVa4n8HuCFnLp4cZIekKRgk/a0qS2Q6Dr4KsN5BIrU9LvAR27a/HGj0wZu/yIYvLKmEbzJEkKsXZ/k/EPbzUVNCN+/VbFDu0YTbBxJIOz/ZeXDSJ/nPiu+9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746019779; c=relaxed/relaxed;
	bh=H/eGatCGfMyAMZkac1vP/80gmKFHQJq5wLmjfkF9Va8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WB2k5m3Ykw/ox0f/tXM0/MFKW0b8iRimhBLDAoK3gGAeQahXjiWlOc0t2l+HUELUuPBNir502mh5XRYU3alOz3reNMTQRlG1aek8WlyeEAG4TdjzyeVzYoj8n7IPI2Rk03ir/Yq5JHIMXOIKyyg65ju8sT438wwfDyPiqYWFk10fDJmFXVxDoK4DQYNjUXA/P4K84kSNlIuuUDQdCVhNeK+jKzZLDPUOEFX3l8ZQDsHPBK46vwKBkNdGuwatesYrBWkFkayxmnICqfzRWpfMuMhkwBuH60II1hQqB3erwoEK0xnx2mOM2K1/YkcxGCNeKslf4uF7auK5pgZ0C67IAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YzXg5ruK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YzXg5ruK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZndMQ0tz9z2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 23:29:37 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UC36v3006768;
	Wed, 30 Apr 2025 13:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=H/eGatCGfMyAMZkac1vP/
	80gmKFHQJq5wLmjfkF9Va8=; b=YzXg5ruK2YTxjOx17CmwTYTPKjHHdBULmlyuX
	jTvijvhkWmVRg63goVfjfQz7qd0RXCKC7JPz1m5rcU5KszKe3FEbJ8unurYMyFJ/
	nf9F3XrrTeOSjMvdCHBg9xTaTwQS8RJB4TbKcvppNP739S0nSsNAqYrKqS4m0ofQ
	9jkznf/QKz1rx/5NmWM66i7xpDvepj16Z25eULXKNX5KpCw1a02KQRXA6rxOiBvH
	yupqxEh6yd7+85JK6WlJXaHwhtINmueGCXYO3iqQ+tigme5/e9+px7E9mYYzULa/
	xvRnz+Gjo3bgq9qFkvIsCAXUgEd3Y2x8tHAuBXNRNxlcHlJuw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b6vb39bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:29:26 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53UDPNbY013840;
	Wed, 30 Apr 2025 13:29:25 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b6vb39bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:29:25 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9qPlM008542;
	Wed, 30 Apr 2025 13:29:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 469ch37pq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:29:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53UDTLBY35783262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 13:29:21 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3298F20043;
	Wed, 30 Apr 2025 13:29:21 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A49120040;
	Wed, 30 Apr 2025 13:29:18 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 30 Apr 2025 13:29:18 +0000 (GMT)
Date: Wed, 30 Apr 2025 18:59:17 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, mpe@ellerman.id.au, peterz@infradead.org,
        fbarrat@linux.ibm.com, ajd@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] powerpc: use lock guards for mutex Set 1
Message-ID: <aBIlrYRE8TvWAKI_@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20250314114502.2083434-1-sshegde@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250314114502.2083434-1-sshegde@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=BISzrEQG c=1 sm=1 tr=0 ts=681225b6 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=_evYCRor3lOg1Tm-bjQA:9
 a=wPNLvfGTeEIA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: eKw5tx0qpIcUseuhLt25YcSIfJCVsS9P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5NCBTYWx0ZWRfXy4wMmo54urfh MoXjz2xRDY3WkKqE+Ij/OlsHcgOejLne2EqamSxwj7IxD14lP8+nK56m89CY7ta+TBSxkI3iZtc p6ePJqRhHbFXo8vlUvo/T3++YBlyg2B4yBuJ775eLDgrYCDQhYE2FcNW1kWuN5Gx0AsyZGtbq2D
 zx/at2ncBiYgifTG9luNL5MsfrBAHg5pKS2yKVJS20Gc5v27bmSSQ4s2s4ikD7ygMWeND6ClW8l 4JtAb+fcfd5YRW3FHZQ+B3Gu5mazvurE4YBurHYYSwi1UM6+P14j7gmGO+CUN7Z1Ish4FgVU2Sa RSfxy9lxUVVxs1iHl95XMPDr1251/xbhkFyPSDrvEu52iXsh/NiAc9EjFWWUGstO2bxogQXImKO
 BdrZOC6x3kt+qnGN8WbQbEtYDSIYLDCXjkE5zIQF1Of/7OIDjuCJQzG20b/RowFBFbvp97eD
X-Proofpoint-ORIG-GUID: C-m7iRsO30HuYYvfFdznr2fBemJCidWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300094
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Shrikanth Hegde <sshegde@linux.ibm.com> [2025-03-14 17:14:56]:

> This is an effort to make the code simpler by making use of lock
> guards which were introduced in [1], which works by using __cleanup 
> attributes. More details in v1 cover letter
> 
> This series aims mainly at simplifying code around mutex with goto
> statements. If it makes sense, there are more code simplification which 
> can done for preempt, rcu, spinlock as well. Even for mutex, there is
> more which could be done. Even there are usecases for kfree which could
> use the new __free infra. 
> 
> Please review. Code is compile/boot tested except for powernv. 
> Have kept the patches separate for easier bisect. Let me if they should
> be combined into one. Commit message is same for all. 
> 
> [1]: https://lkml.kernel.org/r/20230612093537.614161713%40infradead.org
> v1: https://lore.kernel.org/all/20250314054544.1998928-1-sshegde@linux.ibm.com/#t
> 
> v1->v2:
> - Fix changelog of powernv (Andrew Donnellan)
> - use scoped_guard in couple of places to avoid holding mutex
>   un-necessarily (Peter Zijlstra)
> 
> Shrikanth Hegde (6):
>   powerpc: eeh: use lock guard for mutex
>   powerpc: rtas: use lock guard for mutex
>   powerpc: fadump: use lock guard for mutex
>   powerpc: book3s: vas: use lock guard for mutex
>   powerpc: powernv: ocxl: use lock guard for mutex
>   powerpc: sysdev: use lock guard for mutex
> 

For all the patches in this series

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>

-- 
Thanks and Regards
Srikar Dronamraju

