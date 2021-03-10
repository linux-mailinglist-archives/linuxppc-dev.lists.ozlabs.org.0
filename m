Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7196533390A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 10:43:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwRwZ34NTz3dQL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 20:43:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tHLoBfX7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aik@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tHLoBfX7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwRjG5hm2z3bPW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 20:33:53 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A94Zqg043272
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 04:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MfCubvQ0EsfSWH+y56P3j98MnZKrBU8T4zMVCXY1uUo=;
 b=tHLoBfX7JEZ+2JX27eKINyXmuwOMt2HkZnEQ0/C7jVLzTmllb981MV9cFuLURLvdGcG2
 pcIR9mEcO4LTwaJymeIL5YCzFeaT5HWvTe/tlL4n6SRzETXjz/rYwil4oDCzpahZiGot
 istQMa7UoLL0bxj0qDa4fZT/kugz5TPyewv4WEftdGeqKbhAIjpeGTUhSKwp8qPmfnTq
 ishC01jhEtV5f7QHMegrQyOoMfjjKPgakb7/42K2wsLi8NTRzMlqQ0hT+nTIRJOyXneB
 LGlFycKlD64nR95yE/PNMjUY0iAHRuuGFfjhWtLWVpM2GhLjbY4dSuPdVylRBN/zOVIW lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 376gx671g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 04:33:50 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12A95G0a048432
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 04:33:49 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 376gx671fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 04:33:49 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12A9U6vb026715;
 Wed, 10 Mar 2021 09:33:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3768va0ecw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 09:33:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12A9XSIi13500888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Mar 2021 09:33:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B8C0A405F;
 Wed, 10 Mar 2021 09:33:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC604A405B;
 Wed, 10 Mar 2021 09:33:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Mar 2021 09:33:43 +0000 (GMT)
Received: from [9.206.216.192] (unknown [9.206.216.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 09B2760522;
 Wed, 10 Mar 2021 20:33:40 +1100 (AEDT)
Subject: Re: PowerPC64 future proof kernel toc, revised for lld
To: Alan Modra <amodra@gmail.com>
References: <20210309045638.GI6042@bubble.grove.modra.org>
 <20210310034813.GM6042@bubble.grove.modra.org>
 <3c92968f-7c61-8d36-4001-91f8630de4b1@linux.ibm.com>
 <20210310050722.GN6042@bubble.grove.modra.org>
From: Alexey Kardashevskiy <aik@linux.ibm.com>
Message-ID: <5aa60950-d93c-f700-3b0b-a01f947e8a22@linux.ibm.com>
Date: Wed, 10 Mar 2021 20:33:37 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210310050722.GN6042@bubble.grove.modra.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100043
X-Mailman-Approved-At: Wed, 10 Mar 2021 20:42:36 +1100
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
Cc: alexey@au1.ibm.com, linuxppc-dev@lists.ozlabs.org, ellerman@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

One more question - the older version had a construct "DEFINED (.TOC.) ? 
.TOC. : ..." in case .TOC. is not defined (too old ld? too old gcc?) but 
the newer patch seems assuming it is always defined, when was it added? 
I have the same check in SLOF, for example, do I still need it?




On 10/03/2021 16:07, Alan Modra wrote:
> On Wed, Mar 10, 2021 at 03:44:44PM +1100, Alexey Kardashevskiy wrote:
>> For my own education, is .got for prom_init.o still generated by ld or gcc?
> 
> .got is generated by ld.
> 
>> In other words, should "objdump -D -s -j .got" ever dump .got for any .o
>> file, like below?
> 
> No.  "objdump -r prom_init.o | grep GOT" will tell you whether
> prom_init.o *may* cause ld to generate .got entries.  (Linker
> optimisations or --gc-sections might remove the need for those .got
> entries.)
> 
>> objdump: section '.got' mentioned in a -j option, but not found in any input
>> file
> 
> Right, expected.
> 

-- 
Alexey Kardashevskiy
IBM OzLabs, LTC Team

e-mail: aik@linux.ibm.com
