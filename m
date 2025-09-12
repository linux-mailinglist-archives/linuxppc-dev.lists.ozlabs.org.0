Return-Path: <linuxppc-dev+bounces-12053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01709B54140
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:56:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLFf15lNz3cj7;
	Fri, 12 Sep 2025 13:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649382;
	cv=none; b=bWYzJNM/Gtz4JX2nSBY9aGgagX/v3NFO3Nz1vcH0X0s4a4VGf2UnmribvfwKCNy1LGi0c9nBeZiK1Rmc6LTZwJbG//FZ5w6k0Hcg7OlOf35DycWFtK6l9NTNWZObU80sfg1ssZ9XfaYO5toCXLvdL6/ii7B+2kox3Xgxf+o9iETh1Uk4egijlKVoiGinPmOmP3F4PeXYzG3rPVxBvIbqISuuEUH4tj4GGg4T+RYxiA9VK8oKV4g2dIlRj0jdzBHXn46wFLljwijwrq9lMcvaTw9EJToc8n20O9LSX5ID7jLg9MVDBE6FUPjqiJSGjY046evqXF+VC6yXkrG9o/PxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649382; c=relaxed/relaxed;
	bh=xBHwy8CjCOA5Mmgul3+MTNVwaFPl880y3omYzqcLyzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4gofeiSV9Xp3nYEXFs8JtWVYnl7zLlso1sk7G46oOjdeToKb58famQpWHydT4SnBkYx0sQPOWlZ5/sH+YcnbsjDlpa7CDwSPW9xkkxkyR4McvDM8tiJhedN1oNf+zvcSKeVvbF5bvwZ9+hqxyrXy9m8mesXiC8iYwRpnjKgGsrcojGquiTJicKOhOyA3UWrDw1KZQH6cY6BEdArKr+Bu1PZYoul4Bn8vZzy5qdi8k6uWByO+K5rWXdGPcbWY2bjOcBPNIlOeuengXUnrkqP0a5V89Ed6chD+kA8czX8j4dYUO9BhPVZOwmiGARqzvmZgQ+TH+ZbOHeDiQZXMsbojw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gGWiNXQ6; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gGWiNXQ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLFd3Bnlz3cj1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:21 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BMC9vv020534;
	Fri, 12 Sep 2025 03:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xBHwy8
	CjCOA5Mmgul3+MTNVwaFPl880y3omYzqcLyzM=; b=gGWiNXQ6XhNLZz9WEezEok
	+H7m0OEZJs2rU46v2k9YH/KBIArKyFPZA9XkOooCwFgwy/qUMNv6h7v9EALbziN6
	lrQdkNYmWJ1L5eL5VmpLnYH98kJ1n4zYMKg3nJM/iGfdRMca8JruF5g65PQl4EOT
	/1xeCrg76p0EpUHphw1dp/b0JpEpwsfOOSwJUzuZtOAs/dwn/Wy5tNRR9Eois+/B
	9U4lZ1O4oRfymnA94ZvTUvNm8WL1iiM4YA6zrb50UIIPkRcGd8kpjgeoFNgyQ4V/
	Jx5j4xT6iyUE6ONAKpGYLN1nf/pnnKHOiKUW42L+4wtePZFXpgyC4K88hDwdXjyA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmx9006-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:08 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3u8sk025145;
	Fri, 12 Sep 2025 03:56:08 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmx9001-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58BNuHwa011447;
	Fri, 12 Sep 2025 03:56:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9us9dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:07 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3u52a51380548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:56:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CC0720043;
	Fri, 12 Sep 2025 03:56:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A02C22004B;
	Fri, 12 Sep 2025 03:56:03 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:56:03 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vdso: Include asm/syscalls.h for sys_ni_syscall()
Date: Fri, 12 Sep 2025 09:26:02 +0530
Message-ID: <175764920911.610338.12386684613166363012.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e2215a515ae0e21393c50e2f38791a6567cf1dec.1755509195.git.christophe.leroy@csgroup.eu>
References: <e2215a515ae0e21393c50e2f38791a6567cf1dec.1755509195.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-GUID: WZhKrsp1NL8AA_05fJ2MhNrhLGkQPPeP
X-Proofpoint-ORIG-GUID: kFcdqfRNwzm3qIipYzyOKBQQQBVbCnkb
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c399d8 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ptlMtBNaAhq1hGr5q6MA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX4qqNauxynhsH
 KSAWo2LTztrsLfj1nMtqp/lbwOe8jfKvR12+wZsfRX8jyGYAD9LqQvWUBLWvbqRJTpU4pZ4ZO9t
 YEwBFy8pWjMBUS8KwKmsgCGNBXjjYnE+OgJem1fkttQdQVL8bEl+VqRgwd1p5fRY+lWH0dmeLIj
 X+TDOGB4CH0P+b532ZfRXo6MrEsLSdenQDtlmqldpqqDYzn1gJpva8V/IsyBJgvrXmIliOn20sz
 ekdAcp3U4LkXh7ov1G0rGttxWE5JymhxDZHw3eUiK/jaHXy7J6nqQ0CfmycZ0f7zLV/UTeINd8C
 7Vy+6YnFa3vEaQSel4riS6mjq18wqyAOiihUTR/GS7Yc1Jk8Bpkgh+fvCgasltgr5zkhkBaJkUW
 BfW/1kv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 18 Aug 2025 11:26:44 +0200, Christophe Leroy wrote:
> Include asm/syscalls.h to get the correct prototype for sys_ni_syscall()
> 
> 

Applied to powerpc/next.

[1/1] powerpc/vdso: Include asm/syscalls.h for sys_ni_syscall()
      https://git.kernel.org/powerpc/c/58f5382a482ba7313085de57767bb784f211b475

Thanks

