Return-Path: <linuxppc-dev+bounces-14387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CEC77135
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 03:54:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCKZF37Zvz2xqh;
	Fri, 21 Nov 2025 13:54:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763693685;
	cv=none; b=XdADeqWlwbMOy3jfvDEpZhnhpMhxA1m4AB4odvxbVVKVyWzteFgOmwjjnVDXGDK4SBM6tpFKDqsjAR8vN7NnarpIvjeOCFpH7aGyvbGRplx+IKHZjvX+K8GEoHlw1WYomip35F8tyG4Vm2Ci6qVap0QlsuEFsPo69gop6qRSTJxs0unFQb/KTjjeAkkqaGH4iMjpAusYX9Jg1XY8dB1pKiItsVBHhzWivBoOm/n32W5yIWH7exQCczJ3Nf+N+UnMQbwTwmWB9ooLWO+NmhU8upyb+Bkant1ythz2MIemtHLDptkV7wIJ5HKZ+nhU+2JuUYuN+KgBZp2TDLdZopdBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763693685; c=relaxed/relaxed;
	bh=rL+6gQrD2hIPuY1jkJ6ZZlav1c8neJ0Gcd5SaeNzB3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MtFyUbwKTjQpZXOKBGb3Mlkeguytgbsu8TI9R+XQ9H2MV7s88T4dxT3FYh6wvzTfW60VpL059hB+xnTHOm1tK9sWFT7jo6lHUMJaHn3yGCOzkgvtE0pZPrwBFQ9ODsaP7A8Hhk0vii1s+9wMqdWLnqezHHj931NYJJaI+7lLe1pxCsJd13wCQitVIMtwiizv8sq0pnaJ/I37DBg2R+qlsQz6qzzUSmJbIi7vRs21JisRVpf0e+aO3GDFUzA1SuIzoty69QzbXrovyvrA3O1i0ucoK0x/Tu7gLYko7jJvejGio+EP8gqpR7zLIhfOnaWEdFXepE4CySlz6eqw/aodFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dZ9HPD16; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dZ9HPD16;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCKZB5p3mz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 13:54:41 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKNbqNc021553;
	Fri, 21 Nov 2025 02:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rL+6gQ
	rD2hIPuY1jkJ6ZZlav1c8neJ0Gcd5SaeNzB3Q=; b=dZ9HPD160AacbJ2bsYAizX
	EyXwcsFxR3CZ4TWVcBUHWbt4Jfko2id+VOm7ySPuxZ/wZtT7LUjoUOp7CUDlT8gA
	CWomUK1/GunAeHfVovAAyxL+p8J4hhZcSGesa3LOqZtAWRZllQ73mOMR0FRBc4QL
	kTshuhyauycHixY0PlKjxCSPd/ZxIO2Z+ho7u362bzERim1AmF6yxboq9J3dMltI
	TpO6MViCGPUbzYnEhKfugp4jNcoOC0ZcSQ+ad30jOA+Mq9/FCt5p5nFgrPcnn+Cv
	SxuQcBMzSUdmxyKjx8mWwvmiOhVXF0UQkwdD60S/v6exD1WjVEtsWXvfPUFhbE3Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjwhq16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:54:30 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL2sFpf024581;
	Fri, 21 Nov 2025 02:54:29 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjwhq13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:54:29 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKNY8dv010392;
	Fri, 21 Nov 2025 02:54:28 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3usj5dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:54:28 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL2sPII44433694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 02:54:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D439F20215;
	Fri, 21 Nov 2025 02:54:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3728E20214;
	Fri, 21 Nov 2025 02:54:24 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:54:23 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        leo.lilong@huaweicloud.com
Cc: leo.lilong@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com,
        lonuxli.64@gmail.com
