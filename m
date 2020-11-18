Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 362EE2B7342
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 01:42:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbPCM3hT8zDqdP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 11:42:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TR9E9G8R; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbP902hkNzDqYY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 11:40:03 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AI0VfXK091463; Tue, 17 Nov 2020 19:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cCZ/NzGVtH+YqDn1ti91oWtrqNDR6yLpF+Fxsawg+qs=;
 b=TR9E9G8R12jwsHTKvingo5NfqbsmOOXxJK3ClOD/0GzUdE+YoiQAbirpbd2Yx3ztnlof
 qtUhq8bDG7dgIayzE+QosCKzj5Y86dNFIzscKGo2tlSXLG8KSAy50IjoPFCapXtrWRcf
 9wQIZqExFGp5WL9/DQ9n0YmYO+ShcDnPpjBNZRiRKUMdG20VoF+/zjs9LpTQYmtV5YW+
 SYheX2wm1FMvBUvpkk8FCI7VDDAEMHEF2o8BqyU3wszuXg0+uhAt2v8NiHgmXkXQ967B
 cBJjBFFj8CLa5Iw2rJGQir4UwLcWOSUMdzKw9O81xd1/twsLG50Aj/4V2IiHcvQGS2Yj PA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34veevmd65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 19:39:58 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AI0RhJp029550;
 Wed, 18 Nov 2020 00:39:58 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 34t6v9gwkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 00:39:58 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AI0dv9s64881066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 00:39:57 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 383C628059;
 Wed, 18 Nov 2020 00:39:57 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7CB228058;
 Wed, 18 Nov 2020 00:39:55 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.230.183])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Nov 2020 00:39:54 +0000 (GMT)
Subject: Re: [PATCH 4/6] ibmvfc: add FC payload retrieval routines for
 versioned vfcFrames
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201112010442.102589-1-tyreld@linux.ibm.com>
 <20201112010442.102589-4-tyreld@linux.ibm.com>
 <9e38f449-d2e6-6408-4fef-cfb5351393cc@linux.vnet.ibm.com>
 <a829840c-6f39-2901-4cdc-9df1d83f3196@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <8c13e026-b496-d3bd-8d8d-8a4fd607b43a@linux.ibm.com>
Date: Tue, 17 Nov 2020 16:39:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a829840c-6f39-2901-4cdc-9df1d83f3196@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_15:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170179
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/17/20 2:21 PM, Brian King wrote:
> On 11/17/20 4:14 PM, Brian King wrote:
>> On 11/11/20 7:04 PM, Tyrel Datwyler wrote:
>>> The FC iu and response payloads are located at different offsets
>>> depending on the ibmvfc_cmd version. This is a result of the version 2
>>> vfcFrame definition adding an extra 64bytes of reserved space to the
>>> structure prior to the payloads.
>>>
>>> Add helper routines to determine the current vfcFrame version and
>>> returning pointers to the proper iu or response structures within that
>>> ibmvfc_cmd.
>>>
>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>>> ---
>>>  drivers/scsi/ibmvscsi/ibmvfc.c | 76 ++++++++++++++++++++++++----------
>>>  1 file changed, 53 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>>> index aa3445bec42c..5e666f7c9266 100644
>>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>>> @@ -138,6 +138,22 @@ static void ibmvfc_tgt_move_login(struct ibmvfc_target *);
>>>  
>>>  static const char *unknown_error = "unknown error";
>>>  
>>> +static struct ibmvfc_fcp_cmd_iu *ibmvfc_get_fcp_iu(struct ibmvfc_host *vhost, struct ibmvfc_cmd *vfc_cmd)
>>> +{
>>> +	if (be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_HANDLE_VF_WWPN)
>>
>> Suggest adding a flag to the vhost structure that you setup after login in order to
>> simplify this check and avoid chasing multiple pointers along with a byte swap.
>>
>> Maybe something like:
>>
>> vhost->is_v2
> 
> Even better might be vhost->version which you'd set to 1 or 2 and then you could directly
> use that to set the field in the command structures later.

So, the problem is that now a MADs version is determined by capability and not
an over arching protocol version. So, we will still have some MAD's that are v1
while other are v2 with a certain capability. The solution could work in the
short term since targetWWPN is the only feature that has v2 MADs, but I suspect
more versioning down the pipeline which may lead to some MADs whose v2 form has
nothing to do with targetWWPN support.

-Tyrel

