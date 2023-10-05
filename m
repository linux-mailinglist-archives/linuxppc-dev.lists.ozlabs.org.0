Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0F67BA9BE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 21:07:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fD3mdQJu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1gzn5qrGz3dk2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 06:07:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fD3mdQJu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1gyt2xCWz3c7C
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 06:06:46 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 395Iiv9D010927;
	Thu, 5 Oct 2023 19:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=DACDKnQ3Dvf18in8XyBG9cRM7jWk/7aVAW5xPGQ6VqY=;
 b=fD3mdQJuazN9HHmV3kCXVm8BPqG0f64hhlDMXuE9gV8OcM3F0n9IewtMWWB167jDilmF
 weOPVMCVg3bHrJmXFdr3nH5QI5nwUDdI2xFaNHWpAq/NcNdCDpEuHfLdh3+18rIPiRlu
 ci0kv7c9jUVSx6iRrRH2MWuzWqCTMVxEDu94AM0i4hiXeGxJCxfxIVCAJynWLLA6eat0
 XCz+vqkxcWerI7IxOO/WDWLrTip0nu8Im06s7y7wji17OXGP1OtVMIlhtw+bwqfeOt3o
 5hT0eJQQu4TWQXq9dVtUPuXCVhtLFen6ifh2uHsu0Ok04nTZYJumZ40T3hZyO93H/eP9 RQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tj2prrpbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 19:06:34 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 395IgcWd006692;
	Thu, 5 Oct 2023 19:06:33 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tf07krtdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 19:06:33 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 395J6W4I37617990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Oct 2023 19:06:32 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB9E15805D;
	Thu,  5 Oct 2023 19:06:32 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A94A158057;
	Thu,  5 Oct 2023 19:06:32 +0000 (GMT)
Received: from [9.61.60.170] (unknown [9.61.60.170])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Oct 2023 19:06:32 +0000 (GMT)
Message-ID: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
Date: Thu, 5 Oct 2023 14:06:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
From: Eddie James <eajames@linux.ibm.com>
Subject: KUEP broken on FSP2?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VQPzMYzHUX3QyvdOJaQn1eEb_gdy11Pe
X-Proofpoint-ORIG-GUID: VQPzMYzHUX3QyvdOJaQn1eEb_gdy11Pe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_13,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1011 mlxlogscore=481 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310050143
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
Cc: paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I'm attempting to run linux 6.1 on my FSP2, but my kernel crashes 
attempting to get into userspace. The init script works, but the first 
binary (mount) I run results in oops. Can anyone help me to debug this 
further or suggest anything?


Thanks,

Eddie


[    1.042743] kernel tried to execute user page (b7ee2000) - exploit 
attempt? (
uid: 0)
[    1.042846] BUG: Unable to handle kernel instruction fetch
[    1.042919] Faulting instruction address: 0xb7ee2000
[    1.042986] Oops: Kernel access of bad area, sig: 11 [#1]
[    1.043059] BE PAGE_SIZE=4K FSP-2
[    1.043106] Modules linked in:
[    1.043149] CPU: 0 PID: 61 Comm: mount Not tainted 
6.1.55-d23900f.ppcnf-fsp2
#1
[    1.043249] Hardware name: ibm,fsp2 476fpe 0x7ff520c0 FSP-2
[    1.043323] NIP:  b7ee2000 LR: 8c008000 CTR: 00000000
[    1.043392] REGS: bffebd83 TRAP: 0400   Not tainted 
(6.1.55-d23900f.ppcnf-fs
p2)
[    1.043491] MSR:  00000030 <IR,DR>  CR: 00001000  XER: 20000000
[    1.043579]
[    1.043579] GPR00: c00110ac bffebe63 bffebe7e bffebe88 8c008000 
00001000 0000
0d12 b7ee2000
[    1.043579] GPR08: 00000033 00000000 00000000 c139df10 48224824 
1016c314 1016
0000 00000000
[    1.043579] GPR16: 10160000 10160000 00000008 00000000 10160000 
00000000 1016
0000 1017f5b0
[    1.043579] GPR24: 1017fa50 1017f4f0 1017fa50 1017f740 1017f630 
00000000 0000
0000 1017f4f0
[    1.044101] NIP [b7ee2000] 0xb7ee2000
[    1.044153] LR [8c008000] 0x8c008000
[    1.044204] Call Trace:
[    1.044238] Instruction dump:
[    1.044279] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
XXXXXXXX XX
XXXXXX
[    1.044392] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
XXXXXXXX XX
XXXXXX
[    1.044506] ---[ end trace 0000000000000000 ]---
[    1.044568]
[    1.044590] note: mount[61] exited with irqs disabled

