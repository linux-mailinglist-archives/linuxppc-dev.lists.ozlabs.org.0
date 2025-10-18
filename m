Return-Path: <linuxppc-dev+bounces-13039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8CBEC82C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Oct 2025 07:34:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpVjz0jDwz3cl9;
	Sat, 18 Oct 2025 16:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760765655;
	cv=none; b=SPg6x8KBuOOop6g92nRU6t1v72kDsGBHIjrPPFoEnw7DfXKS+QehIfB9pht6yVNygPiVzj6ZtvSpKF7nasIWAUKpEvBMtk2Fi6vx05oODux4Q+Bv4ccWd16mDXzHHjGJ/mtjy8s4TA1o7tQ2ix19kJSUsbL8kTIGZs4RCpDp4ji72a1I5q8yGfOMjs8jTHOzrQPQO86nnxTYzpjbNNg6nGxKE39haMa5qXbRP6A0N6PmX0pEOHaL1oAE5KvbjIemFU61pD2Eqd4MSYXWyznpc2SplXme2mM0GOnJIrlgRX/Ntxpx7yIvcfpxHE9EGq4EzIwZ5L/A/lm3Ji3DH5z5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760765655; c=relaxed/relaxed;
	bh=1a2xqCPKn7Yfe3qT3m1xrGTlZho+TG3RTSnggotxZDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJ0JMj7K/JGO6+nbAmmtJ1xJYPg3WiFhkB0w4WmmX93NZ6Flw79DLfwiUTwesGH5DWaXR+E0x0z/XoG8bsWs6xUh5gp/6Emv3GTHXaEex0fJ9p4AcvtHMOhEqzQEPFHSUEfKqtuobEy4jfcXhHGQI9l6VqCrIkfEyZDPv43ceKUGpjUjfaaZ7WYazHKpTEgZPPjvljM3FYCRirs7WLqsxyF+X53ktl6UXPiWKe0adfDm7LX4POPaEaeRwzy+KJUyBLWfqQpwKWCDMNfHV2ZjAxQMZjW1Kvh6qcxKSplk7M2bOGVUx5KHx83KaSEfSzXTVpBLirjLD0yjyQLODT8oOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E4fRehD6; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E4fRehD6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpVjy3cmjz3ckQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 16:34:14 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I4Z7bt005199;
	Sat, 18 Oct 2025 05:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1a2xqC
	PKn7Yfe3qT3m1xrGTlZho+TG3RTSnggotxZDU=; b=E4fRehD6nrArxKtRSPcC8s
	XwOgpkALWloeWT2P3I85t1bBmhJpxD3NIcl6cSt3+L/7I1J4wQWHSz0viExo3EPW
	K250BDFvk/XEyMyo/gDUSC6qvxiqBjieR8lt4TJtroiD3fHCzKyg77f+X22PbS2C
	PN7omG0hahQGp63OV9kpbCXZvUC1nsrz1Oh5bcSpe+fCuWWQxc+tr7a4VeT1qrhR
	n0JQbQw7u3FpjhedFcqxvesDfPzGYF+fANqJfDE031uIOqtOhBdJuM6jD8/epfX8
	uDccN+vAxV2PRrrK/AGk/TT2ogJkMqJ9/RE13ZbUSWgHgt7i4AgBZ2tlQkWUCToQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v33erb77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 05:33:57 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59I5Xvim027400;
	Sat, 18 Oct 2025 05:33:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v33erb75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 05:33:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59I3hrIM016742;
	Sat, 18 Oct 2025 05:33:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r32kgt8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 05:33:55 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59I5Xs9T27394348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 18 Oct 2025 05:33:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 827E220043;
	Sat, 18 Oct 2025 05:33:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75F0A20040;
	Sat, 18 Oct 2025 05:33:52 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com (unknown [9.43.69.229])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 18 Oct 2025 05:33:52 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Nam Cao <namcao@linutronix.de>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/msi: Fix NULL pointer dereference at irq domain teardown
Date: Sat, 18 Oct 2025 11:03:51 +0530
Message-ID: <176076456872.59904.2831569431349537120.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010120307.3281720-1-namcao@linutronix.de>
References: <20251010120307.3281720-1-namcao@linutronix.de>
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
X-Authority-Analysis: v=2.4 cv=FMYWBuos c=1 sm=1 tr=0 ts=68f326c5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=dwpbbf9tRbJM_blNvucA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 6yZP38Vl89LVXNHJjfBlkkslVXp2LRqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX00aPiBFyr+W6
 WG1fJ47TtpUUnVAfhfra8RUQA3B0SoPDQHhmEWV6msPpW5k+IRtwb3abCIYW/8iyqhDf3IL5m+R
 kHwFgPo/9LSUBEjDoJfGTJ1DP8B0x9TtoDPVk2seqhI5dxYFhHxbcLfbHK4WESe867CBKZOlVR9
 1TxTCAcC2HTN85lQOhr8vAHOyqW/swQyyeBQhIMt6lSWB3G0aLYPDymYyaesotHZZXpkoyGqCcV
 1vv+h76Qf37K4LdDScNEYWxhluEqPp//F3JYv84St4GBvvxxNzqqWPQDAYYVjKzHDtfHhhBP72s
 +GdLVwLXPH7PkfD0Q87PyQRmeoOtWj0ouzTkC1IHArWOfnPwW3AtlBp5VNdIARS3Opt6YgQ6NIy
 sThR0QCp+dH1dCNRQbXbK7F+vwILcA==
X-Proofpoint-ORIG-GUID: VICwb4uCS6y3HdMBRqjtsqusEBH2C9o4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 10 Oct 2025 12:03:07 +0000, Nam Cao wrote:
> pseries_msi_ops_teardown() reads pci_dev* from msi_alloc_info_t. However,
> pseries_msi_ops_prepare() does not populate this structure, thus it is all
> zeros. Consequently, pseries_msi_ops_teardown() triggers a NULL pointer
> dereference crash.
> 
> struct pci_dev is available in struct irq_domain. Read it there instead.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/msi: Fix NULL pointer dereference at irq domain teardown
      https://git.kernel.org/powerpc/c/ef3e73a917ec7d080e0fb0e4015098a4fb0f1cff

Thanks

