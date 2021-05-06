Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB803374D8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 04:30:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbHcq6SWtz30HD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 12:30:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j6pI8n7z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j6pI8n7z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbHcK5J6Fz2yYl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 12:30:25 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14623PuL099470; Wed, 5 May 2021 22:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zVJIP4Vr3vYoks5fNrjKys6fTQaLjWRrc40xCBL/L1A=;
 b=j6pI8n7zzIhv2A9GYDh49psG9zlPAmU/bIfUFv0NcJr+okNT0qumI43NLX41VjDVse3D
 MWsgYsWyQu7ONrCvmuhb5Pvia/1rsGFyCJlYb829SYPkMStDabuu/UjJF7UpfqftBhJZ
 htSZxK4oXpyuj/SJlnGgkjlaq7+p8xl+W+xx9JHhptpWUo85FpsjNs3Ms/p+djNj0YI6
 PsQLbEQyXzcOlfrkG48rNAktXa3r/apwvN+Z5PDWk0oAA2EGt9tZG7nhZpC84GIpUm5f
 oDnRLsm1IfvPANXcVC9R8iYVhjPt4pus9hSfuWV8lyLoZJBrx9b4t1mkbuHUteI5jiqz Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38c69asqvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 22:30:14 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14623NMj099371;
 Wed, 5 May 2021 22:30:14 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38c69asqv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 22:30:14 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1462Qr2F020795;
 Thu, 6 May 2021 02:30:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 38bee88axx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 02:30:12 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1462U9Av57410018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 02:30:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 498D05205F;
 Thu,  6 May 2021 02:30:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E93C752059;
 Thu,  6 May 2021 02:30:08 +0000 (GMT)
Received: from [9.102.44.218] (unknown [9.102.44.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 10924605DB;
 Thu,  6 May 2021 12:30:03 +1000 (AEST)
Subject: Re: [PATCH] cxl: Fix an error message
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, fbarrat@linux.ibm.com, 
 arnd@arndb.de, gregkh@linuxfoundation.org, mpe@ellerman.id.au,
 imunsie@au1.ibm.com, mikey@neuling.org
References: <fa2b2c9c72335ab4c3d5e6a33415e7f020b1d51b.1620243401.git.christophe.jaillet@wanadoo.fr>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <2d898a2a-fc3c-a804-ce13-cbfc58565cfb@linux.ibm.com>
Date: Thu, 6 May 2021 12:29:57 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <fa2b2c9c72335ab4c3d5e6a33415e7f020b1d51b.1620243401.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VSghf0rnEQ14vYNIMtTSdUOwaviH6ala
X-Proofpoint-GUID: E86YZwJNrf2pBY55GnvTwxdXP9pAeMwV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_11:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060012
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/5/21 5:38 am, Christophe JAILLET wrote:
> 'rc' is known to be 0 here.
> Initialize 'rc' with the expected error code before using it.

I would prefer:

"In cxl_add_chardev(), if the call to device_create() fails, we print 
the error message before 'rc' is set correctly, and therefore always 
print 0. Move the error message after setting 'rc'."

> 
> While at it, avoid the affectation of 'rc' in a 'if' to make things more
> obvious and linux style.

I strongly agree with this, some of the other cxl developers don't but 
they are wrong :)

> 
> Fixes: f204e0b8ce ("cxl: Driver code for powernv PCIe based cards for userspace access")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Apart from my comment above:

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

Thanks for catching this!

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
