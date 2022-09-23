Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE15E7F2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYxfg4tWFz3dpc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 01:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bp3bcAFU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bp3bcAFU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYxdy3pX6z3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 01:58:45 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NF2tmR016608;
	Fri, 23 Sep 2022 15:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=FsBCcJas74CxYs/IS4zHTgpISVSDZp2/LeMa0RYqubA=;
 b=bp3bcAFUI0EzWv071v+W4zoL4IUWfhGPWZQT4MwEwjDBYZxFJPEli7M8oR10Mi/nubY6
 +c9tXd86kwaYv329W5iL06iWpnf0hndGZkEnSjPs08qXp6+PmC3SAauudWK47VoJ/maS
 uTb1EhD7t2F5laAIjsa/6f4F+z2P/cmeFcgEvDaeLMNDrc6s0KhF1qUrmxITo8a4zRRY
 pvCJ+NQrGWMv0/iGZcRIJvsGuNiLD4VAWs+tgYFX3Zy2cvG44f4/xdVRt+XyuX+mojCw
 JJGKra0BuThlCYXcdJxq0AJ0dzz0LJy9PvpZTMIl3GeUcerJEwwQeAaivexdemSBh9Ug xg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3js8nep5ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 15:58:36 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28NFqXoA007289;
	Fri, 23 Sep 2022 15:58:35 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma04dal.us.ibm.com with ESMTP id 3jn5vajp8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 15:58:35 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28NFwYlk4522692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Sep 2022 15:58:34 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04E2258059;
	Fri, 23 Sep 2022 15:58:34 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEE2858053;
	Fri, 23 Sep 2022 15:58:33 +0000 (GMT)
Received: from localhost (unknown [9.211.104.104])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Sep 2022 15:58:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 1/2] powerpc/pseries: block untrusted device tree
 changes when locked down
In-Reply-To: <CAHC9VhQG_jEh_H8pV-qJgX2oX_fyGjXoBV7_EJOgvOd4ndc+Xw@mail.gmail.com>
References: <20220922193817.106041-1-nathanl@linux.ibm.com>
 <20220922193817.106041-2-nathanl@linux.ibm.com>
 <CAHC9VhQG_jEh_H8pV-qJgX2oX_fyGjXoBV7_EJOgvOd4ndc+Xw@mail.gmail.com>
Date: Fri, 23 Sep 2022 10:58:33 -0500
Message-ID: <875yheqdzq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PKz65p7FSPUnU9jDiIkaJSyQ69VbztD8
X-Proofpoint-ORIG-GUID: PKz65p7FSPUnU9jDiIkaJSyQ69VbztD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230101
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
Cc: ajd@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, jmorris@namei.org, linux-security-module@vger.kernel.org, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Moore <paul@paul-moore.com> writes:
>> diff --git a/include/linux/security.h b/include/linux/security.h
>> index 7bd0c490703d..1ca8dbacd3cc 100644
>> --- a/include/linux/security.h
>> +++ b/include/linux/security.h
>> @@ -122,6 +122,7 @@ enum lockdown_reason {
>>         LOCKDOWN_XMON_WR,
>>         LOCKDOWN_BPF_WRITE_USER,
>>         LOCKDOWN_DBG_WRITE_KERNEL,
>> +       LOCKDOWN_DEVICE_TREE,
>
> I would suggest moving LOCKDOWN_DEVICE_TREE to be next to
> LOCKDOWN_ACPI_TABLES.  It's not a hard requirement, but it seems like
> a nice idea to group similar things when we can.
>
>>         LOCKDOWN_INTEGRITY_MAX,
>>         LOCKDOWN_KCORE,
>>         LOCKDOWN_KPROBES,
>> diff --git a/security/security.c b/security/security.c
>> index 4b95de24bc8d..2863fc31eec6 100644
>> --- a/security/security.c
>> +++ b/security/security.c
>> @@ -60,6 +60,7 @@ const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
>>         [LOCKDOWN_XMON_WR] = "xmon write access",
>>         [LOCKDOWN_BPF_WRITE_USER] = "use of bpf to write user RAM",
>>         [LOCKDOWN_DBG_WRITE_KERNEL] = "use of kgdb/kdb to write kernel RAM",
>> +       [LOCKDOWN_DEVICE_TREE] = "modifying device tree contents",
>
> Might as well move this one too.

Yes, I can do that for v2. Thanks.
