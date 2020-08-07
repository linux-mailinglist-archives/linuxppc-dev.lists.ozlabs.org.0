Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA6A23F3F9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 22:47:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNcqh3FWxzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 06:47:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IaBEZl3V; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNcnh4YtbzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 06:45:44 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 077KX8Og035322; Fri, 7 Aug 2020 16:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=a6Is6veUv9N6yrcirYkMC2JZMlqvLq7jzeQmxdoFoPI=;
 b=IaBEZl3VSxsJDcz+w3nxp7b6eGeavcUCddlw2oldQxqVIHsaG2w1Bf3Ma2exkC1lKLcK
 z/XuZuGB0Wix4O7yyaSd03lHSENq6nRPaV1GuZQUj88Ek9lBT9qFH9S0fOtq2Xa1z3tW
 KQ4cNb3OuHognkLpNdZbu1i7Yl2Us/86Nw2F174i8kmV3TlyiU5j5nbG79NjzWN28Fmk
 ysXtVVDpK5FKuGaWSsYR0Mt71RgwB255jv1WJzt5eOQl/R0/o1BFniW6C/dapKW3UxR5
 UTOwV/P/UVlQryAREbncr5iiDFycWcvKU2gl3clx2FdHwkiSJ03Vw5u2cSsV1fTLiiPd XA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rnu0ehkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 16:45:34 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 077Ka5x9008328;
 Fri, 7 Aug 2020 20:45:34 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 32nxe5bvsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 20:45:33 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 077KjXJJ54985208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 20:45:33 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78A0428058;
 Fri,  7 Aug 2020 20:45:33 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ADEE2805A;
 Fri,  7 Aug 2020 20:45:33 +0000 (GMT)
Received: from localhost (unknown [9.65.243.213])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 20:45:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
In-Reply-To: <324611f7-fdaf-f83c-7159-977488aa7ce7@linux.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
 <87pn83ytet.fsf@linux.ibm.com>
 <324611f7-fdaf-f83c-7159-977488aa7ce7@linux.ibm.com>
Date: Fri, 07 Aug 2020 15:45:32 -0500
Message-ID: <87k0yayykz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_19:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=1 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070145
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> On 8/7/20 9:54 AM, Nathan Lynch wrote:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>>> index e437a9ac4956..6c659aada55b 100644
>>> --- a/arch/powerpc/mm/numa.c
>>> +++ b/arch/powerpc/mm/numa.c
>>> @@ -221,25 +221,51 @@ static void initialize_distance_lookup_table(int nid,
>>>   	}
>>>   }
>>>   
>>> +static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
>> 
>> It's odd to me to use MAX_NUMNODES for this array when it's going to be
>> indexed not by Linux's logical node IDs but by the platform-provided
>> domain number, which has no relation to MAX_NUMNODES.
>
>
> I didn't want to dynamically allocate this. We could fetch 
> "ibm,max-associativity-domains" to find the size for that. The current 
> code do assume  firmware group id to not exceed MAX_NUMNODES. Hence kept 
> the array size to be MAX_NUMNODEs. I do agree that it is confusing. May 
> be we can do #define MAX_AFFINITY_DOMAIN MAX_NUMNODES?

Well, consider:

- ibm,max-associativity-domains can change at runtime with LPM. This
  doesn't happen in practice yet, but we should probably start thinking
  about how to support that.
- The domain numbering isn't clearly specified to have any particular
  properties such as beginning at zero or a contiguous range.

While the current code likely contains assumptions contrary to these
points, a change such as this is an opportunity to think about whether
those assumptions can be reduced or removed. In particular I think it
would be good to gracefully degrade when the number of NUMA affinity
domains can exceed MAX_NUMNODES. Using the platform-supplied domain
numbers to directly index Linux data structures will make that
impossible.

So, maybe genradix or even xarray wouldn't actually be overengineering
here.
