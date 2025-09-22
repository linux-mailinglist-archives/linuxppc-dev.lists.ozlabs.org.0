Return-Path: <linuxppc-dev+bounces-12502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB0B8F09B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 07:44:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVX9t2871z30Pg;
	Mon, 22 Sep 2025 15:44:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758519874;
	cv=none; b=NOOQpgEj5XKbT0fJm7jTzjlXS2uDbm6eHmQzlMTF+w70zcOrhJZ40eaqqfbHraL6VFcjD+DlLLVfw2w0xDJfmjDj+q9sXgQBIj2/q/BAqwHsBPDkJLX4v56dFxZisFcB7mADpbm1BmDiQuXHjVrcqtB0+SP7BK7EwPx6OO8XB2F20jjOVYfntfvyNJLNYSgtEllyBHl1WYbGMySvHStmV5IA6E+dhWWr7HXsw47bzO/Nicc2TWVuk5rtul/sr/SsDHCyqz6xQVcsh2WlAIvH3fC+uP8DmM6XZ5qicIE+c62+t28LwI+ZBmEGyb1NbNlFrZENZu+rvs/PUW7E1cn0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758519874; c=relaxed/relaxed;
	bh=QbQ8d6ZFPfmGcu+ol74QLLCNjXaKPp7g57kM44CXFvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4d/SQnL3IFKNJ6WHOitmp6rtysmp4ejRga/UI7b8HGZw0Pvd234hMI+CllyorPmdfWdcZzJOqUv7kIjou1svkUGbKuZ4MEWcfBHMnTZ5MUh+9D1q1HMHf/0CwxS/Cuv2Wyv7jGOtOrYOn2jxRC3cHgZby0VhrFkE32p6A6VWsxbYCYDwXHMWJji+4Q5wewBRjVJ0PPYnsLz2ogH+vJsDKfgaHC8DIJ7TYqzlBHW5d8T6b+anUdPH0opyFwlWqCrEMd22xTisc1JWh2i3xoaphubGvAzvPk5n/FyladXNAGOf22cLfR/coTFNWPRfHzdIkQoQrCAytRJI4jCzUicew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K1ER9r8Y; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K1ER9r8Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVX9s41VPz30M0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 15:44:33 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LLScAe010687;
	Mon, 22 Sep 2025 05:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QbQ8d6
	ZFPfmGcu+ol74QLLCNjXaKPp7g57kM44CXFvM=; b=K1ER9r8YnEI0hLdOqI3bNO
	Sdgwj7AUyWeQGukSort8CZktqsCUXsAvxdipfwelXxUqDna01YJRpftfJDif2BvY
	Su2SgJdBPrg/CJYatsrwcKVWcGorelpYhw+h22juD1epRcL13JwaiNlxEbSUrG2T
	aiNLj7/pIfSSDtz6k89/Rc9wctOkWaY9ApOilti7/v4QIzimsYNvcMmqigeiQ+cV
	6pV/E23ivyd0EIDIccW7qIOVyHo2ooBU+p360LgYU1lEfPIJiPt32EsmoAq0YNit
	vFTZQO6N7ZYPrHNvqzQwfNo1f/7KLXRgYOIKkOCGDaCWiFChM2SF/5vtEp2Ty5Lg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499ksbgu29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:43:51 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58M5eJcW021833;
	Mon, 22 Sep 2025 05:43:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499ksbgu26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:43:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58M5Risj013605;
	Mon, 22 Sep 2025 05:43:50 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49a8tj4cjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:43:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58M5hk3A30540206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Sep 2025 05:43:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 781B320043;
	Mon, 22 Sep 2025 05:43:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E389620040;
	Mon, 22 Sep 2025 05:43:43 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.82.69])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Sep 2025 05:43:43 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Aditya Bodkhe <adityab1@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] powerpc/ftrace: support CONFIG_FUNCTION_GRAPH_RETVAL
Date: Mon, 22 Sep 2025 11:13:42 +0530
Message-ID: <175851974398.1538174.12018336075108815728.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916044035.29033-1-adityab1@linux.ibm.com>
References: <20250916044035.29033-1-adityab1@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: raCoTZ1iYBpM5o1pOW0jmdzaXwbZekDA
X-Proofpoint-GUID: f-UDlgEkKy2mO7OR_gMWkHxRBlYjWr57
X-Authority-Analysis: v=2.4 cv=SdH3duRu c=1 sm=1 tr=0 ts=68d0e217 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=rfBYtj7KzXE0Fmh1LW4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMCBTYWx0ZWRfX1aCLHuIUn9Cl
 jCZO3jxQaH/syOSf58PZ6f0wRdtAnqekn0pB9yflwhmOhNCbf7kT4ZlOpLkh3hg5RXdFf2cLiWm
 Tdzj61jdH+YvYttNthaR3Yjv7ujT/La8dOqSzSy1lnLtMdC1GwEaV9D5P+3AsYUHEb4NYcmCXHQ
 FyMdmKK1b52DWgTJL+lMUSjYsnhT+2sVC8EKGy/BD30oknSt9gh7KsuH+teu7eJrO3vgf8PzfNJ
 CGkvf2TGlLLnbzy7+Fi9pahQWuexvhlnJ761yWxTIQN2iDkyZWh/rHks2FrhgIdVV/jVIiJq7Rl
 Meo3CinPzUZb4xyp8+3Hg9zcUQip2H0pmQn/Cfk7ztB9Akmvw46UY9qEieldH7VzAjZqc8qwIzj
 ZVHrEKUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 16 Sep 2025 10:10:34 +0530, Aditya Bodkhe wrote:
> commit a1be9ccc57f0 ("function_graph: Support recording and printing the
> return value of function") introduced support for function graph return
> value tracing.
> 
> Additionally, commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with
> ftrace_regs") further refactored and optimized the implementation,
> making `struct fgraph_ret_regs` unnecessary.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/ftrace: support CONFIG_FUNCTION_GRAPH_RETVAL
      https://git.kernel.org/powerpc/c/d733f18a6da6fb719450d5122162556d785ed580
[2/2] powerpc/fprobe: fix updated fprobe for function-graph tracer
      https://git.kernel.org/powerpc/c/7cec88bfdd33434d62d4d5ba664127fa175b50e7

Thanks

