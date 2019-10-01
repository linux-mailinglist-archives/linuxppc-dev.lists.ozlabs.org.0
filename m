Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A78C4080
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 20:57:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jT6b1SBFzDqHJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 04:57:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jT4m0nT6zDqFS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 04:56:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46jT4l1BsPz8vsm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 04:56:07 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46jT4l0n9fz9sP7; Wed,  2 Oct 2019 04:56:07 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46jT4k3R7nz9sN1;
 Wed,  2 Oct 2019 04:56:06 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91IpkHO037151; Tue, 1 Oct 2019 14:55:55 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vcc22rwxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 14:55:55 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x91IqCau038177;
 Tue, 1 Oct 2019 14:55:54 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vcc22rwxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 14:55:54 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x91IrRcc005347;
 Tue, 1 Oct 2019 18:55:54 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 2v9y585qkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 18:55:54 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91ItqbP60031400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 18:55:52 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B22EBE04F;
 Tue,  1 Oct 2019 18:55:52 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41B77BE051;
 Tue,  1 Oct 2019 18:55:50 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.224.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 18:55:49 +0000 (GMT)
Subject: Re: [PATCH] sysfs: add BIN_ATTR_WO() macro
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1566825818-9731-1-git-send-email-nayna@linux.ibm.com>
 <1566825818-9731-3-git-send-email-nayna@linux.ibm.com>
 <20190826140131.GA15270@kroah.com>
 <ff9674e1-1b27-783a-38f3-4fd725353186@linux.vnet.ibm.com>
 <20190826150153.GD18418@kroah.com>
 <7546990b-8060-9451-129a-19aaa856d2e1@linux.vnet.ibm.com>
 <20191001181601.GA3705194@kroah.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <30330438-bd1d-000f-a9ec-57fd993eb569@linux.vnet.ibm.com>
Date: Tue, 1 Oct 2019 14:55:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191001181601.GA3705194@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=933 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010151
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/01/2019 02:16 PM, Greg Kroah-Hartman wrote:
> On Tue, Oct 01, 2019 at 02:08:53PM -0400, Nayna wrote:
>> Hi Greg,
>>
>>
>> On 08/26/2019 11:01 AM, Greg Kroah-Hartman wrote:
>>> This variant was missing from sysfs.h, I guess no one noticed it before.
>>>
>>> Turns out the powerpc secure variable code can use it, so add it to the
>>> tree for it, and potentially others to take advantage of, instead of
>>> open-coding it.
>>>
>>> Reported-by: Nayna Jain <nayna@linux.ibm.com>
>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> ---
>>>
>>> I'll queue this up to my tree for 5.4-rc1, but if you want to take this
>>> in your tree earlier, feel free to do so.
>>>
>>>    include/linux/sysfs.h | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
>>> index 965236795750..5420817ed317 100644
>>> --- a/include/linux/sysfs.h
>>> +++ b/include/linux/sysfs.h
>>> @@ -196,6 +196,12 @@ struct bin_attribute {
>>>    	.size	= _size,						\
>>>    }
>>> +#define __BIN_ATTR_WO(_name) {						\
>>> +	.attr	= { .name = __stringify(_name), .mode = 0200 },		\
>>> +	.store	= _name##_store,					\
>>> +	.size	= _size,						\
>>> +}
>>> +
>>>    #define __BIN_ATTR_RW(_name, _size)					\
>>>    	__BIN_ATTR(_name, 0644, _name##_read, _name##_write, _size)
>>> @@ -208,6 +214,9 @@ struct bin_attribute bin_attr_##_name = __BIN_ATTR(_name, _mode, _read,	\
>>>    #define BIN_ATTR_RO(_name, _size)					\
>>>    struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
>>> +#define BIN_ATTR_WO(_name, _size)					\
>>> +struct bin_attribute bin_attr_##_name = __BIN_ATTR_WO(_name, _size)
>>> +
>>>    #define BIN_ATTR_RW(_name, _size)					\
>>>    struct bin_attribute bin_attr_##_name = __BIN_ATTR_RW(_name, _size)
>> I am sorry. I didn't notice it via inspection but there is a bug in this
>> macro. When I actually try using it, compilation fails. Here's a likely
>> patch:
>>
>> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
>> index 5420817ed317..fa7ee503fb76 100644
>> --- a/include/linux/sysfs.h
>> +++ b/include/linux/sysfs.h
>> @@ -196,9 +196,9 @@ struct bin_attribute {
>>          .size   = _size,                                                \
>>   }
>> -#define __BIN_ATTR_WO(_name) {                                         \
>> +#define __BIN_ATTR_WO(_name, _size) {                                  \
>>          .attr   = { .name = __stringify(_name), .mode = 0200 },         \
>> -       .store  = _name##_store,                                        \
>> +       .write  = _name##_write,                                        \
>>          .size   = _size,                                                \
>>   }
>>
> Heh, good catch.  Can you send a real patch for this that I can apply to
> give you the proper credit for finding and fixing this?

Sure.. Thanks Greg !!

Thanks & Regards,
       - Nayna
