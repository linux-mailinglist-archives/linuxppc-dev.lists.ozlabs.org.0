Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 139D683427
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 16:43:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462y7D4RYrzDr3Y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 00:43:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tlfalcon@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462y4j5BxmzDqsw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 00:41:24 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x76EcTrh080314
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Aug 2019 10:41:20 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u7a2ncmba-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 10:41:19 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tlfalcon@linux.ibm.com>;
 Tue, 6 Aug 2019 15:41:19 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 6 Aug 2019 15:41:17 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x76EfGYD16056630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Aug 2019 14:41:16 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E14D11206E;
 Tue,  6 Aug 2019 14:41:16 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E54A112063;
 Tue,  6 Aug 2019 14:41:16 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.80.202.176])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  6 Aug 2019 14:41:16 +0000 (GMT)
Subject: Re: [PATCH net-next] ibmveth: Allow users to update reported speed
 and duplex
To: Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org
References: <1565033086-21778-1-git-send-email-tlfalcon@linux.ibm.com>
 <87zhkmvbec.fsf@concordia.ellerman.id.au>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Date: Tue, 6 Aug 2019 09:41:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87zhkmvbec.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19080614-0064-0000-0000-000004065285
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011559; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01242935; UDB=6.00655639; IPR=6.01024399; 
 MB=3.00028065; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-06 14:41:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080614-0065-0000-0000-00003E91A915
Message-Id: <071fe53c-0e89-d221-16be-80d916d3e712@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-06_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060148
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/6/19 5:25 AM, Michael Ellerman wrote:
> Thomas Falcon <tlfalcon@linux.ibm.com> writes:
>> Reported ethtool link settings for the ibmveth driver are currently
>> hardcoded and no longer reflect the actual capabilities of supported
>> hardware. There is no interface designed for retrieving this information
>> from device firmware nor is there any way to update current settings
>> to reflect observed or expected link speeds.
>>
>> To avoid confusion, initially define speed and duplex as unknown and
> Doesn't that risk break existing setups?


You're right, sorry for missing that.


>
>> allow the user to alter these settings to match the expected
>> capabilities of underlying hardware if needed. This update would allow
>> the use of configurations that rely on certain link speed settings,
>> such as LACP. This patch is based on the implementation in virtio_net.
> Wouldn't it be safer to keep the current values as the default, and then
> also allow them to be overridden by a motivated user.

That is a good compromise.  I will resend an updated version soon with 
that change.

Thanks!


>
> cheers
>

