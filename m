Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B82A9800
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 16:01:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSNr12K5dzDrNG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 02:01:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U9mywscg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSNp607bXzDr4Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 01:59:24 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6EViKj186965
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Nov 2020 09:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cofsAbu3i/TfMFO/NUCFUzhSaOasovISMbOH+P2vXLk=;
 b=U9mywscgB5d7T3jlj2ka/CbG57dzL9m20LWAD9GXXHcy//Oshmu+yhrLzN/8dFt5cRi0
 L6+poCMBzMevp6DK6LhnhCSHh90h0logKyINkudsXMqL1gSL2qNWgiV4mLjGLIVZUNR5
 VRsf0eFLybGZSPGcNgLuG4KZLqN+hmxoi9vj4BF9RE+Wj11CgaiRCGU8TiFVw1gh6enq
 9cqUXDsWQJahE0p3s+mOozKNrMWrdDQrXI0Ku5CTY58POf9CLAwxXDPYb7dhtRsaY5Yw
 KW5LW70zIaNCloGRa58fjg3MsGUw2NX5x2dJ3bDDKOX7uYkSjgBEilZ/wfgBTutW/WzP rA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34n6h853tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 09:59:20 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A6ErG7g006924
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Nov 2020 14:59:18 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 34jbyttgjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 14:59:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A6ExGuK23986472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Nov 2020 14:59:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61652AE051
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 14:59:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1124AAE04D
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 14:59:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 14:59:16 +0000 (GMT)
Received: from [9.206.205.203] (unknown [9.206.205.203])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B6F44A013E;
 Sat,  7 Nov 2020 01:59:14 +1100 (AEDT)
Subject: Re: [PATCH 02/29] powerpc/rtas: prevent suspend-related sys_rtas use
 on LE
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-3-nathanl@linux.ibm.com>
 <f7386a11-61b7-4ed5-65d4-e702755be16c@linux.ibm.com>
 <87r1pfkj7z.fsf@linux.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <95c8b599-f939-ad28-5671-cfbf7436508e@linux.ibm.com>
Date: Sat, 7 Nov 2020 01:59:14 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87r1pfkj7z.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_04:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=803
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011060101
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30/10/20 11:10 pm, Nathan Lynch wrote:
>> And there's a zero chance that drmgr will ever be fixed on LE?
> 
> It's always used the sysfs interface on LE, and the only way to provoke
> it to attempt the syscalls is by doing something like this before
> running the migration:
> 
> # echo 0 > /tmp/fake_api_version
> # mount -o bind,ro /tmp/fake_api_version /sys/kernel/mobility/api_version
> 
> So I'm not aware of any circumstance that would actually motivate
> someone to make it work on LE. I'd say it's more likely that drmgr will
> drop its support for using the syscall altogether.
> 

Okay. librtas should handle the error fine, so I don't have any huge 
objection to this, though perhaps a documentation patch to librtas to 
mention that these calls are BE-only would be in order.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
