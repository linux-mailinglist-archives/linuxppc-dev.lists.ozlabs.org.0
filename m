Return-Path: <linuxppc-dev+bounces-9383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5D2ADA0A7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jun 2025 04:39:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKcmT1rwxz30Pn;
	Sun, 15 Jun 2025 12:39:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749955193;
	cv=none; b=ktAan0LEx+BxGdMZ5cIu0Pm9XjGycu7ghVj66egyOP4MmAWTswUsS/4iwoj5L6HGOU7wp7qMLyAmQO7Wigri8LecHKUt/7iynj8nnGHObGJZrp0TrSNNZJl80YZ/BjSBNCiOPc0TrRwBEwN9K7NVyujkLbShzYJdWsy9qP/gjuj91o4OWFezDNj9T/DUXQuVhRP+qGowP3yWWkmdsJXd51c+HhjZ7RATmSxRX+B6TRmBusV5c7f//IdyZxdH55Ko0cI/B8v3pzaqVku4/m1wPRm20XgRPyVap5pbCoW7sbWDPuq0kS0W/Yc4rM5Bz/eT+6d8O8UnUmbcGEwn0SiEew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749955193; c=relaxed/relaxed;
	bh=hUGjMAUYy4wu8n0OUXNcHylAwMp7JmMIoslQdQbE/Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1g7DL99fYnYOQ5BLhnGzX0ypuFK1Kd2TelOAPEs3nfXgFD4uISyyzHcuq04P1k+vLXpfpSEASb+5u9aIHk+xk+czSwMROG3i9YB8hXjxeXzLu2mY5yQj/6UHgud3OjSXdMoRUleYvJATOzihvV1tSAOrhsOZcwqL/Cd4ymCEnFqUgbIQcVWlB2br0ZzvhgTX/BLerDlVSBnoUAeCPllebxKRMqL8aUHfEfYjhT57fXeu/bWLGVsyeek/JG2qKFr1/sK5u5PCr2agyjO0rvbpv/M5rXWQ5JZ/uBOTvJVFoRIeExw8LRbTGQl9i3zkKHADJuVf5cOgMKeYfmwgj4fqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KbMrHXAR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KbMrHXAR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKcmR4JmCz30Pg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 12:39:51 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ENQbku001713;
	Sun, 15 Jun 2025 02:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hUGjMA
	UYy4wu8n0OUXNcHylAwMp7JmMIoslQdQbE/Yg=; b=KbMrHXARhOooDP9Aiy92gb
	sodxmXeE6GilY2dML2VN8cUwW0TjeahsdA8C6E9E0AfA3T1qo/xaCJv+0TlETlIw
	/e1nQxjsG4PtrjobuxhxnBSyO3jondyIXwPTXnDigslOS1KpQ3QtM++GMnZIaRX2
	B/ScQ5p7YcVxwWrsik3DyUsoCbwhOTR2/hBBxLKwnGLUJpKnI46zI+U4mV/0e/Sh
	RnDa6iRoszVsIIlcWjlmWiD92esf6GwqZlunOPD3SOssrer2Dyz92gmlqN2GyfAf
	BXE3q48oI/JP92vjX97Hom/fPAephEQqCqwQs9p9uYnuzfDVG+rfe2WqC7KzaqUg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 478ygmurs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:30 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55F2dTfY013396;
	Sun, 15 Jun 2025 02:39:29 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 478ygmurs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55F1rM7d005481;
	Sun, 15 Jun 2025 02:39:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 479mwkr52q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:28 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55F2dPxg43975104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 02:39:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 107E42004B;
	Sun, 15 Jun 2025 02:39:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AF8A20043;
	Sun, 15 Jun 2025 02:39:18 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.23])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jun 2025 02:39:17 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mahesh@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        gwshan@linux.vnet.ibm.com, benh@kernel.crashing.org, agraf@suse.de,
        vaibhav@linux.ibm.com
Subject: Re: [PATCH v1] powerpc/eeh: Fix missing PE bridge reconfiguration during VFIO EEH recovery
Date: Sun, 15 Jun 2025 08:09:15 +0530
Message-ID: <174995502358.107804.15093806320062799032.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508062928.146043-1-nnmlinux@linux.ibm.com>
References: <20250508062928.146043-1-nnmlinux@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDAxMiBTYWx0ZWRfX9vAKVCGVL9TX hAc/KyA1ai4sGX0cQw6WaQlVyrAuFZnaeCACtHbLgK6swZbYZ9hqGep7xnrXA/1R62MpCokKvD3 sTDSQLIz2hGWcU2g894HBsz0UaNkdBeFyR7PamuoKkd2S4lmKwJQE28pr64DCb2T6+Iv/kkDnJ+
 QeVsq+EDKx5aQsODNc5i02VbpDhjIYo48f0ilfLCJ9y9n+ObRzWKFIdnp9A0OSTt3TqfJ1aQsEy p4GsZ6YLWsSvZfQKKABzaMYeG0njUmGsp8Lg6bZvvP7rNYapUUpArecHeNhWmXVjJV2l/GRiRcI EyEDjn+rowclylK0MLUxx4EfPTXbwJi8gbf2JXTA8KzAQTK91LmjxBvaVxSNQcw2QdkljxsAB+o
 b4DOj/XP5bDUcLADQK+IeUyi1jA345f4IYvzAfRVB39zhbJPJZp9TttZLjvtS8Z+dhikgiF6
X-Authority-Analysis: v=2.4 cv=fYSty1QF c=1 sm=1 tr=0 ts=684e3262 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=giJ742wZMMcE2DLqPy8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2uUB5_iAxcxn8AqaFhb8WcrvLTioQNus
X-Proofpoint-GUID: Q51RZxXKa5-8m08omSAXjP2Tav_LF4Tr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150012
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 08 May 2025 02:29:28 -0400, Narayana Murty N wrote:
> VFIO EEH recovery for PCI passthrough devices fails on PowerNV and pseries
> platforms due to missing host-side PE bridge reconfiguration. In the
> current implementation, eeh_pe_configure() only performs RTAS or OPAL-based
> bridge reconfiguration for native host devices, but skips it entirely for
> PEs managed through VFIO in guest passthrough scenarios.
> 
> This leads to incomplete EEH recovery when a PCI error affects a
> passthrough device assigned to a QEMU/KVM guest. Although VFIO triggers the
> EEH recovery flow through VFIO_EEH_PE_ENABLE ioctl, the platform-specific
> bridge reconfiguration step is silently bypassed. As a result, the PE's
> config space is not fully restored, causing subsequent config space access
> failures or EEH freeze-on-access errors inside the guest.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/eeh: Fix missing PE bridge reconfiguration during VFIO EEH recovery
      https://git.kernel.org/powerpc/c/33bc69cf6655cf60829a803a45275f11a74899e5

Thanks

