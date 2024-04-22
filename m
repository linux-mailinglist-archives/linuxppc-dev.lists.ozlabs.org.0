Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CD48AD72B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 00:18:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rJnuycEs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNflf4Pq5z3dJZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 08:18:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rJnuycEs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNVnG01L5z3c05
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 02:19:13 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43MGDkSf004187;
	Mon, 22 Apr 2024 16:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=mLDdJuHqgDsPvb32retMbfm3Ko9BeIc0ssFlV2heiXA=;
 b=rJnuycEsotyiZcUjBovokw3kyZDPbe5vsz4F1jamxu9wvtS1vipzT8tFfJkb7nxzoLqk
 yK0yvIZJ3dMav4oD0TAXw4DnHcd7X8OcVgRKXAxDvyly/4osmX39Sb9Gl6OiOjm89CgY
 QoXMovpBoSqaHXfSctc+tSKCDTOGD5wIPPiNqN8DdZo5yAfvEadbbuJLcf+j3CvY6lwh
 vCnDZWvJw+rN+AzCa327SiKRJkeuX5IXKP/8IjYkVWZ9HZuATsfVjBABgbwTT1tnAdf3
 XwGj7xTXJjB10EburZD+LrIbWNbzaG5xtA0r4EuqsycD00QsJ6gOTmY4Gx0w3BW/HWwx Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xnu7m80dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 16:18:41 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43MGIfDZ012416;
	Mon, 22 Apr 2024 16:18:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xnu7m80dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 16:18:41 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43MEKFLB015289;
	Mon, 22 Apr 2024 16:18:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmshm0gq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 16:18:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43MGIY3C37486848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Apr 2024 16:18:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1C7820065;
	Mon, 22 Apr 2024 16:18:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D1E620040;
	Mon, 22 Apr 2024 16:18:31 +0000 (GMT)
Received: from [9.171.88.30] (unknown [9.171.88.30])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Apr 2024 16:18:31 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------seXLyvmE5JXHUbCWqpvakMH6"
Message-ID: <d808e90c-a27d-47c4-b7c8-55734f24981c@linux.vnet.ibm.com>
Date: Mon, 22 Apr 2024 21:48:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] objtool: Run objtool only if either of the config
 options are selected
To: Masahiro Yamada <masahiroy@kernel.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>
References: <20240422092206.147078-1-sv@linux.ibm.com>
 <CAK7LNAR3R2MfP69pbXNYx3TCeQiaC-Pjb=zfnMifHRUvhCQA6w@mail.gmail.com>
Content-Language: en-US
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <CAK7LNAR3R2MfP69pbXNYx3TCeQiaC-Pjb=zfnMifHRUvhCQA6w@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Fg3fxFUyKs0abru7p_7tewbxVgHvzAfA
X-Proofpoint-GUID: JN_UOjAL8u0vo1bYCjJhCUN7qncRBORV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404220068
X-Mailman-Approved-At: Tue, 23 Apr 2024 08:17:45 +1000
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, peterz@infradead.org, mahesh@linux.ibm.com, mingo@kernel.org, nathan@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------seXLyvmE5JXHUbCWqpvakMH6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Masahiro, thanks for reviewing.

On 4/22/24 5:39 PM, Masahiro Yamada wrote:
> On Mon, Apr 22, 2024 at 6:25 PM Sathvika Vasireddy<sv@linux.ibm.com>  wrote:
>> Currently, when objtool is enabled and none of the supported options
>> are triggered, kernel build errors out with the below error:
>> error: objtool: At least one command required.
>
> Then, I think CONFIG_OBJTOOL should be disabled.
A subsequent patch introduces --ftr-fixup as an option to objtool to do 
feature fixup at build-time via CONFIG_HAVE_OBJTOOL_FTR_FIXUP option. If 
CONFIG_OBJTOOL is not selected, then objtool cannot be used to pass 
--ftr-fixup option.

In cases where none of the supported options (like --mcount on powerpc 
for example) is triggered, but still require --ftr-fixup option to be 
passed to objtool, we see "error: objtool: At least one command 
required" errors. So, to address this, run only when either of the 
config options are selected.

Thanks,
Sathvika
--------------seXLyvmE5JXHUbCWqpvakMH6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hi Masahiro, thanks for reviewing</font>.<br>
    </p>
    <div class="moz-cite-prefix"><font face="monospace">On 4/22/24 5:39
        PM, Masahiro Yamada wrote:</font><br>
    </div>
    <blockquote type="cite"
cite="mid:CAK7LNAR3R2MfP69pbXNYx3TCeQiaC-Pjb=zfnMifHRUvhCQA6w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Apr 22, 2024 at 6:25 PM Sathvika Vasireddy <a class="moz-txt-link-rfc2396E" href="mailto:sv@linux.ibm.com">&lt;sv@linux.ibm.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Currently, when objtool is enabled and none of the supported options
are triggered, kernel build errors out with the below error:
error: objtool: At least one command required.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Then, I think CONFIG_OBJTOOL should be disabled.</pre>
    </blockquote>
    <font face="monospace">A subsequent patch introduces --ftr-fixup as
      an option to objtool to do feature fixup at build-time via
      CONFIG_HAVE_OBJTOOL_FTR_FIXUP option. If CONFIG_OBJTOOL is not
      selected, then objtool cannot be used to pass --ftr-fixup option.<br>
    </font>
    <p><font face="monospace">In cases where none of the supported
        options (like --mcount on powerpc for example) is triggered, but
        still require --ftr-fixup option to be passed to objtool, we see
        "error: objtool: At least one command required" errors. So, to
        address this, run only when either of the config options are
        selected.</font><span style="white-space: pre-wrap">
</span></p>
    <span style="white-space: pre-wrap">
</span><font face="monospace">Thanks,<br>
      Sathvika</font><br>
  </body>
</html>

--------------seXLyvmE5JXHUbCWqpvakMH6--

