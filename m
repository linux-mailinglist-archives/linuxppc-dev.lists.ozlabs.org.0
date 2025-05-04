Return-Path: <linuxppc-dev+bounces-8271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FFBAA83BB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 May 2025 05:21:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zqqh714mBz2yr6;
	Sun,  4 May 2025 13:21:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746328903;
	cv=none; b=iSMoK8+Qi0kkuqN4yJRjxJyOFd1343K2DBmsk6iJUnb8X41ZPAkN0XoJm9o9K9yA+1k8c6rmMsBPaTZhsGE2B1wgB2bVS8VROY+e+8O3YFYdg86X+QqI5aR7iwX9r4Ad0vK8eP8+qE7WSYF9kCFHF4Q7x8z9t0dE3ARiBwl+3JhDReW/ZWHQD2NDHdcVr9JVLCsSKRKtmnqw1kGpGnZ/dFrR8ySv5jUqfQhptF7VebgebOAEcqW1XpWF/CtXn7CvIkJUOqZ7AB7IpYKWny9xVwu+xhCc99eqQZ/WRomMOpnUgoI8NBysVfhCFAk2FPuyXPdCAD51Scey4B/1bxk9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746328903; c=relaxed/relaxed;
	bh=v7cT19u7KwDZy5zU1KqVIBbQ05cJwXNl9ZOTJ/i5sb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ico8Oo9PLCgG2j6f6i2M+GTHvBfd54ZUyz18yC6uzkM4KzLNJAoi7WYBp9mTheASdxJGSi+fN8o261v4Xs5PC8xVE+n6qo3Vr8pI/HisTcVA80Ose+8ydAVs+baG68uJgUoqSfMD9gOZZQMGLEW0EC4Peg0ZrQR4gA+CeLglhV1eFP6sOd173lcn0Y2E2f512XiMLxU3KPR83+zcP7i+Grb4k265BvgJzpsgBK0Z+Lk4vPlzwgT9bL5VPK+G/4GNWiUI985MZ0G/V5it01VR3La8e/q6VrRNGp+klQeTcIk4dnzxkpj7cUwYgbB28MfgBM0UAO7WsInyY7MuJDLDZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iNYJcRsg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iNYJcRsg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zqqh63kBkz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 May 2025 13:21:42 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543NfqH2017088;
	Sun, 4 May 2025 03:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=v7cT19
	u7KwDZy5zU1KqVIBbQ05cJwXNl9ZOTJ/i5sb8=; b=iNYJcRsgwrbSs4TKMpmWPF
	MFwlpsRBet3gMgDBem9sJsX+A8VyY9LZFSWhcKS8GLSdHvHM9XUnGz2/uJD79C5+
	v+JSsQk4FbyfM9MgxwRayukDpgZAk2y3sK38H7n7dEz6VEUZYaGc4j0tAW6xDJCM
	1af4Ynx0sg8/saa3zVimDbjF2/SQL4B/OuwNDtjjRd7TjZCPvixkpLBYxkuWdfhu
	4x2HTLPm7hS/D8Uj19RUPqJhlUDRM144eD/Rj3aVWA3QwiPNRfObD5Gjk02uqa6i
	bL/4teTekIL3/YfwICcp1USmqMbb5xHUZFjP4wFczFUJ5vRQID3UPPjZa0L6jw2Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46du9v8n39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5441JbOx002815;
	Sun, 4 May 2025 03:21:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfngb4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443LT5w44892576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5A602004B;
	Sun,  4 May 2025 03:21:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C0F020040;
	Sun,  4 May 2025 03:21:26 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:25 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
Cc: sfr@canb.auug.org.au, tyreld@linux.ibm.com, linux-next@vger.kernel.org,
        hbabu@us.ibm.com
Subject: Re: [PATCH] Documentation: Fix description format for powerpc RTAS ioctls
Date: Sun,  4 May 2025 08:51:23 +0530
Message-ID: <174632869190.233894.9391450115429095949.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430022847.1118093-1-haren@linux.ibm.com>
References: <20250430022847.1118093-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: DU4JN7KePvu9aY2cIpaDpsfEfSv3veAz
X-Authority-Analysis: v=2.4 cv=XNowSRhE c=1 sm=1 tr=0 ts=6816dd3e cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=ioz5gwpxbLTQyuavpQQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DU4JN7KePvu9aY2cIpaDpsfEfSv3veAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNyBTYWx0ZWRfX9b24keTsBbHd z025L8zA/fqE6czyuq4lwOZcgD7IGyVW/wO1pqGMGI8J01zvcII8WU3m4Uzgctwl8eiXyVt2lpg Gavgs+5iLTH4pMVWqu+/i+bE5zfNDZtZU3R2QgK58UDstPu9j7Iq8+GE853sJYUJks7Cx3d53l5
 +m2wgowxpAQRU/sYLOmedBQqUA1xQVMOS0J2oel5X5bYRxvaRDofOSp3Zhs07TOW2KAWyI5GdU5 EbJwln47vvXbp6I8Wm3gtIzI9Pw6TyWCL2rynUNl7Jj9cyd8MJGhIynV7DxHq4UwOuLSRjhTF5I d+E8uiIuvb0u2PHvScPQk9jpnXorVXFffCzhUeFFeX4lja/gixdMbj+PmJLWpIJn17EEPdB2axU
 6/EW4ZB66tt0TiEhWhLJRT0U/yVX9GmF6CmpQ7ioZuoAk/PEj4fa/fnfMK8tAwuyCOABxX2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=708 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040027
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 29 Apr 2025 19:28:47 -0700, Haren Myneni wrote:
> Fix the description format for the following build warnings:
> 
> "Documentation/userspace-api/ioctl/ioctl-number.rst:369:
> ERROR: Malformed table. Text in column margin in table line 301.
> 
> 0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h
> powerpc/pseries indices API
>                             <mailto:linuxppc-dev>
> 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h
> powerpc/pseries Platform Dump API
>                             <mailto:linuxppc-dev>
> 0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h
> powerpc/pseries Physical Attestation API
>                             <mailto:linuxppc-dev>"
> 
> [...]

Applied to powerpc/next.

[1/1] Documentation: Fix description format for powerpc RTAS ioctls
      https://git.kernel.org/powerpc/c/03c9d1a5a30d93bff31b4eb0a52f030b4c7f73ea

Thanks

