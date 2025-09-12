Return-Path: <linuxppc-dev+bounces-12055-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866DAB54144
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:57:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLFp2F4Dz3clV;
	Fri, 12 Sep 2025 13:56:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649390;
	cv=none; b=auojwFlGl5T8ZdGWDUPD+sFkl0t1XXS/+UTmtkJjwqigo/dA6AMDm/4JZP5weIO5dDvJku2tICx3qvYDkeHAKC7/1k7YkYYYywErD+oAIqxm29S8c1K0VHo131/ldowe1yzLoO6K6szNs+9Rxr1iNNLbf/r9utlUnX81gmlDlQJg09Y4YtcG4N2p8D0ySoL1LQRH2mplTP99fgzNcuRn5tsgBPz2AmbSjJhw3vArdSN81ZF3pXQn8UGiyG90K99KZgwI/8dhUuAbJKY7hsXpwlo/EldUmY1UE+nPGrlVi/qTOnreRB1o7ikppc5b7if2iEI/8IVHqiuIRsvKwrWIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649390; c=relaxed/relaxed;
	bh=Qebb0/OFExe/rv0LsvRncySq7WnREswckrL/cMozwyA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oX67pFbAenGYJBGAiZDrO3K4VAYKdfJOj2ZsuOmH55nSmW0ird5nyRI9QVHZ5nx6XEBVWvJqwcfyEMGjwjevtwGbcFAciVhtC7D9unaDqvX7jFi3qrApA1kODKNPyiV45NmGI3pYid2CtJz+R5AjTKyaypqc3TApOYHr5Nf1cVcK4JjAtoieOq3/OoZXhiAMrkTU6VQqojOVU3MXfEvAbpK49/Bi29JhKk7WeozG9oeBzHd8vrnVGuBtIOgFI7/i1gMGyTvk9yRiHuFzI6AGsPbu+nQUBOoz8atfhNXw0Awoy2LeP4zQ7KUwLUvU9vD7NZ3wiVEhQ2MYUvlP1v2zBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GFV6sL2m; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GFV6sL2m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLFn47Xpz3cb1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:29 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C07ndT015943;
	Fri, 12 Sep 2025 03:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Qebb0/
	OFExe/rv0LsvRncySq7WnREswckrL/cMozwyA=; b=GFV6sL2mpNyVQgSLhXLmxg
	sGEtZZp0IPTr4gVzc7lyLN9tbbmrnq6MtZEc8GCOrjofJv5B5qr92v0HTL3oQOho
	LA7xbZEast4rKAEVyIWopUrct5omHLUKxwxgvRso5ZCkcxn1Cu2yPeNks73YH1+m
	b47lTFc24d/vRb96rpwQX3Il689DEuHWyr5+NEYNzcCo6Fy1d7Y00gYvPbg6fen2
	eGdaTatgUmd5isWGogIRFCCKCc1DswCQ14Ly4juxrJcz7Q9wCbSms4pxh9ffGaM/
	xpKQxCNR6dWsIQaaa8W53meWjWIY8PaQ/QfebdZ7DwXqMcCsk3fbrynj42HUyLjA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cffs132-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:16 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3uFt9013813;
	Fri, 12 Sep 2025 03:56:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cffs12x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C1jcAr010605;
	Fri, 12 Sep 2025 03:56:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910sn8yd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3uC7V56230348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:56:12 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7022E2004B;
	Fri, 12 Sep 2025 03:56:12 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F417E20040;
	Fri, 12 Sep 2025 03:56:09 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:56:09 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
        Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH v2 0/3] powerpc: Cleanup and convert to MSI parent domain
Date: Fri, 12 Sep 2025 09:26:08 +0530
Message-ID: <175764920913.610338.16071353255211421986.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1754903590.git.namcao@linutronix.de>
References: <cover.1754903590.git.namcao@linutronix.de>
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
X-Proofpoint-ORIG-GUID: Q30Q0NxNwgJ09JOmuQab1a8-kos94hmD
X-Proofpoint-GUID: unepgJDJccu8cM8LciLhngab_Fl5dnhv
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68c399e0 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=r7hqeWRgI3asRjLWeCMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfXxwISTgqken9B
 buy3jR21ofUFvxWVnJCxa2sRGyDPBWiDn2OzkcDTD73AY414r0jxtvGTK4hceEGmo16vVImVD+2
 Vv8667aVCVQu8JcnL5li5nKvBLCQoTyl2PHZ45JMk81edn7Tpq+Wb7ZoYxqQfb+qbDlK7VGLoXd
 iGoP/EqKFRnVmvuWZokZSpNgSAKo2HJGZFnGbH4g4ApmVn+q41Onkpp/J2e8ubuLnwPzfg3RZRN
 HObzz5lQOw04Ptfkm1J8/Q8lIAcWtPc4euBcmexlJJJI9Qg7JxfBmfLXgETywP63+sJoHW1TPLr
 O2PTy/BBSZ8BLGHemc9Moz4gO2X3CcceNN48T1sSSax1YZ2OsL1JeXWbBuMF6SFYFMJxkhmajyW
 juYRCLyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 11 Aug 2025 11:28:53 +0200, Nam Cao wrote:
> The initial implementation of PCI/MSI interrupt domains in the hierarchical
> interrupt domain model used a shortcut by providing a global PCI/MSI
> domain.
> 
> This works because the PCI/MSI[X] hardware is standardized and uniform, but
> it violates the basic design principle of hierarchical interrupt domains:
> Each hardware block involved in the interrupt delivery chain should have a
> separate interrupt domain.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/xive: Untangle xive from child interrupt controller drivers
      https://git.kernel.org/powerpc/c/cc0cc23babc979e399f34f53e4bccf702a389558
[2/3] powerpc/powernv/pci: Switch to use msi_create_parent_irq_domain()
      https://git.kernel.org/powerpc/c/f0ac60e6e311062f1a452d93376055787db4b070
[3/3] powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()
      https://git.kernel.org/powerpc/c/daaa574aba6f9c683408b58a7ab2dc775ece2f98

Thanks

