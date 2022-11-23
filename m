Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00D6369EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 20:33:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHWWf5HjRz3chn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 06:33:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S6yHipUk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnac123@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S6yHipUk;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHWVg5Lmzz2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 06:32:43 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ANJDMLm014359
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 19:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=v1y4CJRgzDNKx37bTX+klI9/mH53byRTQ1pD38AVuRU=;
 b=S6yHipUkyH9mehJW+6NMUUfg38KLgh/pNL3Tj8nWlvXl23i3BF97PYXOj0odUW0Obp2u
 8kbAfYe3cp0kzvbxdhcyXt40IE4itKdMn0XnzuBpLcZSL3tf1LmEZDlxEpRuvpH/rm0t
 MwtThtaG0TEsEpUiNRCbZ8Q1yXYEYuMjJbFOGvOQy+Opfc79dNXrQJRTUGjD2USLvrQV
 2x/Ow3rY4ZKrhSnAgoHzwrHCAV/ESDxdla8zU0mYPE2iwNEUGrqTU7VvCnfHgF1AeqFR
 yQkO9AkcO5h3kNw3SX0aJ6/oVKfW86Cr+T59VtiAi4fok1mYVmwpeCawt058Xl0/cRpH wA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10pgfh4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 19:32:40 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ANJRfn5011083
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 19:32:39 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10pgfh43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 19:32:39 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ANJL7XJ030326;
	Wed, 23 Nov 2022 19:32:38 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma04wdc.us.ibm.com with ESMTP id 3kxps9muwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 19:32:38 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ANJWg6C54854048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Nov 2022 19:32:42 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AC4C58052;
	Wed, 23 Nov 2022 19:32:37 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 648EB5805D;
	Wed, 23 Nov 2022 19:32:36 +0000 (GMT)
Received: from [9.160.73.107] (unknown [9.160.73.107])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Nov 2022 19:32:36 +0000 (GMT)
Message-ID: <c183a039-2001-eb3a-7028-f8a0813987cf@linux.ibm.com>
Date: Wed, 23 Nov 2022 13:32:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 10/13] powerpc/rtas: improve function information lookups
To: Andrew Donnellan <ajd@linux.ibm.com>,
        Nathan Lynch
 <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-11-nathanl@linux.ibm.com>
 <5b4c4316bfe88a3f231ffe416ce34192189549db.camel@linux.ibm.com>
Content-Language: en-US
From: Nick Child <nnac123@linux.ibm.com>
In-Reply-To: <5b4c4316bfe88a3f231ffe416ce34192189549db.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Du-ZjJuuInpgWArCbWE06M_04rK_Lrdv
X-Proofpoint-GUID: el-JTb8wxEfVvg4eZC7Lq4heRAr73Y9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_11,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 mlxlogscore=697 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211230144
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/22/22 20:51, Andrew Donnellan wrote:
> On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
>> +enum rtas_function_flags {
>> +       RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE = (1 << 0),
>> +};
> 
> This seems to be new, what's the justification?
> 

Seems to be a run-time replacement of:
#ifdef CONFIG_CPU_BIG_ENDIAN
	{ "ibm,suspend-me", -1, -1, -1, -1, -1 },
	{ "ibm,update-nodes", -1, 0, -1, -1, -1, 4096 },
	{ "ibm,update-properties", -1, 0, -1, -1, -1, 4096 },
#endif

It looks to be handled logically:
+ if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) &&
+	    (func->flags & RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE))
+		goto err;

Perhaps, also allow the addition of any future special cases
for rtas functions easier to maintain?
