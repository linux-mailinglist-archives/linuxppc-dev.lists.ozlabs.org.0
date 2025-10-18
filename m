Return-Path: <linuxppc-dev+bounces-13038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D7BEC823
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Oct 2025 07:34:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpVjx5YgTz3cj3;
	Sat, 18 Oct 2025 16:34:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760765653;
	cv=none; b=TZhQaOgrg7IZCtYWdv/UOrEINm3QM4UDmbbxrsr3ni/dZykaOziHro0ViKc2auSM2A+q4be1LGzN0NE/7aj2/OIDmVwr4cdJjmlgkVoXZkzyO6eWnojSUw7pZd24T2rzVd7p9GSCoFYtuy6zvsLiVcpIYeZ4IOFTKzrX7y8/6h2BI5bl3nHV+AXMpAXPQwMDEm1YU+4BiejA7zL4SWZb+FgUpYnFyGqAab1hzhDOdzn0haIQgFAF+h9weO/eKwJxayUudw4FxP4nuJOpg3oro20zXI2A3IQVN1ljdT9wyq86T1GwMWY4kIABMK7Rn11iLuAaEhOnvFOcLJbxnknypg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760765653; c=relaxed/relaxed;
	bh=NeeUesnrcqkMWegJSjwueFiedvybxeTlIsj/sTYadVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JjaQIX2/eWam7ZYlbWvNRCOdDPW+N2IwT7wgGHioSd+Um7qEV9QQmEKF/9XRIEnQruZnj7nohhwciZk8i210Op4Wn5kaA945YMCc68KvLpaOd75tmH7tObk0CSHLy4bX8d83iHMG8GOdIGZTrifpI27Kuu69+BEg8HE/X1Z3iVc8LIaCVgf37NQ0Kf5ftoCv2TsHTcNmwnbVIHxlkE7VtGS5FVj5ivFd7a3EwhssqMkNmkPhr6EJqQlkJQJX3U6AacSLH7rhmXQs4RYnasw3SVdJfXf4cAdWP5sKqcfJ7F4KM9Ji9Z3xlw8xpmyAdP2QlqxMRmWhdI3yR1HUXHExOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hlj7lB/k; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hlj7lB/k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpVjx1QJyz3cdG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 16:34:13 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I3U295014014;
	Sat, 18 Oct 2025 05:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NeeUes
	nrcqkMWegJSjwueFiedvybxeTlIsj/sTYadVw=; b=Hlj7lB/kBSBAgiCDAUP3Ko
	5DpvCRzILttHfdcj0bCJEJ+peyTyqnaFjC/JHkccUZj5pgwxwBhd6DiG6CiS1XQq
	I7X2evWTj06tWJw6PwEwShjorf/T6MylXZAEzKErSOF+CGHF4VtU+ohl0YG3v0SI
	ypp/q9E+EJzfE6A5rBlFwxxOJfNWsAPJXA95By9xbY8Gun01+6uI1IcWcw5xB6kR
	7fk7JnNG/VoBk3138DnN9coAde4ni5SHO+WW5KBMqulvSAjHOzVIDV8xnkT6FnfM
	33+2OJFt2QgAPwHzutcUjg95dKypAJyPCK6VMibAALOlJv3h2npOQH/ogH1/XPVg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v31rgbkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 05:33:56 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59I5XtqF026030;
	Sat, 18 Oct 2025 05:33:55 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v31rgbkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 05:33:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59I3hSXc018862;
	Sat, 18 Oct 2025 05:33:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r2jn8wrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 05:33:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59I5XpiX49086902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 18 Oct 2025 05:33:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2684E20043;
	Sat, 18 Oct 2025 05:33:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6A3420040;
	Sat, 18 Oct 2025 05:33:47 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com (unknown [9.43.69.229])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 18 Oct 2025 05:33:47 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>, Nam Cao <namcao@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH] powerpc, ocxl: Fix extraction of struct xive_irq_data
Date: Sat, 18 Oct 2025 11:03:46 +0530
Message-ID: <176076456873.59904.12854719764174051235.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008081359.1382699-1-namcao@linutronix.de>
References: <20251008081359.1382699-1-namcao@linutronix.de>
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
X-Proofpoint-ORIG-GUID: 0Gs6clxS-3DH47ngsQVduJL7VwCY74hP
X-Proofpoint-GUID: np-mCPSN0CaaIbi8GK3cb3614DONbjBG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX7XSNL00Cx9Vk
 +Q1sgQnbCuzL78fAkyvIw/L8k4ze2STv0gM+/BYTiNNaHI/EEJ8LJ3VUQ/sXXp93aToOxee6F/k
 62crA2Qt3MYGCtB0+cWvOkf/fjCSLdTpsIA6MHOpBsWZWkUVolF/83rm0uFZd3yR7Eo37he+ORe
 o67L11GIxkX5Xvj0lahojlofYIPZR7MxXXm6dLMOwP6bYp+gTw0jqdcJcb3K4mwGJNCR7oGQM7R
 FIbY0mfiU/O2R6CNJmjzq+8wRtRN72FIlEvqy3Flc4ZLh1VBRnm5HRjxBLyNehxo0+/K+YLWWxZ
 Ans0NfvNE/lLqL6JbKZqHGC8u3DqthQlXBy1mGrs3Yy2rdqQWBSP7JG4bL/oT25nhd4mknpeDFQ
 plk3PO/b+d11Gwmhw3dSgN2gBFnkcQ==
X-Authority-Analysis: v=2.4 cv=IJYPywvG c=1 sm=1 tr=0 ts=68f326c4 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=24m1D_QoUu3p9LEs7a4A:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 08 Oct 2025 08:13:59 +0000, Nam Cao wrote:
> Commit cc0cc23babc9 ("powerpc/xive: Untangle xive from child interrupt
> controller drivers") changed xive_irq_data to be stashed to chip_data
> instead of handler_data. However, multiple places are still attempting to
> read xive_irq_data from handler_data and get a NULL pointer deference bug.
> 
> Update them to read xive_irq_data from chip_data.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc, ocxl: Fix extraction of struct xive_irq_data
      https://git.kernel.org/powerpc/c/2743cf75f7c92d2a0a4acabd7aef1c17d98fe123

Thanks

