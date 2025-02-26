Return-Path: <linuxppc-dev+bounces-6483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B47A454A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 05:47:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2hlM3hBrz3blB;
	Wed, 26 Feb 2025 15:46:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740545215;
	cv=none; b=MFtxcTs7R1fq1DwGbl0oMye+ySVVznSTqsFGephXY0FmEFWa/NixWRWC9Juj2oflLayWodxljqcGRaHoOnLP3mR9ywRU+hbeHZ1jlxguzq93SYqqdEJ9ES/nmkrNmdMcsi5XRT/E1l6O/xHHFhg80X9JO8rt27Gyfsu5nQ/7cxtVAXa4RaalfCVrCyORQyKOikHnbz+oUn+ZeVRTv6J8lF+EgBFoaqjvFz8XJ8HurUgEJBf5D70MscJj0fFOuH4Bg7BSljUm0fkv34kPZ10azu1srvitBgMR3pC3xiMp4Anln4EGWY8vKCNCe3Uq0lYT0V8MJZIL05qsMaSNfsv4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740545215; c=relaxed/relaxed;
	bh=UGnsTDCDGe8G2v3oTBOpZ/92icpnLt9nPD0ihUM9Zi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H4C5slZAPB3vEmBTxWwzCtjAqIEf/Y7dptFXBgIIPXighpzSydF3utoYvYiXdBF+oMDbTeZGvwSYX87PAaPByf3u//7K2wDIFMPMVQjztlgqg7RvjHv9esPvIpDBF/24vQY843/gXnxVNc1/Rcl3P94wSBRHgUTzBEpvrI7pmhR+fC6gLmSLsz54ut8/QwHo//fhw7m3Pntk+EK/RpytQmNkvTOsqvXEQCGO8KZqRTQpVmbFl0faRIR2taz+wayF4rbBalng5OPcibZX5MpKKRCXaN5itApKnIqz2SCchPgph2k/5Ugg4eeJcB/Qs+P+BgSWeUdFC/WoucG9JpQrow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h6Sea7Db; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h6Sea7Db;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2hlL567xz30WY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 15:46:54 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1mARR020966;
	Wed, 26 Feb 2025 04:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UGnsTD
	CDGe8G2v3oTBOpZ/92icpnLt9nPD0ihUM9Zi0=; b=h6Sea7DbE5qCgiNltLBx5S
	ZROcGkjuquNfuYfLJuvGpOGVKZboxy+RYlj0GvdRJEwS8UfCTtt7KhWEGOHmgYxK
	g7N5o3nhdjSLuzimzvmg+XUFzx+08On/Gz3aM6DFUyyiEjvz4SHbCIm2dXlYkay+
	kZ07S0Yn/orHIrci2PACv3YPTOAvXh4XwLD85knV4bzKUqFSbQ+rRl8XVpu3LBFP
	FY97jKBoCrPV5Rhz+RQ2i3JcpAzQwuzFmfjWDh6f9A6LXyS+ZKREBmTC+xKRHgjy
	Ve0nFsu1J37uLREOZTC93Hco+jmrlaX4kK5yVSo0+s7yUp/pZyUkVmMMvAYaxcCQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5bh417-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:41 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q4kfxi015738;
	Wed, 26 Feb 2025 04:46:41 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5bh415-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:41 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q26erQ027333;
	Wed, 26 Feb 2025 04:46:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yum20cyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51Q4kc2853150018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 04:46:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A98C620043;
	Wed, 26 Feb 2025 04:46:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E577720040;
	Wed, 26 Feb 2025 04:46:34 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.65.188])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Feb 2025 04:46:34 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/ipic: Stop printing address of registers
Date: Wed, 26 Feb 2025 10:16:32 +0530
Message-ID: <174054508252.1386382.6056168945528529778.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <ecffb21d88405f99e7ffc906a733396c57c36d50.1736405302.git.christophe.leroy@csgroup.eu>
References: <ecffb21d88405f99e7ffc906a733396c57c36d50.1736405302.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qd2TNnM2phvmYQkvNTET_B0HC_81_FPn
X-Proofpoint-ORIG-GUID: 2Z_Ib-uG9xuEO2Ka7KUTe2rXjrWHgbKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=711
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260033
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 09 Jan 2025 07:48:36 +0100, Christophe Leroy wrote:
> The following line appears at boot:
> 
> 	IPIC (128 IRQ sources) at (ptrval)
> 
> This is pointless so remove the printing of the virtual address and
> replace it by matching physical address.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ipic: Stop printing address of registers
      https://git.kernel.org/powerpc/c/67d939159764d0c826971f9a83b4df687df5cbf4

Thanks

