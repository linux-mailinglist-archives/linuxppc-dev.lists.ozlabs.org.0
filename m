Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050B5203C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 03:04:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XnxC4zxMzDqTm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 11:04:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=julietk@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Xnv36vdFzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 11:02:23 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P0qTl8087719
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 21:02:20 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tb5aksf4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 21:02:20 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5P11YFj032375
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 01:02:19 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 2t9by6kunb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 01:02:19 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5P12HA958523916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 01:02:17 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B857B6E05B;
 Tue, 25 Jun 2019 01:02:17 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0FB46E056;
 Tue, 25 Jun 2019 01:02:16 +0000 (GMT)
Received: from Juliets-MacBook-Pro.local (unknown [9.80.219.73])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 25 Jun 2019 01:02:16 +0000 (GMT)
Subject: Re: [PATCH] powerpc/rtas: retry when cpu offline races with
 suspend/migration
To: Nathan Lynch <nathanl@linux.ibm.com>, mmc <mmc@linux.vnet.ibm.com>
References: <20190621060518.29616-1-nathanl@linux.ibm.com>
 <f3b54ef4394bdbf4887d2185bb951c80@linux.vnet.ibm.com>
 <87h88eucbn.fsf@linux.ibm.com>
From: Juliet Kim <julietk@linux.vnet.ibm.com>
Message-ID: <5a825cec-234a-ee8a-a776-8ba305f9cb26@linux.vnet.ibm.com>
Date: Mon, 24 Jun 2019 20:02:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87h88eucbn.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250004
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
Cc: ego@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 julietk@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's some concern this could retry forever, resulting in live lock.  
Another approach would be to abandon the attempt and fail the LPM 
request. 
https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-June/192531.html

On 6/24/19 12:23 PM, Nathan Lynch wrote:
> Hi Mingming,
>
> mmc <mmc@linux.vnet.ibm.com> writes:
>> On 2019-06-21 00:05, Nathan Lynch wrote:
>>> So return -EAGAIN instead of -EBUSY when this race is
>>> encountered. Additionally: logging this event is still appropriate but
>>> use pr_info instead of pr_err; and remove use of unlikely() while here
>>> as this is not a hot path at all.
>> Looks good, since it's not a hot path anyway, so unlikely() should
>> benefit from optimize compiler path, and should stay. No?
> The latency of this path in rtas_ibm_suspend_me() in the best case is
> around 2-3 seconds.
>
> So I think not -- this is such a heavyweight and relatively
> seldom-executed path that the unlikely() cannot yield any discernible
> performance benefit, and its presence imposes a readability cost.
