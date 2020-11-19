Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3820A2B9C5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 22:00:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcXC22C2dzDqll
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 08:00:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Va1cSq22; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcWRs5ZJMzDqpG;
 Fri, 20 Nov 2020 07:26:48 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJK4DOG167460; Thu, 19 Nov 2020 15:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=uXff1xvHP2finD+XGHqtCSefaov6RFvZ1+aCSuTDkjQ=;
 b=Va1cSq22WSeEMTHvKghDEEtXkMRq36Va/fwPREuNOHPsv+1vwTREY4woQK0sU6cLkDP+
 H0TWFwnStwYCbJaYWO2v9uCD8lFN2E+CzdXT8AfmP2FCIT8M5e7Wmh232FbBm1Oq4Jft
 UQ5i5BV4QokJmHgtM8Qpf1xMAy41JuugYWMbELO3Wrkc0L4EvqHZAQ3pu/OLJjD6UZJB
 zm+tV4DzphBVqXla2xkivPDalDPT+B6fJBuaAS1Ju/6+AlzKGCO2xiAirU1h4czoFFOI
 WeEnE3D5bwAI2mQBRFq9eYDoOnnr46ZGGBrvPddA7gR7Ilig1WR84NujFANeYz8enyg1 OA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34wy3vs2xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 15:26:37 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJKMviJ011487;
 Thu, 19 Nov 2020 20:26:37 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 34uttrytbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 20:26:37 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJKQacs16777840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 20:26:36 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F93B124054;
 Thu, 19 Nov 2020 20:26:36 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67DC2124053;
 Thu, 19 Nov 2020 20:26:35 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.65.227.245])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 20:26:35 +0000 (GMT)
Subject: Re: [PATCH net-next v2 9/9] ibmvnic: Do not replenish RX buffers
 after every polling loop
To: ljp <ljp@linux.vnet.ibm.com>
References: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
 <1605748345-32062-10-git-send-email-tlfalcon@linux.ibm.com>
 <1a4e7b1ef1fb101cbb26fb9d5867ee46@linux.vnet.ibm.com>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <83ca37f3-07be-4179-8414-88c8c83bfe56@linux.ibm.com>
Date: Thu, 19 Nov 2020 14:26:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1a4e7b1ef1fb101cbb26fb9d5867ee46@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------BB2E899EE748F0AC1E28909F"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_10:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 mlxlogscore=628 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190134
X-Mailman-Approved-At: Fri, 20 Nov 2020 07:58:21 +1100
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
Cc: cforno12@linux.ibm.com, netdev@vger.kernel.org, ricklind@linux.ibm.com,
 dnbanerg@us.ibm.com,
 Linuxppc-dev <linuxppc-dev-bounces+ljp=linux.ibm.com@lists.ozlabs.org>,
 drt@linux.vnet.ibm.com, brking@linux.vnet.ibm.com, kuba@kernel.org,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------BB2E899EE748F0AC1E28909F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/20 3:43 AM, ljp wrote:
> On 2020-11-18 19:12, Thomas Falcon wrote:
>> From: "Dwip N. Banerjee" <dnbanerg@us.ibm.com>
>>
>> Reduce the amount of time spent replenishing RX buffers by
>> only doing so once available buffers has fallen under a certain
>> threshold, in this case half of the total number of buffers, or
>> if the polling loop exits before the packets processed is less
>> than its budget.
>>
>> Signed-off-by: Dwip N. Banerjee <dnbanerg@us.ibm.com>
>> ---
>>  drivers/net/ethernet/ibm/ibmvnic.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c
>> b/drivers/net/ethernet/ibm/ibmvnic.c
>> index 96df6d8fa277..9fe43ab0496d 100644
>> --- a/drivers/net/ethernet/ibm/ibmvnic.c
>> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
>> @@ -2537,7 +2537,10 @@ static int ibmvnic_poll(struct napi_struct
>> *napi, int budget)
>>          frames_processed++;
>>      }
>>
>> -    if (adapter->state != VNIC_CLOSING)
>> +    if (adapter->state != VNIC_CLOSING &&
>> + ((atomic_read(&adapter->rx_pool[scrq_num].available) <
>> +          adapter->req_rx_add_entries_per_subcrq / 2) ||
>> +          frames_processed < budget))
>
> 1/2 seems a simple and good algorithm.
> Explaining why "frames_process < budget" is necessary in the commit 
> message
> or source code also helps.
>
Hello, Lijun. The patch author, Dwip Banerjee, suggested the modified 
commit message below:

