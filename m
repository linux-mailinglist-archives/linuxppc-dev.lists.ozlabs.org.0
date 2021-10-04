Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87642150D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 19:18:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNS9D59Hjz30Qr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 04:18:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KwqFRNvN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNS8T0xqZz2ymk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 04:17:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KwqFRNvN; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HNS8S1jZkz4xbR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 04:17:44 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HNS8S1YmSz4xbQ; Tue,  5 Oct 2021 04:17:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KwqFRNvN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HNS8R5bkVz4xb9;
 Tue,  5 Oct 2021 04:17:43 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194H9F86018107; 
 Mon, 4 Oct 2021 13:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/LzhN2nc0xTevZq3pJNKQOS2fL9eKp7W5kcCVhO3PtQ=;
 b=KwqFRNvNdtWUGpisPTA1kiWL2o++QfFdYEyZT2dqwGvi7HOqT6M/1bxijD2eGo/b/2S0
 xIKYEMaL7LuOIYf7RrxmmG7+h9DxshokTYmqCWJNBI/yp3iHxgOIzIYvmyW+CSrCrsUM
 xKx63838L8V+dxhgsBucIXWI2uws9YkfrYKrwTE+nf13vZmmXmjBktUUzPwpFaDq1xWZ
 3ZqtY5jaTz8ZWEUi5/lzI48MFp8w92EWHB+sc2EJGpeimd9bgoSZOHr0A8Op05eqFsW/
 2MKYNec0eJzceGBcq+CAAuexqZBpOaYUJK57wGalDwAofb4cn6rfxl5btzV4fbzGqzu7 Mw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg5rm046m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 13:17:40 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194HC2GF031066;
 Mon, 4 Oct 2021 17:17:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3bef29gg5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 17:17:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194HHYuZ15466942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 17:17:34 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74DD611C05B;
 Mon,  4 Oct 2021 17:17:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9E5111C04A;
 Mon,  4 Oct 2021 17:17:27 +0000 (GMT)
Received: from [9.43.74.5] (unknown [9.43.74.5])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 17:17:27 +0000 (GMT)
Message-ID: <496a0ddb-ec5d-e043-7045-779316cf9c56@linux.ibm.com>
Date: Mon, 4 Oct 2021 22:47:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/3] powerpc: Set crashkernel offset to mid of RMA region
Content-Language: en-US
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
References: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
 <20211004151142.256251-4-sourabhjain@linux.ibm.com>
 <f13e218e-4e38-4076-672f-d555d7abfc02@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <f13e218e-4e38-4076-672f-d555d7abfc02@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1kMUUUP74enlfqKdjWM-HOqkw46Cx7Fo
X-Proofpoint-GUID: 1kMUUUP74enlfqKdjWM-HOqkw46Cx7Fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 mlxlogscore=902
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040113
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
Cc: Abdul haleem <abdhalee@linux.vnet.ibm.com>, mahesh@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, hbathini@linux.ibm.com, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Aneesh,

@@ -1235,6 +1235,9 @@ int __init early_init_dt_scan_rtas(unsigned long 
node,
>>       entryp = of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
>>       sizep  = of_get_flat_dt_prop(node, "rtas-size", NULL);
>>   +    if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
>> +        powerpc_firmware_features |= FW_FEATURE_LPAR;
>> +
>
> The equivalent check that we currently do more than checking 
> ibm,hypertas-functions.
>
>     if (!strcmp(uname, "rtas") || !strcmp(uname, "rtas@0")) {
>         prop = of_get_flat_dt_prop(node, "ibm,hypertas-functions",
>                        &len);
>         if (prop) {
>             powerpc_firmware_features |= FW_FEATURE_LPAR;
>             fw_hypertas_feature_init(prop, len);
> }
>
If ibm,hypertas-functions prop has to be part of rtas or rtas@0 node to 
decide we are on LPAR then how about splitting the probe_fw_features 
functions into two functions, one to detect FW_FEATURE_LPAR and another 
function to do the rest?
>
> also do we expect other firmware features to be set along with 
> FW_FEATURE_LPAR?


No only FW_FEATURE_LPAR feature so that kernel can decide the 
crashkernel offset accordingly.


Thanks for the review.

- Sourabh Jain

