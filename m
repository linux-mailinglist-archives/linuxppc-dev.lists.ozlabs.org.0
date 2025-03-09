Return-Path: <linuxppc-dev+bounces-6829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D943CA58414
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Mar 2025 13:38:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z9fhW5rB3z2yVT;
	Sun,  9 Mar 2025 23:38:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741523915;
	cv=none; b=em/HfEJTkOlAbbJ4CcRK/ZAz02EJMMhw833NO1YOLKpfgvPihZqHIP9xLqOYxev5QtNCT5vygAdlbZUvEXH3HL8FApQp3c5rKBEK2Z/a6vZ3/gPVoUAWmancBt6dmJF5FHv/XN5Cea/yz9PsjoEWy54QRhbN6bZoKR8TlKAMBIBHZUK3POpnG6sJu1ogafnOyO5a9U1AKpHOliR6aCvUtzC4Oe2iBbVAiZiuDik+BLm2dhXS1QtEhYMaTq6C/Y0LyMkXwH9b/qjSuNKizaNnAUsrXhzSrVSgkyRxMbjxS/KTaV+mCQZlVz8XK+4k1LV5fWkiPrkIw2vXmB4AI7tQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741523915; c=relaxed/relaxed;
	bh=z25u1C5IboR8ljLK34Hmmh2M2r05ibUTuM8VlpKwCyI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=cP2zmlFE4ZPfY4vZ8qnx8V/iOtctJ8j5ME0ZyaZTh9D8MMqVIouxUWrKFa93YO1Jxv6HbYnqkXQukgay4/ICqJ3o3TCldp+VsUptgHjzASBzCRZMGtbEioFKkyld/DbeZUSaUDV26RF0rZwFCsKoMQuNvvwWhKAEyffGkckZE6reoIT6MJBpwfK1jc2tfAroNTVtzXwKzOp3juvDt5orM7qJc2YdLOI9sZyF7NuoANd4pmuPd/D2YoN01zWin/TgL6myRKpVmPLkWUEedNCbRrYhcyiXHnklS4ZaZU9dM0mLz93KEmiRZJdOcsOvXBqbgs+ltn+t2RT2rjmDf2iVNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=esymyqcV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=esymyqcV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z9fhT6xb9z2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Mar 2025 23:38:33 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529BhLlW007842;
	Sun, 9 Mar 2025 12:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=z25u1C5IboR8ljLK34Hmmh2M2r05
	ibUTuM8VlpKwCyI=; b=esymyqcVSn1f6sCXHool+WBm5UIVWJi1eSHnUPUs/jnO
	k+dTF0pWL4AOxhhg/UIF1ZQ6OuhWdLsGB8BnKQghmyN81rKTqnypEtEqzA0GB/3m
	/uuRviDeoSLo9GWB77XVdne7rJhGowpYGM6OTJs7iT6UjThIdN2fz67Q1CgKDM0w
	NjTZiHeiLEtwmn2/73bh2COMz3+WdAHpCVhXGcw7lQtz/mLwA4xj4cFJNiSrtxZN
	x6Qc/AHzhSCMPMX1F8WV+pYe5RUBTqivEe4moyc8ojzAW09c7IY6rWXv+v7Ei2r0
	kYdKp7145T2T1H0CyR5Ir11BT0EL/MA6GV/PE8ZCuA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 458wa4j250-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 12:38:20 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5299cF9X006991;
	Sun, 9 Mar 2025 12:38:19 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45907st85j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 12:38:19 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 529CcJ0p23790280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Mar 2025 12:38:19 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E3235805D;
	Sun,  9 Mar 2025 12:38:19 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 782AA58052;
	Sun,  9 Mar 2025 12:38:17 +0000 (GMT)
Received: from [9.61.254.32] (unknown [9.61.254.32])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Mar 2025 12:38:17 +0000 (GMT)
Message-ID: <70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com>
Date: Sun, 9 Mar 2025 18:08:16 +0530
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
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [linux-next-20250307] Build Failure
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y3GgWXzXuzgdO767rWyEK9Pzx6fEmJNT
X-Proofpoint-ORIG-GUID: y3GgWXzXuzgdO767rWyEK9Pzx6fEmJNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=689 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503090100
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Greetings!!,

I see linux-next-20250307 fails to build on IBM Power9 and Power10 servers.


Errors:

In file included from ^[[01m^[[K<command-line>^[[m^[[K:
^[[01m^[[K./usr/include/cxl/features.h:11:10:^[[m^[[K ^[[01;31m^[[Kfatal 
error: ^[[m^[[Kuuid/uuid.h: No such file or directory
    11 | #include ^[[01;31m^[[K<uuid/uuid.h>^[[m^[[K
       |          ^[[01;31m^[[K^~~~~~~~~~~~~^[[m^[[K
compilation terminated.
make[4]: *** [usr/include/Makefile:85: usr/include/cxl/features.hdrtest] 
Error 1
make[3]: *** [scripts/Makefile.build:461: usr/include] Error 2
make[2]: *** [scripts/Makefile.build:461: usr] Error 2
make[2]: *** Waiting for unfinished jobs....
arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: 
intra_function_call not a direct call
arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: 
unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: 
intra_function_call not a direct call
make[1]: *** [/home/linux_src/linux/Makefile:1997: .] Error 2
make: *** [Makefile:251: __sub-make] Error 2

Please add below tag, if you happen to fix this issue.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


