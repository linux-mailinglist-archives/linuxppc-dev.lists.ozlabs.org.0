Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B473FF0DFF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 05:49:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477DbK2HFPzF5PM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 15:49:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477DYZ5P4SzF1Yv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 15:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 477DYZ1BB0z8snv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 15:48:02 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 477DYZ0mCBz9sPn; Wed,  6 Nov 2019 15:48:02 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 477DYY1fsSz9sPF
 for <linuxppc-dev@ozlabs.org>; Wed,  6 Nov 2019 15:47:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA64l0DA015295; Tue, 5 Nov 2019 23:47:56 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3hhmsd7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 23:47:56 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA64ii7S032519;
 Wed, 6 Nov 2019 04:47:54 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 2w11e7ccp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 04:47:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA64lrOa32965076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Nov 2019 04:47:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 667A67805F;
 Wed,  6 Nov 2019 04:47:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D44878063;
 Wed,  6 Nov 2019 04:47:52 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.85.194.118])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 Nov 2019 04:47:52 +0000 (GMT)
Subject: Re: [RFC PATCH] powerpc/pseries/mobility: notify network peers after
 migration
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@ozlabs.org
References: <1572998794-9392-1-git-send-email-tlfalcon@linux.ibm.com>
 <b42f1dbdba88f74149de669cb285408d640cdb79.camel@russell.cc>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <15e84597-7b5a-1269-f1b8-753268e90741@linux.ibm.com>
Date: Tue, 5 Nov 2019 22:47:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b42f1dbdba88f74149de669cb285408d640cdb79.camel@russell.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911060050
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
Cc: nathanl@linux.ibm.com, netdev@vger.kernel.org, msuchanek@suse.com,
 tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/5/19 10:13 PM, Russell Currey wrote:
> On Tue, 2019-11-05 at 18:06 -0600, Thomas Falcon wrote:
>> After a migration, it is necessary to send a gratuitous ARP
>> from all running interfaces so that the rest of the network
>> is aware of its new location. However, some supported network
>> devices are unaware that they have been migrated. To avoid network
>> interruptions and other unwanted behavior, force a GARP on all
>> valid, running interfaces as part of the post_mobility_fixup
>> routine.
>>
>> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
> Hi Thomas,
>
>> ---
>>   arch/powerpc/platforms/pseries/mobility.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c
>> b/arch/powerpc/platforms/pseries/mobility.c
>> index b571285f6c14..c1abc14cf2bb 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -17,6 +17,9 @@
>>   #include <linux/delay.h>
>>   #include <linux/slab.h>
>>   #include <linux/stringify.h>
>> +#include <linux/netdevice.h>
>> +#include <linux/rtnetlink.h>
>> +#include <net/net_namespace.h>
>>   
>>   #include <asm/machdep.h>
>>   #include <asm/rtas.h>
>> @@ -331,6 +334,8 @@ void post_mobility_fixup(void)
>>   {
>>   	int rc;
>>   	int activate_fw_token;
>> +	struct net_device *netdev;
>> +	struct net *net;
>>   
>>   	activate_fw_token = rtas_token("ibm,activate-firmware");
>>   	if (activate_fw_token == RTAS_UNKNOWN_SERVICE) {
>> @@ -371,6 +376,21 @@ void post_mobility_fixup(void)
>>   	/* Possibly switch to a new RFI flush type */
>>   	pseries_setup_rfi_flush();
>>   
>> +	/* need to force a gratuitous ARP on running interfaces */
>> +	rtnl_lock();
>> +	for_each_net(net) {
>> +		for_each_netdev(net, netdev) {
>> +			if (netif_device_present(netdev) &&
>> +			    netif_running(netdev) &&
>> +			    !(netdev->flags & (IFF_NOARP |
>> IFF_LOOPBACK)))
>> +				call_netdevice_notifiers(NETDEV_NOTIFY_
>> PEERS,
>> +							 netdev);
> Without curly braces following the "if" statment, the second line
> (below) will be executed unconditionally, which I assume with this
> indentation isn't what you want.
>
> (reported by snowpatch)
>
> - Russell

Thanks for catching that! I'll fix that and send a v2 soon.

Tom


>> +				call_netdevice_notifiers(NETDEV_RESEND_
>> IGMP,
>> +							 netdev);
>> +		}
>> +	}
>> +	rtnl_unlock();
>> +
>>   	return;
>>   }
>>   
