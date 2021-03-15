Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B0033A9B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 03:53:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzLZY4nP5z3cM6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 13:53:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jRtgMWjg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=michaele@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jRtgMWjg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzLZ52S56z2ysr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 13:52:44 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12F2XlQp129569; Sun, 14 Mar 2021 22:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=TfwgIDtMspvL1SrXH4WOgpQyUnLw8JK846jcaSOMI+I=;
 b=jRtgMWjgfnJLI7qeGsrxGDpLBx5KI9uKMN8koo+eqHQ7kAkh0gqKu2+2rBzLquwkejEZ
 r2ziZFH8dPJc7Y0XZOLOx/+DETtIvoaZ49oDnEdFhGZu8m2lFA/GJ3GJHEJEaBzUhPEb
 Zs6nVF0o7eZpsQ2SHDKBpIeuatf03Z+0gYYvoIf1CIrv8wh1Xy00QnM+Zcqep1Z+rznz
 E1iEotpH3yDnGSbC1kft9/6e8oyyw5Al5Pl3wBQIq6h2Xr2LgbpU0UBwD/7Uz6seRyrV
 ap0oo0lvuoAeuhVHi4ql0ReCY0KjPgD0M20tXPkqqgxyyCiEm3/Xt1M9rZq7Xs5e5hHr vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379ukebh0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 14 Mar 2021 22:52:41 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12F2nsB3026890;
 Sun, 14 Mar 2021 22:52:41 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379ukebh05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 14 Mar 2021 22:52:41 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12F2qdk9002570;
 Mon, 15 Mar 2021 02:52:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 378mnh1d9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 02:52:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12F2qKvD17957140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 02:52:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA840A4054;
 Mon, 15 Mar 2021 02:52:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52B07A405B;
 Mon, 15 Mar 2021 02:52:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 02:52:36 +0000 (GMT)
Received: from localhost (unknown [9.206.171.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 871BF601F4;
 Mon, 15 Mar 2021 13:52:34 +1100 (AEDT)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>
Subject: Re: [PATCH] rpadlpar: fix potential drc_name corruption in store
 functions
In-Reply-To: <a67af978-1c47-c66b-47f0-3d754da738f9@linux.ibm.com>
References: <20210310223021.423155-1-tyreld@linux.ibm.com>
 <20210313091751.GM6564@kitsune.suse.cz>
 <a67af978-1c47-c66b-47f0-3d754da738f9@linux.ibm.com>
Date: Mon, 15 Mar 2021 13:52:31 +1100
Message-ID: <87o8fl3z80.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-14_16:2021-03-12,
 2021-03-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150018
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
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org, mmc@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 3/13/21 1:17 AM, Michal Such=C3=A1nek wrote:
>> On Wed, Mar 10, 2021 at 04:30:21PM -0600, Tyrel Datwyler wrote:
>>> Both add_slot_store() and remove_slot_store() try to fix up the drc_name
>>> copied from the store buffer by placing a NULL terminator at nbyte + 1
>>> or in place of a '\n' if present. However, the static buffer that we
>>> copy the drc_name data into is not zeored and can contain anything past
>>> the n-th byte. This is problematic if a '\n' byte appears in that buffer
>>> after nbytes and the string copied into the store buffer was not NULL
>>> terminated to start with as the strchr() search for a '\n' byte will ma=
rk
>>> this incorrectly as the end of the drc_name string resulting in a drc_n=
ame
>>> string that contains garbage data after the n-th byte. The following
>>> debugging shows an example of the drmgr utility writing "PHB 4543" to
>>> the add_slot sysfs attribute, but add_slot_store logging a corrupted
>>> string value.
>>>
>>> [135823.702864] drmgr: drmgr: -c phb -a -s PHB 4543 -d 1
>>> [135823.702879] add_slot_store: drc_name =3D PHB 4543=C2=B0|<82>!, rc =
=3D -19
>>>
>>> Fix this by NULL terminating the string when we copy it into our static
>>> buffer by coping nbytes + 1 of data from the store buffer. The code has
>> Why is it OK to copy nbytes + 1 and why is it expected that the buffer
>> contains a nul after the content?
>
> It is my understanding that the store function buffer is allocated as a
> zeroed-page which the kernel copies up to at most (PAGE_SIZE - 1) of user=
 data
> into. Anything after nbytes would therefore be zeroed.

I think that's true, but it would be nice if we didn't have to rely on
that obscure detail in order for this code to be correct & understandable.

>> Isn't it much saner to just nul terminate the string after copying?
>
> At the cost of an extra line of code, sure.

Is there a reason we can't use strscpy()? That should deal with all the
corner cases around the string copy, and then all you have to do is look
for a newline and turn it into nul.

cheers
