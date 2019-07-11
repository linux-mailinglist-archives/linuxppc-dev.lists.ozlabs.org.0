Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF465939
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 16:43:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kzM151pJzDqN1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 00:43:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kzJj3MNPzDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 00:41:24 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6BEZNWH015568
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 10:41:12 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tp49t781a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 10:41:11 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.vnet.ibm.com>;
 Thu, 11 Jul 2019 15:41:10 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 11 Jul 2019 15:41:06 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6BEf5nC64684456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jul 2019 14:41:05 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 251406A054;
 Thu, 11 Jul 2019 14:41:05 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83C096A051;
 Thu, 11 Jul 2019 14:41:02 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.80.233.139])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Jul 2019 14:41:02 +0000 (GMT)
Subject: Re: Coccinelle: Checking of_node_put() calls with SmPL
To: wen.yang99@zte.com.cn, Markus.Elfring@web.de, julia.lawall@lip6.fr
References: <201907111435459627761@zte.com.cn>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Thu, 11 Jul 2019 07:41:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <201907111435459627761@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071114-0004-0000-0000-000015268C22
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011408; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01230664; UDB=6.00648235; IPR=6.01011939; 
 MB=3.00027680; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-11 14:41:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071114-0005-0000-0000-00008C69C428
Message-Id: <23e06fc0-b969-44e9-a44d-f11b19dfdeca@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907110164
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
Cc: wang.yi59@zte.com.cn, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 daniel.lezcano@linaro.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, oss@buserror.net, paulus@samba.org,
 xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/10/2019 11:35 PM, wen.yang99@zte.com.cn wrote:
>>> we developed a coccinelle script to detect such problems.
>>
>> Would you find the implementation of the function “dt_init_idle_driver”
>> suspicious according to discussed source code search patterns?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/cpuidle/dt_idle_states.c?id=e9a83bd2322035ed9d7dcf35753d3f984d76c6a5#n208
>> https://elixir.bootlin.com/linux/v5.2/source/drivers/cpuidle/dt_idle_states.c#L208
>>
>>
>>> This script is still being improved.
>>
>> Will corresponding software development challenges become more interesting?
> 
> Hello Markus,
> This is the simplified code pattern for it:
> 
> 172         for (i = 0; ; i++) {

This loop can only be exited on a break.

> 173                 state_node = of_parse_phandle(...);     ---> Obtain here
> ...
> 177                 match_id = of_match_node(matches, state_node);
> 178                 if (!match_id) {
> 179                         err = -ENODEV;                              
> 180                         break;                         --->  Jump out of the loop without releasing it
> 181                 }
> 182 
> 183                 if (!of_device_is_available(state_node)) {
> 184                         of_node_put(state_node);
> 185                         continue;                    --->  Release the object references within a loop
> 186                 }
> ...
> 208                 of_node_put(state_node);  -->  Release the object references within a loop

This is required at the end of every loop or continue to free the reference.
Only a break will exit the loop where we hit the below of_node_put().

> 209         }
> 210 
> 211         of_node_put(state_node);       -->    There may be double free here.

None of the break conditions call of_node_put(), so it needs to be called here.

-Tyrel

> 
> This code pattern is very interesting and the coccinelle software should also recognize this pattern.
> 
> Regards,
> Wen
> 