Subject: Re: [PATCH] macintosh/mac_hid: fix race condition in mac_hid_toggle_emumouse
Date: Fri, 21 Nov 2025 08:23:52 +0530
Message-ID: <176369324783.72695.10204424891065348642.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20250819091035.2263329-1-leo.lilong@huaweicloud.com>
References: <20250819091035.2263329-1-leo.lilong@huaweicloud.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691fd466 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=AiHppB-aAAAA:8 a=ID6ng7r3AAAA:8 a=2q4paKsRDt6h5Fse_6gA:9
 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX3/wBF8XZMVw+
 IbUEbpCrNACI7Ix8ZByzezGSsuOvYMgsiSgNVtTxeXZTGjz3qGILJA19NoAeOhiqeQYec75lUDZ
 9YJY1h7FtKaq099Y9GRnrwdOV11WvYhZmXxXqHP8V/WAcEWSro8Tb7sEucJDX214nRLzplM8Mye
 hMSF2HnvDDZ3WyaVwuHqgqujj6S8DLqdv42eafpmuu4iYsGfsla2/qn/0W/MQwl60TPsaTSSXUh
 YTlhvFP0WWhqXqTXEpJ7bVZTOz3g5o5ag7GjuBInGBXUlkUIsKN5ohxJJuRP6YbwEi4XcXLEJY2
 BXQXNkPECa7Mv8WEymdEGhs3658R972z6KZAulrlQCXl75NU/eTYr7grwcS5duJEeU0ExHpm1ca
 iXajhHAHdunzCR841+oorxSY/r6zxg==
X-Proofpoint-GUID: xDKYSfzk0Hb4jTlRwC3CD5AP4K7xbrfT
X-Proofpoint-ORIG-GUID: txwizknX6t3T8f44PJXxb_ACtf8Llrjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 19 Aug 2025 17:10:35 +0800, leo.lilong@huaweicloud.com wrote:
> The following warning appears when running syzkaller, and this issue also
> exists in the mainline code.
> 
>  ------------[ cut here ]------------
>  list_add double add: new=ffffffffa57eee28, prev=ffffffffa57eee28, next=ffffffffa5e63100.
>  WARNING: CPU: 0 PID: 1491 at lib/list_debug.c:35 __list_add_valid_or_report+0xf7/0x130
>  Modules linked in:
>  CPU: 0 PID: 1491 Comm: syz.1.28 Not tainted 6.6.0+ #3
>  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
>  RIP: 0010:__list_add_valid_or_report+0xf7/0x130
>  RSP: 0018:ff1100010dfb7b78 EFLAGS: 00010282
>  RAX: 0000000000000000 RBX: ffffffffa57eee18 RCX: ffffffff97fc9817
>  RDX: 0000000000040000 RSI: ffa0000002383000 RDI: 0000000000000001
>  RBP: ffffffffa57eee28 R08: 0000000000000001 R09: ffe21c0021bf6f2c
>  R10: 0000000000000001 R11: 6464615f7473696c R12: ffffffffa5e63100
>  R13: ffffffffa57eee28 R14: ffffffffa57eee28 R15: ff1100010dfb7d48
>  FS:  00007fb14398b640(0000) GS:ff11000119600000(0000) knlGS:0000000000000000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 0000000000000000 CR3: 000000010d096005 CR4: 0000000000773ef0
>  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>  PKRU: 80000000
>  Call Trace:
>   <TASK>
>   input_register_handler+0xb3/0x210
>   mac_hid_start_emulation+0x1c5/0x290
>   mac_hid_toggle_emumouse+0x20a/0x240
>   proc_sys_call_handler+0x4c2/0x6e0
>   new_sync_write+0x1b1/0x2d0
>   vfs_write+0x709/0x950
>   ksys_write+0x12a/0x250
>   do_syscall_64+0x5a/0x110
>   entry_SYSCALL_64_after_hwframe+0x78/0xe2
> 
> [...]

Applied to powerpc/next.

[1/1] macintosh/mac_hid: fix race condition in mac_hid_toggle_emumouse
      https://git.kernel.org/powerpc/c/1e4b207ffe54cf33a4b7a2912c4110f89c73bf3f

Thanks

