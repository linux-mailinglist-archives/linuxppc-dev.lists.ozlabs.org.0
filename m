Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83147831DEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 17:55:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GjTQmwO3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG8511Qxtz3byl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 03:55:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GjTQmwO3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TG8473M6cz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 03:54:47 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40IG2ftR030193;
	Thu, 18 Jan 2024 16:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=prRDCbVOhbKHGi5TCgmxx9era6YL99O0cTuS3rgHrLg=;
 b=GjTQmwO373ejfR/uWbv1Zi68o7tyn7TauY4K8dxo+rOxG8gHbvU0zHewTm8WGJEgboRk
 Bi5tfY87BJWnBub/CrcjbXUBClbtlj6e7PzwLFCOIWmwtmneF8mj3Zy5zle/EOPoRgC+
 dhFMdUk6xD7ZyUs/YXK1hjlE7SjNvRGpVwQA2zw2ye/jG+8h7Kccrenon5iadnsDmvbk
 OsmnSnCQGd64c9zWIMFsYcLBCT8u3bkhhAEY3ocvG6CisvmsAeC9hYPi15oUoW9LjxI7
 wTAD88Lve5MSHsO4aATnXB4ikOo0+ixul8HBWht/UUUiAJRESYGoINkk6a7XxZ8TYtH/ 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vq75q9vyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:54:37 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40IGkskN016450;
	Thu, 18 Jan 2024 16:54:36 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vq75q9vwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:54:36 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40IE7dSq006508;
	Thu, 18 Jan 2024 16:54:35 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vm7j240a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 16:54:35 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40IGsYlq10683008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jan 2024 16:54:34 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2633B5805A;
	Thu, 18 Jan 2024 16:54:34 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F13B58056;
	Thu, 18 Jan 2024 16:54:34 +0000 (GMT)
Received: from localhost (unknown [9.61.184.220])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jan 2024 16:54:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
In-Reply-To: <20240116055910.421605-1-haren@linux.ibm.com>
References: <20240116055910.421605-1-haren@linux.ibm.com>
Date: Thu, 18 Jan 2024 10:54:33 -0600
Message-ID: <87r0iea8fq.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zK5jLBrkXTCOZ7a7xnbS3nI6fxGFLFgH
X-Proofpoint-ORIG-GUID: ZtM2IjN-6ea-E8TaOxMV8IcPor1lQ6eY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=828
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401180123
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: aneesh.kumar@kernel.org, haren@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> VAS allocate, modify and deallocate HCALLs returns
> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
> delay and expects OS to reissue HCALL after that delay. But using
> msleep() will often sleep at least 20 msecs even though the
> hypervisor suggests OS reissue these HCALLs after 1 or 10msecs.
>
> The open and close VAS window functions hold mutex and then issue
> these HCALLs. So these operations can take longer than the
> necessary when multiple threads issue open or close window APIs
> simultaneously, especially might affect the performance in the
> case of repeat open/close APIs for each compression request.
>
> Multiple tasks can open / close VAS windows at the same time
> which depends on the available VAS credits. For example, 240
> cores system provides 4800 VAS credits. It means 4800 tasks can
> execute open VAS windows HCALLs with the mutex. Since each
> msleep() will often sleep more than 20 msecs, some tasks are
> waiting more than 120 secs to acquire mutex. It can cause hung
> traces for these tasks in dmesg due to mutex contention around
> open/close HCALLs.
>
> Instead of msleep(), use usleep_range() to ensure sleep with
> the expected value before issuing HCALL again. So since each
> task sleep 10 msecs maximum, this patch allow more tasks can
> issue open/close VAS calls without any hung traces in the
> dmesg.
>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>

IMO this can be converted to a more generic helper in the future, should
one emerge.
