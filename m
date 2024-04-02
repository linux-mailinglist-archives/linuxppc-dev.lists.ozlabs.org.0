Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0180F894908
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 03:54:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gyURA9cx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7rY763gyz3dVx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 12:54:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gyURA9cx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7rXN6tR5z3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 12:54:12 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4321W6qG022031;
	Tue, 2 Apr 2024 01:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LzMPa98MFPXqWkXtzv4lwoW5+7xQOJKo67nN9boqKto=;
 b=gyURA9cxnxueeLYMr1gQb1EJ9YCsO3vl8mpKyMDwSWyJjrcuk1Ej20hdgfHORTfgYzow
 XbMlTFwvgXlOA07HkNoSidWiqmt2EOCW/uq25HqD/JCU9YEGHEMUVhdYbSOqmFfPw2X7
 HKejbrfv1tv7elkcm3VTSXg+spCNzUWTvNmpkrR086XLdB0XiYTTgw1q5aZsOYy0059Y
 OSNCSHBERy0eLZMrHjZSMXaHOyJAB2Gftr5seKCFixeZoEq74RjzxyCDdsNZ/nTxzPuF
 a6fpAYS8xVRBYkbMYyHvDW9TTBP0A1UUGTFr0HwVInyNXK/w5haetL5S36EEZYHFL8CA /g== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x88ef80xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 01:54:00 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4321nRRf015293;
	Tue, 2 Apr 2024 01:54:00 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x6y9kucg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 01:53:59 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4321ruOq31523538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Apr 2024 01:53:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3139E20040;
	Tue,  2 Apr 2024 01:53:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B472020043;
	Tue,  2 Apr 2024 01:53:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Apr 2024 01:53:55 +0000 (GMT)
Received: from [10.61.2.106] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8EB426009D;
	Tue,  2 Apr 2024 12:53:50 +1100 (AEDT)
Message-ID: <92fe8355-233c-4d73-a81a-08e7c6fc571e@linux.ibm.com>
Date: Tue, 2 Apr 2024 12:53:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add static_key_feature_checks_initialized flag
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20240327045911.64543-1-nicholas@linux.ibm.com>
 <65caab3e-8618-4045-8bb9-75a2548d7cd7@csgroup.eu>
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
In-Reply-To: <65caab3e-8618-4045-8bb9-75a2548d7cd7@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jz99gdvvGoJiz07ndX6dzoZVx4EGxZ1N
X-Proofpoint-ORIG-GUID: jz99gdvvGoJiz07ndX6dzoZVx4EGxZ1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_18,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404020012
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 28/3/2024 2:20 am, Christophe Leroy wrote:
> 
> 
> Le 27/03/2024 à 05:59, Nicholas Miehlbradt a écrit :
>> JUMP_LABEL_FEATURE_CHECK_DEBUG used static_key_initialized to determine
>> whether {cpu,mmu}_has_feature() was used before static keys were
>> initialized. However, {cpu,mmu}_has_feature() should not be used before
>> setup_feature_keys() is called. As static_key_initalized is set much
>> earlier during boot there is a window in which JUMP_LABEL_FEATURE_CHECK_DEBUG
>> will not report errors. Add a flag specifically to indicate when
>> {cpu,mmu}_has_feature() is safe to use.
> 
> What do you mean by "much earlier" ?
> 
> As far as I can see, static_key_initialized is set by jump_label_init()
> as cpu_feature_keys_init() and mmu_feature_keys_init() are call
> immediately after. I don't think it is possible to do anything inbetween.
> 
> Or maybe you mean the problem is the call to jump_label_init() in
> early_init_devtree() ? You should make it explicit in the message, and
> see if it wouldn't be better to call cpu_feature_keys_init() and
> mmu_feature_keys_init() as well in early_init_devtree() in that case ?
> 
The jump_label_init() call in early_init_devtree() is exactly the issue. 
I don't think it's possible to move the call to mmu_feature_keys_init() 
earlier without significant refactoring since mmu features are being set 
as late as setup_kup().

I'll still sent a v2 with a better worded commit message.

Nicholas

> Christophe
