Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8812C25EC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 09:46:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4584SP6MfDzDqLT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 17:45:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4581gY2frfzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 15:40:25 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M5b5gp126915
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 01:40:23 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2smury8r0m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 01:40:22 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Wed, 22 May 2019 06:40:20 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 22 May 2019 06:40:18 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4M5eHuf36503658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2019 05:40:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48BA5AE057;
 Wed, 22 May 2019 05:40:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89488AE055;
 Wed, 22 May 2019 05:40:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 22 May 2019 05:40:16 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv: Return for invalid IMC domain
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20190520085753.19670-1-anju@linux.vnet.ibm.com>
 <87sgt86na9.fsf@concordia.ellerman.id.au>
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Date: Wed, 22 May 2019 11:10:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87sgt86na9.fsf@concordia.ellerman.id.au>
Content-Type: multipart/alternative;
 boundary="------------423130FBCB40CAF30FC4B33D"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052205-0012-0000-0000-0000031E2BC6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052205-0013-0000-0000-00002156DF1D
Message-Id: <7855537e-d021-fc4a-9791-419acda1616d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905220040
X-Mailman-Approved-At: Wed, 22 May 2019 17:44:50 +1000
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
Cc: pavsubra@in.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------423130FBCB40CAF30FC4B33D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/21/19 5:18 PM, Michael Ellerman wrote:
> Anju T Sudhakar <anju@linux.vnet.ibm.com> writes:
>> Currently init_imc_pmu() can be failed either because
>> an IMC unit with invalid domain(i.e an IMC node not
>> supported by the kernel) is attempted a pmu-registration
>> or something went wrong while registering a valid IMC unit.
>> In both the cases kernel provides a 'Registration failed'
>> error message.
>>
>> Example:
>> Log message, when trace-imc node is not supported by the kernel, and the
>> skiboot supports trace-imc node.
>>
>> So for kernel, trace-imc node is now an unknown domain.
>>
>> [    1.731870] nest_phb5_imc performance monitor hardware support registered
>> [    1.731944] nest_powerbus0_imc performance monitor hardware support registered
>> [    1.734458] thread_imc performance monitor hardware support registered
>> [    1.734460] IMC Unknown Device type
>> [    1.734462] IMC PMU (null) Register failed
>> [    1.734558] nest_xlink0_imc performance monitor hardware support registered
>> [    1.734614] nest_xlink1_imc performance monitor hardware support registered
>> [    1.734670] nest_xlink2_imc performance monitor hardware support registered
>> [    1.747043] Initialise system trusted keyrings
>> [    1.747054] Key type blacklist registered
>>
>>
>> To avoid ambiguity on the error message, return for invalid domain
>> before attempting a pmu registration.
> What do we print once the patch is applied?


Once the patch is applied, we return for invalid domains. so we will 
only have

`/IMC Unknown Device type/` message printed for *unknown domains*.

And `/IMC PMU (null) Register failed/` message will appear only if the

registration fails for a *known domain*.



Thanks,

Anju



--------------423130FBCB40CAF30FC4B33D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 5/21/19 5:18 PM, Michael Ellerman
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:87sgt86na9.fsf@concordia.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Anju T Sudhakar <a class="moz-txt-link-rfc2396E" href="mailto:anju@linux.vnet.ibm.com">&lt;anju@linux.vnet.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Currently init_imc_pmu() can be failed either because
an IMC unit with invalid domain(i.e an IMC node not
supported by the kernel) is attempted a pmu-registration
or something went wrong while registering a valid IMC unit.
In both the cases kernel provides a 'Registration failed'
error message.

Example:
Log message, when trace-imc node is not supported by the kernel, and the
skiboot supports trace-imc node.

So for kernel, trace-imc node is now an unknown domain.

[    1.731870] nest_phb5_imc performance monitor hardware support registered
[    1.731944] nest_powerbus0_imc performance monitor hardware support registered
[    1.734458] thread_imc performance monitor hardware support registered
[    1.734460] IMC Unknown Device type
[    1.734462] IMC PMU (null) Register failed
[    1.734558] nest_xlink0_imc performance monitor hardware support registered
[    1.734614] nest_xlink1_imc performance monitor hardware support registered
[    1.734670] nest_xlink2_imc performance monitor hardware support registered
[    1.747043] Initialise system trusted keyrings
[    1.747054] Key type blacklist registered


To avoid ambiguity on the error message, return for invalid domain
before attempting a pmu registration. 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What do we print once the patch is applied?
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Once the patch is applied, we return for invalid domains. so we
      will only have <br>
    </p>
    <p>`<i>IMC Unknown Device type</i>` message printed for <b>unknown
        domains</b>.</p>
    <p>And `<i>IMC PMU (null) Register failed</i>` message will appear
      only if the <br>
    </p>
    <p>registration fails for a <b>known domain</b>.</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Anju<br>
    </p>
    <br>
  </body>
</html>

--------------423130FBCB40CAF30FC4B33D--

