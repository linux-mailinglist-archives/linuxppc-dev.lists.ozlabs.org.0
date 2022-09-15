Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 405595BA2B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 00:28:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTBfl6zYsz2yjR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 08:27:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JrmYLMYv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JrmYLMYv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MStQF2R5Fz308B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 20:16:04 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F9v08v009282;
	Thu, 15 Sep 2022 10:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=pp1; bh=m2DpW3lR3YXKCdboT75odgST74rheL9YdVC1mK+WGrQ=;
 b=JrmYLMYvKOZ1vC+3hlsFrsriIHcPSn8aB22EXlK4TMVO2+i7e7bx2HxGCccceXW7Xcqb
 HLUPcQhv1v2kFCmMMyR16TsgIA3tzwi++E8FGZEYalg0AK8NvJ/gSrXP+HfGv71h4UQV
 W43v5i2YVyiqPsat5uKvLA2K3LRNilLl52CWUuyU/CO/OCnesflfjK2NO9F8ZjlVKoL0
 FJPiOgWc9yWESxueqtFwzXsmHQNyGFktmWfBfoDdLPMv7kRCzHI6SoRAzF7A4yw9VuOB
 /o03yu8YQ6gTvQbovBjywpHXUY66cK/E5Yz80gxp2bFVC5rU7SlbRWQGQAYI9qbLiv0j Hw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jm1v9rtw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 10:15:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28FA6fLq025792;
	Thu, 15 Sep 2022 10:15:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3jjytx272d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 10:15:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28FAFpbL41091390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 10:15:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56CDDAE053;
	Thu, 15 Sep 2022 10:15:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD083AE045;
	Thu, 15 Sep 2022 10:15:48 +0000 (GMT)
Received: from [9.43.59.100] (unknown [9.43.59.100])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 10:15:48 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------rhNJzktj0bNwKdu1UH2TM287"
Message-ID: <f49d73c7-6f80-53d5-9a54-43ea2ace860e@linux.ibm.com>
Date: Thu, 15 Sep 2022 15:45:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 0/3] Asynchronous EEH recovery
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20220816032716.108297-1-ganeshgr@linux.ibm.com>
 <YxFMJEWSfSBkcwyq@ziepe.ca>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <YxFMJEWSfSBkcwyq@ziepe.ca>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t500gf5YkpFHrnS6DjbsIrYygpm20k-c
X-Proofpoint-ORIG-GUID: t500gf5YkpFHrnS6DjbsIrYygpm20k-c
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_06,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209150055
X-Mailman-Approved-At: Fri, 16 Sep 2022 08:27:25 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------rhNJzktj0bNwKdu1UH2TM287
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/22 05:49, Jason Gunthorpe wrote:

> On Tue, Aug 16, 2022 at 08:57:13AM +0530, Ganesh Goudar wrote:
>> Hi,
>>
>> EEH reocvery is currently serialized and these patches shorten
>> the time taken for EEH recovery by making the recovery to run
>> in parallel. The original author of these patches is Sam Bobroff,
>> I have rebased and tested these patches.
> How did you test this?

This is tested on SRIOV VFs.

>
> I understand that VFIO on 6.0 does not work at all on power?
>
> I am waiting for power maintainers to pick up this series to fix it:
>
> https://lore.kernel.org/kvm/20220714081822.3717693-1-aik@ozlabs.ru/
>
> Jason
--------------rhNJzktj0bNwKdu1UH2TM287
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 9/2/22 05:49, Jason Gunthorpe wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:YxFMJEWSfSBkcwyq@ziepe.ca">
      <pre class="moz-quote-pre" wrap="">On Tue, Aug 16, 2022 at 08:57:13AM +0530, Ganesh Goudar wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi,

EEH reocvery is currently serialized and these patches shorten
the time taken for EEH recovery by making the recovery to run
in parallel. The original author of these patches is Sam Bobroff,
I have rebased and tested these patches.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How did you test this?</pre>
    </blockquote>
    <pre>This is tested on SRIOV VFs.</pre>
    <blockquote type="cite" cite="mid:YxFMJEWSfSBkcwyq@ziepe.ca">
      <pre class="moz-quote-pre" wrap="">

I understand that VFIO on 6.0 does not work at all on power?

I am waiting for power maintainers to pick up this series to fix it:

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/kvm/20220714081822.3717693-1-aik@ozlabs.ru/">https://lore.kernel.org/kvm/20220714081822.3717693-1-aik@ozlabs.ru/</a>

Jason
</pre>
    </blockquote>
  </body>
</html>

--------------rhNJzktj0bNwKdu1UH2TM287--

