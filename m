Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532DB51BD87
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 12:53:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv9XD1YBqz3bZC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 20:53:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hltVOsJP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hltVOsJP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv9WW46Svz2xnM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 20:52:23 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245Akm1H025315;
 Thu, 5 May 2022 10:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EPriKUXIspvOLSAzegvScXZPeIzCcoCmJYNG3yQcbxI=;
 b=hltVOsJPgYXYcrvSXmsPhQi5IPBZhh7kqO+X9vUzBQLVAFrfPb9Ag4u+Z8QqlQMhfXgK
 bZF+JtzRDb+bSZvj1kId4//Nacb+1wm/WodN7K0ZdqY//GbGgAbo06HBjnRgxLMvWIbN
 rttApHzs44DYMHnyoB2wdXBXGwRFiwAiUubKwxCyZ/3gK8jAdgUIml5qpBfWSIFG2LWD
 w/dulXfj9hQL/sLPBegEUT5og67LafzhB3u2FWd+8KrQ2nWbTOeSnr8MvOUTsbIZeNd+
 Rq1Sw1hlPtXjxE2fMjnEPNg5Ta2k/LZ87foax85e1JXtDDfsF7VTC2ihceUfURBgJH8K 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvd4g832u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:52:17 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 245AmAd1029105;
 Thu, 5 May 2022 10:52:16 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvd4g832b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:52:16 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245Am84E017746;
 Thu, 5 May 2022 10:52:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3fttcj2yek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:52:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245AqBUT47579392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 10:52:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1B974C050;
 Thu,  5 May 2022 10:52:11 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F12614C052;
 Thu,  5 May 2022 10:52:08 +0000 (GMT)
Received: from [9.43.125.84] (unknown [9.43.125.84])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 10:52:08 +0000 (GMT)
Message-ID: <43bedf08-b878-b5b2-80a5-059261f87f09@linux.ibm.com>
Date: Thu, 5 May 2022 16:22:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V2 0/2] Fix session topology test for powerpc and add
 utility function to get cpuinfo entries
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, disgoel@linux.vnet.ibm.com
References: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nhW00hGnAUUXcY5z77uryO-taF05TPpR
X-Proofpoint-ORIG-GUID: 9SLZg-tMNP_y2TVW8QYumYGhooGdtMkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050075
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/5/22 15:09, Athira Rajeev wrote:
> The session topology test fails in powerpc pSeries platform.
> Test logs:
> <<>>
> Session topology : FAILED!
> <<>>
> 
> This test uses cpu topology information and in powerpc,
> some of the topology info is restricted in environment
> like virtualized platform. Hence this test needs to be
> skipped in pSeries platform for powerpc. The information
> about platform is available in /proc/cpuinfo.
> 
> Patch 1 adds generic utility function in "util/header.c"
> to read /proc/cpuinfo for any entry. Though the testcase
> fix needs value from "platform" entry, making this as a
> generic function to return value for any entry from the
> /proc/cpuinfo file which can be used commonly in future
> usecases.
> 
> Patch 2 uses the newly added utility function to look for
> platform and skip the test in pSeries platform for powerpc.
> 
> Athira Rajeev (2):
>   tools/perf: Add utility function to read /proc/cpuinfo for any field
>   tools/perf/tests: Fix session topology test to skip the test in guest
>     environment

Hi Athira,
   Patchset looks good to me.

Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

Thanks,
Kajol Jain

> 
> Changelog:
>  V1 -> v2:
>  Addressed review comments from Kajol.
>  Use "strim" to remove space from string. Also
>  use "feof" to check for EOF instead of using new
>  variable "ret".
> 
>  tools/perf/tests/topology.c | 17 ++++++++++++
>  tools/perf/util/header.c    | 53 +++++++++++++++++++++++++++++++++++++
>  tools/perf/util/header.h    |  1 +
>  3 files changed, 71 insertions(+)
> 
