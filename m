Return-Path: <linuxppc-dev+bounces-6154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F30A34464
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 16:04:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ytz3h1FTKz30PF;
	Fri, 14 Feb 2025 02:04:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739459056;
	cv=none; b=gGGi28380PB8ZxAJ5nNzY2PfEp6LQ4JgpavGsOippmLAvx75DqR0weEuxx7ThOxmSn27gi77uCi45lnPeA/WnEuTWLq0Uku+OAn+8kt/1wEfGrjPzjlQPORSrCaOzzx4IO97rQnrVKUa1RhiLmlPgKqifAacs09SQwPwF48YubGfNvFSq8p8sdPn/ugefBaRQeT8WVSAlqBjoTTPv3abaWhJcZm435ogBAGuUpHaodby1B6qtm5K3enZ+2ID71tmgCCEyGAnduEFYNugmYVbmzPAK3Hcbkl+vpE5PwBX4YymZkuDc6VLvGB7HZwjFKYozf4Yes0vSi9viEtxtvwXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739459056; c=relaxed/relaxed;
	bh=9sn/0W+u2m5UU6jPKFLpLTgarS3MTBh1n7M7FWMc4JM=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=kWe6gWRZC0Sz93p4n1n0+mQJrFhN8s4hoCbh5QCrz8fmyPKH0urXfibVDURO2rhi+93V7RsuujZ+Fez2wvUvFFw9ZOueg8SX4xE4ENS3Jvli3SUneMo+DiVzZV3kwBPgFJVAxaJXwIfi4u4ch83kUO/WYtNyjHPCdpWaEVzzYb0UPz4OqV0eUwC5CWmKRE9ctOpB+Y7hGdeyjX21IYeRV1drH23bQSxt/L3SxuiW4W+1UEsCwF6BmT/NZmy8NWbg1xfDkFWc8QAri0U44fOsNvLPK8lLFdtzhBGiE6fxM3rtq5LPqDLAMRvp2dOFPKiuUaICx2SoprXIRzItaiBG5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y1R5GFSp; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y1R5GFSp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ytz3g1qqmz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 02:04:14 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D7WxUo014718;
	Thu, 13 Feb 2025 15:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=9sn/0W+u2m5UU6jPKFLpLTgarS3M
	TBh1n7M7FWMc4JM=; b=Y1R5GFSpjSwCdLCgzTuSSf6NVJzjllcJ/1+7VftuvxZP
	UvJUPSvOYkESaRidAKys+BO1JhnHQVP8uZDcm+jckRGLIrZETwYcHXt60pcR1XSs
	wMe/Z8lDeM5bwlMr0fyCAEjkj/M7APcKTB9P8FNrHO2Ehb0Eigg6QqBQ/AN9Xuny
	VTJpM5Zv13gCruWzCVyAuJ/myD8YbZ97c8fmsMzSKRQjKH+GjEG1A7eL6Lr8zlwq
	M2co3RNMXufbZjnZjVVfZKzvtAnKNvz+116mvuOTO/kOJigqVxzhNgEslzzbqn8U
	bQBaECZoI1l0DT2iGXofAPLRCbC15/NiSxJgcRLoJA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44sceq27xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 15:04:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51DDxMjh028716;
	Thu, 13 Feb 2025 15:04:11 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pma1xbm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 15:04:11 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51DF49me19071714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 15:04:10 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 976D858058;
	Thu, 13 Feb 2025 15:04:09 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 915BB58057;
	Thu, 13 Feb 2025 15:04:08 +0000 (GMT)
Received: from [9.61.255.185] (unknown [9.61.255.185])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Feb 2025 15:04:08 +0000 (GMT)
Message-ID: <8e73069b-5987-4a08-b13d-13fe691092ad@linux.vnet.ibm.com>
Date: Thu, 13 Feb 2025 20:34:07 +0530
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
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [linux-next-20250212] syscall kexec_file_load not available
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ax8z4eh8gHPKYoV9oViK3KDvDxpM0D-S
X-Proofpoint-ORIG-GUID: ax8z4eh8gHPKYoV9oViK3KDvDxpM0D-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxlogscore=514
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130112
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Greetings!!!

 From kernel next-20250210, I am observing syscall kexec_file_load not 
available, there by kdump service is failing to start.


Logs:

[root@ltc-zzci-1 ~]# kexec -p 
--initrd=/boot/initramfs-6.14.0-rc2-next-20250212kdump.img 
/boot/vmlinuz-6.14.0-rc2-next-20250212 -c
Warning: append= option is not passed. Using the first kernel root partition
Modified cmdline: elfcorehdr=311424K 
root=UUID=b5b1f89c-d479-48b3-90e2-744a2fd05667
[root@ltc-zzci-1 ~]# kexec -p 
--initrd=/boot/initramfs-6.14.0-rc2-next-20250212kdump.img 
/boot/vmlinuz-6.14.0-rc2-next-20250212 -s
syscall kexec_file_load not available.
[root@ltc-zzci-1 ~]# kexec -v
kexec-tools 2.0.27
[root@ltc-zzci-1 ~]# uname -r
6.14.0-rc2-next-20250212


Regards,

Venkat.


