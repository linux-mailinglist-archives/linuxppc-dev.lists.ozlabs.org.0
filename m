Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20E573CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 23:41:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YxLh1Q72zDqW4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 07:41:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=julietk@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YxJx3R5wzDqT8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 07:40:16 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QLNJVX142456
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 17:40:12 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tcdn97kjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 17:40:12 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5QLdeuV024425
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 21:40:11 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 2t9by79vjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 21:40:11 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5QLeA9M61800950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 21:40:10 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDD71C6055;
 Wed, 26 Jun 2019 21:40:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C777C605A;
 Wed, 26 Jun 2019 21:40:09 +0000 (GMT)
Received: from juliets-mbp.austin.ibm.com (unknown [9.41.174.95])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 26 Jun 2019 21:40:09 +0000 (GMT)
Subject: Re: [PATCH] powerpc/rtas: retry when cpu offline races with
 suspend/migration
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20190621060518.29616-1-nathanl@linux.ibm.com>
 <f3b54ef4394bdbf4887d2185bb951c80@linux.vnet.ibm.com>
 <87h88eucbn.fsf@linux.ibm.com>
 <5a825cec-234a-ee8a-a776-8ba305f9cb26@linux.vnet.ibm.com>
 <877e99ts5f.fsf@linux.ibm.com>
From: Juliet Kim <julietk@linux.vnet.ibm.com>
Message-ID: <5614fafb-43c3-1dca-1853-51ff0940fb74@linux.vnet.ibm.com>
Date: Wed, 26 Jun 2019 16:40:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <877e99ts5f.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906260246
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
Cc: ego@linux.vnet.ibm.com, mmc <mmc@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/25/19 1:51 PM, Nathan Lynch wrote:
> Juliet Kim <julietk@linux.vnet.ibm.com> writes:
>
>> There's some concern this could retry forever, resulting in live lock.
> First of all the system will make progress in other areas even if there
> are repeated retries; we're not indefinitely holding locks or anything
> like that.

For instance, system admin runs a script that picks and offlines CPUs in a
loop to keep a certain rate of onlined CPUs for energy saving. If LPM keeps
putting CPUs back online, that would never finish, and would keepgenerating
new offline requests

> Second, Linux checks the H_VASI_STATE result on every retry. If the
> platform wants to terminate the migration (say, if it imposes a
> timeout), Linux will abandon it when H_VASI_STATE fails to return
> H_VASI_SUSPENDING. And it seems incorrect to bail out before that
> happens, absent hard errors on the Linux side such as allocation
> failures.
I confirmed with the PHYP and HMC folks that they wouldn't time out the LPM
request including H_VASI_STATE, so if the LPM retries were unlucky enough to
encounter repeated CPU offline attempts (maybe some customer code retrying
that), then the retries could continue indefinitely, or until some manual
intervention.  And in the mean time, the LPM delay here would cause PHYP to
block other operations.

