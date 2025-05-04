Return-Path: <linuxppc-dev+bounces-8268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9700AAA83B6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 May 2025 05:21:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zqqgr4tfrz2yqR;
	Sun,  4 May 2025 13:21:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746328888;
	cv=none; b=ZmbobrXIZIpnM5yLAuZhLXf0lNB11ka9du2/d7CbsbSYAEDUhWKiKD10gKM20/7f3uqSqx/xojWjQErlHddmTsM6k3EeW5tcUfD1Iv4XAXnU/Awih2KrmePUo7odDd1E3T4ILmPMAlEGD6qaVXxuu0uQbsHzCmrh6OYBqYpVpteWOYjCiytD1Mh6C8z/2TFuJ+tWncjxA66fLtZhZMEAvpNV6LNBqP4pcQZMVxD95RK0jckulB1O58tOA2acW959b70oQeT20XJtMXO4HD7bdPoT6VC/Y0fVkVbCne+UeJGdRHyRSaqLnoieccQskHQ6GV02QBETomoKxTJWVKvp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746328888; c=relaxed/relaxed;
	bh=RSnqLAnCuOwwUQA49ChNsRa6/RNKI8y6V4u+POvMpPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEFuidi0sNxXrITThnDz0oNeYWGWh0yriecKaqPJmkOWB2jTlDvTg9Ic/YLwrk9h/t1WD+ZbV7A7aYSglPRaEHvF+mN5IMLmTqhUlHNSw533DN1X3Zs3QGA8TklZN5ly0lTGMTTW8NDITkVgOLIJ5Ig4ifEVUBReJR00PwZwN+xB3zWvZj+Yf13mk3ldoP0JkEMrlYfmpo9RZ446jTCm76Nr/TRK1TSW1XrvnPFXVej50rq398htycg80w3O3iQ8AduNS8zmHgHsdX+Yim2DGRfkGKdrYiuVMWPJxoWJL3cf9MinfFkqLv5CIU2InuPdDVC37/FZ8O7szcWOj63jsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b6MIv9i0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b6MIv9i0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zqqgq0czqz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 May 2025 13:21:26 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5442tbWg003043;
	Sun, 4 May 2025 03:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RSnqLA
	nCuOwwUQA49ChNsRa6/RNKI8y6V4u+POvMpPI=; b=b6MIv9i0HIAs2ogwR41feg
	FlRLof+Ptw+zgZsKZ92xOYuvzbbvZCDkBh+t1f2GMv3uppKPGAXQ8wEplK8+Nj0+
	luJDhOCPsvTQ38rMgFiVzPZ7yHA6gqmFFoq/36N7j1fqOUFy86n8qThjchYOoJSw
	BRwAwRi2ygWr0K95sz76DSX0I5UjQLnc4vrXi0lpAyX6+xqlFTCHQBN4lDMP3Ho0
	SRVjeNwMnCQRKV/xMsud1sXbHpfoH/5WIbarSP8ZK2x9N3otsCp2lvyOPWKvzg/3
	hKU3Uf8G+IszLLRUMsG29Fw3c9MJ++eWoHEhx5CA+1GCkRKI2/DJGmhqT/7XBmlQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dw400djw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:11 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5443LBib016023;
	Sun, 4 May 2025 03:21:11 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dw400djv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5443FNBc013769;
	Sun, 4 May 2025 03:21:10 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e06200es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:10 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443L8qL34865700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B539320043;
	Sun,  4 May 2025 03:21:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6929820040;
	Sun,  4 May 2025 03:21:05 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:05 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Don't use --- in kernel logs
Date: Sun,  4 May 2025 08:51:02 +0530
Message-ID: <174632869189.233894.3764174532974244105.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <54a1f8d2c3fb5b95434039724c8c141052ae5cc0.1739346038.git.christophe.leroy@csgroup.eu>
References: <54a1f8d2c3fb5b95434039724c8c141052ae5cc0.1739346038.git.christophe.leroy@csgroup.eu>
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
X-Authority-Analysis: v=2.4 cv=KefSsRYD c=1 sm=1 tr=0 ts=6816dd27 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=BWUmfwPSzPqrUTimO94A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: AlRTDl44keZ1oD7kyKlnWOkEl1iSzhxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyMyBTYWx0ZWRfXyYbS54hKH5IB TjXJhKnG9LhQtfdXQQg/2rLkWb/9602G6d+Ae31Y5+7vFluMlB1vBxfj+VtF4Lkoj3jwYKQcl93 l5Mseq9TJDmMTTesPB70bIMq0NrrpZR1KW+Gq8hHIM3P38l4Juh2MBtmbMehiwtPflnjjK1Y2NA
 awStsPlF9rFvcC3MXPS06p4s//fDB0pKHR9bAJOHsL1qeP+lYtm6vy+LWrbPw+QVL2zIUpMGs+k OXTFPgQO/RzbEEpnsSBBXxWjBTHfvgeq+wo0SPBtw2cTxmlSokCK/WOdE85MTi7Bd+Hhg90TmkM NZnryF1M57lOnfWRrTRWqyK3EKyRLwLTYDkg1rZyxy3IvcoFTk1q+QIROsYTVzbp2lrHAyUW42f
 bzZjf7LVP5C1083qT3NsueRh9zLO4YNTdUcFl9zp1HnNdA5r4aCx/arwJ65Q29Mx5L5Vh/P0
X-Proofpoint-GUID: BGoVprOT3Uk5pRqUowKYnM4iyizUHIrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=793
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 12 Feb 2025 08:40:48 +0100, Christophe Leroy wrote:
> When a kernel log containing --- at the start of a line is copied into
> a patch message, 'git am' drops everything located after that ---.
> 
> Replace --- by ---- to avoid that.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Don't use --- in kernel logs
      https://git.kernel.org/powerpc/c/b2f64cf1585a3afd06261dd4ae067136b6a66eb4

Thanks