Reduce the amount of time spent replenishing RX buffers by
only doing so once available buffers has fallen under a certain
threshold, in this case half of the total number of buffers, or
if the polling loop exits before the packets processed is less
than its budget. Non-exhaustion of NAPI budget implies lower
incoming packet pressure, allowing the leeway to refill the buffers
in preparation for any impending burst.

Would such an update require a v3?

>
>>          replenish_rx_pool(adapter, &adapter->rx_pool[scrq_num]);
>>      if (frames_processed < budget) {
>>          if (napi_complete_done(napi, frames_processed)) {

--------------BB2E899EE748F0AC1E28909F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/19/20 3:43 AM, ljp wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1a4e7b1ef1fb101cbb26fb9d5867ee46@linux.vnet.ibm.com">On
      2020-11-18 19:12, Thomas Falcon wrote:
      <br>
      <blockquote type="cite">From: "Dwip N. Banerjee"
        <a class="moz-txt-link-rfc2396E" href="mailto:dnbanerg@us.ibm.com">&lt;dnbanerg@us.ibm.com&gt;</a>
        <br>
        <br>
        Reduce the amount of time spent replenishing RX buffers by
        <br>
        only doing so once available buffers has fallen under a certain
        <br>
        threshold, in this case half of the total number of buffers, or
        <br>
        if the polling loop exits before the packets processed is less
        <br>
        than its budget.
        <br>
        <br>
        Signed-off-by: Dwip N. Banerjee <a class="moz-txt-link-rfc2396E" href="mailto:dnbanerg@us.ibm.com">&lt;dnbanerg@us.ibm.com&gt;</a>
        <br>
        ---
        <br>
         drivers/net/ethernet/ibm/ibmvnic.c | 5 ++++-
        <br>
         1 file changed, 4 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/drivers/net/ethernet/ibm/ibmvnic.c
        <br>
        b/drivers/net/ethernet/ibm/ibmvnic.c
        <br>
        index 96df6d8fa277..9fe43ab0496d 100644
        <br>
        --- a/drivers/net/ethernet/ibm/ibmvnic.c
        <br>
        +++ b/drivers/net/ethernet/ibm/ibmvnic.c
        <br>
        @@ -2537,7 +2537,10 @@ static int ibmvnic_poll(struct
        napi_struct
        <br>
        *napi, int budget)
        <br>
                 frames_processed++;
        <br>
             }
        <br>
        <br>
        -    if (adapter-&gt;state != VNIC_CLOSING)
        <br>
        +    if (adapter-&gt;state != VNIC_CLOSING &amp;&amp;
        <br>
        +       
        ((atomic_read(&amp;adapter-&gt;rx_pool[scrq_num].available) &lt;
        <br>
        +          adapter-&gt;req_rx_add_entries_per_subcrq / 2) ||
        <br>
        +          frames_processed &lt; budget))
        <br>
      </blockquote>
      <br>
      1/2 seems a simple and good algorithm.
      <br>
      Explaining why "frames_process &lt; budget" is necessary in the
      commit message
      <br>
      or source code also helps.
      <br>
      <br>
    </blockquote>
    <p>Hello, Lijun. The patch author, Dwip Banerjee, suggested the
      modified commit message below:</p>
    <p><font size="2">Reduce the amount of time spent replenishing RX
        buffers by<br>
        only doing so once available buffers has fallen under a certain<br>
        threshold, in this case half of the total number of buffers, or<br>
        if the polling loop exits before the packets processed is less<br>
        than its budget. Non-exhaustion of NAPI budget implies lower<br>
        incoming packet pressure, allowing the leeway to refill the
        buffers<br>
        in preparation for any impending burst.<br>
      </font></p>
    <p>Would such an update require a v3?<br>
    </p>
    <blockquote type="cite"
      cite="mid:1a4e7b1ef1fb101cbb26fb9d5867ee46@linux.vnet.ibm.com">
      <br>
      <blockquote type="cite">         replenish_rx_pool(adapter,
        &amp;adapter-&gt;rx_pool[scrq_num]);
        <br>
             if (frames_processed &lt; budget) {
        <br>
                 if (napi_complete_done(napi, frames_processed)) {
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------BB2E899EE748F0AC1E28909F--

