Return-Path: <linuxppc-dev+bounces-6565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7EFA4917C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 07:19:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3yjL2Bb4z3brx;
	Fri, 28 Feb 2025 17:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740723574;
	cv=none; b=lIKoT9EsamPJM2NYzAoezQLTD9kvgfndoEONw5lGVeGc9iOqWhOJmR3Ul1tRZHu08Yq/TTKrBPu3wjX03eewNs4UM3624NmSOetxW8+1naQX71hSy8btTxlVV7sxFYgqUwhsnNIXYPxW0hdbac3TueDV5VkxDBL7s4BNvKHAavG5DGbiGJWdCx/Su5CWlGwV7NQFfvM0HlPnklk5Alr2Qp4fAyoKoludz2ipvU7y8IIwz7W+eBz4OXzicTprg1szBgyhASxkVoychreSXO7pGmN1rw1U7V7X4QfPXSSoPT4fwBhCLXELTzEjhvQrBqGioj+XF0Ie7dfbpLRMNlEXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740723574; c=relaxed/relaxed;
	bh=fr1vg76RcX2p/Mitf7IfH33i4E78sqtU6R5wxK3K63o=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=MNf4cqz4+XBLlK56w7om2aeCb07ePALytQg0sFJk4YDMV89GyucSbQ2ekHvH65P6ypvqGC3T5P9HTwScqcyERRCqEABnJcJOjkLsWsPNUNrxLPlfLAi0XJNRoE7JBUOtesHgHj3P6TxBcwsYYqmxz7ewDSKDONE5utEE0NOzZ1UqNtEDNbxAZ5qt8A5TPfYZg8UNnaaku0I9VaqHUVYtC7ZJiiiBJdHBAxqTnXTnCIBs0MYl35WM17UrfcA4FRU/AohRDN20zylMSJfoGZ2H0NlU59ln8u821HtZeegm1SeVEJdH89eFal3d7gA2OcEVGqIMhRg8tFz2V2ubUhru8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZbddBfmb; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZbddBfmb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3yjK3GtRz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 17:19:32 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RMnkEn015316;
	Fri, 28 Feb 2025 06:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=fr1vg76RcX2p/Mitf7IfH33i4E78
	sqtU6R5wxK3K63o=; b=ZbddBfmbodFDx8aFhnRx+kzuKktCnGjGMN+zW5cSjtYy
	eU3KPHmGBg8oD7/ZVYi4Q8yuCnehhmlohMdyBB3whcN10n7ovqF+qnqcRTjBjOFy
	d4lcbSzJvZ9mXk8lTWj1AScmJwzUS4HEBXlTJTmwgvgJFL8ZXQ+9jWefm7ZtNoPz
	UBRrFfWsakTh1a21rmNmydD0JHaAEj7cryzjPPlFhV/tgNPx4IKhax+8tlIzyQqX
	IMtve6HE7ZeMHp7RLW2onDJK/o9whYev2uMzBxWOB6BbxNvr4j8fsdL41DhmxvIu
	RzZDOyprwZVcwfnvjFqNzIo/m4FFaJZIszqrxV7LfA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45316a9mjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 06:19:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51S33mcb027479;
	Fri, 28 Feb 2025 06:19:22 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44ytdkvvkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 06:19:22 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51S6JLQv30736976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Feb 2025 06:19:21 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 955425804B;
	Fri, 28 Feb 2025 06:19:21 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C3FA58055;
	Fri, 28 Feb 2025 06:19:20 +0000 (GMT)
Received: from [9.61.250.132] (unknown [9.61.250.132])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 28 Feb 2025 06:19:19 +0000 (GMT)
Message-ID: <ed12ee41-5b7c-496d-801f-8c7e3699ab31@linux.vnet.ibm.com>
Date: Fri, 28 Feb 2025 11:49:18 +0530
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
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>, maddy@linux.ibm.com
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Subject: [linux-ppc]Memory Hotpulg self test is failing
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: z_Or5vXI3Ire9qFOV_2kXAI00PZ79HAB
X-Proofpoint-GUID: z_Or5vXI3Ire9qFOV_2kXAI00PZ79HAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Greetings!!


I am seeing memory hot plug self test is failing on power-pc kernel on 
IBM P11 system.

Kernel Version: 6.14.0-rc4-g09a81ff40389

Logs:

[stdlog] TAP version 13
[stdlog] 1..1
[stdlog] # timeout set to 45
[stdlog] # selftests: memory-hotplug: mem-on-off-test.sh
[stdlog] # Test scope: 2% hotplug memory
[stdlog] #    online all hot-pluggable memory in offline state:
[stdlog] #        SKIPPED - no hot-pluggable memory in offline state
[stdlog] #    offline 2% hot-pluggable memory in online state
[stdlog] #    trying to offline 2 out of 60 memory block(s):
[stdlog] # online->offline memory0
[stdlog] # -> Failure
[stdlog] # online->offline memory1
[stdlog] # -> Failure
[stdlog] # online->offline memory10
[stdlog] # -> Success
[stdlog] # online->offline memory11
[stdlog] #
[stdlog] not ok 1 selftests: memory-hotplug: mem-on-off-test.sh # 
TIMEOUT 45 seconds


Unfortunately I do have previous passed data, hence git bisect is not done.


If you happen to fix this issue, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>


Regards,

Venkat.


