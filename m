Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CB99852
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 17:38:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dpb93PLDzDqW1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 01:38:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hegdevasant@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DpY519BSzDrRB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 01:36:40 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MFM53I047784
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 11:36:37 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uhw2c2cr4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 11:36:37 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hegdevasant@linux.vnet.ibm.com>;
 Thu, 22 Aug 2019 16:36:35 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 16:36:33 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7MFaWwL19529984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 15:36:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 227BC52050;
 Thu, 22 Aug 2019 15:36:32 +0000 (GMT)
Received: from [9.199.54.18] (unknown [9.199.54.18])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0F73B52052;
 Thu, 22 Aug 2019 15:36:30 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] powerpc/powernv: Enhance opal message read
 interface
To: "Oliver O'Halloran" <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190821081335.20103-1-hegdevasant@linux.vnet.ibm.com>
 <8446e4f922a140b9fcba60a37105a4090b7b1681.camel@gmail.com>
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Date: Thu, 22 Aug 2019 21:06:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8446e4f922a140b9fcba60a37105a4090b7b1681.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082215-0012-0000-0000-0000034192ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082215-0013-0000-0000-0000217BBEA8
Message-Id: <448acb2b-8ca1-329a-3070-285c692bbafa@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220151
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/22/19 11:21 AM, Oliver O'Halloran wrote:
> On Wed, 2019-08-21 at 13:43 +0530, Vasant Hegde wrote:
>> Use "opal-msg-size" device tree property to allocate memory for "opal_msg".
>>
>> Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
>> Cc: Jeremy Kerr <jk@ozlabs.org>
>> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
>> ---
>> Changes in v3:
>>    - Call BUG_ON, if we fail to allocate memory during init.
>>
>> -Vasant
>>
>>   arch/powerpc/platforms/powernv/opal.c | 29 ++++++++++++++++++---------
>>   1 file changed, 19 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
>> index aba443be7daa..4f1f68f568bf 100644
>> --- a/arch/powerpc/platforms/powernv/opal.c
>> +++ b/arch/powerpc/platforms/powernv/opal.c
>> @@ -58,6 +58,8 @@ static DEFINE_SPINLOCK(opal_write_lock);
>>   static struct atomic_notifier_head opal_msg_notifier_head[OPAL_MSG_TYPE_MAX];
>>   static uint32_t opal_heartbeat;
>>   static struct task_struct *kopald_tsk;
>> +static struct opal_msg *opal_msg;
>> +static uint64_t opal_msg_size;
>>   
>>   void opal_configure_cores(void)
>>   {
>> @@ -271,14 +273,9 @@ static void opal_message_do_notify(uint32_t msg_type, void *msg)
>>   static void opal_handle_message(void)
>>   {
>>   	s64 ret;
>> -	/*
>> -	 * TODO: pre-allocate a message buffer depending on opal-msg-size
>> -	 * value in /proc/device-tree.
>> -	 */
>> -	static struct opal_msg msg;
>>   	u32 type;
>>   
>> -	ret = opal_get_msg(__pa(&msg), sizeof(msg));
>> +	ret = opal_get_msg(__pa(opal_msg), opal_msg_size);
>>   	/* No opal message pending. */
>>   	if (ret == OPAL_RESOURCE)
>>   		return;
>> @@ -290,14 +287,14 @@ static void opal_handle_message(void)
>>   		return;
>>   	}
>>   
>> -	type = be32_to_cpu(msg.msg_type);
>> +	type = be32_to_cpu(opal_msg->msg_type);
>>   
>>   	/* Sanity check */
>>   	if (type >= OPAL_MSG_TYPE_MAX) {
>>   		pr_warn_once("%s: Unknown message type: %u\n", __func__, type);
>>   		return;
>>   	}
>> -	opal_message_do_notify(type, (void *)&msg);
>> +	opal_message_do_notify(type, (void *)opal_msg);
>>   }
>>   
>>   static irqreturn_t opal_message_notify(int irq, void *data)
>> @@ -306,9 +303,21 @@ static irqreturn_t opal_message_notify(int irq, void *data)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> -static int __init opal_message_init(void)
>> +static int __init opal_message_init(struct device_node *opal_node)
>>   {
>>   	int ret, i, irq;
> 
>> +	const __be32 *val;
>> +
>> +	val = of_get_property(opal_node, "opal-msg-size", NULL);
>> +	if (val)
>> +		opal_msg_size = be32_to_cpup(val);
> 
> Use of_property_read_u32()

Yes. Will fix it.

> 
>> +
>> +	/* If opal-msg-size property is not available then use default size */
>> +	if (!opal_msg_size)
>> +		opal_msg_size = sizeof(struct opal_msg);
>> +
>> +	opal_msg = kmalloc(opal_msg_size, GFP_KERNEL);
> 
>> +	BUG_ON(opal_msg == NULL);
> 
> Seems questionable. Why not fall back to using a staticly allocated
> struct opal_msg? Or re-try the allocation with the size limited to
> sizeof(struct opal_msg)?

If we are not able to allocate memory during init then we have bigger problem.
No point in continuing. Hence added BUG_ON().
May be I can retry allocation with fixed size before calling BUG_ON().
How about something like below :

+       /* If opal-msg-size property is not available then use default size */
+       if (!opal_msg_size)
+               opal_msg_size = sizeof(struct opal_msg);
+
+       opal_msg = kmalloc(opal_msg_size, GFP_KERNEL);
+       if (!opal_msg) {
+               opal_msg = kmalloc(sizeof(struct opal_msg), GFP_KERNEL);
+               BUG_ON(opal_msg == NULL);
+       }


-Vasant

