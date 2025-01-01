Return-Path: <linuxppc-dev+bounces-4554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB229FF38C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 10:09:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNPCb3dqjz301x;
	Wed,  1 Jan 2025 20:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735722539;
	cv=none; b=LVLmRK+au5syALQK4T3i5rxltmW7uyJFfPCSdftAaKtec2vmbPjgMylkZVkLEgAOfQmMyowADoyVcus6PlaX9MjsuT13WjnC72R4EHX4Wwhpp0Z7YCo+kpr1YbgP7vGPUYUK0K047WfsGFi5upzi4wZse0rA02GDEd0L+Evmesy+zb/oh2m4aSCpsRqJoojV50EcZzseBPe7vR/f0t0da/LkI7LglNLixMxZljnwX4i7ybZSxclOgs9cqQUo6nR0hMwmC4yzHnT3hnXGwMb5Kd5bA2p6zI9hYpAaHMDD1IAOFWVGzFk7J5vJf+IXbsgXrJoPtUuByq9OzcV6B4jl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735722539; c=relaxed/relaxed;
	bh=KnYsxM4h1zFDlv9KF6yvnXFfNx61t2Sov0Dbqg3KGRg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJB63OvINeo+H9oEfUFunnLDhlKjuQYbxawRxTvgHQIR9T/xtModQ/vc3B/gr106YD3uaQjjtajXDjVj4yfnaRshJowC0lIpdyP1l8a5djWcp/jbVGibEbYW5pHfqlHv0tHfikTY4we5GBal82BLKl/X9r76u6ff/q4dc42mIIzNa/nJBBK5VBkP0HadJTR7i3jR1bh3vZI9e+VDFlNAf0FRmngm1ptO7qYlXRWRxfYSIsVFAJkyqHi/5Z9tfsvFflFbdXhL74+VJuP8uhja53+XUcue/8HtgXI91CDE+79caCBSUCz7h+gjEt8FCRpFvXiFOrcEjJpL6Qq5rK+APQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gQoVlozb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gQoVlozb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNPCZ2rMSz2yvn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 20:08:58 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5016tbif028191;
	Wed, 1 Jan 2025 09:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KnYsxM
	4h1zFDlv9KF6yvnXFfNx61t2Sov0Dbqg3KGRg=; b=gQoVlozbWRkpJiDRnEDzue
	5evZ1LdoT0AgIdlmgmClhKIlrQhKGyFXXGGFKu44KeM19Bft38XXqxyjJfWXsB8I
	X7etsEkpbG4fs9S+x8K4cOwbuarP8j7NcZPe1C4EEsNRQUqIgBKzgNyz3WJXPa25
	a4iaFyugO1enPA2xdQFjfnPlgCuuZYBaQkrE+1EYJAPIXZuuDgtzrBc6nAay578S
	C0NeVIUgmNclVRWh/zDhxo5v5iPvPT0VxuSJSPfVoZfFwFcyAcOqaXzEXIEja+/c
	DacNopYe7SiL5HTLLCwvU0kBxkQYE6RBWwcQZC8vbkQdK0ZfAlXc9+lYDSSS8vwA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vj34juad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:49 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5018JuJT026987;
	Wed, 1 Jan 2025 09:08:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43txc1wbj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50198lpt52756930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 09:08:47 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36C0020043;
	Wed,  1 Jan 2025 09:08:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C8F220040;
	Wed,  1 Jan 2025 09:08:45 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.115.214])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 09:08:45 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Use get_user() in start_thread()
Date: Wed,  1 Jan 2025 14:38:43 +0530
Message-ID: <173572211262.1875638.15956391246379198775.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216121706.26790-1-mpe@ellerman.id.au>
References: <20241216121706.26790-1-mpe@ellerman.id.au>
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
X-Proofpoint-GUID: IeP2nfkBVu3wDkjva-IC87APMYMB_yBJ
X-Proofpoint-ORIG-GUID: IeP2nfkBVu3wDkjva-IC87APMYMB_yBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=665 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501010077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 16 Dec 2024 23:17:06 +1100, Michael Ellerman wrote:
> For ELFv1 binaries (big endian), the ELF entry point isn't the address
> of the first instruction, instead it points to the function descriptor
> for the entry point. The address of the first instruction is in the
> function descriptor.
> 
> That means the kernel has to fetch the address of the first instruction
> from user memory.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Use get_user() in start_thread()
      https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=f66dbe43798fc97e8c0e6d9b86f1aa923ef523fa 

Thanks

