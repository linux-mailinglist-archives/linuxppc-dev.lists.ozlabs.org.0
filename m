Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 819A2367A8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 09:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQpP33936z2ysw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:06:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZvpBNqnM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ricklind@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZvpBNqnM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQpNc08yKz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 17:05:51 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M74CXX065781; Thu, 22 Apr 2021 03:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NrlE+0erGU7/ciMtnZrJoG/XFKoSNrCnPtiUlJykfTo=;
 b=ZvpBNqnM413ItqMccsmAF6rY4kmzSoDdCezOAxFp27EOvy5rkMSvK1gxylOITKJISuuo
 3hMfRm/DKM/HMPGqbm3G8sjfmYGH/FM8bzh395MBq9oqqa0i1YKmB2fG9BXnpw1ksHtu
 jT7IaWoGX4w+AztrLMp5Ow1604Iv4BYhtNjYpwS96zTK1aWbquryeDsoD5ptD0D3RHwq
 qwveMmbdrf4H+61LQOww1XhVlHmpFFc28Wj5VJvaS1L2bBboKy4QQJ23VTQG6ytCin7D
 2jy66Gl3eDX94nZRyZK9AAhqtNeQdUYH/3CB8/OhfOb4WSyCV9IZoPSL72E1ALjRq6/B mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38331na9k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 03:05:46 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13M751kv069514;
 Thu, 22 Apr 2021 03:05:46 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38331na9jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 03:05:45 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M6vIqc025486;
 Thu, 22 Apr 2021 07:05:44 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 37yqaa81fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 07:05:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13M75i6032571862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 07:05:44 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C244AE05F;
 Thu, 22 Apr 2021 07:05:44 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B604AE05C;
 Thu, 22 Apr 2021 07:05:42 +0000 (GMT)
Received: from [9.160.109.21] (unknown [9.160.109.21])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 07:05:41 +0000 (GMT)
Subject: Re: [PATCH V2 net] ibmvnic: Continue with reset if set link down
 failed
To: Lijun Pan <lijunp213@gmail.com>
References: <20210420213517.24171-1-drt@linux.ibm.com>
 <60C99F56-617D-455B-9ACF-8CE1EED64D92@linux.vnet.ibm.com>
 <51a63be8-9b24-3f72-71d0-111959649059@linux.vnet.ibm.com>
 <CAOhMmr4YF6HyBfa4gZZFQqUK6tyw5io=WzSb6G08zhbtu1sU-g@mail.gmail.com>
From: Rick Lindsley <ricklind@linux.vnet.ibm.com>
Message-ID: <877cbb4b-8bc6-75ad-9cd4-a3ffccfc8405@linux.vnet.ibm.com>
Date: Thu, 22 Apr 2021 00:05:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAOhMmr4YF6HyBfa4gZZFQqUK6tyw5io=WzSb6G08zhbtu1sU-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5mVYkVRhA1D24UeXsx-lo3aBAw1c3p2w
X-Proofpoint-ORIG-GUID: jRGLKjVfTCZUEjBT74ddEBSM67vi4ryr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220059
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
Cc: netdev@vger.kernel.org, Lijun Pan <ljp@linux.vnet.ibm.com>,
 Tom Falcon <tlfalcon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 21, 2021 at 3:06 AM Rick Lindsley
<ricklind@linux.vnet.ibm.com> wrote:

>> Please describe the advantage in deferring it further by routing it through
>> do_hard_reset().  I don't see one.

On 4/21/21 10:12 PM, Lijun Pan replied:

> It is not deferred. It exits with error and calls do_hard_reset.
> See my reply to Suka's.

I saw your reply, but it does not answer the question I asked.  The patch
would have us reinitialize and restart the communication queues.  Your
suggestion would do more work than that.  Please describe the advantage
in deferring the reinitialization - and yes, defer is the right word -
by routing it through do_hard_reset() and executing that extra code.  I
see that route as doing more work than necessary and so introducing
additional risk, for no clear advantage.  So I would find it helpful
if you would describe the advantage.

> The testing was done on this patch. It was not performed on a full hard reset.
> So I don't think you could even compare the two results.

A problem has been noted, a patch has been proposed, and the reasoning that
the patch is correct has been given.  Testing with this patch has
demonstrated the problem has not returned.  So far, that sounds like a
pretty reasonable solution.

Your comment is curious - why would testing for this patch be done on a full
hard reset when this patch does not invoke a full hard reset?  If you have
data to consider then let's have it. I'm willing to be convinced, but so far
this just sounds like "I wouldn't do it that way myself, and I have a bad
feeling about doing it any other way."

Rick
