Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA658D82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 00:01:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZYlM1TcbzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 08:01:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZYhn036NzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 07:59:36 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5RLvD2O077537
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 17:59:31 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2td2gshc3n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 17:59:31 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <julietk@linux.vnet.ibm.com>;
 Thu, 27 Jun 2019 22:59:30 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 22:59:28 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5RLxRoR52232452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 21:59:27 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 748B7124055;
 Thu, 27 Jun 2019 21:59:27 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC564124054;
 Thu, 27 Jun 2019 21:59:26 +0000 (GMT)
Received: from Juliets-MacBook-Pro.local (unknown [9.85.141.228])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Jun 2019 21:59:26 +0000 (GMT)
Subject: Re: [PATCH] powerpc/rtas: retry when cpu offline races with
 suspend/migration
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>
References: <20190621060518.29616-1-nathanl@linux.ibm.com>
 <f3b54ef4394bdbf4887d2185bb951c80@linux.vnet.ibm.com>
 <87h88eucbn.fsf@linux.ibm.com>
 <5a825cec-234a-ee8a-a776-8ba305f9cb26@linux.vnet.ibm.com>
 <877e99ts5f.fsf@linux.ibm.com>
 <5614fafb-43c3-1dca-1853-51ff0940fb74@linux.vnet.ibm.com>
 <875zortydg.fsf@concordia.ellerman.id.au>
From: Juliet Kim <julietk@linux.vnet.ibm.com>
Date: Thu, 27 Jun 2019 16:59:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <875zortydg.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19062721-0060-0000-0000-00000356621C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011343; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01224184; UDB=6.00644296; IPR=6.01005372; 
 MB=3.00027497; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-27 21:59:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062721-0061-0000-0000-000049EE7945
Message-Id: <a079dc5c-9d48-370d-baed-d74eb9c4fd92@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270252
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


On 6/27/19 12:01 AM, Michael Ellerman wrote:
> Juliet Kim <julietk@linux.vnet.ibm.com> writes:
>> On 6/25/19 1:51 PM, Nathan Lynch wrote:
>>> Juliet Kim <julietk@linux.vnet.ibm.com> writes:
>>>
>>>> There's some concern this could retry forever, resulting in live lock.
>>> First of all the system will make progress in other areas even if there
>>> are repeated retries; we're not indefinitely holding locks or anything
>>> like that.
>> For instance, system admin runs a script that picks and offlines CPUs in a
>> loop to keep a certain rate of onlined CPUs for energy saving. If LPM keeps
>> putting CPUs back online, that would never finish, and would keepgenerating
>> new offline requests
>>
>>> Second, Linux checks the H_VASI_STATE result on every retry. If the
>>> platform wants to terminate the migration (say, if it imposes a
>>> timeout), Linux will abandon it when H_VASI_STATE fails to return
>>> H_VASI_SUSPENDING. And it seems incorrect to bail out before that
>>> happens, absent hard errors on the Linux side such as allocation
>>> failures.
>> I confirmed with the PHYP and HMC folks that they wouldn't time out the LPM
>> request including H_VASI_STATE, so if the LPM retries were unlucky enough to
>> encounter repeated CPU offline attempts (maybe some customer code retrying
>> that), then the retries could continue indefinitely, or until some manual
>> intervention.  And in the mean time, the LPM delay here would cause PHYP to
>> block other operations.
> That sounds like a PHYP bug to me.
>
> cheers


PHYP doesn’t time out because they have no idea how long it will take for OS to
get to the point that it suspends. Other OS allows application to prepare for LPM.
They cannot predict the length of time that is appropriate in all cases and in any
case, it’s unlikely they’d make a change to that would come in time to help with
the current issue.

